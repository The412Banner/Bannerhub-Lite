.class public final synthetic Lcom/xj/landscape/launcher/ui/gamedetail/BhImportLambda;
.super Ljava/lang/Object;

# implements kotlin.jvm.functions.Function1 — called when user taps Import Config
.implements Lkotlin/jvm/functions/Function1;

# instance fields
.field public final a:Lcom/xj/landscape/launcher/ui/gamedetail/GameDetailSettingMenu;
.field public final b:Lcom/xj/common/data/gameinfo/GameDetailEntity;

# direct methods
.method public synthetic constructor <init>(Lcom/xj/landscape/launcher/ui/gamedetail/GameDetailSettingMenu;Lcom/xj/common/data/gameinfo/GameDetailEntity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xj/landscape/launcher/ui/gamedetail/BhImportLambda;->a:Lcom/xj/landscape/launcher/ui/gamedetail/GameDetailSettingMenu;
    iput-object p2, p0, Lcom/xj/landscape/launcher/ui/gamedetail/BhImportLambda;->b:Lcom/xj/common/data/gameinfo/GameDetailEntity;

    return-void
.end method

# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    # v0 = GameDetailSettingMenu
    iget-object v0, p0, Lcom/xj/landscape/launcher/ui/gamedetail/BhImportLambda;->a:Lcom/xj/landscape/launcher/ui/gamedetail/GameDetailSettingMenu;

    # v1 = FragmentActivity (field a — direct field access, no z() method in BH-Lite)
    iget-object v1, v0, Lcom/xj/landscape/launcher/ui/gamedetail/GameDetailSettingMenu;->a:Landroidx/fragment/app/FragmentActivity;

    # v2 = GameDetailEntity
    iget-object v2, p0, Lcom/xj/landscape/launcher/ui/gamedetail/BhImportLambda;->b:Lcom/xj/common/data/gameinfo/GameDetailEntity;

    # Replicate GameHub's own gameId resolution:
    #   if getId() > 0  → gameId = String.valueOf(getId())   (catalog/server game)
    #   else            → gameId = getLocalGameId()           (locally-added game)
    invoke-virtual {v2}, Lcom/xj/common/data/gameinfo/GameDetailEntity;->getId()I
    move-result v3

    if-gtz v3, :has_server_id

    invoke-virtual {v2}, Lcom/xj/common/data/gameinfo/GameDetailEntity;->getLocalGameId()Ljava/lang/String;
    move-result-object v3
    goto :resolve_done

    :has_server_id
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v3

    :resolve_done

    # v4 = gameName (String)
    invoke-virtual {v2}, Lcom/xj/common/data/gameinfo/GameDetailEntity;->getName()Ljava/lang/String;
    move-result-object v4

    invoke-static {v1, v3, v4}, Lapp/revanced/extension/gamehub/BhSettingsExporter;->showImportDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0
    return-object v0
.end method
