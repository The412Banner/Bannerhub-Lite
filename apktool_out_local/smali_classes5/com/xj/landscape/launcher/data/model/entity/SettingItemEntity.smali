.class public final Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
.end annotation


# static fields
.field private static final CONTENT_TYPE_CLEAR_CAHCE:I

.field private static final CONTENT_TYPE_DELETE_PC_MU:I

.field private static final CONTENT_TYPE_DEVICE_INFO:I

.field private static final CONTENT_TYPE_FEEDBACK:I

.field private static final CONTENT_TYPE_HID_TIPS:I

.field private static final CONTENT_TYPE_HOMEPAGE:I

.field private static final CONTENT_TYPE_LANGUAGE:I

.field private static final CONTENT_TYPE_NOTIFICATION_ACTIVITY:I

.field private static final CONTENT_TYPE_NOTIFICATION_BLOCK:I

.field private static final CONTENT_TYPE_NOTIFICATION_FRIEND:I

.field private static final CONTENT_TYPE_NOTIFICATION_HIGHTLIGHT:I

.field private static final CONTENT_TYPE_NOTIFICATION_NEWS:I

.field private static final CONTENT_TYPE_NOTIFICATION_ORTHER:I

.field private static final CONTENT_TYPE_NOTIFICATION_PUSH:I

.field private static final CONTENT_TYPE_NOTIFICATION_PUSH_ENABLE:I

.field private static final CONTENT_TYPE_NOTIFICATION_RECOMMEND_GAME:I

.field private static final CONTENT_TYPE_PERSONAL_INFORMATION:I

.field private static final CONTENT_TYPE_PRIVACY_POLICY:I

.field private static final CONTENT_TYPE_RECODE_BIT:I

.field private static final CONTENT_TYPE_RECODE_FPS:I

.field private static final CONTENT_TYPE_RECODE_TYPE:I

.field private static final CONTENT_TYPE_RESET_MAPPING:I

.field public static final Companion:Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final TYPE_BTN:I

.field private static final TYPE_EMPTY_SPACE:I

.field private static final TYPE_JUMP_ITEM:I

.field private static final TYPE_SHOW_SELECT_TEXT:I

.field private static final TYPE_SWITCH:I

.field private static final TYPE_TEXT_INPUT:I

.field private static final TYPE_UPGRADE:I


# instance fields
.field private contentType:I

.field private params:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private switchValue:Z

.field private type:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->Companion:Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;

    const/4 v0, -0x1

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_EMPTY_SPACE:I

    const/4 v0, 0x1

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_JUMP_ITEM:I

    const/4 v1, 0x2

    sput v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_TEXT_INPUT:I

    const/4 v2, 0x3

    sput v2, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_BTN:I

    const/4 v3, 0x4

    sput v3, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_UPGRADE:I

    const/4 v4, 0x5

    sput v4, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_SWITCH:I

    const/4 v5, 0x6

    sput v5, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_SHOW_SELECT_TEXT:I

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_RECODE_FPS:I

    sput v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_RECODE_TYPE:I

    sput v2, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_RECODE_BIT:I

    sput v3, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_RESET_MAPPING:I

    sput v4, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_CLEAR_CAHCE:I

    const/4 v0, 0x7

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_DELETE_PC_MU:I

    const/16 v0, 0x8

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_BLOCK:I

    const/16 v0, 0x9

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_PUSH:I

    const/16 v0, 0xa

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_ORTHER:I

    const/16 v0, 0xb

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_FRIEND:I

    const/16 v0, 0xc

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_HIGHTLIGHT:I

    const/16 v0, 0xd

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_FEEDBACK:I

    const/16 v0, 0xe

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_HOMEPAGE:I

    const/16 v0, 0xf

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_HID_TIPS:I

    const/16 v0, 0x10

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_LANGUAGE:I

    const/16 v0, 0x11

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_DEVICE_INFO:I

    const/16 v0, 0x12

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_PERSONAL_INFORMATION:I

    const/16 v0, 0x13

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_PRIVACY_POLICY:I

    const/16 v0, 0x14

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_PUSH_ENABLE:I

    const/16 v0, 0x15

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_RECOMMEND_GAME:I

    const/16 v0, 0x16

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_ACTIVITY:I

    const/16 v0, 0x17

    sput v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_NEWS:I

    return-void
.end method

.method public constructor <init>(IILandroid/util/SparseArray;Z)V
    .locals 1
    .param p3    # Landroid/util/SparseArray;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Landroid/util/SparseArray<",
            "Ljava/lang/Object;",
            ">;Z)V"
        }
    .end annotation

    const-string v0, "params"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->type:I

    .line 3
    iput p2, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->contentType:I

    .line 4
    iput-object p3, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->params:Landroid/util/SparseArray;

    .line 5
    iput-boolean p4, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->switchValue:Z

    return-void
.end method

