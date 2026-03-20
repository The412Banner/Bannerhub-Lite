.class public final Lcom/xj/landscape/launcher/vm/SettingItemViewModel;
.super Lcom/xj/base/base/viewmodel/BaseViewModel;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/LifecycleObserver;


# annotations
.annotation runtime Lkotlin/Metadata;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/xj/base/base/viewmodel/BaseViewModel;-><init>()V

    return-void
.end method


# virtual methods
.method public final i()Ljava/util/List;
    .locals 17

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    sget-object v9, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->Companion:Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getTYPE_JUMP_ITEM()I

    move-result v2

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_FEEDBACK()I

    move-result v3

    const/16 v6, 0xc

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, v8

    invoke-direct/range {v1 .. v7}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;-><init>(IILandroid/util/SparseArray;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getTYPE_JUMP_ITEM()I

    move-result v11

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_HOMEPAGE()I

    move-result v12

    const/16 v15, 0xc

    const/16 v16, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object v10, v1

    invoke-direct/range {v10 .. v16}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;-><init>(IILandroid/util/SparseArray;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getTYPE_JUMP_ITEM()I

    move-result v3

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_HID_TIPS()I

    move-result v4

    const/16 v7, 0xc

    const/4 v8, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, v1

    invoke-direct/range {v2 .. v8}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;-><init>(IILandroid/util/SparseArray;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public final j()Ljava/util/List;
    .locals 17

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    sget-object v9, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->Companion:Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getTYPE_JUMP_ITEM()I

    move-result v2

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_NOTIFICATION_PUSH_ENABLE()I

    move-result v3

    const/16 v6, 0xc

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, v8

    invoke-direct/range {v1 .. v7}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;-><init>(IILandroid/util/SparseArray;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getTYPE_SWITCH()I

    move-result v11

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_NOTIFICATION_RECOMMEND_GAME()I

    move-result v12

    const/16 v15, 0xc

    const/16 v16, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object v10, v1

    invoke-direct/range {v10 .. v16}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;-><init>(IILandroid/util/SparseArray;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getTYPE_SWITCH()I

    move-result v3

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_NOTIFICATION_ACTIVITY()I

    move-result v4

    const/16 v7, 0xc

    const/4 v8, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, v1

    invoke-direct/range {v2 .. v8}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;-><init>(IILandroid/util/SparseArray;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getTYPE_SWITCH()I

    move-result v11

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_NOTIFICATION_NEWS()I

    move-result v12

    move-object v10, v1

    invoke-direct/range {v10 .. v16}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;-><init>(IILandroid/util/SparseArray;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public final k()Ljava/util/List;
    .locals 17

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    sget-object v9, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->Companion:Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getTYPE_JUMP_ITEM()I

    move-result v2

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_LANGUAGE()I

    move-result v3

    const/16 v6, 0xc

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, v8

    invoke-direct/range {v1 .. v7}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;-><init>(IILandroid/util/SparseArray;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    nop

    new-instance v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getTYPE_BTN()I

    move-result v11

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_CLEAR_CAHCE()I

    move-result v12

    const/16 v15, 0xc

    const/16 v16, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object v10, v1

    invoke-direct/range {v10 .. v16}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;-><init>(IILandroid/util/SparseArray;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    # BannerHub Lite: Grant Root Access button (contentType=0x64) below Clear Cache
    new-instance v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    invoke-virtual {v9}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getTYPE_BTN()I

    move-result v11

    const/16 v12, 0x64

    const/16 v15, 0xc

    const/16 v16, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object v10, v1

    invoke-direct/range {v10 .. v16}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;-><init>(IILandroid/util/SparseArray;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public final l()Ljava/util/List;
    .locals 9

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;

    sget-object v1, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;->Companion:Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;

    invoke-virtual {v1}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getTYPE_BTN()I

    move-result v2

    invoke-virtual {v1}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity$Companion;->getCONTENT_TYPE_DELETE_PC_MU()I

    move-result v3

    const/16 v6, 0xc

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, v8

    invoke-direct/range {v1 .. v7}, Lcom/xj/landscape/launcher/data/model/entity/SettingItemEntity;-><init>(IILandroid/util/SparseArray;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
