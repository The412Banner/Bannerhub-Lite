package app.revanced.extension.gamehub;

import android.app.AlertDialog;
import android.content.Context;
import android.widget.Toast;

/**
 * BannerHub Lite — API Source selector.
 * Lets the user pick between BannerHub API (self-hosted GitHub) or
 * the EmuReady proxy (original GameHub Lite behaviour).
 *
 * Pref key "api_source" in "bh_prefs":
 *   0 = BannerHub API (default)
 *   1 = EmuReady Proxy
 */
public class BhApiSelectorHelper {

    private static final String PREFS = "bh_prefs";
    private static final String KEY   = "api_source";

    private static final String BANNERHUB_URL = "https://bannerhub-api.the412banner.workers.dev/";
    private static final String EMUREADY_URL  = "https://gamehub-lite-api.emuready.workers.dev/";

    public static int getApiSource(Context ctx) {
        return ctx.getSharedPreferences(PREFS, 0).getInt(KEY, 0);
    }

    public static void setApiSource(Context ctx, int source) {
        ctx.getSharedPreferences(PREFS, 0).edit().putInt(KEY, source).apply();
    }

    /**
     * Called from EggGameHttpConfig.c(Context) to resolve the effective base URL
     * at runtime based on the stored pref, overriding the build-time URL.
     *
     * @param ctx       app context
     * @param buildUrl  the URL baked in at build time (bannerhub-api after sed patch)
     * @return          URL to actually use for this session
     */
    public static String getEffectiveApiUrl(Context ctx, String buildUrl) {
        if (getApiSource(ctx) == 1) {
            return EMUREADY_URL;
        }
        // source 0 = BannerHub API — use the build-time URL (already patched by sed)
        return buildUrl;
    }

    /** Shows the 2-option radio dialog from any Context (settings btn click). */
    public static void showApiSelectorDialog(Context ctx) {
        int current = getApiSource(ctx);
        CharSequence[] items = {
            "BannerHub API  (self-hosted, recommended)",
            "EmuReady Proxy  (original GameHub Lite)"
        };
        new AlertDialog.Builder(ctx)
            .setTitle("API Source")
            .setSingleChoiceItems(items, current, (dlg, which) -> {
                setApiSource(ctx, which);
                dlg.dismiss();
                String[] labels = {"BannerHub API", "EmuReady Proxy"};
                Toast.makeText(ctx, "API: " + labels[which], Toast.LENGTH_SHORT).show();
            })
            .show();
    }
}