.method public synthetic constructor <init>(IILandroid/util/SparseArray;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    and-int/lit8 p6, p5, 0x2

    const/4 v0, 0x0

    if-eqz p6, :cond_0

    move p2, v0

    :cond_0
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_1

    .line 6
    new-instance p3, Landroid/util/SparseArray;

    invoke-direct {p3}, Landroid/util/SparseArray;-><init>()V

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    move p4, v0

    .line 7
    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;-><init>(IILandroid/util/SparseArray;Z)V

    return-void
.end method

.method public static final synthetic access$getCONTENT_TYPE_CLEAR_CAHCE$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_CLEAR_CAHCE:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_DELETE_PC_MU$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_DELETE_PC_MU:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_DEVICE_INFO$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_DEVICE_INFO:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_FEEDBACK$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_FEEDBACK:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_HID_TIPS$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_HID_TIPS:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_HOMEPAGE$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_HOMEPAGE:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_LANGUAGE$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_LANGUAGE:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_NOTIFICATION_ACTIVITY$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_ACTIVITY:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_NOTIFICATION_BLOCK$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_BLOCK:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_NOTIFICATION_FRIEND$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_FRIEND:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_NOTIFICATION_HIGHTLIGHT$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_HIGHTLIGHT:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_NOTIFICATION_NEWS$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_NEWS:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_NOTIFICATION_ORTHER$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_ORTHER:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_NOTIFICATION_PUSH$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_PUSH:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_NOTIFICATION_PUSH_ENABLE$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_PUSH_ENABLE:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_NOTIFICATION_RECOMMEND_GAME$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_RECOMMEND_GAME:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_PERSONAL_INFORMATION$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_PERSONAL_INFORMATION:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_PRIVACY_POLICY$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_PRIVACY_POLICY:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_RECODE_BIT$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_RECODE_BIT:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_RECODE_FPS$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_RECODE_FPS:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_RECODE_TYPE$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_RECODE_TYPE:I

    return v0
.end method

.method public static final synthetic access$getCONTENT_TYPE_RESET_MAPPING$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_RESET_MAPPING:I

    return v0
.end method

.method public static final synthetic access$getTYPE_BTN$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_BTN:I

    return v0
.end method

.method public static final synthetic access$getTYPE_EMPTY_SPACE$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_EMPTY_SPACE:I

    return v0
.end method

.method public static final synthetic access$getTYPE_JUMP_ITEM$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_JUMP_ITEM:I

    return v0
.end method

.method public static final synthetic access$getTYPE_SHOW_SELECT_TEXT$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_SHOW_SELECT_TEXT:I

    return v0
.end method

.method public static final synthetic access$getTYPE_SWITCH$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_SWITCH:I

    return v0
.end method

.method public static final synthetic access$getTYPE_TEXT_INPUT$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_TEXT_INPUT:I

    return v0
.end method

.method public static final synthetic access$getTYPE_UPGRADE$cp()I
    .locals 1

    sget v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->TYPE_UPGRADE:I

    return v0
.end method

.method public static synthetic copy$default(Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;IILandroid/util/SparseArray;ZILjava/lang/Object;)Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;
    .locals 0

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_0

    iget p1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->type:I

    :cond_0
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_1

    iget p2, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->contentType:I

    :cond_1
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_2

    iget-object p3, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->params:Landroid/util/SparseArray;

    :cond_2
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_3

    iget-boolean p4, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->switchValue:Z

    :cond_3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->copy(IILandroid/util/SparseArray;Z)Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()I
    .locals 1

    iget v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->type:I

    return v0
.end method

.method public final component2()I
    .locals 1

    iget v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->contentType:I

    return v0
.end method

.method public final component3()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->params:Landroid/util/SparseArray;

    return-object v0
.end method

.method public final component4()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->switchValue:Z

    return v0
.end method

.method public final copy(IILandroid/util/SparseArray;Z)Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;
    .locals 1
    .param p3    # Landroid/util/SparseArray;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Landroid/util/SparseArray<",
            "Ljava/lang/Object;",
            ">;Z)",
            "Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string v0, "params"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;-><init>(IILandroid/util/SparseArray;Z)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    iget v1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->type:I

    iget v3, p1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->type:I

    if-eq v1, v3, :cond_2

    return v2

    :cond_2
    iget v1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->contentType:I

    iget v3, p1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->contentType:I

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->params:Landroid/util/SparseArray;

    iget-object v3, p1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->params:Landroid/util/SparseArray;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-boolean v1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->switchValue:Z

    iget-boolean p1, p1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->switchValue:Z

    if-eq v1, p1, :cond_5

    return v2

    :cond_5
    return v0
.end method

.method public final getContentName()Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->contentType:I

    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_RECODE_FPS:I

    const-string v2, "getString(...)"

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_record_title1:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_0
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_RECODE_TYPE:I

    if-ne v0, v1, :cond_1

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_record_title2:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_1
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_RECODE_BIT:I

    if-ne v0, v1, :cond_2

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_record_title3:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_2
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_RESET_MAPPING:I

    if-ne v0, v1, :cond_3

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_record_reset_mapping:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_3
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_CLEAR_CAHCE:I

    if-ne v0, v1, :cond_4

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_record_clear_cache:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_4
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_DELETE_PC_MU:I

    if-ne v0, v1, :cond_5

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_delete_simulator:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_5
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_BLOCK:I

    if-ne v0, v1, :cond_6

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_notification_title1:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_6
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_PUSH:I

    if-ne v0, v1, :cond_7

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_notification_title3:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_7
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_ORTHER:I

    if-ne v0, v1, :cond_8

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_notification_title4:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_8
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_FRIEND:I

    if-ne v0, v1, :cond_9

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_notification_title5:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_9
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_HIGHTLIGHT:I

    if-ne v0, v1, :cond_a

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_notification_title6:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_a
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_PUSH_ENABLE:I

    if-ne v0, v1, :cond_b

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->push_notification:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_b
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_RECOMMEND_GAME:I

    if-ne v0, v1, :cond_c

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->game_recommendation:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_c
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_ACTIVITY:I

    if-ne v0, v1, :cond_d

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->event_notification:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_d
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_NEWS:I

    if-ne v0, v1, :cond_e

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->news_push:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_e
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_FEEDBACK:I

    if-ne v0, v1, :cond_f

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_help_feedback:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_f
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_HOMEPAGE:I

    if-ne v0, v1, :cond_10

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_help_home_page:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_10
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_HID_TIPS:I

    if-ne v0, v1, :cond_11

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_help_hid_mode_tips:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_11
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_LANGUAGE:I

    if-ne v0, v1, :cond_12

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_language:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_12
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_DEVICE_INFO:I

    if-ne v0, v1, :cond_13

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_device_info:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_13
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_PERSONAL_INFORMATION:I

    if-ne v0, v1, :cond_14

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_personal_information:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_14
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_PRIVACY_POLICY:I

    if-ne v0, v1, :cond_15

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->title_privacy_policy:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_15
    # BannerHub Lite: Grant Root Access button (contentType=0x64)
    const/16 v1, 0x64

    if-ne v0, v1, :cond_16

    const-string v0, "Grant Root Access"

    goto :goto_0

    :cond_16
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public final getContentType()I
    .locals 1

    iget v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->contentType:I

    return v0
.end method

.method public final getParams()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->params:Landroid/util/SparseArray;

    return-object v0
.end method

.method public final getParams(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)TT;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 2
    iget-object v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->params:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    :cond_0
    return-object p1
.end method

.method public final getSubContentName()Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->contentType:I

    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_BLOCK:I

    const-string v2, "getString(...)"

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_notification_desc1:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_0
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_PUSH:I

    if-ne v0, v1, :cond_1

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_notification_desc3:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_ORTHER:I

    if-ne v0, v1, :cond_2

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_notification_desc4:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_FRIEND:I

    if-ne v0, v1, :cond_3

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_notification_desc5:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_HIGHTLIGHT:I

    if-ne v0, v1, :cond_4

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->llauncher_setting_notification_desc6:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_PUSH_ENABLE:I

    if-ne v0, v1, :cond_5

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v0

    sget v1, Lcom/xj/language/R$string;->notification_settings_hint:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->a()Landroid/app/Application;

    move-result-object v1

    sget v2, Lcom/xj/language/R$string;->app_name:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "format(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->f(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public final getSwitchValue()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->switchValue:Z

    return v0
.end method

.method public final getType()I
    .locals 1

    iget v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->type:I

    return v0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->type:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->contentType:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->params:Landroid/util/SparseArray;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->switchValue:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public final isNotificationContentType()Z
    .locals 2

    iget v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->contentType:I

    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_PUSH_ENABLE:I

    if-eq v0, v1, :cond_1

    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_RECOMMEND_GAME:I

    if-eq v0, v1, :cond_1

    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_ACTIVITY:I

    if-eq v0, v1, :cond_1

    sget v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->CONTENT_TYPE_NOTIFICATION_NEWS:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public final putParams(ILjava/lang/Object;)V
    .locals 1
    .param p2    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->params:Landroid/util/SparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method public final setContentType(I)V
    .locals 0

    iput p1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->contentType:I

    return-void
.end method

.method public final setParams(Landroid/util/SparseArray;)V
    .locals 1
    .param p1    # Landroid/util/SparseArray;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->params:Landroid/util/SparseArray;

    return-void
.end method

.method public final setSwitchValue(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->switchValue:Z

    return-void
.end method

.method public final setType(I)V
    .locals 0

    iput p1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->type:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 6
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget v0, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->type:I

    iget v1, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->contentType:I

    iget-object v2, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->params:Landroid/util/SparseArray;

    iget-boolean v3, p0, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->switchValue:Z

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SettingItemEntity(type="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", contentType="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", params="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", switchValue="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
