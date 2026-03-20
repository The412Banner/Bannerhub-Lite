.class public final Lcom/xj/landscape/launcher/ui/setting/holder/SettingBtnHolder;
.super Lcom/xj/common/view/adapter/VBViewHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/xj/common/view/adapter/VBViewHolder<",
        "Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;",
        "Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
.end annotation


# instance fields
.field private refreshJob:Lkotlinx/coroutines/Job;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/xj/common/view/adapter/VBViewHolder;-><init>()V

    return-void
.end method

.method public static synthetic s(Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;Lcom/xj/common/view/focus/focus/view/FocusableConstraintLayout;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/xj/landscape/launcher/ui/setting/holder/SettingBtnHolder;->w(Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;Lcom/xj/common/view/focus/focus/view/FocusableConstraintLayout;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t(Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;Landroid/view/View;Z)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/xj/landscape/launcher/ui/setting/holder/SettingBtnHolder;->v(Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;Landroid/view/View;Z)V

    return-void
.end method

.method public static final v(Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;Landroid/view/View;Z)V
    .locals 6

    const-string p1, "$this_apply"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "layout"

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;->layout:Lcom/xj/common/view/focus/focus/view/FocusableConstraintLayout;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 p0, 0x8

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p0}, Lcom/xj/base/adaptscreen/AdaptiveSizeKt;->b(Ljava/lang/Number;)Lcom/xj/base/adaptscreen/AdaptiveSize;

    move-result-object p0

    invoke-virtual {p0}, Lcom/xj/base/adaptscreen/AdaptiveSize;->f()I

    move-result v1

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lcom/xj/common/utils/FocusableBorderExtKt;->g(Landroid/view/View;IIIILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;->layout:Lcom/xj/common/view/focus/focus/view/FocusableConstraintLayout;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/xj/common/utils/FocusableBorderExtKt;->b(Landroid/view/View;)V

    :goto_0
    return-void
.end method

.method public static final w(Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;Lcom/xj/common/view/focus/focus/view/FocusableConstraintLayout;)Lkotlin/Unit;
    .locals 2

    const-string v0, "$this_apply"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$entity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "it"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;->layout:Lcom/xj/common/view/focus/focus/view/FocusableConstraintLayout;

    invoke-virtual {p0}, Lcom/xj/common/view/focus/focus/view/FocusableConstraintLayout;->r()V

    invoke-virtual {p1}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->getContentType()I

    move-result p0

    # BannerHub Lite: Grant Root Access (contentType=0x64) — injected early while p2 is still a View
    const/16 v0, 0x64

    if-ne p0, v0, :bh_skip_root_grant

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/revanced/extension/gamehub/BhRootGrantHelper;->requestRoot(Landroid/content/Context;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :bh_skip_root_grant

    sget-object p1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->Companion:Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;

    invoke-virtual {p1}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_DELETE_PC_MU()I

    move-result p2

    const/4 v0, 0x2

    const/4 v1, 0x0

    if-ne p0, p2, :cond_0

    new-instance p0, Lcom/xj/landscape/launcher/event/ClearSimulatorDataEvent;

    invoke-direct {p0}, Lcom/xj/landscape/launcher/event/ClearSimulatorDataEvent;-><init>()V

    invoke-static {p0, v1, v0, v1}, Lcom/drake/channel/ChannelKt;->c(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_RESET_MAPPING()I

    move-result p2

    if-ne p0, p2, :cond_1

    new-instance p0, Lcom/xj/landscape/launcher/event/ReSetMappingEvent;

    invoke-direct {p0}, Lcom/xj/landscape/launcher/event/ReSetMappingEvent;-><init>()V

    invoke-static {p0, v1, v0, v1}, Lcom/drake/channel/ChannelKt;->c(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_FEEDBACK()I

    move-result p2

    if-ne p0, p2, :cond_2

    new-instance p0, Lcom/xj/landscape/launcher/event/ClickFeedBackEvent;

    invoke-direct {p0}, Lcom/xj/landscape/launcher/event/ClickFeedBackEvent;-><init>()V

    invoke-static {p0, v1, v0, v1}, Lcom/drake/channel/ChannelKt;->c(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_HOMEPAGE()I

    move-result p2

    if-ne p0, p2, :cond_3

    new-instance p0, Lcom/xj/landscape/launcher/event/ClickHomePageEvent;

    invoke-direct {p0}, Lcom/xj/landscape/launcher/event/ClickHomePageEvent;-><init>()V

    invoke-static {p0, v1, v0, v1}, Lcom/drake/channel/ChannelKt;->c(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_HID_TIPS()I

    move-result p2

    if-ne p0, p2, :cond_4

    new-instance p0, Lcom/xj/landscape/launcher/event/ClickHidTipsEvent;

    invoke-direct {p0}, Lcom/xj/landscape/launcher/event/ClickHidTipsEvent;-><init>()V

    invoke-static {p0, v1, v0, v1}, Lcom/drake/channel/ChannelKt;->c(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_CLEAR_CAHCE()I

    move-result p1

    if-ne p0, p1, :cond_5

    new-instance p0, Lcom/xj/landscape/launcher/event/ClickClearCache;

    invoke-direct {p0}, Lcom/xj/landscape/launcher/event/ClickClearCache;-><init>()V

    invoke-static {p0, v1, v0, v1}, Lcom/drake/channel/ChannelKt;->c(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    :cond_5
    :goto_0
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public bridge synthetic l(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    invoke-virtual {p0, p1}, Lcom/xj/landscape/launcher/ui/setting/holder/SettingBtnHolder;->u(Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;)V

    return-void
.end method

.method public n()V
    .locals 3

    invoke-super {p0}, Lcom/xj/common/view/adapter/VBViewHolder;->n()V

    iget-object v0, p0, Lcom/xj/landscape/launcher/ui/setting/holder/SettingBtnHolder;->refreshJob:Lkotlinx/coroutines/Job;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2, v1}, Lkotlinx/coroutines/Job$DefaultImpls;->a(Lkotlinx/coroutines/Job;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    :cond_0
    iput-object v1, p0, Lcom/xj/landscape/launcher/ui/setting/holder/SettingBtnHolder;->refreshJob:Lkotlinx/coroutines/Job;

    return-void
.end method

.method public p()V
    .locals 0

    invoke-super {p0}, Lcom/xj/common/view/adapter/VBViewHolder;->p()V

    invoke-virtual {p0}, Lcom/xj/landscape/launcher/ui/setting/holder/SettingBtnHolder;->n()V

    return-void
.end method

.method public u(Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;)V
    .locals 10

    const-string v0, "entity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xj/common/view/adapter/VBViewHolder;->f()Landroidx/viewbinding/ViewBinding;

    move-result-object v0

    check-cast v0, Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;

    iget-object v1, p0, Lcom/xj/landscape/launcher/ui/setting/holder/SettingBtnHolder;->refreshJob:Lkotlinx/coroutines/Job;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const/4 v3, 0x1

    invoke-static {v1, v2, v3, v2}, Lkotlinx/coroutines/Job$DefaultImpls;->a(Lkotlinx/coroutines/Job;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    :cond_0
    invoke-virtual {p1}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->getContentType()I

    move-result v1

    sget-object v3, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->Companion:Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;

    invoke-virtual {v3}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_RESET_MAPPING()I

    move-result v3

    if-ne v1, v3, :cond_1

    invoke-static {}, Lkotlinx/coroutines/CoroutineScopeKt;->b()Lkotlinx/coroutines/CoroutineScope;

    move-result-object v4

    new-instance v7, Lcom/xj/landscape/launcher/ui/setting/holder/SettingBtnHolder$onBind$1$1;

    invoke-direct {v7, v0, v2}, Lcom/xj/landscape/launcher/ui/setting/holder/SettingBtnHolder$onBind$1$1;-><init>(Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;Lkotlin/coroutines/Continuation;)V

    const/4 v8, 0x3

    const/4 v9, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v4 .. v9}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    move-result-object v1

    iput-object v1, p0, Lcom/xj/landscape/launcher/ui/setting/holder/SettingBtnHolder;->refreshJob:Lkotlinx/coroutines/Job;

    goto :goto_0

    :cond_1
    iget-object v1, v0, Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;->tvTitle:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->getContentName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    iget-object v1, v0, Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;->layout:Lcom/xj/common/view/focus/focus/view/FocusableConstraintLayout;

    new-instance v2, Lcom/xj/landscape/launcher/ui/setting/holder/a;

    invoke-direct {v2, v0}, Lcom/xj/landscape/launcher/ui/setting/holder/a;-><init>(Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object v1, v0, Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;->layout:Lcom/xj/common/view/focus/focus/view/FocusableConstraintLayout;

    const-string v2, "layout"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/xj/common/view/focus/focus/view/FocusViewsExtKt;->b(Landroid/view/View;)V

    iget-object v3, v0, Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;->layout:Lcom/xj/common/view/focus/focus/view/FocusableConstraintLayout;

    new-instance v7, Lcom/xj/landscape/launcher/ui/setting/holder/b;

    invoke-direct {v7, v0, p1}, Lcom/xj/landscape/launcher/ui/setting/holder/b;-><init>(Lcom/xj/landscape/launcher/databinding/LlauncherItemSettingFocusableTextBinding;Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;)V

    const/4 v8, 0x3

    const/4 v9, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    invoke-static/range {v3 .. v9}, Lcom/xj/common/utils/ClickUtilsKt;->l(Landroid/view/View;JZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)V

    return-void
.end method
