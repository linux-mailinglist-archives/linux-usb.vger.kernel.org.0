Return-Path: <linux-usb+bounces-23982-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09404AB889B
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7F1F4E47BD
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2549F1D54EF;
	Thu, 15 May 2025 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bs6ZW4v7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F731AAE13
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317394; cv=none; b=M0miNQOWsnSHUDGz8floeSzqIfVeMhXw/6uMszyJkD2hqlBeqhc9o+yJpicQxdnkt9oXl3lTxHiQl1ILXF5JYdCK2jgD2OVWjZEs+R/i2I1Ml08k7H+L1kakN+fP+8p3tilFst23UkimzuDaRWQtV/9NBQGet0Z8u9bUxjVMZGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317394; c=relaxed/simple;
	bh=6zU/1hgDrUuv4rR5E2kPlwrn6enjWEiecou5TXh8szI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6fgn21BEqP0aHXTRKkPbSAlv/4mB4X2jA9VR5pPx8jkEKzbONV7SZlUxKkGZK5VGHm8srMSOE8ZfmC1EwodkDPvh1eLzssemJnE0XoJbB4pgsW73oM165PFS+oPwxEpMTPkZ4ChMNFSw5FqdimODIeOWsTzOHNnoiMqD9gdSZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bs6ZW4v7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317393; x=1778853393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6zU/1hgDrUuv4rR5E2kPlwrn6enjWEiecou5TXh8szI=;
  b=bs6ZW4v7RiK4pIUogG5CfuRMxbXtIxV/aoopc9MdihexbdJRW8Yt0piO
   WI8L1SVV6JozeGHbns1Oywhcg0xM37MibY7gvFD0TcIqFO0RZroGBarWk
   SsCm5iNDJ5BmJGfeIVr7EcoPHn8QbSbtKm5ZIpeMAEh/1LO1KFwYKoB49
   t4lO02n+ZUBaYi30bdEv++UepRDr/2mlhFKsDZPV19K1Mn9WuRSGAZ6ab
   kdUfnjD9VGtSwf51S6hhbdAGZiK23flTxHy9Kp1P7DzAJD+CBLn10C0S9
   vzjVTOsxMAcRP5Zs5MZ7Dj4UJXnWQgiyawGbeuZkzuFIPlQ5drLqvEfck
   w==;
X-CSE-ConnectionGUID: L8AB0eRvQ66lUzUEl+drFw==
X-CSE-MsgGUID: lYZ7fqkmRkynDeoQqBLB3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60269993"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60269993"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:33 -0700
X-CSE-ConnectionGUID: VlKvYMa+TP+rBj3l+2FXEA==
X-CSE-MsgGUID: YLXMkjA2QreaKqpKKaCHtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372067"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:31 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Xu Rao <raoxu@uniontech.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/24] usb: xhci: Add debugfs support for xHCI port bandwidth
Date: Thu, 15 May 2025 16:55:59 +0300
Message-ID: <20250515135621.335595-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xu Rao <raoxu@uniontech.com>

In many projects, you need to obtain the available bandwidth of the
xhci roothub port. Refer to xhci rev1_2 and use the TRB_GET_BW
command to obtain it.

hardware tested:
03:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Raven USB 3.1
(prog-if 30 [XHCI])
Subsystem: Huawei Technologies Co., Ltd. Raven USB 3.1
Flags: bus master, fast devsel, latency 0, IRQ 30
Memory at c0300000 (64-bit, non-prefetchable) [size=1M]
Capabilities: [48] Vendor Specific Information: Len=08 <?>
Capabilities: [50] Power Management version 3
Capabilities: [64] Express Endpoint, MSI 00
Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
Kernel driver in use: xhci_hcd

