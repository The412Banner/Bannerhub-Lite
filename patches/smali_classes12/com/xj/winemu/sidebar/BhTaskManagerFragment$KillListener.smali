.class public Lcom/xj/winemu/sidebar/BhTaskManagerFragment$KillListener;
.super Ljava/lang/Object;
.source "SourceFile"

# onClick: sends SIGKILL to the process, then triggers a list refresh.

.implements Landroid/view/View$OnClickListener;

.field public final pid:I
.field public final fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;

.method public constructor <init>(ILcom/xj/winemu/sidebar/BhTaskManagerFragment;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput p1, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$KillListener;->pid:I
    iput-object p2, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$KillListener;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    iget v0, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$KillListener;->pid:I
    const/16 v1, 0x9    # SIGKILL = 9
    invoke-static {v0, v1}, Landroid/os/Process;->sendSignal(II)V
    iget-object v0, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$KillListener;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    invoke-virtual {v0}, Lcom/xj/winemu/sidebar/BhTaskManagerFragment;->startScan()V
    return-void
.end method
