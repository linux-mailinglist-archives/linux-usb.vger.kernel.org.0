Return-Path: <linux-usb+bounces-21720-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 721E8A5F5D5
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 14:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C695D3B0B61
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 13:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE80267730;
	Thu, 13 Mar 2025 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="gG1yMXXp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7156126772D;
	Thu, 13 Mar 2025 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741872128; cv=none; b=j9Hwf9blM4vPgPUcjGrZjIcChQEUqczziPWyulNjCZx6H8VM77iXx7ZmDa4sG3H4P9OrryFQya+4CWCOztkwH4iWnhNBY009lN7V3bLITfNOhx8aWQO50b6VlyKV2MU7q0AsHaR8Vy1TRRcR9tUzTkrAaO4ilP+FkECPwI7TFCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741872128; c=relaxed/simple;
	bh=L1bBoAB4uHzQdytm9sSFWbOcDfjXVTvynPt4m3CS6oY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RFUT30qq6R2D96E2VPEkCq7TxXvrBC5Yph7Kwwf/oOe5TirjT2cptGegvgAIEU88kzK32hPnLFaUwJEKlUxveEXtsUwjC0bH5NkFuU0hRDTZBp2wax+3M/96S0OY3Eyvg0nnng89UA9cOIIudysj7sMi0FoPaRDt+96QTFwp/jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=gG1yMXXp; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1741872105;
	bh=vkqzDik51jkb1XhdqTBBrHS1N617pr0nxj01GONTXuc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=gG1yMXXpN8TGKkTwCy4EjhHqFQCgD4tx1ODLy1bvqeFHTCnBcbiX9Lhr8l+HOv/81
	 VPlCRlch2dDtYu6IA1y/yZxEbcgF14p9gDbZXVndn5XeHmdXMJGuAZt4867iaAmBdU
	 CgWpoHBL6Dedy7JcDXU7s0JZD/dRxW3u9/pMnH0E=
X-QQ-mid: bizesmtpip3t1741872096tn0qrkk
X-QQ-Originating-IP: Gn2urkvPkYcB0c1+G3mHBs8BqHvTMLm+sbTpH0pTTQA=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 13 Mar 2025 21:21:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2189012959449461710
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangyuli@uniontech.com,
	zhanjun@uniontech.com,
	Xu Rao <raoxu@uniontech.com>
Subject: [PATCH V5] usb:xhci: Add debugfs support for xHCI port bandwidth
Date: Thu, 13 Mar 2025 21:21:32 +0800
Message-Id: <20250313132132.2856-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0
X-QQ-XMAILINFO: NL3fB1gebWXoxpeVu4dU//g/7OahWU+DU6NM39d5+o85sLHMi8Ieb1m1
	lhqFgC+TTaLQjH3/HwXWSXnGNGPHs8QaC8HtTvdNtbf5ZtzwitTsafWf979DaTM51yrZUe0
	I78lrAnJq3wfycVI6boFEYrUQWeaaLmtsNFk7Nv2UfN9IgGkYUrLPzhcEtrpqS8NLYdmj8I
	fzOvtFWgX0WYpBDu+om/H/8AqaNBJG7ivUYVoVUzQ8zHbtojAkJYlx1aooy10pSeC5FGG75
	+RbMcR3lsFUBMI7f4IKQ0vU3ljxMzv6tPIBzF+z8o6I95rZ4pLoy6S9m2uDVIBZwxyjjddS
	Pyn9aM+YAZHv5cH8RJ08/5ZwItYM4t4tOIrUaNkXKWTOJ7cu3qjuzeW5JIafEp8Q13XujOW
	tL5g8nbujky30+BkRLuwvGBiTkE96OsGUiptMQ4ObX6is0LaSKbWyhZKWO3pVk2okdmYPLg
	bZSfDPcCP6JsOHM1nbxSdbzw5sKBmHyCa/idgklu+Xb2/sSd9FgHBzGFtJYMGCHDIA2y+Zy
	XtL5EcaYrxnoIjRFC2xhC+HJfKsKBy91+FcymMmOoQ9MVozXonD6iU994q4bxYb1yAYgul2
	PEniKt7KM8WCMn8KyhFFLN1RXZUiQfe1l7h17VprjeD0ap25GldhfAjKrh0LCGzQJuCy3+D
	BgeNBaeEt9qrjn4mz+uanh+zvxp8i3lL9qCeVumSt7koGAOYUD4ScJTu263uz51+/t/x7OD
	eGJUEHI7Y5/3x/b5LvqQIof67ZwlCHP2M0nwmTByA5U1hpGTJN/R/SqMrqWzAImoALTOPlQ
	L78wT3Znmrw+bqyGd6a3vJ9lqBp81YkudvSHiqVFOepUp+iQPjw/3zWV8++HLXaSQxt/5hO
	ixOaZiGWLut3cIzpjQ82wmiCAUkkTPUJyb5J+SMekLDlT6izhhTpznLDUvKtOY4xXx+vCDw
	JRmwamYXqRDlWWgtITGI/wP7j4GejlBuCHWfZa4hQVMfiXzM1k82CZUWyC0Yio/meooxzkz
	UJmzs4f9bWd4iYgIEMkunUHt/hhtibvh6XVByzq0BgqLYe5GcNgGhwtwE+J2a4tBNrbHhHi
	w==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

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
---
Changelog:
 *v1->v2: modify the patch subject no code changes.
  v2->v3: separate files in debugfs for each speed (SS HS FS).
	queue one command for each speed not queuing three commands on one file.
	print value from context not array on stack.
  v3->v4: Fix compilation warnings for W=1 build. Delete unused variable
  v4->v5: Add pm_runtime_get_sync operation before get port bandwidth.
	  When obtaining port bandwidth, alloc a new command structure with
	  context for each time.
	  Create dma pool instead of allocating one shared.
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
index 92703efda1f7..b8614590cb6d 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -484,6 +484,35 @@ void xhci_free_container_ctx(struct xhci_hcd *xhci,
 	kfree(ctx);
 }

