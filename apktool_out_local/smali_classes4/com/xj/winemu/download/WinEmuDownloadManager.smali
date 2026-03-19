.class public final Lcom/xj/winemu/download/WinEmuDownloadManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/arialyy/aria/core/download/DownloadTaskListener;


# annotations
.annotation runtime Lkotlin/Metadata;
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final a:Lcom/xj/winemu/download/WinEmuDownloadManager;

.field public static final b:Lkotlinx/coroutines/CoroutineScope;

.field public static c:I

.field public static final d:Lkotlin/Lazy;

.field public static final e:Ljava/util/List;

.field public static final f:Lkotlin/Lazy;

.field public static final g:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-direct {v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;-><init>()V

    sput-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->a:Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-static {}, Lkotlinx/coroutines/CoroutineScopeKt;->b()Lkotlinx/coroutines/CoroutineScope;

    move-result-object v0

    sput-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    new-instance v0, Lcom/xj/winemu/download/b;

    invoke-direct {v0}, Lcom/xj/winemu/download/b;-><init>()V

    invoke-static {v0}, Lkotlin/LazyKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->d:Lkotlin/Lazy;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->e:Ljava/util/List;

    new-instance v0, Lcom/xj/winemu/download/c;

    invoke-direct {v0}, Lcom/xj/winemu/download/c;-><init>()V

    invoke-static {v0}, Lkotlin/LazyKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->f:Lkotlin/Lazy;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->g:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final J(Lcom/xj/winemu/api/bean/EnvLayerEntity;)Z
    .locals 1

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getType()I

    move-result p0

    const/4 v0, 0x7

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static final K(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Z
    .locals 1

    const-string v0, "$tmp0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public static final L(Lcom/xj/winemu/api/bean/EnvLayerEntity;)Z
    .locals 1

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getType()I

    move-result p0

    const/4 v0, 0x7

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static final L0(JLcom/arialyy/aria/core/download/DownloadEntity;)Z
    .locals 2

    const-string v0, "it"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/arialyy/aria/core/common/AbsEntity;->getId()J

    move-result-wide v0

    cmp-long p0, v0, p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static final M(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Z
    .locals 1

    const-string v0, "$tmp0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public static final M0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Z
    .locals 1

    const-string v0, "$tmp0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public static final N0()Lcom/xj/winemu/data/repository/EnvLayerRepository;
    .locals 1

    new-instance v0, Lcom/xj/winemu/data/repository/EnvLayerRepository;

    invoke-direct {v0}, Lcom/xj/winemu/data/repository/EnvLayerRepository;-><init>()V

    return-object v0
.end method

.method public static synthetic P(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/arialyy/aria/core/common/HttpOption;ZZZZILjava/lang/Object;)V
    .locals 11

    move/from16 v0, p9

    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_0

    const-string v1, ""

    move-object v5, v1

    goto :goto_0

    :cond_0
    move-object v5, p3

    :goto_0
    and-int/lit8 v1, v0, 0x8

    if-eqz v1, :cond_1

    new-instance v1, Lcom/arialyy/aria/core/common/HttpOption;

    invoke-direct {v1}, Lcom/arialyy/aria/core/common/HttpOption;-><init>()V

    move-object v6, v1

    goto :goto_1

    :cond_1
    move-object v6, p4

    :goto_1
    and-int/lit8 v1, v0, 0x10

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    move v7, v2

    goto :goto_2

    :cond_2
    move/from16 v7, p5

    :goto_2
    and-int/lit8 v1, v0, 0x20

    if-eqz v1, :cond_3

    move v8, v2

    goto :goto_3

    :cond_3
    move/from16 v8, p6

    :goto_3
    and-int/lit8 v1, v0, 0x40

    if-eqz v1, :cond_4

    const/4 v1, 0x1

    move v9, v1

    goto :goto_4

    :cond_4
    move/from16 v9, p7

    :goto_4
    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_5

    move v10, v2

    goto :goto_5

    :cond_5
    move/from16 v10, p8

    :goto_5
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    invoke-virtual/range {v2 .. v10}, Lcom/xj/winemu/download/WinEmuDownloadManager;->O(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/arialyy/aria/core/common/HttpOption;ZZZZ)V

    return-void
.end method

.method public static synthetic Q0(Lcom/xj/winemu/download/WinEmuDownloadManager;JZILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    const/4 p3, 0x1

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/xj/winemu/download/WinEmuDownloadManager;->P0(JZ)V

    return-void
.end method

.method public static synthetic X0(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/lang/String;ZZLcom/xj/common/data/gameinfo/InstalledGameSource;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V
    .locals 6

    and-int/lit8 p7, p6, 0x2

    if-eqz p7, :cond_0

    const/4 p2, 0x0

    :cond_0
    move v2, p2

    and-int/lit8 p2, p6, 0x10

    if-eqz p2, :cond_1

    const/4 p5, 0x0

    :cond_1
    move-object v5, p5

    move-object v0, p0

    move-object v1, p1

    move v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/xj/winemu/download/WinEmuDownloadManager;->W0(Ljava/lang/String;ZZLcom/xj/common/data/gameinfo/InstalledGameSource;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public static synthetic Y(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/drake/net/interfaces/ProgressListener;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 7

    and-int/lit8 p7, p7, 0x10

    if-eqz p7, :cond_0

    const/4 p5, 0x0

    :cond_0
    move-object v5, p5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/xj/winemu/download/WinEmuDownloadManager;->X(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/drake/net/interfaces/ProgressListener;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final Y0()Lcom/xj/common/service/ISteamGameService$ISteamGameDownloadService;
    .locals 2

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-class v1, Lcom/xj/common/service/ISteamGameService;

    invoke-static {v1, v0}, Lcom/therouter/TheRouter;->e(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xj/common/service/ISteamGameService;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/xj/common/service/ISteamGameService;->t()Lcom/xj/common/service/ISteamGameService$ISteamGameDownloadService;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public static synthetic a(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->K(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static synthetic a0(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/util/Set;Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;ILkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 6

    and-int/lit8 p6, p6, 0x8

    if-eqz p6, :cond_0

    const/4 p4, 0x4

    :cond_0
    move v4, p4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/xj/winemu/download/WinEmuDownloadManager;->Z(Ljava/util/Set;Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b()Lcom/xj/winemu/data/repository/EnvLayerRepository;
    .locals 1

    invoke-static {}, Lcom/xj/winemu/download/WinEmuDownloadManager;->N0()Lcom/xj/winemu/data/repository/EnvLayerRepository;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic b1(Lcom/xj/winemu/download/WinEmuDownloadManager;JZILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    const/4 p3, 0x1

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/xj/winemu/download/WinEmuDownloadManager;->a1(JZ)V

    return-void
.end method

.method public static synthetic c()Lcom/xj/common/service/ISteamGameService$ISteamGameDownloadService;
    .locals 1

    invoke-static {}, Lcom/xj/winemu/download/WinEmuDownloadManager;->Y0()Lcom/xj/common/service/ISteamGameService$ISteamGameDownloadService;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic d(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->M(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static synthetic e(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->M0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static synthetic f(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->y0(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Lcom/xj/winemu/api/bean/EnvLayerEntity;)Z
    .locals 0

    invoke-static {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->J(Lcom/xj/winemu/api/bean/EnvLayerEntity;)Z

    move-result p0

    return p0
.end method

.method public static synthetic h(Lcom/xj/winemu/api/bean/EnvLayerEntity;)Z
    .locals 0

    invoke-static {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->L(Lcom/xj/winemu/api/bean/EnvLayerEntity;)Z

    move-result p0

    return p0
.end method

.method public static synthetic i(JLcom/arialyy/aria/core/download/DownloadEntity;)Z
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->L0(JLcom/arialyy/aria/core/download/DownloadEntity;)Z

    move-result p0

    return p0
.end method

.method public static final synthetic j(Lcom/xj/winemu/download/WinEmuDownloadManager;Lcom/arialyy/aria/core/task/DownloadTask;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->C(Lcom/arialyy/aria/core/task/DownloadTask;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic k(Lcom/xj/winemu/download/WinEmuDownloadManager;Lcom/xj/common/download/bean/AriaDownloadArgs;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->G(Lcom/xj/common/download/bean/AriaDownloadArgs;)V

    return-void
.end method

.method public static final synthetic l(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;Ljava/util/Set;Lcom/xj/winemu/api/bean/EnvLayerEntity;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0

    invoke-virtual/range {p0 .. p5}, Lcom/xj/winemu/download/WinEmuDownloadManager;->H(Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;Ljava/util/Set;Lcom/xj/winemu/api/bean/EnvLayerEntity;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic m(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/xj/winemu/download/WinEmuDownloadManager;->N(Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic n(Lcom/xj/winemu/download/WinEmuDownloadManager;Lcom/arialyy/aria/core/download/DownloadEntity;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->Q(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    return-void
.end method

.method public static final synthetic o(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/util/Set;Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0

    invoke-virtual/range {p0 .. p5}, Lcom/xj/winemu/download/WinEmuDownloadManager;->Z(Ljava/util/Set;Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic p(Lcom/xj/winemu/download/WinEmuDownloadManager;)Lcom/arialyy/aria/core/download/DownloadReceiver;
    .locals 0

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic q()Ljava/util/Map;
    .locals 1

    sget-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->g:Ljava/util/Map;

    return-object v0
.end method

.method public static final synthetic r(Lcom/xj/winemu/download/WinEmuDownloadManager;)Lcom/xj/winemu/data/repository/EnvLayerRepository;
    .locals 0

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->m0()Lcom/xj/winemu/data/repository/EnvLayerRepository;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic s(Lcom/xj/winemu/download/WinEmuDownloadManager;)Lcom/xj/common/service/ISteamGameService$ISteamGameDownloadService;
    .locals 0

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->n0()Lcom/xj/common/service/ISteamGameService$ISteamGameDownloadService;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic t()Ljava/util/List;
    .locals 1

    sget-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->e:Ljava/util/List;

    return-object v0
.end method

.method public static final synthetic u(Lcom/xj/winemu/download/WinEmuDownloadManager;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->G0(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic v(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->S0(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public static final synthetic w(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/xj/winemu/download/WinEmuDownloadManager;->T0(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final y0(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;Z)Lkotlin/Unit;
    .locals 4

    if-nez p2, :cond_2

    sget-object p2, Lcom/xj/winemu/download/WinEmuDownloadManager;->a:Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-virtual {p2, p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->B(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;)V

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/arialyy/aria/core/task/DownloadTask;->getFilePath()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getUrl()Ljava/lang/String;

    move-result-object v0

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onTaskFail exception : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " , task = "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ",downloadUrl = "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "WinEmuDownloadManager"

    invoke-static {v0, p1}, Lcom/xj/common/utils/XjLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "onTaskFail"

    invoke-virtual {p2, p1, p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->S0(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;)V

    :cond_2
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static synthetic z(Lcom/xj/winemu/download/WinEmuDownloadManager;JZZILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    const/4 p3, 0x0

    :cond_0
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_1

    const/4 p4, 0x1

    :cond_1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/xj/winemu/download/WinEmuDownloadManager;->y(JZZ)V

    return-void
.end method


# virtual methods
.method public final A(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 5

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p1

    if-nez p1, :cond_0

    goto/16 :goto_4

    :cond_0
    :try_start_0
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->e:Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xj/winemu/download/action/DependOnDownloadAction;

    invoke-interface {v2}, Lcom/xj/winemu/download/action/DependOnDownloadAction;->b()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-interface {v2}, Lcom/xj/winemu/download/action/DependOnDownloadAction;->f()[I

    move-result-object v3

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsEntity;->getState()I

    move-result v4

    invoke-static {v3, v4}, Lkotlin/collections/ArraysKt;->F([II)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :cond_2
    :goto_1
    invoke-interface {v2, p1}, Lcom/xj/winemu/download/action/DependOnDownloadAction;->g(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    invoke-interface {v2}, Lcom/xj/winemu/download/action/DependOnDownloadAction;->a()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    if-eqz p1, :cond_4

    sget-object p1, Lcom/xj/winemu/download/WinEmuDownloadManager;->e:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    :cond_4
    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :goto_2
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {p1}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :goto_3
    invoke-static {p1}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {p1}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "msg = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " , err = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "WinEmuDownloadManager_checkActions"

    invoke-static {v0, p1}, Lcom/xj/common/utils/XjLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_4
    return-void
.end method

.method public A0(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 1

    const-string v0, "onTaskResume"

    invoke-virtual {p0, v0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->S0(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public final B(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;)V
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFileName()Ljava/lang/String;

    move-result-object v0

    :cond_2
    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "name = "

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " fileSize = "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "WinEmuDownloadManager"

    invoke-static {v0, p1}, Lcom/xj/common/utils/XjLog;->h(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    sget-object p1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v1}, Lcom/xj/winemu/download/DownloadExtKt;->b(Lcom/arialyy/aria/core/download/DownloadEntity;)Lcom/xj/winemu/data/bean/DownloadExtendInfo;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getFileSize()J

    move-result-wide v2

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_4

    :cond_3
    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v2

    :goto_1
    sget-object p1, Lcom/xj/winemu/download/WinEmuDownloadManager;->a:Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-virtual {p1, v2, v3, v1, p2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->F(JLcom/arialyy/aria/core/download/DownloadEntity;Ljava/lang/Exception;)Z

    move-result p2

    if-eqz p2, :cond_4

    return-void

    :cond_4
    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->s0(Z)Z

    move-result p1

    if-nez p1, :cond_6

    invoke-static {v1}, Lcom/xj/winemu/download/DownloadExtKt;->b(Lcom/arialyy/aria/core/download/DownloadEntity;)Lcom/xj/winemu/data/bean/DownloadExtendInfo;

    move-result-object p1

    if-nez p1, :cond_5

    goto :goto_3

    :cond_5
    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->setState(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-static {p1}, Lcom/blankj/utilcode/util/GsonUtils;->j(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/arialyy/aria/core/common/AbsEntity;->setStr(Ljava/lang/String;)V

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p1

    :try_start_2
    sget-object p2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {p1}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :goto_2
    invoke-static {p1}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    const-string p2, "refreshExtendStr"

    invoke-static {p1}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "failure : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/xj/common/utils/XjLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    :goto_3
    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_5

    :goto_4
    sget-object p2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {p1}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_5
    return-void
.end method

.method public B0(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 1

    const-string v0, "onTaskRunning"

    invoke-virtual {p0, v0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->S0(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public final C(Lcom/arialyy/aria/core/task/DownloadTask;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 7

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-static {v1}, Lcom/xj/winemu/download/DownloadExtKt;->b(Lcom/arialyy/aria/core/download/DownloadEntity;)Lcom/xj/winemu/data/bean/DownloadExtendInfo;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    const-string v2, "WinEmuDownloadManager"

    if-nez v1, :cond_1

    const-string p1, "checkFileMd5 , \u6269\u5c55\u4fe1\u606f\u4e3a\u7a7a"

    invoke-static {v2, p1}, Lcom/xj/common/utils/XjLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/Boxing;->a(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_1
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_3

    :cond_2
    const-string p1, ""

    :cond_3
    invoke-virtual {v1}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getVersion()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u4e0b\u8f7d\u5b8c\u6210\uff08"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " version = "

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\uff0c\u5f00\u59cb\u6821\u9a8cmd5\uff09filePath = "

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/xj/common/utils/XjLog;->h(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lcom/xj/winemu/download/WinEmuDownloadManager$checkEmuFileMd5$2;

    invoke-direct {v2, p1, v1, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager$checkEmuFileMd5$2;-><init>(Ljava/lang/String;Lcom/xj/winemu/data/bean/DownloadExtendInfo;Lkotlin/coroutines/Continuation;)V

    invoke-static {v2, p2}, Lcom/drake/net/utils/SuspendKt;->d(Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public C0(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 1

    const-string v0, "onTaskStart"

    invoke-virtual {p0, v0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->S0(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public final D(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;Lkotlin/jvm/functions/Function1;)V
    .locals 9

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkIsExpired , code = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " , e = "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v1, "WinEmuDownloadManager"

    invoke-static {v1, p2}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p1, :cond_1

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p3, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p2

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;)V

    invoke-static {p2}, Lcom/xj/winemu/download/DownloadExtKt;->b(Lcom/arialyy/aria/core/download/DownloadEntity;)Lcom/xj/winemu/data/bean/DownloadExtendInfo;

    move-result-object v1

    if-nez v1, :cond_2

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p3, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_2
    invoke-virtual {v1}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getFileType()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_3

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p3, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_3
    invoke-virtual {v1}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getFileId()I

    move-result v1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1

    :cond_4
    move-object p1, v0

    :goto_1
    if-nez p1, :cond_5

    goto :goto_2

    :cond_5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/16 v2, 0x193

    if-ne p1, v2, :cond_6

    sget-object v3, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->c()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v4

    new-instance v6, Lcom/xj/winemu/download/WinEmuDownloadManager$checkIsGameExpired$1;

    invoke-direct {v6, v1, p3, p2, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager$checkIsGameExpired$1;-><init>(ILkotlin/jvm/functions/Function1;Lcom/arialyy/aria/core/download/DownloadEntity;Lkotlin/coroutines/Continuation;)V

    const/4 v7, 0x2

    const/4 v8, 0x0

    const/4 v5, 0x0

    invoke-static/range {v3 .. v8}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    goto :goto_3

    :cond_6
    :goto_2
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p3, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_3
    return-void
.end method

.method public D0(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->B(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;)V

    const-string v0, "onTaskStop"

    invoke-virtual {p0, v0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->S0(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public final E(J)Z
    .locals 5

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/blankj/utilcode/util/FileUtils;->B(Ljava/lang/String;)J

    move-result-wide v0

    cmp-long v2, p1, v0

    if-gez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "checkStorageEnough , fileSize = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, ",external Storage size = "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "WinEmuDownloadManager"

    invoke-static {p2, p1}, Lcom/xj/common/utils/XjLog;->p(Ljava/lang/String;Ljava/lang/String;)V

    return v2
.end method

.method public E0(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 1

    const-string v0, "onWait"

    invoke-virtual {p0, v0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->S0(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public final F(JLcom/arialyy/aria/core/download/DownloadEntity;Ljava/lang/Exception;)Z
    .locals 7

    const-string v0, "failure : "

    const-string v1, "refreshExtendStr"

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x2

    if-eqz p4, :cond_2

    invoke-virtual {p4}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p4

    if-eqz p4, :cond_2

    const-string v5, "\u5185\u5b58\u7a7a\u95f4\u4e0d\u8db3"

    const/4 v6, 0x0

    invoke-static {p4, v5, v2, v4, v6}, Lkotlin/text/StringsKt;->c0(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result p4

    if-ne p4, v3, :cond_2

    invoke-static {p3}, Lcom/xj/winemu/download/DownloadExtKt;->b(Lcom/arialyy/aria/core/download/DownloadEntity;)Lcom/xj/winemu/data/bean/DownloadExtendInfo;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p1, v4}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->setState(I)V

    :try_start_0
    sget-object p2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {p1}, Lcom/blankj/utilcode/util/GsonUtils;->j(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/arialyy/aria/core/common/AbsEntity;->setStr(Ljava/lang/String;)V

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    sget-object p2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {p1}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :goto_0
    invoke-static {p1}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {p1}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/xj/common/utils/XjLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_1
    return v3

    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->E(J)Z

    move-result p1

    if-eqz p1, :cond_3

    return v2

    :cond_3
    invoke-static {p3}, Lcom/xj/winemu/download/DownloadExtKt;->b(Lcom/arialyy/aria/core/download/DownloadEntity;)Lcom/xj/winemu/data/bean/DownloadExtendInfo;

    move-result-object p1

    if-nez p1, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {p1, v4}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->setState(I)V

    :try_start_1
    sget-object p2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {p1}, Lcom/blankj/utilcode/util/GsonUtils;->j(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/arialyy/aria/core/common/AbsEntity;->setStr(Ljava/lang/String;)V

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p1

    sget-object p2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {p1}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :goto_2
    invoke-static {p1}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-static {p1}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/xj/common/utils/XjLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_3
    return v3
.end method

.method public final F0(J)V
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "reStart -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "WinEmuDownloadManager"

    invoke-static {v1, v0}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->s0(Z)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    sget-object v1, Lcom/xj/common/utils/LogA;->a:Lcom/xj/common/utils/LogA;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u542f\u52a8\u65b0\u4e0b\u8f7d "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/xj/common/utils/LogA;->b(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/arialyy/aria/core/download/DownloadReceiver;->load(J)Lcom/arialyy/aria/core/download/target/HttpNormalTarget;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->ignoreCheckPermissions()Lcom/arialyy/aria/core/common/AbsNormalTarget;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/target/HttpNormalTarget;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p2

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_1

    invoke-static {p2}, Lcom/blankj/utilcode/util/FileUtils;->k(Ljava/lang/String;)Z

    :cond_1
    sget-object p2, Lcom/xj/winemu/download/WinEmuDownloadManager;->a:Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-virtual {p2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->n0()Lcom/xj/common/service/ISteamGameService$ISteamGameDownloadService;

    move-result-object p2

    if-eqz p2, :cond_2

    invoke-interface {p2}, Lcom/xj/common/service/ISteamGameService$ISteamGameDownloadService;->h()V

    :cond_2
    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->resume(Z)V

    return-void
.end method

.method public final G(Lcom/xj/common/download/bean/AriaDownloadArgs;)V
    .locals 7

    invoke-virtual {p1}, Lcom/xj/common/download/bean/AriaDownloadArgs;->isCheckToDownloadSubData()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/xj/common/download/bean/AriaDownloadArgs;->getSubData()Lcom/xj/common/download/bean/SubData;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->c()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    new-instance v4, Lcom/xj/winemu/download/WinEmuDownloadManager$checkSubDataNeed2Download$1;

    const/4 v0, 0x0

    invoke-direct {v4, p1, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager$checkSubDataNeed2Download$1;-><init>(Lcom/xj/common/download/bean/AriaDownloadArgs;Lkotlin/coroutines/Continuation;)V

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    :cond_0
    return-void
.end method

.method public final G0(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2

    new-instance v0, Lcom/xj/winemu/download/WinEmuDownloadManager$refreshDownloadUrl$2;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/xj/winemu/download/WinEmuDownloadManager$refreshDownloadUrl$2;-><init>(ILkotlin/coroutines/Continuation;)V

    invoke-static {v0, p2}, Lcom/drake/net/utils/SuspendKt;->d(Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final H(Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;Ljava/util/Set;Lcom/xj/winemu/api/bean/EnvLayerEntity;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 10

    instance-of v0, p5, Lcom/xj/winemu/download/WinEmuDownloadManager$checkUserPreferComponent$1;

    if-eqz v0, :cond_0

    move-object v0, p5

    check-cast v0, Lcom/xj/winemu/download/WinEmuDownloadManager$checkUserPreferComponent$1;

    iget v1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$checkUserPreferComponent$1;->label:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$checkUserPreferComponent$1;->label:I

    :goto_0
    move-object v6, v0

    goto :goto_1

    :cond_0
    new-instance v0, Lcom/xj/winemu/download/WinEmuDownloadManager$checkUserPreferComponent$1;

    invoke-direct {v0, p0, p5}, Lcom/xj/winemu/download/WinEmuDownloadManager$checkUserPreferComponent$1;-><init>(Lcom/xj/winemu/download/WinEmuDownloadManager;Lkotlin/coroutines/Continuation;)V

    goto :goto_0

    :goto_1
    iget-object p5, v6, Lcom/xj/winemu/download/WinEmuDownloadManager$checkUserPreferComponent$1;->result:Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->g()Ljava/lang/Object;

    move-result-object v0

    iget v1, v6, Lcom/xj/winemu/download/WinEmuDownloadManager$checkUserPreferComponent$1;->label:I

    const/4 v2, 0x5

    const/4 v3, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v9, 0x1

    if-eqz v1, :cond_3

    if-eq v1, v9, :cond_2

    if-eq v1, v5, :cond_2

    if-eq v1, v4, :cond_2

    if-eq v1, v3, :cond_2

    if-ne v1, v2, :cond_1

    goto :goto_2

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_2
    invoke-static {p5}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto/16 :goto_8

    :cond_3
    invoke-static {p5}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    const/4 p5, 0x0

    if-nez p2, :cond_4

    invoke-static {p5}, Lkotlin/coroutines/jvm/internal/Boxing;->a(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_4
    sget-object v1, Lcom/xj/winemu/settings/PcGameSettingDataHelper;->a:Lcom/xj/winemu/settings/PcGameSettingDataHelper;

    invoke-virtual {v1, p1}, Lcom/xj/winemu/settings/PcGameSettingDataHelper;->w(Ljava/lang/String;)Lcom/xj/winemu/settings/PcGameSettingOperations;

    move-result-object p1

    invoke-virtual {p2}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getType()I

    move-result v1

    sget-object v7, Lcom/xj/winemu/api/bean/ComponentType;->TRANSLATOR:Lcom/xj/winemu/api/bean/ComponentType;

    invoke-virtual {v7}, Lcom/xj/winemu/api/bean/ComponentType;->getType()I

    move-result v7

    const/4 v8, 0x0

    if-ne v1, v7, :cond_7

    sget-object p5, Lcom/xj/winemu/EmuContainers;->f:Lcom/xj/winemu/EmuContainers$Companion;

    invoke-virtual {p4}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p5, p4}, Lcom/xj/winemu/EmuContainers$Companion;->b(Ljava/lang/String;)I

    move-result p4

    if-ne p4, v9, :cond_6

    invoke-virtual {p1}, Lcom/xj/winemu/settings/PcGameSettingOperations;->e0()Lcom/xj/winemu/bean/PcSettingDataEntity;

    move-result-object p1

    if-eqz p1, :cond_5

    :goto_3
    invoke-virtual {p1}, Lcom/xj/winemu/bean/PcSettingDataEntity;->getName()Ljava/lang/String;

    move-result-object p1

    move-object v3, p1

    goto :goto_4

    :cond_5
    move-object v3, v8

    goto :goto_4

    :cond_6
    invoke-virtual {p1}, Lcom/xj/winemu/settings/PcGameSettingOperations;->w()Lcom/xj/winemu/bean/PcSettingDataEntity;

    move-result-object p1

    if-eqz p1, :cond_5

    goto :goto_3

    :goto_4
    iput v9, v6, Lcom/xj/winemu/download/WinEmuDownloadManager$checkUserPreferComponent$1;->label:I

    const/4 v5, 0x0

    const/16 v7, 0x8

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p3

    move-object v4, p2

    invoke-static/range {v1 .. v8}, Lcom/xj/winemu/download/WinEmuDownloadManager;->a0(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/util/Set;Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;ILkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_f

    return-object v0

    :cond_7
    sget-object p4, Lcom/xj/winemu/api/bean/ComponentType;->GPU:Lcom/xj/winemu/api/bean/ComponentType;

    invoke-virtual {p4}, Lcom/xj/winemu/api/bean/ComponentType;->getType()I

    move-result p4

    if-ne v1, p4, :cond_9

    invoke-virtual {p1}, Lcom/xj/winemu/settings/PcGameSettingOperations;->H0()Lcom/xj/winemu/bean/PcSettingDataEntity;

    move-result-object p1

    if-eqz p1, :cond_f

    invoke-virtual {p1}, Lcom/xj/winemu/bean/PcSettingDataEntity;->getId()I

    move-result p1

    const/4 p4, -0x1

    if-eq p1, p4, :cond_f

    invoke-virtual {p2}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object v3

    :goto_5
    iput v5, v6, Lcom/xj/winemu/download/WinEmuDownloadManager$checkUserPreferComponent$1;->label:I

    const/4 v5, 0x0

    const/16 v7, 0x8

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p3

    move-object v4, p2

    invoke-static/range {v1 .. v8}, Lcom/xj/winemu/download/WinEmuDownloadManager;->a0(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/util/Set;Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;ILkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_f

    return-object v0

    :cond_9
    sget-object p4, Lcom/xj/winemu/api/bean/ComponentType;->DXVK:Lcom/xj/winemu/api/bean/ComponentType;

    invoke-virtual {p4}, Lcom/xj/winemu/api/bean/ComponentType;->getType()I

    move-result p4

    if-ne v1, p4, :cond_b

    invoke-virtual {p1}, Lcom/xj/winemu/settings/PcGameSettingOperations;->Z()Lcom/xj/winemu/bean/PcSettingDataEntity;

    move-result-object p1

    if-eqz p1, :cond_a

    invoke-virtual {p1}, Lcom/xj/winemu/bean/PcSettingDataEntity;->getName()Ljava/lang/String;

    move-result-object p1

    move-object v3, p1

    goto :goto_6

    :cond_a
    move-object v3, v8

    :goto_6
    iput v4, v6, Lcom/xj/winemu/download/WinEmuDownloadManager$checkUserPreferComponent$1;->label:I

    const/4 v5, 0x0

    const/16 v7, 0x8

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p3

    move-object v4, p2

    invoke-static/range {v1 .. v8}, Lcom/xj/winemu/download/WinEmuDownloadManager;->a0(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/util/Set;Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;ILkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_f

    return-object v0

    :cond_b
    sget-object p4, Lcom/xj/winemu/api/bean/ComponentType;->VKD3D:Lcom/xj/winemu/api/bean/ComponentType;

    invoke-virtual {p4}, Lcom/xj/winemu/api/bean/ComponentType;->getType()I

    move-result p4

    if-ne v1, p4, :cond_d

    invoke-virtual {p1}, Lcom/xj/winemu/settings/PcGameSettingOperations;->f1()Lcom/xj/winemu/bean/PcSettingDataEntity;

    move-result-object p1

    if-eqz p1, :cond_c

    invoke-virtual {p1}, Lcom/xj/winemu/bean/PcSettingDataEntity;->getName()Ljava/lang/String;

    move-result-object p1

    goto :goto_7

    :cond_c
    move-object p1, v8

    :goto_7
    iput v3, v6, Lcom/xj/winemu/download/WinEmuDownloadManager$checkUserPreferComponent$1;->label:I

    const/4 v5, 0x0

    const/16 v7, 0x8

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p3

    move-object v3, p1

    move-object v4, p2

    invoke-static/range {v1 .. v8}, Lcom/xj/winemu/download/WinEmuDownloadManager;->a0(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/util/Set;Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;ILkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_f

    return-object v0

    :cond_d
    sget-object p4, Lcom/xj/winemu/api/bean/ComponentType;->STEAMCLIENT:Lcom/xj/winemu/api/bean/ComponentType;

    invoke-virtual {p4}, Lcom/xj/winemu/api/bean/ComponentType;->getType()I

    move-result p4

    if-ne v1, p4, :cond_e

    invoke-virtual {p1}, Lcom/xj/winemu/settings/PcGameSettingOperations;->P0()Lcom/xj/winemu/bean/PcSettingDataEntity;

    move-result-object p1

    if-eqz p1, :cond_f

    invoke-virtual {p1}, Lcom/xj/winemu/bean/PcSettingDataEntity;->getId()I

    move-result p1

    const/4 p4, -0x1

    if-eq p1, p4, :cond_f

    invoke-virtual {p2}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object v3

    iput v2, v6, Lcom/xj/winemu/download/WinEmuDownloadManager$checkUserPreferComponent$1;->label:I

    const/4 v5, 0x0

    const/16 v7, 0x8

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p3

    move-object v4, p2

    invoke-static/range {v1 .. v8}, Lcom/xj/winemu/download/WinEmuDownloadManager;->a0(Lcom/xj/winemu/download/WinEmuDownloadManager;Ljava/util/Set;Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;ILkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_f

    return-object v0

    :cond_e
    move v9, p5

    :cond_f
    :goto_8
    invoke-static {v9}, Lkotlin/coroutines/jvm/internal/Boxing;->a(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public final H0(Z)V
    .locals 6

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadReceiver;->getAllCompleteTask()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_2

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/common/AbsEntity;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/arialyy/aria/core/download/DownloadReceiver;->load(J)Lcom/arialyy/aria/core/download/target/HttpNormalTarget;

    move-result-object v2

    invoke-virtual {v2}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->ignoreCheckPermissions()Lcom/arialyy/aria/core/common/AbsNormalTarget;

    if-eqz p1, :cond_1

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->cancel(Z)V

    invoke-virtual {v2}, Lcom/arialyy/aria/core/download/target/HttpNormalTarget;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {v2}, Lcom/xj/winemu/download/DownloadExtKt;->b(Lcom/arialyy/aria/core/download/DownloadEntity;)Lcom/xj/winemu/data/bean/DownloadExtendInfo;

    move-result-object v2

    if-eqz v2, :cond_0

    sget-object v3, Lcom/xj/winemu/EmuFileMgr;->a:Lcom/xj/winemu/EmuFileMgr;

    invoke-virtual {v2}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getFileType()I

    move-result v4

    invoke-virtual {v2}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getFileId()I

    move-result v5

    invoke-virtual {v2}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v5, v2}, Lcom/xj/winemu/EmuFileMgr;->d(IILjava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->removeRecord()V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public final I(Ljava/lang/String;Lcom/xj/common/data/gameinfo/InstalledGameSource;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    instance-of v3, v2, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;

    if-eqz v3, :cond_0

    move-object v3, v2

    check-cast v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;

    iget v4, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    const/high16 v5, -0x80000000

    and-int v6, v4, v5

    if-eqz v6, :cond_0

    sub-int/2addr v4, v5

    iput v4, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;

    invoke-direct {v3, v0, v2}, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;-><init>(Lcom/xj/winemu/download/WinEmuDownloadManager;Lkotlin/coroutines/Continuation;)V

    :goto_0
    iget-object v2, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->result:Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->g()Ljava/lang/Object;

    move-result-object v4

    iget v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    const/4 v6, 0x7

    const-string v7, "WinEmuDownloadManager"

    const/4 v8, 0x0

    packed-switch v5, :pswitch_data_0

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_0
    iget-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    check-cast v1, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    iget-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    check-cast v5, Ljava/util/Iterator;

    iget-object v6, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    check-cast v6, Ljava/util/Set;

    iget-object v7, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    check-cast v7, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;

    iget-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    check-cast v9, Lkotlin/jvm/functions/Function2;

    invoke-static {v2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto/16 :goto_14

    :pswitch_1
    iget-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    check-cast v1, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    iget-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    check-cast v5, Ljava/util/Iterator;

    iget-object v6, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    check-cast v6, Ljava/util/Set;

    iget-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    check-cast v9, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;

    iget-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    check-cast v10, Lkotlin/jvm/functions/Function2;

    iget-object v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    invoke-static {v2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto/16 :goto_12

    :pswitch_2
    iget-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    check-cast v1, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    iget-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    check-cast v5, Ljava/util/Iterator;

    iget-object v6, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    check-cast v6, Ljava/util/Set;

    iget-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    check-cast v9, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;

    iget-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    check-cast v10, Lkotlin/jvm/functions/Function2;

    iget-object v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    invoke-static {v2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto/16 :goto_10

    :pswitch_3
    iget-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    iget-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    check-cast v5, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;

    iget-object v6, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    check-cast v6, Lkotlin/jvm/functions/Function2;

    iget-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    iget-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    check-cast v10, Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-static {v2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto/16 :goto_c

    :pswitch_4
    iget-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    iget-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    check-cast v5, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;

    iget-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    check-cast v9, Lkotlin/jvm/functions/Function2;

    iget-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    iget-object v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    check-cast v11, Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-static {v2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto/16 :goto_9

    :pswitch_5
    iget-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    iget-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    check-cast v5, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;

    iget-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    check-cast v9, Lkotlin/jvm/functions/Function2;

    iget-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    iget-object v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    check-cast v11, Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-static {v2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto/16 :goto_6

    :pswitch_6
    iget-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    iget-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    check-cast v5, Lcom/xj/winemu/bean/PcSettingDataEntity;

    iget-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    check-cast v9, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;

    iget-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    check-cast v10, Lkotlin/jvm/functions/Function2;

    iget-object v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    iget-object v12, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    check-cast v12, Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-static {v2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    :cond_1
    move-object/from16 v17, v9

    move-object v9, v5

    move-object/from16 v5, v17

    goto/16 :goto_5

    :pswitch_7
    iget-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    iget-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    check-cast v5, Lcom/xj/winemu/bean/PcSettingDataEntity;

    iget-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    check-cast v9, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;

    iget-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    check-cast v10, Lkotlin/jvm/functions/Function2;

    iget-object v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    iget-object v12, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    check-cast v12, Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-static {v2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto/16 :goto_4

    :pswitch_8
    iget-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    iget-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    check-cast v5, Lcom/xj/winemu/bean/PcSettingDataEntity;

    iget-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    check-cast v9, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;

    iget-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    check-cast v10, Lkotlin/jvm/functions/Function2;

    iget-object v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    iget-object v12, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    check-cast v12, Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-static {v2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    move-object/from16 v17, v9

    move-object v9, v5

    move-object/from16 v5, v17

    goto/16 :goto_3

    :pswitch_9
    iget-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    check-cast v1, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;

    iget-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    check-cast v5, Lkotlin/jvm/functions/Function2;

    iget-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    iget-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    check-cast v10, Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-static {v2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto :goto_2

    :pswitch_a
    iget-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    check-cast v1, Lkotlin/jvm/functions/Function2;

    iget-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    iget-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    check-cast v9, Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-static {v2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    move-object v10, v9

    move-object/from16 v17, v5

    move-object v5, v1

    move-object/from16 v1, v17

    goto :goto_1

    :pswitch_b
    invoke-static {v2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    new-instance v2, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$config$1;

    move-object/from16 v5, p2

    invoke-direct {v2, v1, v5, v8}, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$config$1;-><init>(Ljava/lang/String;Lcom/xj/common/data/gameinfo/InstalledGameSource;Lkotlin/coroutines/Continuation;)V

    iput-object v0, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    iput-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    move-object/from16 v5, p3

    iput-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    const/4 v9, 0x1

    iput v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    invoke-static {v2, v3}, Lcom/drake/net/utils/SuspendKt;->d(Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_2

    return-object v4

    :cond_2
    move-object v10, v0

    :goto_1
    check-cast v2, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;

    if-nez v2, :cond_4

    if-eqz v5, :cond_3

    invoke-static {}, Lkotlin/collections/CollectionsKt;->m()Ljava/util/List;

    move-result-object v1

    invoke-interface {v5, v1, v8}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v1

    :cond_4
    new-instance v9, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$userSelectContainer$1;

    invoke-direct {v9, v1, v8}, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$userSelectContainer$1;-><init>(Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    iput-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    iput-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    iput-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    iput-object v2, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    const/4 v11, 0x2

    iput v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    invoke-static {v9, v3}, Lcom/drake/net/utils/SuspendKt;->d(Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v9

    if-ne v9, v4, :cond_5

    return-object v4

    :cond_5
    move-object/from16 v17, v9

    move-object v9, v1

    move-object v1, v2

    move-object/from16 v2, v17

    :goto_2
    check-cast v2, Lcom/xj/winemu/bean/PcSettingDataEntity;

    new-instance v11, Ljava/util/LinkedHashSet;

    invoke-direct {v11}, Ljava/util/LinkedHashSet;-><init>()V

    sget-object v12, Lcom/xj/winemu/EmuImageFs;->g:Lcom/xj/winemu/EmuImageFs$Companion;

    invoke-virtual {v12}, Lcom/xj/winemu/EmuImageFs$Companion;->a()Lcom/xj/winemu/EmuImageFs;

    move-result-object v12

    invoke-virtual {v1}, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;->getImagefs()Lcom/xj/winemu/api/bean/EnvLayerEntity;

    move-result-object v13

    invoke-virtual {v13}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object v13

    iput-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    iput-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    iput-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    iput-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    iput-object v2, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    iput-object v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    const/4 v14, 0x3

    iput v14, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    invoke-virtual {v12, v13, v3}, Lcom/xj/winemu/EmuImageFs;->C(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v12

    if-ne v12, v4, :cond_6

    return-object v4

    :cond_6
    move-object/from16 v17, v5

    move-object v5, v1

    move-object v1, v11

    move-object v11, v9

    move-object v9, v2

    move-object v2, v12

    move-object v12, v10

    move-object/from16 v10, v17

    :goto_3
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v5}, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;->getImagefs()Lcom/xj/winemu/api/bean/EnvLayerEntity;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_7
    if-eqz v9, :cond_c

    invoke-virtual {v9}, Lcom/xj/winemu/bean/PcSettingDataEntity;->getId()I

    move-result v2

    if-lez v2, :cond_c

    sget-object v2, Lcom/xj/winemu/EmuContainers;->f:Lcom/xj/winemu/EmuContainers$Companion;

    invoke-virtual {v2}, Lcom/xj/winemu/EmuContainers$Companion;->a()Lcom/xj/winemu/EmuContainers;

    move-result-object v2

    invoke-virtual {v9}, Lcom/xj/winemu/bean/PcSettingDataEntity;->getName()Ljava/lang/String;

    move-result-object v13

    iput-object v12, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    iput-object v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    iput-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    iput-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    iput-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    iput-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    const/4 v14, 0x4

    iput v14, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    invoke-virtual {v2, v13, v3}, Lcom/xj/winemu/EmuContainers;->B(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_8

    return-object v4

    :cond_8
    move-object/from16 v17, v9

    move-object v9, v5

    move-object/from16 v5, v17

    :goto_4
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_b

    sget-object v2, Lcom/xj/winemu/EmuContainers;->f:Lcom/xj/winemu/EmuContainers$Companion;

    invoke-virtual {v2}, Lcom/xj/winemu/EmuContainers$Companion;->a()Lcom/xj/winemu/EmuContainers;

    move-result-object v2

    invoke-virtual {v5}, Lcom/xj/winemu/bean/PcSettingDataEntity;->getName()Ljava/lang/String;

    move-result-object v13

    iput-object v12, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    iput-object v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    iput-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    iput-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    iput-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    iput-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    const/4 v14, 0x5

    iput v14, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    invoke-virtual {v2, v13, v3}, Lcom/xj/winemu/EmuContainers;->m(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_1

    return-object v4

    :goto_5
    check-cast v2, Lcom/xj/winemu/EnvRepo;

    if-eqz v2, :cond_9

    invoke-virtual {v2}, Lcom/xj/winemu/EnvRepo;->getEntry()Lcom/xj/winemu/api/bean/EnvLayerEntity;

    move-result-object v2

    if-eqz v2, :cond_9

    goto :goto_7

    :cond_9
    invoke-virtual {v12}, Lcom/xj/winemu/download/WinEmuDownloadManager;->m0()Lcom/xj/winemu/data/repository/EnvLayerRepository;

    move-result-object v2

    invoke-virtual {v9}, Lcom/xj/winemu/bean/PcSettingDataEntity;->getId()I

    move-result v9

    iput-object v12, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    iput-object v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    iput-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    iput-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    iput-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    iput-object v8, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    const/4 v13, 0x6

    iput v13, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    invoke-virtual {v2, v9, v3}, Lcom/xj/winemu/data/repository/EnvLayerRepository;->g(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_a

    return-object v4

    :cond_a
    move-object v9, v10

    move-object v10, v11

    move-object v11, v12

    :goto_6
    check-cast v2, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    move-object v12, v11

    move-object v11, v10

    move-object v10, v9

    :goto_7
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :goto_8
    move-object v9, v11

    goto :goto_a

    :cond_b
    move-object v5, v9

    goto :goto_8

    :cond_c
    sget-object v2, Lcom/xj/winemu/EmuContainers;->f:Lcom/xj/winemu/EmuContainers$Companion;

    invoke-virtual {v2}, Lcom/xj/winemu/EmuContainers$Companion;->a()Lcom/xj/winemu/EmuContainers;

    move-result-object v2

    invoke-virtual {v5}, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;->getContainer()Lcom/xj/winemu/api/bean/EnvLayerEntity;

    move-result-object v9

    invoke-virtual {v9}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object v9

    iput-object v12, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    iput-object v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    iput-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    iput-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    iput-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    iput-object v8, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    iput v6, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    invoke-virtual {v2, v9, v3}, Lcom/xj/winemu/EmuContainers;->B(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_d

    return-object v4

    :cond_d
    move-object v9, v10

    move-object v10, v11

    move-object v11, v12

    :goto_9
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_e

    invoke-virtual {v5}, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;->getContainer()Lcom/xj/winemu/api/bean/EnvLayerEntity;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_e
    move-object v12, v11

    move-object/from16 v17, v10

    move-object v10, v9

    move-object/from16 v9, v17

    :goto_a
    invoke-virtual {v5, v9}, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;->setGameId(Ljava/lang/String;)V

    sget-object v2, Lcom/xj/winemu/settings/PcGameSettingDataHelper;->a:Lcom/xj/winemu/settings/PcGameSettingDataHelper;

    invoke-virtual {v2, v9}, Lcom/xj/winemu/settings/PcGameSettingDataHelper;->w(Ljava/lang/String;)Lcom/xj/winemu/settings/PcGameSettingOperations;

    move-result-object v2

    invoke-virtual {v2}, Lcom/xj/winemu/settings/PcGameSettingOperations;->P0()Lcom/xj/winemu/bean/PcSettingDataEntity;

    move-result-object v2

    if-eqz v2, :cond_14

    invoke-virtual {v2}, Lcom/xj/winemu/bean/PcSettingDataEntity;->getId()I

    move-result v11

    const/4 v13, -0x1

    if-eq v11, v13, :cond_14

    invoke-virtual {v5}, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;->getComponent()Ljava/util/List;

    move-result-object v11

    check-cast v11, Ljava/lang/Iterable;

    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_f
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_10

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    move-object v14, v13

    check-cast v14, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    invoke-virtual {v14}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getType()I

    move-result v15

    if-ne v15, v6, :cond_f

    invoke-virtual {v2}, Lcom/xj/winemu/bean/PcSettingDataEntity;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-static {v15, v14}, Lkotlin/jvm/internal/Intrinsics;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_f

    goto :goto_b

    :cond_10
    move-object v13, v8

    :goto_b
    check-cast v13, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    if-eqz v13, :cond_11

    const-string v2, "\u901a\u7528\u914d\u7f6e\u6709\u7528\u6237\u9009\u4e2d\u7684steam\u7248\u672c\uff0c\u4e0d\u9700\u8981\u6dfb\u52a0\u515c\u5e95"

    invoke-static {v7, v2}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e

    :cond_11
    invoke-virtual {v5}, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;->getComponent()Ljava/util/List;

    move-result-object v6

    new-instance v11, Lcom/xj/winemu/download/d;

    invoke-direct {v11}, Lcom/xj/winemu/download/d;-><init>()V

    new-instance v13, Lcom/xj/winemu/download/e;

    invoke-direct {v13, v11}, Lcom/xj/winemu/download/e;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-interface {v6, v13}, Ljava/util/Collection;->removeIf(Ljava/util/function/Predicate;)Z

    const-string v6, "\u901a\u7528\u914d\u7f6e\u6ca1\u6709\u6709\u7528\u6237\u9009\u4e2d\u7684steam\u7248\u672c\uff0c\u6dfb\u52a0\u4e00\u4e2a\u8fdb\u884c\u515c\u5e95"

    invoke-static {v7, v6}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v6, Lcom/xj/winemu/EmuComponents;->c:Lcom/xj/winemu/EmuComponents$Companion;

    invoke-virtual {v6}, Lcom/xj/winemu/EmuComponents$Companion;->a()Lcom/xj/winemu/EmuComponents;

    move-result-object v6

    invoke-virtual {v2}, Lcom/xj/winemu/bean/PcSettingDataEntity;->getName()Ljava/lang/String;

    move-result-object v2

    iput-object v12, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    iput-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    iput-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    iput-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    iput-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    iput-object v8, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    const/16 v11, 0x8

    iput v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    invoke-virtual {v6, v2, v3}, Lcom/xj/winemu/EmuComponents;->n(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_12

    return-object v4

    :cond_12
    move-object v6, v10

    :goto_c
    check-cast v2, LComponentRepo;

    if-eqz v2, :cond_13

    invoke-virtual {v5}, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;->getComponent()Ljava/util/List;

    move-result-object v10

    invoke-virtual {v2}, LComponentRepo;->getEntry()Lcom/xj/winemu/api/bean/EnvLayerEntity;

    move-result-object v2

    invoke-interface {v10, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v2

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/Boxing;->a(Z)Ljava/lang/Boolean;

    goto :goto_d

    :cond_13
    const-string v2, "\u7ec4\u4ef6\u5217\u8868\u6ca1\u6709\u62c9\u53d6\u5230steam \u7ec4\u4ef6\u4fe1\u606f"

    invoke-static {v7, v2}, Lcom/xj/common/utils/XjLog;->p(Ljava/lang/String;Ljava/lang/String;)V

    :goto_d
    move-object v10, v6

    goto :goto_e

    :cond_14
    invoke-virtual {v5}, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;->getComponent()Ljava/util/List;

    move-result-object v2

    new-instance v6, Lcom/xj/winemu/download/f;

    invoke-direct {v6}, Lcom/xj/winemu/download/f;-><init>()V

    new-instance v11, Lcom/xj/winemu/download/g;

    invoke-direct {v11, v6}, Lcom/xj/winemu/download/g;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-interface {v2, v11}, Ljava/util/Collection;->removeIf(Ljava/util/function/Predicate;)Z

    move-result v2

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/Boxing;->a(Z)Ljava/lang/Boolean;

    :goto_e
    invoke-virtual {v5}, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;->getComponent()Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_19

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    sget-object v11, Lcom/xj/winemu/download/WinEmuDownloadManager;->a:Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-virtual {v5}, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;->getContainer()Lcom/xj/winemu/api/bean/EnvLayerEntity;

    move-result-object v15

    iput-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    iput-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    iput-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    iput-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    iput-object v2, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    iput-object v6, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    const/16 v12, 0x9

    iput v12, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    move-object v12, v9

    move-object v13, v6

    move-object v14, v1

    move-object/from16 v16, v3

    invoke-virtual/range {v11 .. v16}, Lcom/xj/winemu/download/WinEmuDownloadManager;->H(Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;Ljava/util/Set;Lcom/xj/winemu/api/bean/EnvLayerEntity;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v11

    if-ne v11, v4, :cond_15

    return-object v4

    :cond_15
    move-object/from16 v17, v6

    move-object v6, v1

    move-object/from16 v1, v17

    move-object/from16 v18, v5

    move-object v5, v2

    move-object v2, v11

    move-object v11, v9

    move-object/from16 v9, v18

    :goto_10
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_17

    const-string v1, "check user select first"

    invoke-static {v7, v1}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    :cond_16
    :goto_11
    move-object v2, v5

    move-object v1, v6

    move-object v5, v9

    move-object v9, v11

    goto :goto_f

    :cond_17
    sget-object v2, Lcom/xj/winemu/EmuComponents;->c:Lcom/xj/winemu/EmuComponents$Companion;

    invoke-virtual {v2}, Lcom/xj/winemu/EmuComponents$Companion;->a()Lcom/xj/winemu/EmuComponents;

    move-result-object v2

    invoke-virtual {v1}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object v12

    iput-object v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    iput-object v10, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    iput-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    iput-object v6, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    iput-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    iput-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    const/16 v13, 0xa

    iput v13, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    invoke-virtual {v2, v12, v3}, Lcom/xj/winemu/EmuComponents;->q(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_18

    return-object v4

    :cond_18
    :goto_12
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v1}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, " \u9700\u8981\u4e0b\u8f7d\uff1f "

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v7, v12}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v2, :cond_16

    invoke-interface {v6, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_19
    sget-object v2, Lcom/xj/winemu/EmuImageFs;->g:Lcom/xj/winemu/EmuImageFs$Companion;

    invoke-virtual {v2}, Lcom/xj/winemu/EmuImageFs$Companion;->a()Lcom/xj/winemu/EmuImageFs;

    move-result-object v2

    invoke-virtual {v2}, Lcom/xj/winemu/EmuImageFs;->x()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-virtual {v5}, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;->getDeps()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_1d

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v6, v1

    move-object v7, v5

    move-object v9, v10

    move-object v5, v2

    :cond_1a
    :goto_13
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    sget-object v2, Lcom/xj/winemu/EmuComponents;->c:Lcom/xj/winemu/EmuComponents$Companion;

    invoke-virtual {v2}, Lcom/xj/winemu/EmuComponents$Companion;->a()Lcom/xj/winemu/EmuComponents;

    move-result-object v2

    invoke-virtual {v1}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object v10

    iput-object v9, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$0:Ljava/lang/Object;

    iput-object v7, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$1:Ljava/lang/Object;

    iput-object v6, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$2:Ljava/lang/Object;

    iput-object v5, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$3:Ljava/lang/Object;

    iput-object v1, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$4:Ljava/lang/Object;

    iput-object v8, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->L$5:Ljava/lang/Object;

    const/16 v11, 0xb

    iput v11, v3, Lcom/xj/winemu/download/WinEmuDownloadManager$collectGameConfigs$1;->label:I

    invoke-virtual {v2, v10, v3}, Lcom/xj/winemu/EmuComponents;->q(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_1b

    return-object v4

    :cond_1b
    :goto_14
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v6, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_13

    :cond_1c
    move-object v1, v6

    move-object v5, v7

    move-object v10, v9

    :cond_1d
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const-wide/16 v3, 0x0

    :goto_15
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    invoke-virtual {v6}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getFileSize()J

    move-result-wide v6

    add-long/2addr v3, v6

    goto :goto_15

    :cond_1e
    invoke-virtual {v5, v3, v4}, Lcom/xj/winemu/data/bean/GameEnvConfigEntity;->setTotalDownloadSize(J)V

    if-eqz v10, :cond_1f

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->Q0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v10, v1, v5}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1f
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final I0()V
    .locals 2

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/download/DownloadReceiver;->removeAllTask(Z)V

    return-void
.end method

.method public final J0(Lcom/xj/winemu/download/action/DependOnDownloadAction;)V
    .locals 7

    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->c()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    new-instance v4, Lcom/xj/winemu/download/WinEmuDownloadManager$removeDependOnDownloadAction$1;

    const/4 v0, 0x0

    invoke-direct {v4, p1, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager$removeDependOnDownloadAction$1;-><init>(Lcom/xj/winemu/download/action/DependOnDownloadAction;Lkotlin/coroutines/Continuation;)V

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public final K0(J)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "removeTaskRecord -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "WinEmuDownloadManager"

    invoke-static {v1, v0}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/arialyy/aria/core/download/DownloadReceiver;->load(J)Lcom/arialyy/aria/core/download/target/HttpNormalTarget;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->ignoreCheckPermissions()Lcom/arialyy/aria/core/common/AbsNormalTarget;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->removeRecord()V

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->o0()Ljava/util/List;

    move-result-object v0

    new-instance v1, Lcom/xj/winemu/download/h;

    invoke-direct {v1, p1, p2}, Lcom/xj/winemu/download/h;-><init>(J)V

    new-instance p1, Lcom/xj/winemu/download/i;

    invoke-direct {p1, v1}, Lcom/xj/winemu/download/i;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-interface {v0, p1}, Ljava/util/Collection;->removeIf(Ljava/util/function/Predicate;)Z

    return-void
.end method

.method public final N(Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2

    new-instance v0, Lcom/xj/winemu/download/WinEmuDownloadManager$compareEmuFileAndMD5Right$2;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lcom/xj/winemu/download/WinEmuDownloadManager$compareEmuFileAndMD5Right$2;-><init>(Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    invoke-static {v0, p3}, Lcom/drake/net/utils/SuspendKt;->d(Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final O(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/arialyy/aria/core/common/HttpOption;ZZZZ)V
    .locals 1

    const-string v0, "url"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "filePath"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "extend"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "httpOption"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, p8}, Lcom/xj/winemu/download/WinEmuDownloadManager;->s0(Z)Z

    move-result p8

    if-nez p8, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object p8

    invoke-virtual {p8, p1}, Lcom/arialyy/aria/core/download/DownloadReceiver;->load(Ljava/lang/String;)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->setFilePath(Ljava/lang/String;)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;

    invoke-virtual {p1, p3}, Lcom/arialyy/aria/core/inf/AbsTarget;->setExtendField(Ljava/lang/String;)Lcom/arialyy/aria/core/inf/AbsTarget;

    if-eqz p7, :cond_1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsBuilderTarget;->ignoreFilePathOccupy()Lcom/arialyy/aria/core/common/AbsBuilderTarget;

    :cond_1
    invoke-virtual {p1, p4}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->option(Lcom/arialyy/aria/core/common/HttpOption;)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;

    invoke-virtual {p4, p6}, Lcom/arialyy/aria/core/common/HttpOption;->useServerFileName(Z)Lcom/arialyy/aria/core/common/HttpOption;

    if-eqz p5, :cond_2

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsBuilderTarget;->setHighestPriority()J

    :cond_2
    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsBuilderTarget;->ignoreCheckPermissions()Lcom/arialyy/aria/core/common/AbsBuilderTarget;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsBuilderTarget;->create()J

    return-void
.end method

.method public final O0()V
    .locals 6

    sget-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    new-instance v3, Lcom/xj/winemu/download/WinEmuDownloadManager$resumeAll$1;

    const/4 v1, 0x0

    invoke-direct {v3, v1}, Lcom/xj/winemu/download/WinEmuDownloadManager$resumeAll$1;-><init>(Lkotlin/coroutines/Continuation;)V

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v2, 0x0

    invoke-static/range {v0 .. v5}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public final P0(JZ)V
    .locals 7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "resumeTask -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "WinEmuDownloadManager"

    invoke-static {v1, v0}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->s0(Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->c()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    new-instance v4, Lcom/xj/winemu/download/WinEmuDownloadManager$resumeTask$1;

    const/4 v0, 0x0

    invoke-direct {v4, p1, p2, p3, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager$resumeTask$1;-><init>(JZLkotlin/coroutines/Continuation;)V

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public final Q(Lcom/arialyy/aria/core/download/DownloadEntity;)V
    .locals 1

    sget-object v0, Lcom/xj/winemu/download/WinEmuFileExplorer;->a:Lcom/xj/winemu/download/WinEmuFileExplorer;

    invoke-virtual {v0, p1}, Lcom/xj/winemu/download/WinEmuFileExplorer;->w(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    sget-object v0, Lcom/xj/winemu/utils/EmuDownloadedFileReceiver;->a:Lcom/xj/winemu/utils/EmuDownloadedFileReceiver;

    invoke-virtual {v0, p1}, Lcom/xj/winemu/utils/EmuDownloadedFileReceiver;->a(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    return-void
.end method

.method public final R(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/xj/winemu/download/listener/OnNetDownloadListener;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 8

    new-instance v7, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadByNet$2;

    const/4 v6, 0x0

    move-object v0, v7

    move-object v1, p1

    move-object v2, p5

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadByNet$2;-><init>(Ljava/lang/String;Lcom/xj/winemu/download/listener/OnNetDownloadListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    invoke-static {v7, p6}, Lcom/drake/net/utils/SuspendKt;->d(Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->g()Ljava/lang/Object;

    move-result-object p2

    if-ne p1, p2, :cond_0

    return-object p1

    :cond_0
    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p1
.end method

.method public final R0(Lcom/arialyy/aria/core/download/DownloadEntity;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-static {p1, v0, v1, v0}, Lcom/drake/channel/ChannelKt;->c(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    sget-object v2, Lcom/xj/winemu/data/repository/DownloadTaskRepository;->a:Lcom/xj/winemu/data/repository/DownloadTaskRepository$Companion;

    invoke-virtual {v2, p1}, Lcom/xj/winemu/data/repository/DownloadTaskRepository$Companion;->a(Lcom/arialyy/aria/core/download/DownloadEntity;)Lcom/xj/common/download/bean/CommonDownloadTask;

    move-result-object p1

    invoke-static {p1, v0, v1, v0}, Lcom/drake/channel/ChannelKt;->c(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public final S(Lcom/xj/common/download/bean/AriaDownloadArgs;)V
    .locals 7

    const-string v0, "args"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->c()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    new-instance v4, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadComponent$1;

    const/4 v0, 0x0

    invoke-direct {v4, p1, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadComponent$1;-><init>(Lcom/xj/common/download/bean/AriaDownloadArgs;Lkotlin/coroutines/Continuation;)V

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public final S0(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 10

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_1

    return-void

    :cond_1
    sget-object v1, Lcom/xj/common/utils/XjLog;->a:Lcom/xj/common/utils/XjLog;

    invoke-virtual {v1}, Lcom/xj/common/utils/XjLog;->j()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p2}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsEntity;->getState()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_1

    :cond_2
    move-object v2, v0

    :goto_1
    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFileName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsEntity;->getPercent()I

    move-result v4

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsEntity;->getCurrentProgress()J

    move-result-wide v5

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v7

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "from ="

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " state =  "

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " , "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "WinEmuDownloadManager"

    invoke-static {v2, v1}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    sget-object v3, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->c()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v4

    new-instance v6, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEvent$2;

    invoke-direct {v6, p1, p2, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEvent$2;-><init>(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;Lkotlin/coroutines/Continuation;)V

    const/4 v7, 0x2

    const/4 v8, 0x0

    const/4 v5, 0x0

    invoke-static/range {v3 .. v8}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public final T(Lcom/xj/winemu/api/bean/EnvLayerEntity;Lcom/xj/winemu/download/listener/OnDepComponentDownloadListener;)V
    .locals 2

    const-string v0, "listener"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getType()I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1

    new-instance v0, Lcom/xj/winemu/download/action/MultiDepComponentDownloadAction;

    const-string v1, ""

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->e(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, v1, p1, p2}, Lcom/xj/winemu/download/action/MultiDepComponentDownloadAction;-><init>(Ljava/lang/String;Ljava/util/List;Lcom/xj/winemu/download/listener/OnDepComponentDownloadListener;)V

    invoke-virtual {p0, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->x(Lcom/xj/winemu/download/action/DependOnDownloadAction;)V

    return-void

    :cond_1
    const-string p1, "WinEmuDownloadManager"

    const-string p2, "\u975e\u4f9d\u8d56\u7ec4\u4ef6\uff0c\u8bf7\u8c03\u7528downloadComponent"

    invoke-static {p1, p2}, Lcom/xj/common/utils/XjLog;->p(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final T0(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 12

    instance-of v0, p3, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEventInternal$1;

    if-eqz v0, :cond_0

    move-object v0, p3

    check-cast v0, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEventInternal$1;

    iget v1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEventInternal$1;->label:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEventInternal$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEventInternal$1;

    invoke-direct {v0, p0, p3}, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEventInternal$1;-><init>(Lcom/xj/winemu/download/WinEmuDownloadManager;Lkotlin/coroutines/Continuation;)V

    :goto_0
    iget-object p3, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEventInternal$1;->result:Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->g()Ljava/lang/Object;

    move-result-object v1

    iget v2, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEventInternal$1;->label:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    iget-object p1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEventInternal$1;->L$1:Ljava/lang/Object;

    move-object p2, p1

    check-cast p2, Lcom/arialyy/aria/core/task/DownloadTask;

    iget-object p1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEventInternal$1;->L$0:Ljava/lang/Object;

    check-cast p1, Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-static {p3}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto/16 :goto_3

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    invoke-static {p3}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    const/4 p3, 0x0

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v2

    goto :goto_1

    :cond_3
    move-object v2, p3

    :goto_1
    if-nez v2, :cond_4

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p1

    :cond_4
    sget-object v2, Lcom/xj/common/utils/XjLog;->a:Lcom/xj/common/utils/XjLog;

    invoke-virtual {v2}, Lcom/xj/common/utils/XjLog;->j()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {p2}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-virtual {v2}, Lcom/arialyy/aria/core/common/AbsEntity;->getState()I

    move-result v4

    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/Boxing;->e(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_2

    :cond_5
    move-object v4, p3

    :goto_2
    invoke-virtual {v2}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFileName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Lcom/arialyy/aria/core/common/AbsEntity;->getPercent()I

    move-result v6

    invoke-virtual {v2}, Lcom/arialyy/aria/core/common/AbsEntity;->getCurrentProgress()J

    move-result-wide v7

    invoke-virtual {v2}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v9

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "from ="

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " state =  "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " , "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "WinEmuDownloadManager"

    invoke-static {v2, p1}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    const/4 p1, 0x2

    invoke-static {p2, p3, p1, p3}, Lcom/drake/channel/ChannelKt;->c(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    invoke-virtual {p2}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->R0(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    iput-object p0, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEventInternal$1;->L$0:Ljava/lang/Object;

    iput-object p2, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEventInternal$1;->L$1:Ljava/lang/Object;

    iput v3, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$sendTaskEventInternal$1;->label:I

    const-wide/16 v2, 0x32

    invoke-static {v2, v3, v0}, Lkotlinx/coroutines/DelayKt;->b(JLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_7

    return-object v1

    :cond_7
    move-object p1, p0

    :goto_3
    invoke-virtual {p1, p2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->A(Lcom/arialyy/aria/core/task/DownloadTask;)V

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p1
.end method

.method public final U(Lcom/xj/common/download/bean/AriaDownloadArgs;)V
    .locals 7

    const-string v0, "args"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->c()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    new-instance v4, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadEnv$1;

    const/4 v0, 0x0

    invoke-direct {v4, p1, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadEnv$1;-><init>(Lcom/xj/common/download/bean/AriaDownloadArgs;Lkotlin/coroutines/Continuation;)V

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public final U0(I)V
    .locals 1

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->d0()Lcom/arialyy/aria/core/AriaManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaManager;->getDownloadConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/config/DownloadConfig;->setMaxTaskNum(I)Lcom/arialyy/aria/core/config/DownloadConfig;

    :cond_0
    sput p1, Lcom/xj/winemu/download/WinEmuDownloadManager;->c:I

    return-void
.end method

.method public final V(Lcom/xj/common/download/bean/AriaDownloadArgs;)V
    .locals 7

    const-string v0, "args"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->c()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    new-instance v4, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadGame$1;

    const/4 v0, 0x0

    invoke-direct {v4, p1, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadGame$1;-><init>(Lcom/xj/common/download/bean/AriaDownloadArgs;Lkotlin/coroutines/Continuation;)V

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public final V0(Ljava/util/List;Z)V
    .locals 7

    const-string v0, "files"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    invoke-virtual {v0}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getFileType()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eq v1, v3, :cond_3

    const/4 v5, 0x3

    if-eq v1, v5, :cond_2

    const/4 v5, 0x4

    if-eq v1, v5, :cond_1

    invoke-virtual {v0}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getType()I

    move-result v1

    const/4 v6, 0x6

    if-eq v1, v6, :cond_0

    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->a:Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-virtual {v1, v5, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->r0(ILcom/xj/winemu/api/bean/EnvLayerEntity;)Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Lcom/xj/winemu/api/bean/EnvLayerEntity;->Companion:Lcom/xj/winemu/api/bean/EnvLayerEntity$Companion;

    invoke-static {v5, v0, v4, v3, v4}, Lcom/xj/winemu/api/bean/EnvLayerEntity$Companion;->d(Lcom/xj/winemu/api/bean/EnvLayerEntity$Companion;Lcom/xj/winemu/api/bean/EnvLayerEntity;Ljava/lang/String;ILjava/lang/Object;)Lcom/xj/common/download/bean/AriaDownloadArgs;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/xj/common/download/bean/AriaDownloadArgs;->setStartNow(Z)V

    invoke-virtual {v3, p2}, Lcom/xj/common/download/bean/AriaDownloadArgs;->setSilentInstall(Z)V

    invoke-virtual {v1, v3}, Lcom/xj/winemu/download/WinEmuDownloadManager;->S(Lcom/xj/common/download/bean/AriaDownloadArgs;)V

    invoke-virtual {v0}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getFileType()I

    move-result v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u672a\u8bc6\u522b\u5230\u7684\u6587\u4ef6\u7c7b\u578b fileType "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "\uff0c\u6309\u7ec4\u4ef6\u4e0b\u8f7d"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "WinEmuDownloadManager"

    invoke-static {v1, v0}, Lcom/xj/common/utils/XjLog;->p(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->a:Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-virtual {v1, v5, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->r0(ILcom/xj/winemu/api/bean/EnvLayerEntity;)Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Lcom/xj/winemu/api/bean/EnvLayerEntity;->Companion:Lcom/xj/winemu/api/bean/EnvLayerEntity$Companion;

    invoke-static {v5, v0, v4, v3, v4}, Lcom/xj/winemu/api/bean/EnvLayerEntity$Companion;->d(Lcom/xj/winemu/api/bean/EnvLayerEntity$Companion;Lcom/xj/winemu/api/bean/EnvLayerEntity;Ljava/lang/String;ILjava/lang/Object;)Lcom/xj/common/download/bean/AriaDownloadArgs;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/xj/common/download/bean/AriaDownloadArgs;->setStartNow(Z)V

    invoke-virtual {v0, p2}, Lcom/xj/common/download/bean/AriaDownloadArgs;->setSilentInstall(Z)V

    invoke-virtual {v1, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->S(Lcom/xj/common/download/bean/AriaDownloadArgs;)V

    goto :goto_0

    :cond_2
    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->a:Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-virtual {v1, v5, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->r0(ILcom/xj/winemu/api/bean/EnvLayerEntity;)Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Lcom/xj/winemu/api/bean/EnvLayerEntity;->Companion:Lcom/xj/winemu/api/bean/EnvLayerEntity$Companion;

    invoke-static {v5, v0, v4, v3, v4}, Lcom/xj/winemu/api/bean/EnvLayerEntity$Companion;->j(Lcom/xj/winemu/api/bean/EnvLayerEntity$Companion;Lcom/xj/winemu/api/bean/EnvLayerEntity;Ljava/lang/String;ILjava/lang/Object;)Lcom/xj/common/download/bean/AriaDownloadArgs;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/xj/common/download/bean/AriaDownloadArgs;->setStartNow(Z)V

    invoke-virtual {v0, p2}, Lcom/xj/common/download/bean/AriaDownloadArgs;->setSilentInstall(Z)V

    invoke-virtual {v1, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->b0(Lcom/xj/common/download/bean/AriaDownloadArgs;)V

    goto/16 :goto_0

    :cond_3
    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->a:Lcom/xj/winemu/download/WinEmuDownloadManager;

    invoke-virtual {v1, v3, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->r0(ILcom/xj/winemu/api/bean/EnvLayerEntity;)Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Lcom/xj/winemu/api/bean/EnvLayerEntity;->Companion:Lcom/xj/winemu/api/bean/EnvLayerEntity$Companion;

    invoke-static {v5, v0, v4, v3, v4}, Lcom/xj/winemu/api/bean/EnvLayerEntity$Companion;->f(Lcom/xj/winemu/api/bean/EnvLayerEntity$Companion;Lcom/xj/winemu/api/bean/EnvLayerEntity;Ljava/lang/String;ILjava/lang/Object;)Lcom/xj/common/download/bean/AriaDownloadArgs;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/xj/common/download/bean/AriaDownloadArgs;->setStartNow(Z)V

    invoke-virtual {v0, p2}, Lcom/xj/common/download/bean/AriaDownloadArgs;->setSilentInstall(Z)V

    invoke-virtual {v1, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->W(Lcom/xj/common/download/bean/AriaDownloadArgs;)V

    goto/16 :goto_0

    :cond_4
    return-void
.end method

.method public final W(Lcom/xj/common/download/bean/AriaDownloadArgs;)V
    .locals 1

    const-string v0, "args"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->U(Lcom/xj/common/download/bean/AriaDownloadArgs;)V

    return-void
.end method

.method public final W0(Ljava/lang/String;ZZLcom/xj/common/data/gameinfo/InstalledGameSource;Lkotlin/jvm/functions/Function0;)V
    .locals 10

    const-string v0, "gameId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "gameSource"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->c()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    new-instance v0, Lcom/xj/winemu/download/WinEmuDownloadManager$startDownloadGameConfig$1;

    const/4 v9, 0x0

    move-object v3, v0

    move-object v4, p1

    move-object v5, p4

    move v6, p2

    move v7, p3

    move-object v8, p5

    invoke-direct/range {v3 .. v9}, Lcom/xj/winemu/download/WinEmuDownloadManager$startDownloadGameConfig$1;-><init>(Ljava/lang/String;Lcom/xj/common/data/gameinfo/InstalledGameSource;ZZLkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)V

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    move-object v4, v0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public final X(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/drake/net/interfaces/ProgressListener;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 9

    invoke-static {p1}, Lcom/xj/winemu/ext/StringExtKt;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/blankj/utilcode/util/FileUtils;->I(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "WinEmuDownloadManager"

    if-eqz v0, :cond_1

    invoke-static {v3}, Lcom/blankj/utilcode/util/FileUtils;->x(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "md5 = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " , checkSum = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v6, 0x1

    invoke-static {v0, p4, v6}, Lkotlin/text/StringsKt;->I(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "downloadSync exist -> return"

    invoke-static {v1, v0}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2, p3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_1
    invoke-static {v3}, Lcom/drake/net/Net;->f(Ljava/lang/Object;)Lokhttp3/Request;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v0, "cancel pre exist request"

    invoke-static {v1, v0}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v3}, Lcom/drake/net/Net;->d(Ljava/lang/Object;)Z

    :cond_2
    const-string v0, "downloadSync start new"

    invoke-static {v1, v0}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v8, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadSync$2;

    const/4 v7, 0x0

    move-object v0, v8

    move-object v1, p1

    move-object v2, p4

    move-object v4, p2

    move-object v5, p3

    move-object v6, p5

    invoke-direct/range {v0 .. v7}, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadSync$2;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/drake/net/interfaces/ProgressListener;Lkotlin/coroutines/Continuation;)V

    invoke-static {v8, p6}, Lcom/drake/net/utils/SuspendKt;->d(Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final Z(Ljava/util/Set;Ljava/lang/String;Lcom/xj/winemu/api/bean/EnvLayerEntity;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 10

    instance-of v0, p5, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;

    if-eqz v0, :cond_0

    move-object v0, p5

    check-cast v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;

    iget v1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->label:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;

    invoke-direct {v0, p0, p5}, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;-><init>(Lcom/xj/winemu/download/WinEmuDownloadManager;Lkotlin/coroutines/Continuation;)V

    :goto_0
    iget-object p5, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->result:Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->g()Ljava/lang/Object;

    move-result-object v1

    iget v2, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->label:I

    const/4 v3, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const-string v7, "WinEmuDownloadManager"

    if-eqz v2, :cond_5

    if-eq v2, v6, :cond_4

    if-eq v2, v5, :cond_3

    if-eq v2, v4, :cond_2

    if-ne v2, v3, :cond_1

    iget p1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->I$0:I

    iget-object p2, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$2:Ljava/lang/Object;

    check-cast p2, LComponentRepo;

    iget-object p3, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$1:Ljava/lang/Object;

    check-cast p3, Ljava/lang/String;

    iget-object p4, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$0:Ljava/lang/Object;

    check-cast p4, Ljava/util/Set;

    invoke-static {p5}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto/16 :goto_3

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    iget-object p1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$1:Ljava/lang/Object;

    check-cast p1, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    iget-object p2, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$0:Ljava/lang/Object;

    check-cast p2, Ljava/util/Set;

    invoke-static {p5}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto/16 :goto_2

    :cond_3
    iget p4, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->I$0:I

    iget-object p1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$2:Ljava/lang/Object;

    move-object p3, p1

    check-cast p3, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    iget-object p1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$1:Ljava/lang/Object;

    move-object p2, p1

    check-cast p2, Ljava/lang/String;

    iget-object p1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$0:Ljava/lang/Object;

    check-cast p1, Ljava/util/Set;

    invoke-static {p5}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto :goto_1

    :cond_4
    iget-object p1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$1:Ljava/lang/Object;

    move-object p3, p1

    check-cast p3, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    iget-object p1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$0:Ljava/lang/Object;

    check-cast p1, Ljava/util/Set;

    invoke-static {p5}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    goto/16 :goto_6

    :cond_5
    invoke-static {p5}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    if-eqz p2, :cond_d

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result p5

    if-nez p5, :cond_6

    goto/16 :goto_5

    :cond_6
    sget-object p5, Lcom/xj/winemu/EmuComponents;->c:Lcom/xj/winemu/EmuComponents$Companion;

    invoke-virtual {p5}, Lcom/xj/winemu/EmuComponents$Companion;->a()Lcom/xj/winemu/EmuComponents;

    move-result-object p5

    iput-object p1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$0:Ljava/lang/Object;

    iput-object p2, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$1:Ljava/lang/Object;

    iput-object p3, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$2:Ljava/lang/Object;

    iput p4, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->I$0:I

    iput v5, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->label:I

    invoke-virtual {p5, p2, v0}, Lcom/xj/winemu/EmuComponents;->n(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p5

    if-ne p5, v1, :cond_7

    return-object v1

    :cond_7
    :goto_1
    check-cast p5, LComponentRepo;

    if-nez p5, :cond_9

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "\u672c\u5730\u6ca1\u6709\u7528\u6237\u9009\u62e9\u7684\u7ec4\u4ef6 ("

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ") \u4fe1\u606f ,\u4e0b\u8f7d\u63a8\u8350"

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v7, p2}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p2, Lcom/xj/winemu/EmuComponents;->c:Lcom/xj/winemu/EmuComponents$Companion;

    invoke-virtual {p2}, Lcom/xj/winemu/EmuComponents$Companion;->a()Lcom/xj/winemu/EmuComponents;

    move-result-object p2

    invoke-virtual {p3}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object p4

    iput-object p1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$0:Ljava/lang/Object;

    iput-object p3, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$1:Ljava/lang/Object;

    const/4 p5, 0x0

    iput-object p5, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$2:Ljava/lang/Object;

    iput v4, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->label:I

    invoke-virtual {p2, p4, v0}, Lcom/xj/winemu/EmuComponents;->q(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p5

    if-ne p5, v1, :cond_8

    return-object v1

    :cond_8
    move-object p2, p1

    move-object p1, p3

    :goto_2
    check-cast p5, Ljava/lang/Boolean;

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    if-eqz p3, :cond_c

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_9
    sget-object p3, Lcom/xj/winemu/EmuComponents;->c:Lcom/xj/winemu/EmuComponents$Companion;

    invoke-virtual {p3}, Lcom/xj/winemu/EmuComponents$Companion;->a()Lcom/xj/winemu/EmuComponents;

    move-result-object p3

    iput-object p1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$0:Ljava/lang/Object;

    iput-object p2, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$1:Ljava/lang/Object;

    iput-object p5, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$2:Ljava/lang/Object;

    iput p4, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->I$0:I

    iput v3, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->label:I

    invoke-virtual {p3, p2, v0}, Lcom/xj/winemu/EmuComponents;->q(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v1, :cond_a

    return-object v1

    :cond_a
    move v8, p4

    move-object p4, p1

    move p1, v8

    move-object v9, p3

    move-object p3, p2

    move-object p2, p5

    move-object p5, v9

    :goto_3
    check-cast p5, Ljava/lang/Boolean;

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p5

    const-string v0, "\u672c\u5730\u7528\u6237\u9009\u62e9\u7684\u7ec4\u4ef6 ("

    if-eqz p5, :cond_b

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ") \u9700\u8981\u91cd\u65b0\u4e0b\u8f7d"

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v7, p3}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, LComponentRepo;->getEntry()Lcom/xj/winemu/api/bean/EnvLayerEntity;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->setFileType(I)V

    invoke-interface {p4, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p1

    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/Boxing;->a(Z)Ljava/lang/Boolean;

    goto :goto_4

    :cond_b
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ") \u5df2\u4e0b\u8f7d\uff0c\u65e0\u9700\u91cd\u65b0\u4e0b\u8f7d"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v7, p1}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    :cond_c
    :goto_4
    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p1

    :cond_d
    :goto_5
    invoke-virtual {p3}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getType()I

    move-result p2

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "\u7528\u6237\u6ca1\u6709\u9009\u62e9 \u7ec4\u4ef6 type "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ",\u68c0\u6d4b\u662f\u5426\u9700\u8981\u4e0b\u8f7d\u63a8\u8350\u7684"

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v7, p2}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p2, Lcom/xj/winemu/EmuComponents;->c:Lcom/xj/winemu/EmuComponents$Companion;

    invoke-virtual {p2}, Lcom/xj/winemu/EmuComponents$Companion;->a()Lcom/xj/winemu/EmuComponents;

    move-result-object p2

    invoke-virtual {p3}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getName()Ljava/lang/String;

    move-result-object p4

    iput-object p1, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$0:Ljava/lang/Object;

    iput-object p3, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->L$1:Ljava/lang/Object;

    iput v6, v0, Lcom/xj/winemu/download/WinEmuDownloadManager$downloadUserSelectAfterRecommend$1;->label:I

    invoke-virtual {p2, p4, v0}, Lcom/xj/winemu/EmuComponents;->q(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p5

    if-ne p5, v1, :cond_e

    return-object v1

    :cond_e
    :goto_6
    check-cast p5, Ljava/lang/Boolean;

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_f

    invoke-interface {p1, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_f
    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p1
.end method

.method public final Z0()V
    .locals 6

    sget-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    new-instance v3, Lcom/xj/winemu/download/WinEmuDownloadManager$stopAll$1;

    const/4 v1, 0x0

    invoke-direct {v3, v1}, Lcom/xj/winemu/download/WinEmuDownloadManager$stopAll$1;-><init>(Lkotlin/coroutines/Continuation;)V

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v2, 0x0

    invoke-static/range {v0 .. v5}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public final a1(JZ)V
    .locals 7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "stopTask -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "WinEmuDownloadManager"

    invoke-static {v1, v0}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->s0(Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->c()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    new-instance v4, Lcom/xj/winemu/download/WinEmuDownloadManager$stopTask$1;

    const/4 v0, 0x0

    invoke-direct {v4, p1, p2, p3, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager$stopTask$1;-><init>(JZLkotlin/coroutines/Continuation;)V

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public final b0(Lcom/xj/common/download/bean/AriaDownloadArgs;)V
    .locals 1

    const-string v0, "args"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->U(Lcom/xj/common/download/bean/AriaDownloadArgs;)V

    return-void
.end method

.method public final c0()Ljava/util/List;
    .locals 1

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadReceiver;->getAllCompleteTask()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {}, Lkotlin/collections/CollectionsKt;->m()Ljava/util/List;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final c1(JZ)V
    .locals 8

    invoke-virtual {p0, p3}, Lcom/xj/winemu/download/WinEmuDownloadManager;->s0(Z)Z

    move-result p3

    if-nez p3, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object p3

    invoke-virtual {p3, p1, p2}, Lcom/arialyy/aria/core/download/DownloadReceiver;->load(J)Lcom/arialyy/aria/core/download/target/HttpNormalTarget;

    move-result-object p3

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Lcom/arialyy/aria/core/download/target/HttpNormalTarget;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    const-string v1, "WinEmuDownloadManager"

    if-nez v0, :cond_2

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "toggleTask failure ,null task for id : "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/xj/common/utils/XjLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-virtual {p3}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->ignoreCheckPermissions()Lcom/arialyy/aria/core/common/AbsNormalTarget;

    invoke-virtual {p3}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->getTaskState()I

    move-result v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "toggleTask state = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p3}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->getTaskState()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_3

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v2, p0

    move-wide v3, p1

    invoke-static/range {v2 .. v7}, Lcom/xj/winemu/download/WinEmuDownloadManager;->b1(Lcom/xj/winemu/download/WinEmuDownloadManager;JZILjava/lang/Object;)V

    return-void

    :cond_3
    invoke-virtual {p3}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->getCurrentProgress()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p3, v0, v2

    if-lez p3, :cond_4

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-wide v1, p1

    invoke-static/range {v0 .. v5}, Lcom/xj/winemu/download/WinEmuDownloadManager;->Q0(Lcom/xj/winemu/download/WinEmuDownloadManager;JZILjava/lang/Object;)V

    goto :goto_1

    :cond_4
    invoke-virtual {p0, p1, p2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->F0(J)V

    :goto_1
    return-void
.end method

.method public final d0()Lcom/arialyy/aria/core/AriaManager;
    .locals 1

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/core/Aria;->get(Landroid/content/Context;)Lcom/arialyy/aria/core/AriaManager;

    move-result-object v0

    return-object v0
.end method

.method public final d1(IILjava/lang/String;)Lcom/arialyy/aria/core/download/DownloadEntity;
    .locals 2

    const-string v0, "newUrl"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, p1, p2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->f0(II)Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p1

    const-string p2, "updateDownloadUrlByFileId , "

    const-string v0, "WinEmuDownloadManager"

    invoke-static {v0, p2}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p1, :cond_0

    const-string p1, "\u67e5\u627e\u5bf9\u5e94\u4e0b\u8f7d\u4efb\u52a1\u5b9e\u4f53\u5931\u8d25"

    invoke-static {v0, p1}, Lcom/xj/common/utils/XjLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p1, p3}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->setUrl(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object p2

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsEntity;->getId()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/arialyy/aria/core/download/DownloadReceiver;->load(J)Lcom/arialyy/aria/core/download/target/HttpNormalTarget;

    move-result-object p2

    invoke-virtual {p2}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->ignoreCheckPermissions()Lcom/arialyy/aria/core/common/AbsNormalTarget;

    move-result-object p2

    check-cast p2, Lcom/arialyy/aria/core/download/target/HttpNormalTarget;

    invoke-virtual {p2, p3}, Lcom/arialyy/aria/core/download/target/HttpNormalTarget;->updateUrl(Ljava/lang/String;)Lcom/arialyy/aria/core/download/target/HttpNormalTarget;

    move-result-object p2

    invoke-virtual {p2}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->save()V

    return-object p1
.end method

.method public final e0()Ljava/util/List;
    .locals 1

    sget-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->e:Ljava/util/List;

    return-object v0
.end method

.method public final f0(II)Lcom/arialyy/aria/core/download/DownloadEntity;
    .locals 4

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->o0()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsEntity;->getStr()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/xj/winemu/ext/StringExtKt;->a(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v1}, Lcom/xj/winemu/download/DownloadExtKt;->b(Lcom/arialyy/aria/core/download/DownloadEntity;)Lcom/xj/winemu/data/bean/DownloadExtendInfo;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getFileId()I

    move-result v3

    if-ne v3, p1, :cond_0

    invoke-virtual {v2}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getFileType()I

    move-result v2

    if-ne v2, p2, :cond_0

    return-object v1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public final g0(Ljava/lang/String;)Ljava/util/List;
    .locals 1

    const-string v0, "url"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DownloadReceiver;->getDownloadEntity(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    if-nez p1, :cond_0

    invoke-static {}, Lkotlin/collections/CollectionsKt;->m()Ljava/util/List;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method public final h0()Lcom/arialyy/aria/core/download/DownloadReceiver;
    .locals 2

    invoke-static {p0}, Lcom/arialyy/aria/core/Aria;->download(Ljava/lang/Object;)Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v0

    const-string v1, "download(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public final i0()Ljava/util/List;
    .locals 1

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadReceiver;->getDRunningTask()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {}, Lkotlin/collections/CollectionsKt;->m()Ljava/util/List;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final j0(I)Lcom/arialyy/aria/core/download/DownloadEntity;
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->f0(II)Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p1

    return-object p1
.end method

.method public final k0(I)Lcom/arialyy/aria/core/download/DownloadEntity;
    .locals 3

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->l0()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsEntity;->getStr()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/xj/winemu/ext/StringExtKt;->a(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v1}, Lcom/xj/winemu/download/DownloadExtKt;->b(Lcom/arialyy/aria/core/download/DownloadEntity;)Lcom/xj/winemu/data/bean/DownloadExtendInfo;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getFileId()I

    move-result v2

    if-ne v2, p1, :cond_0

    return-object v1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public final l0()Ljava/util/List;
    .locals 1

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadReceiver;->getAllNotCompleteTask()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {}, Lkotlin/collections/CollectionsKt;->m()Ljava/util/List;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final m0()Lcom/xj/winemu/data/repository/EnvLayerRepository;
    .locals 1

    sget-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->f:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xj/winemu/data/repository/EnvLayerRepository;

    return-object v0
.end method

.method public final n0()Lcom/xj/common/service/ISteamGameService$ISteamGameDownloadService;
    .locals 1

    sget-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->d:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xj/common/service/ISteamGameService$ISteamGameDownloadService;

    return-object v0
.end method

.method public final o0()Ljava/util/List;
    .locals 1

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadReceiver;->getTaskList()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    return-object v0
.end method

.method public bridge synthetic onNoSupportBreakPoint(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->t0(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public bridge synthetic onPre(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->u0(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public bridge synthetic onTaskCancel(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->v0(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public bridge synthetic onTaskComplete(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->w0(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public bridge synthetic onTaskFail(Lcom/arialyy/aria/core/task/ITask;Ljava/lang/Exception;)V
    .locals 0

    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1, p2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->x0(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;)V

    return-void
.end method

.method public bridge synthetic onTaskPre(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->z0(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public bridge synthetic onTaskResume(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->A0(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public bridge synthetic onTaskRunning(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->B0(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public bridge synthetic onTaskStart(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->C0(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public bridge synthetic onTaskStop(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->D0(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public bridge synthetic onWait(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->E0(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public final p0(Landroid/content/Context;)V
    .locals 3

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1}, Lcom/arialyy/aria/core/Aria;->init(Landroid/content/Context;)Lcom/arialyy/aria/core/AriaManager;

    invoke-static {p0}, Lcom/arialyy/aria/core/Aria;->download(Ljava/lang/Object;)Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadReceiver;->register()V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->U0(I)V

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->d0()Lcom/arialyy/aria/core/AriaManager;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaManager;->getAppConfig()Lcom/arialyy/aria/core/config/AppConfig;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/config/AppConfig;->setNotNetRetry(Z)Lcom/arialyy/aria/core/config/AppConfig;

    :cond_0
    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->d0()Lcom/arialyy/aria/core/AriaManager;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaManager;->getDownloadConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Lcom/arialyy/aria/core/config/DownloadConfig;->setThreadNum(I)Lcom/arialyy/aria/core/config/DownloadConfig;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/config/DownloadConfig;->setMaxSpeed(I)Lcom/arialyy/aria/core/config/DownloadConfig;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->setReTryNum(I)Lcom/arialyy/aria/core/config/BaseTaskConfig;

    :cond_1
    return-void
.end method

.method public final q0(Lcom/xj/winemu/api/bean/EnvLayerEntity;)Z
    .locals 6

    const-string v0, "entity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lcom/xj/winemu/download/WinEmuDownloadManager;->e:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lcom/xj/winemu/download/action/DependOnDownloadAction;

    instance-of v4, v3, Lcom/xj/winemu/download/action/MultiDepComponentDownloadAction;

    if-eqz v4, :cond_0

    check-cast v3, Lcom/xj/winemu/download/action/MultiDepComponentDownloadAction;

    invoke-virtual {v3}, Lcom/xj/winemu/download/action/MultiDepComponentDownloadAction;->u()Ljava/util/List;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lcom/xj/winemu/api/bean/EnvLayerEntity;

    invoke-static {v5, p1}, Lkotlin/jvm/internal/Intrinsics;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    move-object v2, v4

    :cond_2
    if-eqz v2, :cond_0

    move-object v2, v1

    :cond_3
    if-eqz v2, :cond_4

    const/4 p1, 0x1

    goto :goto_0

    :cond_4
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final r0(ILcom/xj/winemu/api/bean/EnvLayerEntity;)Z
    .locals 4

    const-string p1, "entity"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->l0()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-static {v0}, Lcom/xj/winemu/download/DownloadExtKt;->b(Lcom/arialyy/aria/core/download/DownloadEntity;)Lcom/xj/winemu/data/bean/DownloadExtendInfo;

    move-result-object v2

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v2}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getFileId()I

    move-result v2

    invoke-virtual {p2}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getId()I

    move-result v3

    if-ne v2, v3, :cond_1

    invoke-virtual {p2}, Lcom/xj/winemu/api/bean/EnvLayerEntity;->getDownloadUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :cond_3
    return v1
.end method

.method public final s0(Z)Z
    .locals 7

    invoke-static {}, Lcom/blankj/utilcode/util/NetworkUtils;->r()Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->c()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    new-instance v4, Lcom/xj/winemu/download/WinEmuDownloadManager$isNetConnected$1;

    const/4 p1, 0x0

    invoke-direct {v4, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager$isNetConnected$1;-><init>(Lkotlin/coroutines/Continuation;)V

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    :cond_0
    if-nez v0, :cond_1

    const-string p1, "WinEmuDownloadManager"

    const-string v1, "\u7f51\u7edc\u672a\u8fde\u63a5"

    invoke-static {p1, v1}, Lcom/xj/common/utils/XjLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return v0
.end method

.method public t0(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->getFilePath()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onNoSupportBreakPoint = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "WinEmuDownloadManager"

    invoke-static {v0, p1}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public u0(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 1

    const-string v0, "onPre"

    invoke-virtual {p0, v0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->S0(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public v0(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 1

    const-string v0, "onTaskCancel"

    invoke-virtual {p0, v0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->S0(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public w0(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 7

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->c()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    new-instance v4, Lcom/xj/winemu/download/WinEmuDownloadManager$onTaskComplete$1;

    const/4 v0, 0x0

    invoke-direct {v4, p1, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager$onTaskComplete$1;-><init>(Lcom/arialyy/aria/core/task/DownloadTask;Lkotlin/coroutines/Continuation;)V

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    :cond_1
    :goto_0
    return-void
.end method

.method public final x(Lcom/xj/winemu/download/action/DependOnDownloadAction;)V
    .locals 7

    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v1, Lcom/xj/winemu/download/WinEmuDownloadManager;->b:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->c()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    new-instance v4, Lcom/xj/winemu/download/WinEmuDownloadManager$addDependOnDownloadAction$1;

    const/4 v0, 0x0

    invoke-direct {v4, p1, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager$addDependOnDownloadAction$1;-><init>(Lcom/xj/winemu/download/action/DependOnDownloadAction;Lkotlin/coroutines/Continuation;)V

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->d(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method public x0(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;)V
    .locals 1

    new-instance v0, Lcom/xj/winemu/download/a;

    invoke-direct {v0, p1, p2}, Lcom/xj/winemu/download/a;-><init>(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;)V

    invoke-virtual {p0, p1, p2, v0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->D(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final y(JZZ)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cancelTask -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " , "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "WinEmuDownloadManager"

    invoke-static {v1, v0}, Lcom/xj/common/utils/XjLog;->c(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p3, :cond_0

    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object p3

    invoke-virtual {p3, p1, p2}, Lcom/arialyy/aria/core/download/DownloadReceiver;->load(J)Lcom/arialyy/aria/core/download/target/HttpNormalTarget;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->ignoreCheckPermissions()Lcom/arialyy/aria/core/common/AbsNormalTarget;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->cancel(Z)V

    if-eqz p4, :cond_1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/target/HttpNormalTarget;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/xj/winemu/download/DownloadExtKt;->b(Lcom/arialyy/aria/core/download/DownloadEntity;)Lcom/xj/winemu/data/bean/DownloadExtendInfo;

    move-result-object p1

    if-eqz p1, :cond_1

    sget-object p2, Lcom/xj/winemu/EmuFileMgr;->a:Lcom/xj/winemu/EmuFileMgr;

    invoke-virtual {p1}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getFileType()I

    move-result p3

    invoke-virtual {p1}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getFileId()I

    move-result p4

    invoke-virtual {p1}, Lcom/xj/winemu/data/bean/DownloadExtendInfo;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p3, p4, p1}, Lcom/xj/winemu/EmuFileMgr;->d(IILjava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/xj/winemu/download/WinEmuDownloadManager;->h0()Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object p3

    invoke-virtual {p3, p1, p2}, Lcom/arialyy/aria/core/download/DownloadReceiver;->load(J)Lcom/arialyy/aria/core/download/target/HttpNormalTarget;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->ignoreCheckPermissions()Lcom/arialyy/aria/core/common/AbsNormalTarget;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->cancel()V

    :cond_1
    :goto_0
    return-void
.end method

.method public z0(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 8

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_1

    invoke-virtual {p0, v1, v2}, Lcom/xj/winemu/download/WinEmuDownloadManager;->E(J)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getId()J

    move-result-wide v3

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v2, p0

    invoke-static/range {v2 .. v7}, Lcom/xj/winemu/download/WinEmuDownloadManager;->b1(Lcom/xj/winemu/download/WinEmuDownloadManager;JZILjava/lang/Object;)V

    return-void

    :cond_1
    const-string v0, "onTaskPre"

    invoke-virtual {p0, v0, p1}, Lcom/xj/winemu/download/WinEmuDownloadManager;->S0(Ljava/lang/String;Lcom/arialyy/aria/core/task/DownloadTask;)V

    :cond_2
    :goto_0
    return-void
.end method