test progress:
1. cd /sys/kernel/debug/usb/xhci/0000:03:00.3/port_bandwidth# ls
FS_BW  HS_BW  SS_BW
2. test fs speed  device
cat FS_BW
port[1] available bw: 90%.
port[2] available bw: 90%.
port[3] available bw: 90%.
port[4] available bw: 90%.
port[5] available bw: 0%.
port[6] available bw: 0%.
port[7] available bw: 0%.
port[8] available bw: 0%.
plug in fs usb audio ID 0d8c:013c
cat FS_BW
port[1] available bw: 76%.
port[2] available bw: 76%.
port[3] available bw: 76%.
port[4] available bw: 76%.
port[5] available bw: 0%.
port[6] available bw: 0%.
port[7] available bw: 0%.
port[8] available bw: 0%.
3. test hs speed device
cat HS_BW
port[1] available bw: 79%.
port[2] available bw: 79%.
port[3] available bw: 79%.
port[4] available bw: 79%.
port[5] available bw: 0%.
port[6] available bw: 0%.
port[7] available bw: 0%.
port[8] available bw: 0%.
plug in hs usb video ID 0408:1040
cat HS_BW
port[1] available bw: 39%.
port[2] available bw: 39%.
port[3] available bw: 39%.
port[4] available bw: 39%.
port[5] available bw: 0%.
port[6] available bw: 0%.
port[7] available bw: 0%.
port[8] available bw: 0%.
4.cat SS_BW
port[1] available bw: 0%.
port[2] available bw: 0%.
port[3] available bw: 0%.
port[4] available bw: 0%.
port[5] available bw: 90%.
port[6] available bw: 90%.
port[7] available bw: 90%.
port[8] available bw: 90%.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c | 108 ++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-mem.c     |  45 ++++++++++++-
 drivers/usb/host/xhci-ring.c    |  13 ++++
 drivers/usb/host/xhci.c         |  36 +++++++++++
 drivers/usb/host/xhci.h         |  14 +++++
 5 files changed, 215 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 1f5ef174abea..c6d44977193f 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -631,6 +631,112 @@ static void xhci_debugfs_create_ports(struct xhci_hcd *xhci,
 	}
 }
 
+static int xhci_port_bw_show(struct xhci_hcd *xhci, u8 dev_speed,
+				struct seq_file *s)
+{
+	unsigned int			num_ports;
+	unsigned int			i;
+	int				ret;
+	struct xhci_container_ctx	*ctx;
+	struct usb_hcd			*hcd = xhci_to_hcd(xhci);
+	struct device			*dev = hcd->self.controller;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		return ret;
+
+	num_ports = HCS_MAX_PORTS(xhci->hcs_params1);
+
+	ctx = xhci_alloc_port_bw_ctx(xhci, 0);
+	if (!ctx) {
+		pm_runtime_put_sync(dev);
+		return -ENOMEM;
+	}
+
+	/* get roothub port bandwidth */
+	ret = xhci_get_port_bandwidth(xhci, ctx, dev_speed);
+	if (ret)
+		goto err_out;
+
+	/* print all roothub ports available bandwidth
+	 * refer to xhci rev1_2 protocol 6.2.6 , byte 0 is reserved
+	 */
+	for (i = 1; i < num_ports+1; i++)
+		seq_printf(s, "port[%d] available bw: %d%%.\n", i,
+				ctx->bytes[i]);
+err_out:
+	pm_runtime_put_sync(dev);
+	xhci_free_port_bw_ctx(xhci, ctx);
+	return ret;
+}
+
+static int xhci_ss_bw_show(struct seq_file *s, void *unused)
+{
+	int ret;
+	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
+
+	ret = xhci_port_bw_show(xhci, USB_SPEED_SUPER, s);
+	return ret;
+}
+
+static int xhci_hs_bw_show(struct seq_file *s, void *unused)
+{
+	int ret;
+	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
+
+	ret = xhci_port_bw_show(xhci, USB_SPEED_HIGH, s);
+	return ret;
+}
+
+static int xhci_fs_bw_show(struct seq_file *s, void *unused)
+{
+	int ret;
+	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
+
+	ret = xhci_port_bw_show(xhci, USB_SPEED_FULL, s);
+	return ret;
+}
+
+static struct xhci_file_map bw_context_files[] = {
+	{"SS_BW",	xhci_ss_bw_show, },
+	{"HS_BW",	xhci_hs_bw_show, },
+	{"FS_BW",	xhci_fs_bw_show, },
+};
+
+static int bw_context_open(struct inode *inode, struct file *file)
+{
+	int			i;
+	struct xhci_file_map	*f_map;
+	const char		*file_name = file_dentry(file)->d_iname;
+
+	for (i = 0; i < ARRAY_SIZE(bw_context_files); i++) {
+		f_map = &bw_context_files[i];
+
+		if (strcmp(f_map->name, file_name) == 0)
+			break;
+	}
+
+	return single_open(file, f_map->show, inode->i_private);
+}
+
+static const struct file_operations bw_fops = {
+	.open			= bw_context_open,
+	.read			= seq_read,
+	.llseek			= seq_lseek,
+	.release		= single_release,
+};
+
+static void xhci_debugfs_create_bandwidth(struct xhci_hcd *xhci,
+					struct dentry *parent)
+{
+	parent = debugfs_create_dir("port_bandwidth", parent);
+
+	xhci_debugfs_create_files(xhci, bw_context_files,
+			  ARRAY_SIZE(bw_context_files),
+			  xhci,
+			  parent, &bw_fops);
+}
+
 void xhci_debugfs_init(struct xhci_hcd *xhci)
 {
 	struct device		*dev = xhci_to_hcd(xhci)->self.controller;
@@ -681,6 +787,8 @@ void xhci_debugfs_init(struct xhci_hcd *xhci)
 	xhci->debugfs_slots = debugfs_create_dir("devices", xhci->debugfs_root);
 
 	xhci_debugfs_create_ports(xhci, xhci->debugfs_root);
+
+	xhci_debugfs_create_bandwidth(xhci, xhci->debugfs_root);
 }
 
 void xhci_debugfs_exit(struct xhci_hcd *xhci)
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index ed36df46b140..7ff6a47d3198 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -484,6 +484,35 @@ void xhci_free_container_ctx(struct xhci_hcd *xhci,
 	kfree(ctx);
 }
 
