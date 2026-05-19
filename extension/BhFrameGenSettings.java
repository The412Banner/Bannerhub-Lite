package com.xj.winemu.sidebar;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Global AI Frame Generation settings, persisted in SharedPreferences "bh_framegen".
 *
 * Wire format reference: GAMEHUB_600_MASTER_MAP § 26.8.3 (10-byte mmap protocol at
 * <imageFs>/etc/gamescope.control).
 *
 * Preset values mirror GameHub 6.0.1's AiFrameInterpolationMode enum (§ 26.8.1).
 */
public class BhFrameGenSettings {

    public static final String PREFS = "bh_framegen";

    /** Six AI Frame Generation presets, identical to GameHub 6.0.1's enabled-mode values. */
    public enum Preset {
        ECO  (0, 0.2f, "Eco",   "Lowest overhead, suitable for lower-end devices or battery-sensitive play."),
        FLOW (0, 0.4f, "Flow",  "Low overhead smoothness boost for most lightweight games."),
        BAL  (0, 0.6f, "Bal",   "Recommended. Balances smoothness, power usage, and stability."),
        BOOST(0, 0.8f, "Boost", "Stronger motion smoothing for users who prefer extra fluidity."),
        CLEAR(1, 0.6f, "Clear", "Prioritizes a steadier, cleaner image with fewer motion artifacts."),
        MAX  (1, 0.8f, "Max",   "Highest quality preset with the highest power and performance cost.");

        public final int model;        // byte 8: 0=standard, 1=clear/extreme
        public final float flowScale;  // bytes 4-7: float (0.2..1.0)
        public final String label;
        public final String description;

        Preset(int model, float flowScale, String label, String description) {
            this.model = model;
            this.flowScale = flowScale;
            this.label = label;
            this.description = description;
        }
    }

    public boolean enabled = false;
    public Preset preset = Preset.BAL;
    public float flowScale = 0.6f;      // bytes 4-7, clamped 0.2..1.0
    public int model = 0;               // byte 8, 0..1

    public static BhFrameGenSettings load(Context ctx) {
        SharedPreferences sp = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        BhFrameGenSettings s = new BhFrameGenSettings();
        s.enabled = sp.getBoolean("enabled", false);
        try { s.preset = Preset.valueOf(sp.getString("preset", "BAL")); }
        catch (Exception e) { s.preset = Preset.BAL; }
        s.flowScale = sp.getFloat("flowScale", s.preset.flowScale);
        s.model = sp.getInt("model", s.preset.model);
        return s;
    }

    public void save(Context ctx) {
        SharedPreferences.Editor ed = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit();
        ed.putBoolean("enabled", enabled);
        ed.putString("preset", preset.name());
        ed.putFloat("flowScale", flowScale);
        ed.putInt("model", model);
        ed.apply();
    }

    /** Apply a preset's defaults to flowScale and model. Call save() after to persist. */
    public void applyPreset(Preset p) {
        this.preset = p;
        this.flowScale = p.flowScale;
        this.model = p.model;
    }
}
