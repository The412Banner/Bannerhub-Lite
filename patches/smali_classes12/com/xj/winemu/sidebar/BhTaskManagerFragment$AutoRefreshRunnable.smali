.class public Lcom/xj/winemu/sidebar/BhTaskManagerFragment$AutoRefreshRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# Calls fragment.startScan() then re-posts itself to handler every 3 seconds.
# Stopped by handler.removeCallbacksAndMessages(null) in onPause.

.implements Ljava/lang/Runnable;

.field public final fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
.field public final handler:Landroid/os/Handler;

.method public constructor <init>(Lcom/xj/winemu/sidebar/BhTaskManagerFragment;Landroid/os/Handler;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$AutoRefreshRunnable;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    iput-object p2, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$AutoRefreshRunnable;->handler:Landroid/os/Handler;
    return-void
.end method

.method public run()V
    .locals 4
    iget-object v0, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$AutoRefreshRunnable;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    invoke-virtual {v0}, Lcom/xj/winemu/sidebar/BhTaskManagerFragment;->startScan()V
    iget-object v1, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$AutoRefreshRunnable;->handler:Landroid/os/Handler;
    const-wide/16 v2, 0xBB8    # 3000 ms
    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    return-void
.end method