+struct xhci_container_ctx *xhci_alloc_port_bw_ctx(struct xhci_hcd *xhci,
+						  gfp_t flags)
+{
+	struct xhci_container_ctx *ctx;
+	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
+
+	ctx = kzalloc_node(sizeof(*ctx), flags, dev_to_node(dev));
+	if (!ctx)
+		return NULL;
+
+	ctx->size = GET_PORT_BW_ARRAY_SIZE;
+
+	ctx->bytes = dma_pool_zalloc(xhci->port_bw_pool, flags, &ctx->dma);
+	if (!ctx->bytes) {
+		kfree(ctx);
+		return NULL;
+	}
+	return ctx;
+}
+
+void xhci_free_port_bw_ctx(struct xhci_hcd *xhci,
+			     struct xhci_container_ctx *ctx)
+{
+	if (!ctx)
+		return;
+	dma_pool_free(xhci->port_bw_pool, ctx->bytes, ctx->dma);
+	kfree(ctx);
+}
+
 struct xhci_input_control_ctx *xhci_get_input_control_ctx(
 					      struct xhci_container_ctx *ctx)
 {
@@ -1912,6 +1941,11 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Freed small stream array pool");
 
+	dma_pool_destroy(xhci->port_bw_pool);
+	xhci->port_bw_pool = NULL;
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+			"Freed xhci port bw array pool");
+
 	dma_pool_destroy(xhci->medium_streams_pool);
 	xhci->medium_streams_pool = NULL;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
@@ -2475,7 +2509,16 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 * will be allocated with dma_alloc_coherent()
 	 */
 
-	if (!xhci->small_streams_pool || !xhci->medium_streams_pool)
+	/* refer to xhci rev1_2 protocol 5.3.3 max ports is 255.
+	 * refer to xhci rev1_2 protocol 6.4.3.14 port bandwidth buffer need
+	 * to be 16-byte aligned.
+	 */
+	xhci->port_bw_pool =
+		dma_pool_create("xHCI 256 port bw ctx arrays",
+			dev, GET_PORT_BW_ARRAY_SIZE, 16, 0);
+
+	if (!xhci->small_streams_pool || !xhci->medium_streams_pool ||
+		!xhci->port_bw_pool)
 		goto fail;
 
 	/* Set up the command ring to have one segments for now. */
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e70bf7a27556..9607f75b8d2a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1899,6 +1899,8 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
 	case TRB_NEC_GET_FW:
 		xhci_handle_cmd_nec_get_fw(xhci, event);
 		break;
+	case TRB_GET_BW:
+		break;
 	default:
 		/* Skip over unknown commands on the event ring */
 		xhci_info(xhci, "INFO unknown command type %d\n", cmd_type);
@@ -4445,6 +4447,17 @@ int xhci_queue_configure_endpoint(struct xhci_hcd *xhci,
 			command_must_succeed);
 }
 
+/* Queue a get root hub port bandwidth command TRB */
+int xhci_queue_get_port_bw(struct xhci_hcd *xhci,
+		struct xhci_command *cmd, dma_addr_t in_ctx_ptr,
+		u8 dev_speed, bool command_must_succeed)
+{
+	return queue_command(xhci, cmd, lower_32_bits(in_ctx_ptr),
+		upper_32_bits(in_ctx_ptr), 0,
+		TRB_TYPE(TRB_GET_BW) | DEV_SPEED_FOR_TRB(dev_speed),
+		command_must_succeed);
+}
+
 /* Queue an evaluate context command TRB */
 int xhci_queue_evaluate_context(struct xhci_hcd *xhci, struct xhci_command *cmd,
 		dma_addr_t in_ctx_ptr, u32 slot_id, bool command_must_succeed)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index b6267fc37b08..fd9d41fe3224 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3090,6 +3090,42 @@ void xhci_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 }
 EXPORT_SYMBOL_GPL(xhci_reset_bandwidth);
 