+struct xhci_container_ctx *xhci_alloc_port_bw_ctx(struct xhci_hcd *xhci,
+						    gfp_t flags)
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
@@ -1907,6 +1936,11 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
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
@@ -2463,7 +2497,16 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 * will be allocated with dma_alloc_coherent()
 	 */

-	if (!xhci->small_streams_pool || !xhci->medium_streams_pool)
+	/* refer to xhci rev1_2 protocol 5.3.3 max ports is 255.
+	 * refer to xhci rev1_2 protocol 6.2.6 port bandwidth buffer need to be
+	 * 8-byte aligned.
+	 */
+	xhci->port_bw_pool =
+		dma_pool_create("xHCI 256 port bw ctx arrays",
+			dev, GET_PORT_BW_ARRAY_SIZE, 8, 0);
+
+	if (!xhci->small_streams_pool || !xhci->medium_streams_pool ||
+		!xhci->port_bw_pool)
 		goto fail;

 	/* Set up the command ring to have one segments for now. */
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 965bffce301e..0a01753075b4 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1867,6 +1867,8 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
 	case TRB_NEC_GET_FW:
 		xhci_handle_cmd_nec_get_fw(xhci, event);
 		break;
+	case TRB_GET_BW:
+		break;
 	default:
 		/* Skip over unknown commands on the event ring */
 		xhci_info(xhci, "INFO unknown command type %d\n", cmd_type);
@@ -4414,6 +4416,17 @@ int xhci_queue_configure_endpoint(struct xhci_hcd *xhci,
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
index 45653114ccd7..fde774408a13 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3088,6 +3088,42 @@ void xhci_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 }
 EXPORT_SYMBOL_GPL(xhci_reset_bandwidth);

+/* Get the available bandwidth of the ports under the xhci roothub */
+int xhci_get_port_bandwidth(struct xhci_hcd *xhci, struct xhci_container_ctx *ctx,
+		u8 dev_speed)
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
index 8c164340a2c3..51bf99787ec9 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -586,6 +586,7 @@ struct xhci_stream_info {

 #define	SMALL_STREAM_ARRAY_SIZE		256
 #define	MEDIUM_STREAM_ARRAY_SIZE	1024
+#define	GET_PORT_BW_ARRAY_SIZE		256

 /* Some Intel xHCI host controllers need software to keep track of the bus
  * bandwidth.  Keep track of endpoint info here.  Each root port is allocated
@@ -999,6 +1000,9 @@ enum xhci_setup_dev {
 /* bits 16:23 are the virtual function ID */
 /* bits 24:31 are the slot ID */

+/* bits 19:16 are the dev speed */
+#define DEV_SPEED_FOR_TRB(p)    ((p) << 16)
+
 /* Stop Endpoint TRB - ep_index to endpoint ID for this TRB */
 #define SUSPEND_PORT_FOR_TRB(p)		(((p) & 1) << 23)
 #define TRB_TO_SUSPEND_PORT(p)		(((p) & (1 << 23)) >> 23)
@@ -1554,6 +1558,7 @@ struct xhci_hcd {
 	struct dma_pool	*device_pool;
 	struct dma_pool	*segment_pool;
 	struct dma_pool	*small_streams_pool;
+	struct dma_pool	*port_bw_pool;
 	struct dma_pool	*medium_streams_pool;

 	/* Host controller watchdog timer structures */
@@ -1837,6 +1842,10 @@ struct xhci_container_ctx *xhci_alloc_container_ctx(struct xhci_hcd *xhci,
 		int type, gfp_t flags);
 void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
+struct xhci_container_ctx *xhci_alloc_port_bw_ctx(struct xhci_hcd *xhci,
+		gfp_t flags);
+void xhci_free_port_bw_ctx(struct xhci_hcd *xhci,
+		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 				  u32 imod_interval);
@@ -1907,6 +1916,11 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
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
2.43.4


