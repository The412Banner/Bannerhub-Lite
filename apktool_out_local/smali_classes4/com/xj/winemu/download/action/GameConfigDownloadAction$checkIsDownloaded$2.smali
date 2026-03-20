.class final Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xj/winemu/download/action/GameConfigDownloadAction;->u(Lcom/xj/winemu/api/bean/EnvLayerEntity;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Ljava/lang/Boolean;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.xj.winemu.download.action.GameConfigDownloadAction$checkIsDownloaded$2"
    f = "GameConfigDownloadAction.kt"
    l = {
        0xcd,
        0xcf,
        0xd0
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $entity:Lcom/xj/winemu/api/bean/EnvLayerEntity;

.field label:I


# direct methods
.method public constructor <init>(Lcom/xj/winemu/api/bean/EnvLayerEntity;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/xj/winemu/api/bean/EnvLayerEntity;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;->$entity:Lcom/xj/winemu/api/bean/EnvLayerEntity;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance p1, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;

    iget-object v0, p0, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;->$entity:Lcom/xj/winemu/api/bean/EnvLayerEntity;

    invoke-direct {p1, v0, p2}, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;-><init>(Lcom/xj/winemu/api/bean/EnvLayerEntity;Lkotlin/coroutines/Continuation;)V

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineScope;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p1

    check-cast p1, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;

    sget-object p2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p1, p2}, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->g()Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;->label:I

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v1, :cond_3

    if-eq v1, v5, :cond_2

    if-eq v1, v3, :cond_1

    if-ne v1, v2, :cond_0

    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto :goto_2

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto :goto_3

    :cond_2
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto :goto_0

    :cond_3
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;->$entity:Lcom/xj/winemu/api/bean/EnvLayerEntity;

    invoke-virtual {p1}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getFileType()I

    move-result p1

    if-eq p1, v3, :cond_8

    if-eq p1, v2, :cond_6

    const/4 v1, 0x4

    if-eq p1, v1, :cond_4

    # BannerHub Lite: GPU driver (and any other unrecognised fileType) is not tracked
    # in EmuComponents/EmuContainers/EmuImageFs, so the original else branch returned
    # FALSE ("not downloaded") even after a successful md5-verified download — causing
    # checkNextStartTask to see the key already in the completed-downloads map (f) and
    # fire the "more than once" abort.  Jumping to :goto_1 (v4=1 → TRUE) tells
    # checkIsDownloaded that the item is done, so checkAllComplete can proceed normally.
    goto :goto_1

    :cond_4
    sget-object p1, Lcom/xj/winemu/EmuComponents;->c:Lcom/xj/winemu/EmuComponents$Companion;

    invoke-virtual {p1}, Lcom/xj/winemu/EmuComponents$Companion;->a()Lcom/xj/winemu/EmuComponents;

    move-result-object p1

    iget-object v1, p0, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;->$entity:Lcom/xj/winemu/api/bean/EnvLayerEntity;

    invoke-virtual {v1}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object v1

    iput v5, p0, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;->label:I

    invoke-virtual {p1, v1, p0}, Lcom/xj/winemu/EmuComponents;->q(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_5

    return-object v0

    :cond_5
    :goto_0
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_a

    :goto_1
    move v4, v5

    goto :goto_4

    :cond_6
    sget-object p1, Lcom/xj/winemu/EmuContainers;->f:Lcom/xj/winemu/EmuContainers$Companion;

    invoke-virtual {p1}, Lcom/xj/winemu/EmuContainers$Companion;->a()Lcom/xj/winemu/EmuContainers;

    move-result-object p1

    iget-object v1, p0, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;->$entity:Lcom/xj/winemu/api/bean/EnvLayerEntity;

    invoke-virtual {v1}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object v1

    iput v2, p0, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;->label:I

    invoke-virtual {p1, v1, p0}, Lcom/xj/winemu/EmuContainers;->B(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_7

    return-object v0

    :cond_7
    :goto_2
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_a

    goto :goto_1

    :cond_8
    sget-object p1, Lcom/xj/winemu/EmuImageFs;->g:Lcom/xj/winemu/EmuImageFs$Companion;

    invoke-virtual {p1}, Lcom/xj/winemu/EmuImageFs$Companion;->a()Lcom/xj/winemu/EmuImageFs;

    move-result-object p1

    iget-object v1, p0, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;->$entity:Lcom/xj/winemu/api/bean/EnvLayerEntity;

    invoke-virtual {v1}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object v1

    iput v3, p0, Lcom/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2;->label:I

    invoke-virtual {p1, v1, p0}, Lcom/xj/winemu/EmuImageFs;->C(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_9

    return-object v0

    :cond_9
    :goto_3
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_a

    goto :goto_1

    :cond_a
    :goto_4
    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/Boxing;->a(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
