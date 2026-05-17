package app.revanced.extension.gamehub;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.xj.winemu.sidebar.BhVulkanIcdWriter;

/**
 * GameScope driver selection dialog (VK vs V2).
 * Style mirrors BhFrameGenDialog / CpuMultiSelectHelper.
 * Called from BhVulkanDriverWiring when user taps "GameScope Driver".
 */
public class GpuDriverSelectHelper {

    public static void show(Context ctx) {
        Dialog dialog = new Dialog(ctx);
        dialog.setCancelable(false);

        Window w = dialog.getWindow();
        if (w != null) {
            w.requestFeature(Window.FEATURE_NO_TITLE);
            WindowManager.LayoutParams lp = w.getAttributes();
            lp.width     = WindowManager.LayoutParams.MATCH_PARENT;
            lp.height    = WindowManager.LayoutParams.MATCH_PARENT;
            lp.dimAmount = 0.6f;
            lp.flags    |= WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            w.setAttributes(lp);
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        }

        dialog.setContentView(buildContentView(ctx, dialog));
        dialog.show();
    }

    private static View buildContentView(Context ctx, Dialog dialog) {
        boolean v2Available = BhVulkanIcdWriter.isV2Available(ctx);
        boolean v2Selected  = BhVulkanIcdWriter.isV2Selected(ctx) && v2Available;

        // Track selection (lambda-safe array)
        boolean[] isV2 = {v2Selected};

        // Root overlay — not clickable so touches pass through to panel
        FrameLayout root = new FrameLayout(ctx);
        root.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        root.setClickable(false);
        root.setFocusable(false);

        // Dark rounded panel aligned to end
        LinearLayout panel = new LinearLayout(ctx);
        panel.setOrientation(LinearLayout.VERTICAL);
        FrameLayout.LayoutParams panelLp = new FrameLayout.LayoutParams(
                dp(ctx, 320), ViewGroup.LayoutParams.WRAP_CONTENT);
        panelLp.gravity      = Gravity.END | Gravity.CENTER_VERTICAL;
        panelLp.rightMargin  = dp(ctx, 24);
        panelLp.topMargin    = dp(ctx, 16);
        panelLp.bottomMargin = dp(ctx, 16);
        panel.setLayoutParams(panelLp);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.parseColor("#ff1f1f24"));
        bg.setCornerRadius(dp(ctx, 10));
        panel.setBackground(bg);
        panel.setPadding(dp(ctx, 16), dp(ctx, 8), dp(ctx, 16), dp(ctx, 8));
        root.addView(panel);

        // Title
        TextView title = new TextView(ctx);
        title.setText("GameScope Driver");
        title.setTextColor(Color.WHITE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        title.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        titleLp.bottomMargin = dp(ctx, 8);
        title.setLayoutParams(titleLp);
        panel.addView(title);
        panel.addView(divider(ctx));

        // Options
        LinearLayout optVk = makeOption(ctx, "GameScopeVK",
                "Frame generation + direct rendering", !isV2[0]);
        panel.addView(optVk);

        String v2desc = v2Available
                ? "GPU spoofing, no direct rendering"
                : "GPU spoofing (requires imagefs 1.4.1+)";
        LinearLayout optV2 = makeOption(ctx, "GameScopeV2", v2desc, isV2[0]);
        if (!v2Available) optV2.setAlpha(0.5f);
        panel.addView(optV2);

        // Click handlers
        optVk.setOnClickListener(v -> {
            isV2[0] = false;
            setOptionSelected(optVk, true);
            setOptionSelected(optV2, false);
        });
        optV2.setOnClickListener(v -> {
            if (!v2Available) return;
            isV2[0] = true;
            setOptionSelected(optVk, false);
            setOptionSelected(optV2, true);
        });

        panel.addView(divider(ctx));

        // Buttons row
        LinearLayout btnRow = new LinearLayout(ctx);
        btnRow.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams btnRowLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        btnRowLp.topMargin = dp(ctx, 10);
        btnRow.setLayoutParams(btnRowLp);
        panel.addView(btnRow);

        TextView btnCancel = makeButton(ctx, "Cancel", "#ff444455");
        LinearLayout.LayoutParams cancelLp = new LinearLayout.LayoutParams(0, dp(ctx, 36), 1f);
        cancelLp.rightMargin = dp(ctx, 6);
        btnCancel.setLayoutParams(cancelLp);
        btnCancel.setOnClickListener(v -> dialog.dismiss());
        btnRow.addView(btnCancel);

        TextView btnApply = makeButton(ctx, "Apply", "#ff3b82f6");
        btnApply.setLayoutParams(new LinearLayout.LayoutParams(0, dp(ctx, 36), 1f));
        btnApply.setOnClickListener(v -> {
            String selected = isV2[0] ? BhVulkanIcdWriter.DRIVER_V2 : BhVulkanIcdWriter.DRIVER_VK;
            BhVulkanIcdWriter.setSelectedDriver(ctx, selected);
            BhVulkanIcdWriter.ensureIcdJson(ctx);
            Toast.makeText(ctx, "Will apply on next container start", Toast.LENGTH_SHORT).show();
            dialog.dismiss();
        });
        btnRow.addView(btnApply);

        return root;
    }

    // ── helpers ───────────────────────────────────────────────────────────────

    private static LinearLayout makeOption(Context ctx, String name, String desc, boolean selected) {
        LinearLayout row = new LinearLayout(ctx);
        row.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin    = dp(ctx, 6);
        lp.bottomMargin = dp(ctx, 6);
        row.setLayoutParams(lp);
        row.setPadding(dp(ctx, 10), dp(ctx, 8), dp(ctx, 10), dp(ctx, 8));
        setOptionSelected(row, selected);

        TextView tvName = new TextView(ctx);
        tvName.setText(name);
        tvName.setTextColor(Color.WHITE);
        tvName.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        tvName.setClickable(false);
        tvName.setFocusable(false);
        tvName.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        row.addView(tvName);

        TextView tvDesc = new TextView(ctx);
        tvDesc.setText(desc);
        tvDesc.setTextColor(Color.parseColor("#ffaaaaaa"));
        tvDesc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        tvDesc.setClickable(false);
        tvDesc.setFocusable(false);
        tvDesc.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        row.addView(tvDesc);

        return row;
    }

    private static void setOptionSelected(LinearLayout row, boolean selected) {
        GradientDrawable gd = new GradientDrawable();
        gd.setCornerRadius(8f);
        if (selected) {
            gd.setColor(Color.parseColor("#333b82f6"));
            gd.setStroke(2, Color.parseColor("#ff3b82f6"));
        } else {
            gd.setColor(Color.parseColor("#11ffffff"));
            gd.setStroke(1, Color.parseColor("#22ffffff"));
        }
        row.setBackground(gd);
    }

    private static TextView makeButton(Context ctx, String text, String color) {
        TextView btn = new TextView(ctx);
        btn.setText(text);
        btn.setTextColor(Color.parseColor("#fff0f0f0"));
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        btn.setGravity(Gravity.CENTER);
        btn.setBackgroundColor(Color.parseColor(color));
        return btn;
    }

    private static View divider(Context ctx) {
        View v = new View(ctx);
        v.setBackgroundColor(Color.parseColor("#22ffffff"));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(ctx, 1));
        lp.topMargin    = dp(ctx, 8);
        lp.bottomMargin = dp(ctx, 4);
        v.setLayoutParams(lp);
        return v;
    }

    private static int dp(Context ctx, int v) {
        float density = ctx.getResources().getDisplayMetrics().density;
        return (int) (v * density + 0.5f);
    }
}
