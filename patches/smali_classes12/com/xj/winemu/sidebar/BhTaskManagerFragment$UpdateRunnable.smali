.class public Lcom/xj/winemu/sidebar/BhTaskManagerFragment$UpdateRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# Main-thread Runnable: hands scan results back to the Fragment.

.implements Ljava/lang/Runnable;

.field public final fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
.field public final names:Ljava/util/ArrayList;
.field public final pids:Ljava/util/ArrayList;

.method public constructor <init>(Lcom/xj/winemu/sidebar/BhTaskManagerFragment;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$UpdateRunnable;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    iput-object p2, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$UpdateRunnable;->names:Ljava/util/ArrayList;
    iput-object p3, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$UpdateRunnable;->pids:Ljava/util/ArrayList;
    return-void
.end method

.method public run()V
    .locals 3
    iget-object v0, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$UpdateRunnable;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    iget-object v1, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$UpdateRunnable;->names:Ljava/util/ArrayList;
    iget-object v2, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$UpdateRunnable;->pids:Ljava/util/ArrayList;
    invoke-virtual {v0, v1, v2}, Lcom/xj/winemu/sidebar/BhTaskManagerFragment;->onScanComplete(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    return-void
.end method
