package com.xj.winemu.sidebar;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;

/**
 * AI Frame Generation settings dialog. Programmatic UI mirrors the visual
 * style of RtsGestureConfigDialog (dark dim, rounded panel, blue close button).
 *
 * Every control writes to gamescope.control immediately and persists to
 * {@link BhFrameGenSettings} SharedPreferences. Settings are also re-applied
 * on every game launch via the BhFrameGenWriter launch hook.
 */
public class BhFrameGenDialog extends Dialog {

    private final BhFrameGenSettings settings;
    private final String controlPath;

    // Bound widgets we need to update from preset changes
    private SeekBar sbFlowScale;
    private TextView tvFlowScaleValue;
    private TextView tvPresetDesc;
    private TextView tvPresetLabel;

    public BhFrameGenDialog(Context context) {
        super(context);
        this.settings = BhFrameGenSettings.load(context);
        this.controlPath = BhFrameGenWriter.resolveControlPath(context);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Window w = getWindow();
        if (w != null) {
            w.requestFeature(Window.FEATURE_NO_TITLE);
            WindowManager.LayoutParams lp = w.getAttributes();
            lp.width = WindowManager.LayoutParams.MATCH_PARENT;
            lp.height = WindowManager.LayoutParams.MATCH_PARENT;
            lp.dimAmount = 0.6f;
            lp.flags |= WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            w.setAttributes(lp);
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        }
        setContentView(buildContentView());
    }

    // Outer dim layer
    private View buildContentView() {
        Context ctx = getContext();

        FrameLayout root = new FrameLayout(ctx);
        root.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // Centered panel
        LinearLayout panel = new LinearLayout(ctx);
        panel.setOrientation(LinearLayout.VERTICAL);
        FrameLayout.LayoutParams panelLp = new FrameLayout.LayoutParams(
                dp(320), ViewGroup.LayoutParams.WRAP_CONTENT);
        panelLp.gravity = Gravity.END | Gravity.CENTER_VERTICAL;
        panelLp.rightMargin = dp(24);
        panelLp.bottomMargin = dp(16);
        panelLp.topMargin = dp(16);
        panel.setLayoutParams(panelLp);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.parseColor("#ff1f1f24"));
        bg.setCornerRadius(dp(10));
        panel.setBackground(bg);
        panel.setPadding(0, dp(8), 0, dp(8));
        root.addView(panel);