+/* Get the available bandwidth of the ports under the xhci roothub */
+int xhci_get_port_bandwidth(struct xhci_hcd *xhci, struct xhci_container_ctx *ctx,
+			    u8 dev_speed)
+{
+	struct xhci_command *cmd;
+	unsigned long flags;
+	int ret;
+
+	if (!ctx || !xhci)
+		return -EINVAL;
+
+	cmd = xhci_alloc_command(xhci, true, GFP_KERNEL);
+	if (!cmd)
+		return -ENOMEM;
+
+	cmd->in_ctx = ctx;
+
+	/* get xhci port bandwidth, refer to xhci rev1_2 protocol 4.6.15 */
+	spin_lock_irqsave(&xhci->lock, flags);
+
+	ret = xhci_queue_get_port_bw(xhci, cmd, ctx->dma, dev_speed, 0);
+	if (ret) {
+		spin_unlock_irqrestore(&xhci->lock, flags);
+		goto err_out;
+	}
+	xhci_ring_cmd_db(xhci);
+	spin_unlock_irqrestore(&xhci->lock, flags);
+
+	wait_for_completion(cmd->completion);
+err_out:
+	kfree(cmd->completion);
+	kfree(cmd);
+
+	return ret;
+}
+
 static void xhci_setup_input_ctx_for_config_ep(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *in_ctx,
 		struct xhci_container_ctx *out_ctx,
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index df9ed8a74af6..f8198ec02981 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -589,6 +589,7 @@ struct xhci_stream_info {
 
 #define	SMALL_STREAM_ARRAY_SIZE		256
 #define	MEDIUM_STREAM_ARRAY_SIZE	1024
+#define	GET_PORT_BW_ARRAY_SIZE		256
 
 /* Some Intel xHCI host controllers need software to keep track of the bus
  * bandwidth.  Keep track of endpoint info here.  Each root port is allocated
@@ -1006,6 +1007,9 @@ enum xhci_setup_dev {
 /* bits 16:23 are the virtual function ID */
 /* bits 24:31 are the slot ID */
 
+/* bits 19:16 are the dev speed */
+#define DEV_SPEED_FOR_TRB(p)    ((p) << 16)
+
 /* Stop Endpoint TRB - ep_index to endpoint ID for this TRB */
 #define SUSPEND_PORT_FOR_TRB(p)		(((p) & 1) << 23)
 #define TRB_TO_SUSPEND_PORT(p)		(((p) & (1 << 23)) >> 23)
@@ -1558,6 +1562,7 @@ struct xhci_hcd {
 	struct dma_pool	*device_pool;
 	struct dma_pool	*segment_pool;
 	struct dma_pool	*small_streams_pool;
+	struct dma_pool	*port_bw_pool;
 	struct dma_pool	*medium_streams_pool;
 
 	/* Host controller watchdog timer structures */
@@ -1850,6 +1855,10 @@ struct xhci_container_ctx *xhci_alloc_container_ctx(struct xhci_hcd *xhci,
 		int type, gfp_t flags);
 void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
+struct xhci_container_ctx *xhci_alloc_port_bw_ctx(struct xhci_hcd *xhci,
+		gfp_t flags);
+void xhci_free_port_bw_ctx(struct xhci_hcd *xhci,
+		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 				  u32 imod_interval, unsigned int intr_num);
@@ -1923,6 +1932,11 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 int xhci_queue_configure_endpoint(struct xhci_hcd *xhci,
 		struct xhci_command *cmd, dma_addr_t in_ctx_ptr, u32 slot_id,
 		bool command_must_succeed);
+int xhci_queue_get_port_bw(struct xhci_hcd *xhci,
+		struct xhci_command *cmd, dma_addr_t in_ctx_ptr,
+		u8 dev_speed, bool command_must_succeed);
+int xhci_get_port_bandwidth(struct xhci_hcd *xhci, struct xhci_container_ctx *ctx,
+		u8 dev_speed);
 int xhci_queue_evaluate_context(struct xhci_hcd *xhci, struct xhci_command *cmd,
 		dma_addr_t in_ctx_ptr, u32 slot_id, bool command_must_succeed);
 int xhci_queue_reset_ep(struct xhci_hcd *xhci, struct xhci_command *cmd,
-- 
2.43.0


