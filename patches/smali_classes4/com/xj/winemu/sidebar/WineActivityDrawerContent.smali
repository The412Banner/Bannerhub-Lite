.class public final Lcom/xj/winemu/sidebar/WineActivityDrawerContent;
.super Lcom/xj/common/view/focus/focus/view/FocusableConstraintLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xj/winemu/sidebar/WineActivityDrawerContent$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
.end annotation


# static fields
.field public static final q:Lcom/xj/winemu/sidebar/WineActivityDrawerContent$Companion;


# instance fields
.field public j:Lcom/xj/winemu/api/bean/WineActivityData;

.field public final k:Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;

.field public final l:Landroidx/fragment/app/FragmentManager;

.field public final m:Ljava/util/Map;

.field public n:I

.field public o:I

.field public p:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->q:Lcom/xj/winemu/sidebar/WineActivityDrawerContent$Companion;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 2
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v6}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    invoke-direct {p0, p1, p2, p3}, Lcom/xj/common/view/focus/focus/view/FocusableConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 5
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    .line 6
    sget p3, Lcom/xj/winemu/R$layout;->winemu_activitiy_settings_layout:I

    const/4 v0, 0x1

    .line 7
    invoke-static {p2, p3, p0, v0}, Landroidx/databinding/DataBindingUtil;->h(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;Z)Landroidx/databinding/ViewDataBinding;

    move-result-object p2

    check-cast p2, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;

    iput-object p2, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->k:Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;

    .line 8
    move-object p3, p1

    check-cast p3, Lcom/xj/winemu/WineActivity;

    invoke-virtual {p3}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p3

    const-string v0, "getSupportFragmentManager(...)"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p3, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->l:Landroidx/fragment/app/FragmentManager;

    .line 9
    new-instance p3, Ljava/util/LinkedHashMap;

    invoke-direct {p3}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p3, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->m:Ljava/util/Map;

    .line 10
    invoke-virtual {p0}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->O()V

    .line 11
    iget-object p3, p2, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;->sidebarOpt:Lcom/xj/winemu/view/SidebarTitleItemView;

    .line 12
    invoke-virtual {p3}, Lcom/xj/winemu/view/SidebarTitleItemView;->getFocusStatus()Landroidx/lifecycle/LiveData;

    move-result-object v0

    new-instance v1, Lcom/xj/winemu/sidebar/h1;

    invoke-direct {v1, p0, p3}, Lcom/xj/winemu/sidebar/h1;-><init>(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Lcom/xj/winemu/view/SidebarTitleItemView;)V

    new-instance v2, Lcom/xj/winemu/sidebar/WineActivityDrawerContent$sam$androidx_lifecycle_Observer$0;

    invoke-direct {v2, v1}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent$sam$androidx_lifecycle_Observer$0;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v2}, Landroidx/lifecycle/LiveData;->j(Landroidx/lifecycle/Observer;)V

    .line 13
    new-instance v0, Lcom/xj/winemu/sidebar/i1;

    invoke-direct {v0, p0}, Lcom/xj/winemu/sidebar/i1;-><init>(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)V

    invoke-virtual {p3, v0}, Lcom/xj/winemu/view/SidebarTitleItemView;->setClickListener(Lkotlin/jvm/functions/Function0;)V

    .line 14
    iget-object p3, p2, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;->sidebarPerformance:Lcom/xj/winemu/view/SidebarTitleItemView;

    .line 15
    invoke-virtual {p3}, Lcom/xj/winemu/view/SidebarTitleItemView;->getFocusStatus()Landroidx/lifecycle/LiveData;

    move-result-object v0

    new-instance v1, Lcom/xj/winemu/sidebar/j1;

    invoke-direct {v1, p0, p3}, Lcom/xj/winemu/sidebar/j1;-><init>(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Lcom/xj/winemu/view/SidebarTitleItemView;)V

    new-instance v2, Lcom/xj/winemu/sidebar/WineActivityDrawerContent$sam$androidx_lifecycle_Observer$0;

    invoke-direct {v2, v1}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent$sam$androidx_lifecycle_Observer$0;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v2}, Landroidx/lifecycle/LiveData;->j(Landroidx/lifecycle/Observer;)V

    .line 16
    new-instance v0, Lcom/xj/winemu/sidebar/k1;

    invoke-direct {v0, p0}, Lcom/xj/winemu/sidebar/k1;-><init>(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)V

    invoke-virtual {p3, v0}, Lcom/xj/winemu/view/SidebarTitleItemView;->setClickListener(Lkotlin/jvm/functions/Function0;)V

    .line 17
    iget-object p3, p2, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;->sidebarSetting:Lcom/xj/winemu/view/SidebarTitleItemView;

    .line 18
    invoke-virtual {p3}, Lcom/xj/winemu/view/SidebarTitleItemView;->getFocusStatus()Landroidx/lifecycle/LiveData;

    move-result-object v0

    new-instance v1, Lcom/xj/winemu/sidebar/l1;

    invoke-direct {v1, p0, p3}, Lcom/xj/winemu/sidebar/l1;-><init>(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Lcom/xj/winemu/view/SidebarTitleItemView;)V

    new-instance v2, Lcom/xj/winemu/sidebar/WineActivityDrawerContent$sam$androidx_lifecycle_Observer$0;

    invoke-direct {v2, v1}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent$sam$androidx_lifecycle_Observer$0;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v2}, Landroidx/lifecycle/LiveData;->j(Landroidx/lifecycle/Observer;)V

    .line 19
    new-instance v0, Lcom/xj/winemu/sidebar/m1;

    invoke-direct {v0, p0}, Lcom/xj/winemu/sidebar/m1;-><init>(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)V

    invoke-virtual {p3, v0}, Lcom/xj/winemu/view/SidebarTitleItemView;->setClickListener(Lkotlin/jvm/functions/Function0;)V

    # ── BH: Task Manager sidebar tab (getIdentifier — R$id not extended) ──
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const-string v1, "sidebar_taskmanager"
    const-string v2, "id"
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v3
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v0
    if-eqz v0, :cond_tm_skip
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :cond_tm_skip
    check-cast v0, Lcom/xj/winemu/view/SidebarTitleItemView;
    new-instance v1, Lcom/xj/winemu/sidebar/BhTaskClickListener;
    invoke-direct {v1, p0}, Lcom/xj/winemu/sidebar/BhTaskClickListener;-><init>(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)V
    invoke-virtual {v0, v1}, Lcom/xj/winemu/view/SidebarTitleItemView;->setClickListener(Lkotlin/jvm/functions/Function0;)V
    :cond_tm_skip

    .line 20
    iget-object p2, p2, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;->sidebarKeyboard:Lcom/xj/winemu/view/SidebarTitleItemView;

    .line 21
    invoke-virtual {p2}, Lcom/xj/winemu/view/SidebarTitleItemView;->getFocusStatus()Landroidx/lifecycle/LiveData;

    move-result-object p3

    new-instance v0, Lcom/xj/winemu/sidebar/n1;

    invoke-direct {v0, p0}, Lcom/xj/winemu/sidebar/n1;-><init>(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)V

    new-instance v1, Lcom/xj/winemu/sidebar/WineActivityDrawerContent$sam$androidx_lifecycle_Observer$0;

    invoke-direct {v1, v0}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent$sam$androidx_lifecycle_Observer$0;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p3, v1}, Landroidx/lifecycle/LiveData;->j(Landroidx/lifecycle/Observer;)V

    .line 22
    new-instance p3, Lcom/xj/winemu/sidebar/o1;

    invoke-direct {p3, p2}, Lcom/xj/winemu/sidebar/o1;-><init>(Lcom/xj/winemu/view/SidebarTitleItemView;)V

    invoke-virtual {p2, p3}, Lcom/xj/winemu/view/SidebarTitleItemView;->setClickListener(Lkotlin/jvm/functions/Function0;)V

    .line 23
    sget-object p2, Lcom/xj/common/data/preferences/AppPreferences;->INSTANCE:Lcom/xj/common/data/preferences/AppPreferences;

    invoke-virtual {p2}, Lcom/xj/common/data/preferences/AppPreferences;->getWineScreenBrightnessSwitch()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 24
    sget-object p2, Lcom/xj/winemu/utils/ScreenBrightnessUtils;->a:Lcom/xj/winemu/utils/ScreenBrightnessUtils;

    .line 25
    invoke-static {p1}, Lcom/xj/common/utils/ContextExtensionsKt;->a(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object p1

    .line 26
    invoke-virtual {p2}, Lcom/xj/winemu/utils/ScreenBrightnessUtils;->b()F

    move-result p3

    .line 27
    invoke-virtual {p2, p1, p3}, Lcom/xj/winemu/utils/ScreenBrightnessUtils;->c(Landroid/app/Activity;F)V

    :cond_0
    const/4 p1, -0x1

    .line 28
    iput p1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->p:I

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    const/4 p3, 0x0

    .line 3
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic C(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->T(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->V(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Lcom/xj/winemu/view/SidebarTitleItemView;Ljava/lang/Boolean;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->W(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Lcom/xj/winemu/view/SidebarTitleItemView;Ljava/lang/Boolean;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->X(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic G(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Lcom/xj/winemu/view/SidebarTitleItemView;Ljava/lang/Boolean;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->S(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Lcom/xj/winemu/view/SidebarTitleItemView;Ljava/lang/Boolean;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Ljava/lang/Boolean;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->R(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Ljava/lang/Boolean;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)V
    .locals 0

    invoke-static {p0}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->Z(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)V

    return-void
.end method

.method public static synthetic J(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Lcom/xj/winemu/view/SidebarTitleItemView;Ljava/lang/Boolean;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->U(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Lcom/xj/winemu/view/SidebarTitleItemView;Ljava/lang/Boolean;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K()V
    .locals 0

    invoke-static {}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->Q()V

    return-void
.end method

.method public static synthetic L(Lcom/xj/winemu/view/SidebarTitleItemView;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->P(Lcom/xj/winemu/view/SidebarTitleItemView;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method private final N(ZI)V
    .locals 3

    if-eqz p1, :cond_0

    iput p2, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->n:I

    :cond_0
    const/4 v0, 0x1

    if-eqz p1, :cond_1

    iget v1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->o:I

    add-int/2addr v1, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    goto :goto_0

    :cond_1
    iget v1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->o:I

    sub-int/2addr v1, v0

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    :goto_0
    iput v1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->o:I

    if-lez v1, :cond_2

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    iget p2, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->n:I

    :goto_1
    iget p1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->p:I

    if-eq p1, p2, :cond_7

    iget-object p1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->k:Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;

    iget-object p1, p1, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;->sidebarOpt:Lcom/xj/winemu/view/SidebarTitleItemView;

    invoke-virtual {p1}, Lcom/xj/winemu/view/SidebarTitleItemView;->H()V

    iget-object p1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->k:Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;

    iget-object p1, p1, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;->sidebarPerformance:Lcom/xj/winemu/view/SidebarTitleItemView;

    invoke-virtual {p1}, Lcom/xj/winemu/view/SidebarTitleItemView;->H()V

    iget-object p1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->k:Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;

    iget-object p1, p1, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;->sidebarSetting:Lcom/xj/winemu/view/SidebarTitleItemView;

    invoke-virtual {p1}, Lcom/xj/winemu/view/SidebarTitleItemView;->H()V

    iget-object p1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->k:Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;

    iget-object p1, p1, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;->sidebarKeyboard:Lcom/xj/winemu/view/SidebarTitleItemView;

    invoke-virtual {p1}, Lcom/xj/winemu/view/SidebarTitleItemView;->H()V

    if-eqz p2, :cond_6

    if-eq p2, v0, :cond_5

    const/4 p1, 0x2

    if-eq p2, p1, :cond_4

    const/4 p1, 0x3

    if-eq p2, p1, :cond_3

    goto :goto_2

    :cond_3
    iget-object p1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->k:Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;

    iget-object p1, p1, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;->sidebarKeyboard:Lcom/xj/winemu/view/SidebarTitleItemView;

    invoke-virtual {p1}, Lcom/xj/winemu/view/SidebarTitleItemView;->K()V

    goto :goto_2

    :cond_4
    iget-object p1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->k:Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;

    iget-object p1, p1, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;->sidebarSetting:Lcom/xj/winemu/view/SidebarTitleItemView;

    invoke-virtual {p1}, Lcom/xj/winemu/view/SidebarTitleItemView;->K()V

    goto :goto_2

    :cond_5
    iget-object p1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->k:Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;

    iget-object p1, p1, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;->sidebarPerformance:Lcom/xj/winemu/view/SidebarTitleItemView;

    invoke-virtual {p1}, Lcom/xj/winemu/view/SidebarTitleItemView;->K()V

    goto :goto_2

    :cond_6
    iget-object p1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->k:Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;

    iget-object p1, p1, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;->sidebarOpt:Lcom/xj/winemu/view/SidebarTitleItemView;

    invoke-virtual {p1}, Lcom/xj/winemu/view/SidebarTitleItemView;->K()V

    :goto_2
    iput p2, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->p:I

    :cond_7
    return-void
.end method

.method public static final P(Lcom/xj/winemu/view/SidebarTitleItemView;)Lkotlin/Unit;
    .locals 3

    const-string v0, "$this_apply"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/xj/winemu/sidebar/p1;

    invoke-direct {v0}, Lcom/xj/winemu/sidebar/p1;-><init>()V

    const-wide/16 v1, 0x32

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static final Q()V
    .locals 3

    new-instance v0, Lcom/xj/winemu/ShowKeyBoard;

    invoke-direct {v0}, Lcom/xj/winemu/ShowKeyBoard;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-static {v0, v1, v2, v1}, Lcom/drake/channel/ChannelKt;->c(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public static final R(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Ljava/lang/Boolean;)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const/4 v0, 0x3

    invoke-direct {p0, p1, v0}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->N(ZI)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static final S(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Lcom/xj/winemu/view/SidebarTitleItemView;Ljava/lang/Boolean;)Lkotlin/Unit;
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$this_apply"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;)V

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->N(ZI)V

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    :cond_0
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static final T(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "SidebarControlsFragment"

    invoke-virtual {p0, v0}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->a0(Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static final U(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Lcom/xj/winemu/view/SidebarTitleItemView;Ljava/lang/Boolean;)Lkotlin/Unit;
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$this_apply"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;)V

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->N(ZI)V

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    :cond_0
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static final V(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "SidebarPerformanceFragment"

    invoke-virtual {p0, v0}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->a0(Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static final W(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;Lcom/xj/winemu/view/SidebarTitleItemView;Ljava/lang/Boolean;)Lkotlin/Unit;
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$this_apply"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;)V

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->N(ZI)V

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    :cond_0
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static final X(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "SidebarSettingsFragmentKey"

    invoke-virtual {p0, v0}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->a0(Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static final Z(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)V
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->k:Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;

    iget-object p0, p0, Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;->sidebarOpt:Lcom/xj/winemu/view/SidebarTitleItemView;

    invoke-virtual {p0}, Lcom/xj/common/view/focus/focus/view/FocusableConstraintLayout;->r()V

    return-void
.end method


# virtual methods
.method public final M()V
    .locals 1

    iget-object v0, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->l:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0}, Lcom/xj/base/ext/ShowHideExtKt;->b(Landroidx/fragment/app/FragmentManager;)V

    return-void
.end method

.method public final O()V
    .locals 0

    return-void
.end method

.method public final Y()V
    .locals 3

    const-string v0, "SidebarControlsFragment"

    invoke-virtual {p0, v0}, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->a0(Ljava/lang/String;)V

    new-instance v0, Lcom/xj/winemu/sidebar/q1;

    invoke-direct {v0, p0}, Lcom/xj/winemu/sidebar/q1;-><init>(Lcom/xj/winemu/sidebar/WineActivityDrawerContent;)V

    const-wide/16 v1, 0x12c

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final a0(Ljava/lang/String;)V
    .locals 3

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->m:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x93f1310

    const/4 v2, 0x0

    if-eq v0, v1, :cond_6

    const v1, 0x13246682

    if-eq v0, v1, :cond_3

    const v1, 0x2763a9c4

    if-eq v0, v1, :cond_0

    const v1, -0x37c3556e

    if-eq v0, v1, :cond_bhtm

    goto :goto_0

    :cond_bhtm
    const-string v0, "BhTaskManagerFragment"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :goto_0

    new-instance v2, Lcom/xj/winemu/sidebar/BhTaskManagerFragment;

    invoke-direct {v2}, Lcom/xj/winemu/sidebar/BhTaskManagerFragment;-><init>()V

    goto :goto_0

    :cond_0
    const-string v0, "SidebarPerformanceFragment"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/xj/winemu/sidebar/SidebarPerformanceFragment;->C:Lcom/xj/winemu/sidebar/SidebarPerformanceFragment$Companion;

    iget-object v1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->j:Lcom/xj/winemu/api/bean/WineActivityData;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/xj/winemu/api/bean/WineActivityData;->e()Ljava/lang/String;

    move-result-object v2

    :cond_2
    invoke-virtual {v0, v2}, Lcom/xj/winemu/sidebar/SidebarPerformanceFragment$Companion;->a(Ljava/lang/String;)Lcom/xj/winemu/sidebar/SidebarPerformanceFragment;

    move-result-object v2

    goto :goto_0

    :cond_3
    const-string v0, "SidebarControlsFragment"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    :cond_4
    sget-object v0, Lcom/xj/winemu/sidebar/SidebarControlsFragment;->A:Lcom/xj/winemu/sidebar/SidebarControlsFragment$Companion;

    iget-object v1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->j:Lcom/xj/winemu/api/bean/WineActivityData;

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Lcom/xj/winemu/api/bean/WineActivityData;->e()Ljava/lang/String;

    move-result-object v2

    :cond_5
    invoke-virtual {v0, v2}, Lcom/xj/winemu/sidebar/SidebarControlsFragment$Companion;->a(Ljava/lang/String;)Lcom/xj/winemu/sidebar/SidebarControlsFragment;

    move-result-object v2

    goto :goto_0

    :cond_6
    const-string v0, "SidebarSettingsFragmentKey"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto :goto_0

    :cond_7
    sget-object v0, Lcom/xj/winemu/sidebar/SidebarSettingsFragment;->r:Lcom/xj/winemu/sidebar/SidebarSettingsFragment$Companion;

    iget-object v1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->j:Lcom/xj/winemu/api/bean/WineActivityData;

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Lcom/xj/winemu/api/bean/WineActivityData;->e()Ljava/lang/String;

    move-result-object v2

    :cond_8
    invoke-virtual {v0, v2}, Lcom/xj/winemu/sidebar/SidebarSettingsFragment$Companion;->a(Ljava/lang/String;)Lcom/xj/winemu/sidebar/SidebarSettingsFragment;

    move-result-object v2

    :goto_0
    if-eqz v2, :cond_a

    iget-object v0, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->m:Ljava/util/Map;

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget p1, Lcom/xj/winemu/R$id;->layout_container:I

    iget-object v0, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->l:Landroidx/fragment/app/FragmentManager;

    invoke-static {p1, v0, v2}, Lcom/xj/base/ext/ShowHideExtKt;->a(ILandroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V

    goto :goto_1

    :cond_9
    iget-object v0, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->m:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/fragment/app/Fragment;

    if-eqz p1, :cond_a

    iget-object v0, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->l:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0, p1}, Lcom/xj/base/ext/ShowHideExtKt;->h(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V

    :cond_a
    :goto_1
    return-void
.end method

.method public final getMBinding()Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;
    .locals 1

    iget-object v0, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->k:Lcom/xj/winemu/databinding/WinemuActivitiySettingsLayoutBinding;

    return-object v0
.end method

.method public final setWineData(Lcom/xj/winemu/api/bean/WineActivityData;)V
    .locals 0
    .param p1    # Lcom/xj/winemu/api/bean/WineActivityData;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/xj/winemu/sidebar/WineActivityDrawerContent;->j:Lcom/xj/winemu/api/bean/WineActivityData;

    return-void
.end method