        // Title
        TextView title = new TextView(ctx);
        title.setText("AI Frame Generation");
        title.setTextColor(Color.WHITE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        title.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        titleLp.bottomMargin = dp(8);
        title.setLayoutParams(titleLp);
        panel.addView(title);

        // Scrollable body
        ScrollView scroll = new ScrollView(ctx);
        LinearLayout.LayoutParams scrollLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        scrollLp.leftMargin = dp(16);
        scrollLp.rightMargin = dp(16);
        scroll.setLayoutParams(scrollLp);
        panel.addView(scroll);

        LinearLayout body = new LinearLayout(ctx);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        scroll.addView(body);

        // ── Section 1: Preset slider ─────────────────────────────────────
        TextView presetHeader = new TextView(ctx);
        presetHeader.setText("Preset");
        presetHeader.setTextColor(Color.WHITE);
        presetHeader.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        presetHeader.setLayoutParams(headerLp());
        body.addView(presetHeader);

        tvPresetLabel = new TextView(ctx);
        tvPresetLabel.setTextColor(Color.parseColor("#ffaaaaaa"));
        tvPresetLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        tvPresetLabel.setLayoutParams(headerLp());
        body.addView(tvPresetLabel);

        SeekBar sbPreset = new SeekBar(ctx);
        sbPreset.setMax(BhFrameGenSettings.Preset.values().length - 1);
        sbPreset.setProgress(settings.preset.ordinal());
        sbPreset.setLayoutParams(seekBarLp());
        sbPreset.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                if (!fromUser) return;
                BhFrameGenSettings.Preset p = BhFrameGenSettings.Preset.values()[progress];
                settings.applyPreset(p);
                BhFrameGenWriter.write(controlPath, settings);
                settings.save(getContext());
                if (sbFlowScale != null) sbFlowScale.setProgress(flowScaleToProgress(settings.flowScale));
                if (tvFlowScaleValue != null) tvFlowScaleValue.setText(formatFloat(settings.flowScale));
                updatePresetLabel();
                updatePresetDescription();
            }
            @Override public void onStartTrackingTouch(SeekBar b) {}
            @Override public void onStopTrackingTouch(SeekBar b) {}
        });
        body.addView(sbPreset);

        LinearLayout presetTickRow = new LinearLayout(ctx);
        presetTickRow.setOrientation(LinearLayout.HORIZONTAL);
        presetTickRow.setLayoutParams(rowLp());
        for (BhFrameGenSettings.Preset p : BhFrameGenSettings.Preset.values()) {
            TextView tv = new TextView(ctx);
            tv.setText(p.label);
            tv.setTextColor(Color.parseColor("#ff888e99"));
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 9f);
            tv.setGravity(Gravity.CENTER);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0,
                    ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            tv.setLayoutParams(lp);
            presetTickRow.addView(tv);
        }
        body.addView(presetTickRow);

        tvPresetDesc = new TextView(ctx);
        tvPresetDesc.setTextColor(Color.parseColor("#ff888e99"));
        tvPresetDesc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f);
        LinearLayout.LayoutParams descLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        descLp.topMargin = dp(6);
        descLp.bottomMargin = dp(8);
        tvPresetDesc.setLayoutParams(descLp);
        body.addView(tvPresetDesc);

        body.addView(divider());

        // ── Section 2: flowScale slider ─────────────────────────────────
        LinearLayout flowHeaderRow = new LinearLayout(ctx);
        flowHeaderRow.setOrientation(LinearLayout.HORIZONTAL);
        flowHeaderRow.setLayoutParams(rowLp());

        TextView flowHeader = new TextView(ctx);
        flowHeader.setText("Flow scale");
        flowHeader.setTextColor(Color.WHITE);
        flowHeader.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        LinearLayout.LayoutParams flowHeaderLp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        flowHeader.setLayoutParams(flowHeaderLp);
        flowHeaderRow.addView(flowHeader);

        tvFlowScaleValue = new TextView(ctx);
        tvFlowScaleValue.setTextColor(Color.parseColor("#ffaaaaaa"));
        tvFlowScaleValue.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        tvFlowScaleValue.setText(formatFloat(settings.flowScale));
        flowHeaderRow.addView(tvFlowScaleValue);

        body.addView(flowHeaderRow);

        sbFlowScale = new SeekBar(ctx);
        sbFlowScale.setMax(80);
        sbFlowScale.setProgress(flowScaleToProgress(settings.flowScale));
        sbFlowScale.setLayoutParams(seekBarLp());
        sbFlowScale.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                float v = progressToFlowScale(progress);
                tvFlowScaleValue.setText(formatFloat(v));
                if (!fromUser) return;
                settings.flowScale = v;
                BhFrameGenWriter.writeFlowScale(controlPath, v);
                settings.save(getContext());
            }
            @Override public void onStartTrackingTouch(SeekBar b) {}
            @Override public void onStopTrackingTouch(SeekBar b) {}
        });
        body.addView(sbFlowScale);

        // First-time UI sync
        updatePresetLabel();
        updatePresetDescription();

        // ── Close button ─────────────────────────────────────────────────
        TextView btnClose = new TextView(ctx);
        btnClose.setText("Close");
        btnClose.setTextColor(Color.parseColor("#fff0f0f0"));
        btnClose.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        btnClose.setGravity(Gravity.CENTER);
        btnClose.setBackgroundColor(Color.parseColor("#ff3b82f6"));
        LinearLayout.LayoutParams btnLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(30));
        btnLp.topMargin = dp(10);
        btnLp.leftMargin = dp(40);
        btnLp.rightMargin = dp(40);
        btnClose.setLayoutParams(btnLp);
        btnClose.setOnClickListener(v -> dismiss());
        panel.addView(btnClose);

        return root;
    }

    // ── helpers ─────────────────────────────────────────────────────────
    private LinearLayout.LayoutParams rowLp() {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(8);
        lp.bottomMargin = dp(4);
        return lp;
    }

    private LinearLayout.LayoutParams headerLp() {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(8);
        return lp;
    }

    private LinearLayout.LayoutParams seekBarLp() {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(4);
        lp.bottomMargin = dp(4);
        return lp;
    }

    private View divider() {
        View v = new View(getContext());
        v.setBackgroundColor(Color.parseColor("#22ffffff"));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(1));
        lp.topMargin = dp(8);
        lp.bottomMargin = dp(4);
        v.setLayoutParams(lp);
        return v;
    }

    private int dp(int v) {
        float density = getContext().getResources().getDisplayMetrics().density;
        return (int) (v * density + 0.5f);
    }

    private static int flowScaleToProgress(float flowScale) {
        int p = Math.round((flowScale - 0.2f) * 100f);
        if (p < 0) p = 0;
        if (p > 80) p = 80;
        return p;
    }

    private static float progressToFlowScale(int progress) {
        return 0.2f + (progress / 100f);
    }

    private static String formatFloat(float v) {
        return String.format("%.2f", v);
    }

    private void updatePresetLabel() {
        if (tvPresetLabel == null) return;
        tvPresetLabel.setText(settings.preset.label + " mode");
    }

    private void updatePresetDescription() {
        if (tvPresetDesc == null) return;
        tvPresetDesc.setText(settings.preset.description);
    }

    /** Convenience launcher for the smali wiring patch. */
    public static void show(Context ctx) {
        try {
            BhFrameGenDialog d = new BhFrameGenDialog(ctx);
            d.setCancelable(false);
            d.show();
        } catch (Exception ignored) {}
    }
}
