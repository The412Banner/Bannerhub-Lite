.class public Lcom/xj/winemu/sidebar/BhTaskManagerFragment$RefreshListener;
.super Ljava/lang/Object;
.source "SourceFile"

# onClick for the Refresh button — just re-triggers startScan().

.implements Landroid/view/View$OnClickListener;

.field public final fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;

.method public constructor <init>(Lcom/xj/winemu/sidebar/BhTaskManagerFragment;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$RefreshListener;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    iget-object p0, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$RefreshListener;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    invoke-virtual {p0}, Lcom/xj/winemu/sidebar/BhTaskManagerFragment;->startScan()V
    return-void
.end method
