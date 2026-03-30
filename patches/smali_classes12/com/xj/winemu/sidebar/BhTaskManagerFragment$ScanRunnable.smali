.class public Lcom/xj/winemu/sidebar/BhTaskManagerFragment$ScanRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# Background Runnable: scans /proc for Wine processes, posts results back to
# main thread via BhTaskManagerFragment.onScanComplete().

.implements Ljava/lang/Runnable;

.field public final fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;

.method public constructor <init>(Lcom/xj/winemu/sidebar/BhTaskManagerFragment;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$ScanRunnable;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    return-void
.end method

# Helper: read first line of a file path; returns null on any error.
.method private static readFirstLine(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    :try_start_0
    new-instance v0, Ljava/io/RandomAccessFile;
    const-string v1, "r"
    invoke-direct {v0, p0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->readLine()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    return-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    :catch_0
    const/4 v0, 0x0
    return-object v0
.end method

.method public run()V
    .locals 12

    # v0  = names  ArrayList<String>
    # v1  = pids   ArrayList<Integer>
    # v2  = /proc File
    # v3  = File[] children
    # v4  = loop length
    # v5  = loop index
    # v6  = current File entry
    # v7  = entry name (pid string)
    # v8  = pid int (parsed)
    # v9  = comm file path string
    # v10 = comm string (process name)
    # v11 = temp

    new-instance v0, Ljava/util/ArrayList;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/io/File;
    const-string v3, "/proc"
    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v3
    if-eqz v3, :post_results

    array-length v4, v3
    const/4 v5, 0x0

    :loop
    if-ge v5, v4, :post_results

    aget-object v6, v3, v5
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v7

    # Try to parse as integer (only pid dirs are numeric)
    :try_start_1
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v8
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :next_entry

    # Build /proc/{pid}/comm path
    new-instance v9, Ljava/lang/StringBuilder;
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V
    const-string v11, "/proc/"
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, "/comm"
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v9

    invoke-static {v9}, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$ScanRunnable;->readFirstLine(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
    if-eqz v10, :next_entry

    # Trim whitespace/newline from comm
    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v10

    # Check if this looks like a Wine process
    # Lower-case the name for comparison
    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v11

    # Check contains "wine"
    const-string v9, "wine"
    invoke-virtual {v11, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v9
    if-nez v9, :is_wine_proc

    # Check ends with ".exe"
    const-string v9, ".exe"
    invoke-virtual {v11, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v9
    if-eqz v9, :next_entry

    :is_wine_proc
    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v9
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :next_entry
    add-int/lit8 v5, v5, 0x1
    goto :loop

    :post_results
    # Post onScanComplete to main thread via Handler
    new-instance v2, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v3
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v3, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$UpdateRunnable;
    iget-object v4, p0, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$ScanRunnable;->fragment:Lcom/xj/winemu/sidebar/BhTaskManagerFragment;
    invoke-direct {v3, v4, v0, v1}, Lcom/xj/winemu/sidebar/BhTaskManagerFragment$UpdateRunnable;-><init>(Lcom/xj/winemu/sidebar/BhTaskManagerFragment;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
