.class public Lcom/xj/winemu/sidebar/BhBrowseToRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# Runnable posted to the main-thread Handler to call fragment.browseTo(path).

.implements Ljava/lang/Runnable;

.field public final fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
.field public final path:Ljava/lang/String;

.method public constructor <init>(Lcom/xj/winemu/sidebar/BhTaskManagerFragment;Ljava/lang/String;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/xj/winemu/sidebar/BhBrowseToRunnable;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    iput-object p2, p0, Lcom/xj/winemu/sidebar/BhBrowseToRunnable;->path:Ljava/lang/String;
    return-void
.end method

.method public run()V
    .locals 2
    iget-object v0, p0, Lcom/xj/winemu/sidebar/BhBrowseToRunnable;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    iget-object v1, p0, Lcom/xj/winemu/sidebar/BhBrowseToRunnable;->path:Ljava/lang/String;
    invoke-virtual {v0, v1}, Lcom/xj/winemu/sidebar/BhTaskManagerFragment;->browseTo(Ljava/lang/String;)V
    return-void
.end method
