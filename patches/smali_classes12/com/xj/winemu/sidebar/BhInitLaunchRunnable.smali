.class public Lcom/xj/winemu/sidebar/BhInitLaunchRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# Background Runnable: reads WINEPREFIX via BhWineLaunchHelper, stores it as
# fragment.wineRootPath.  Opens at WINEPREFIX/dosdevices (Windows drive letters
# as c:, d:, z: etc.) if that directory exists; otherwise falls back to WINEPREFIX.
# Posts a BhBrowseToRunnable to the main thread with the chosen start path.

.implements Ljava/lang/Runnable;

.field public final fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;

.method public constructor <init>(Lcom/xj/winemu/sidebar/BhTaskManagerFragment;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/xj/winemu/sidebar/BhInitLaunchRunnable;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    return-void
.end method

.method public run()V
    .locals 6
    # v0 = fragment
    # v1 = prefix string (WINEPREFIX)
    # v2 = Handler (main looper) / dosdevices File
    # v3 = Looper / start path string
    # v4 = BhBrowseToRunnable
    # v5 = temp bool / File

    iget-object v0, p0, Lcom/xj/winemu/sidebar/BhInitLaunchRunnable;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;

    # Get WINEPREFIX
    invoke-static {}, Lapp/revanced/extension/gamehub/BhWineLaunchHelper;->getWinePrefix()Ljava/lang/String;
    move-result-object v1

    # Fallback to "/" if not found
    if-nez v1, :got_prefix
    const-string v1, "/"

    :got_prefix
    # Store WINEPREFIX as wineRootPath (root of navigation)
    iput-object v1, v0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment;->wineRootPath:Ljava/lang/String;

    # Try WINEPREFIX/dosdevices as start path (shows c:, d:, z: drive letters)
    new-instance v2, Ljava/io/File;
    const-string v3, "dosdevices"
    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z
    move-result v5
    if-eqz v5, :use_prefix

    # dosdevices exists — use its absolute path as start
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v3
    goto :post_browse

    :use_prefix
    move-object v3, v1

    :post_browse
    # Post browseTo(startPath) to main thread
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v5
    new-instance v2, Landroid/os/Handler;
    invoke-direct {v2, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v4, Lcom/xj/winemu/sidebar/BhBrowseToRunnable;
    invoke-direct {v4, v0, v3}, Lcom/xj/winemu/sidebar/BhBrowseToRunnable;-><init>(Lcom/xj/winemu/sidebar/BhTaskManagerFragment;Ljava/lang/String;)V
    invoke-virtual {v2, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
