.class public Lcom/xj/winemu/sidebar/BhTabListener;
.super Ljava/lang/Object;
.source "SourceFile"

# onClick: calls fragment.showTab(tabIndex) to switch visible content panel.

.implements Landroid/view/View$OnClickListener;

.field public final fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
.field public final tabIndex:I

.method public constructor <init>(Lcom/xj/winemu/sidebar/BhTaskManagerFragment;I)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/xj/winemu/sidebar/BhTabListener;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    iput p2, p0, Lcom/xj/winemu/sidebar/BhTabListener;->tabIndex:I
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    iget-object v0, p0, Lcom/xj/winemu/sidebar/BhTabListener;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    iget v1, p0, Lcom/xj/winemu/sidebar/BhTabListener;->tabIndex:I
    invoke-virtual {v0, v1}, Lcom/xj/winemu/sidebar/BhTaskManagerFragment;->showTab(I)V
    return-void
.end method
