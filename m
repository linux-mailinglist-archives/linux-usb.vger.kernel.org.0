Return-Path: <linux-usb+bounces-21411-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21052A54354
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 08:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ED743A711C
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 07:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457981A9B46;
	Thu,  6 Mar 2025 07:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="hgTxV6ZU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DBB1A7262;
	Thu,  6 Mar 2025 07:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741245059; cv=none; b=aoUHDK0LHb8Ss1jc5rzbtQHThMc8ZryDqrZkJMrjMnbYwMfm5Gz4PgJP0Sg8LrPWyhKOeMQf0HMnOmwdMLh67u++U3zraknt3LywyPayD9WZXSCBYjdByy5xlYa8f0OdmyPdcRGAb7U7XbYkfnVhk4AfvDQrJQosp+twJqp0Aqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741245059; c=relaxed/simple;
	bh=FCIDjGd0kfgKd2Ik/qO4p+1Q1B0i/+z+2jJ1/VBnTXI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g0RPAAROsuUUwLNKY5pkkKG7yxusVP2Kq6mlNrgPpdhC63iAfS4Obp9mVtVQGGbh50PtqKN5y87gIANi2elepkztHXU8DBzYXuMk0zS6s+faXZzPF5FxQr+QzXc1XLaYqLFHvGaO8fbTkzDYp43+DwE6qQgd0mut3nMXWxBXwdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=hgTxV6ZU; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1741245029;
	bh=iKI/RRKKfuSHY4iJ/KRcLXC88i9BMn/9D/5yhqxCV5U=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=hgTxV6ZUKl9Bp9XojEJ6gCljIsZqOyzoNJB3elKX3ODThFjiZyNMPLvPnPQJzeYPW
	 EufvdICfdFc5aQpkqY8TDBQLUlAhLuADKp9//PYjTysgkibbMWtzhWggc/YY8xUEH6
	 bRYnnrsl/P1sBodOU5bqU/wYzn+iG0D10G1rysFo=
X-QQ-mid: bizesmtpip4t1741245021tr4icsg
X-QQ-Originating-IP: 5JwfBAQksSRRjplLgv8G5NUdTo7USg0/ongwUsLuMYg=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Mar 2025 15:10:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1652482221192236899
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangyuli@uniontech.com,
	zhanjun@uniontech.com,
	Xu Rao <raoxu@uniontech.com>
Subject: [PATCH V4] usb: xhci: Add debugfs support for xHCI port bandwidth
Date: Thu,  6 Mar 2025 15:10:15 +0800
Message-Id: <20250306071015.30366-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: NlrfLQhmr2s5qn/Bc6L66MEpkU7jKUEV9LwBM5acE3Zc3iR40NuCGqdP
	FBaT7MF9mboSxScJUhUGOsRs/O386DzUJPpHb6XjqsbxLHWyJfiWbZ5H8IOroPXrfl2rDX/
	SE9uy2nCnz4tgYeyTnuYAGe6mOLM8erK72387j9lBfNOopc1wfDL0o1Vc47Ke+XWRCaDZkn
	ZAjGVKORDtov8XXKuuZ87/rkeZV22ED4rGdwxqNQBbzSdPIub2Hx4doxGLJeQlSEhLt9wNf
	NJJsVcJ/PZ8upM2GN4GxdJMHuLwrndb9++LFxmvu6ZqAzwFVFt6T28KN5NUmUEJsHkTATGb
	fki2zbTWeR1Yt3sWOL/1nRfOveRoZFjkUJKTRK345413JZClmZRQl6gbHtH0Z+AAxh6BfC/
	ndvI+QE8H+no9XRs0sH04dhd34KoB2ZlZYNH31R5Cnz7OTErxieCzVWfVXbVK0IGOI/9TyG
	Cr9DwuGkIdH3nKVriCd3SHCZPJueuqZDEdUaZZQMCNAWP5HMFOLJGAZ7cOLV/hhWEri7Ea0
	cmZeV7aIkL/UCIZKu+R99ytFCTjhypowLf4ccql6jLZSC+HewfuawO6IxPOVAEz9x+x++Te
	qWsFidF3n1JpLsIJxcA33x1L49ZnEdFuO5pjcJ0QpCyfHi2wmI9u3D/ZZH2C123oqqOJP7o
	n4CiPIC/eENWkp33wdyrrwQfvoVcEY/qb6z9brjgxluXcPEhatvJeCxAyb/48mURImB5PNh
	DATxPY7j6O2pZRXXKUKiqvWxuixUazQlicphbCcI2jTuOa8UwwPE3CJFEvL4woRDsha+IOv
	zMR8zDAsZ5LCMcUU3pCoLyljHCMBKWwWFJFbpZGUraqvMIpiEeY3Oj0HGwtgMHruh64oTHw
	1wLeEIyrUKZBDL1QcFfHzbLLd8BBoQEnUxENcnlQW5S8DDcOzx49/aEWvgiAdMs/BQrZjrQ
	92nA2Y+Isg3WR0M9fdXKK8aD6HI7GOCqHuROPmy/NmKameIp23AWZlvLv65aTp2YO88uq3k
	8kSmn5KyPiLtp8BsJAM/GkUNvmwC/xX8kUneF3Tg==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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
---
 drivers/usb/host/xhci-debugfs.c | 93 +++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-mem.c     |  8 +++
 drivers/usb/host/xhci-ring.c    | 14 +++++
 drivers/usb/host/xhci.c         | 26 +++++++++
 drivers/usb/host/xhci.h         |  9 ++++
 5 files changed, 150 insertions(+)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 1f5ef174abea..5751065d199c 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -631,6 +631,97 @@ static void xhci_debugfs_create_ports(struct xhci_hcd *xhci,
 	}
 }

+static int xhci_port_bw_show(struct xhci_hcd *xhci, u8 dev_speed,
+				struct seq_file *s)
+{
+	unsigned int			num_ports;
+	unsigned int			i;
+	int				ret;
+	struct xhci_container_ctx	*ctx;
+
+	num_ports = HCS_MAX_PORTS(xhci->hcs_params1);
+	ctx = xhci->get_bw_command->in_ctx;
+
+	/* get roothub port bandwidth */
+	ret = xhci_get_port_bandwidth(xhci, dev_speed);
+	if (ret)
+		return ret;
+
+	/* print all roothub ports available bandwidth */
+	for (i = 1; i < num_ports+1; i++)
+		seq_printf(s, "port[%d] available bw: %d%%.\n", i,
+				ctx->bytes[i]);
+
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
@@ -681,6 +772,8 @@ void xhci_debugfs_init(struct xhci_hcd *xhci)
 	xhci->debugfs_slots = debugfs_create_dir("devices", xhci->debugfs_root);

 	xhci_debugfs_create_ports(xhci, xhci->debugfs_root);
+
+	xhci_debugfs_create_bandwidth(xhci, xhci->debugfs_root);
 }

 void xhci_debugfs_exit(struct xhci_hcd *xhci)
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 92703efda1f7..66f08a96d6f9 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1875,6 +1875,10 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	}
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed interrupters");

+	if (xhci->get_bw_command)
+		xhci_free_command(xhci, xhci->get_bw_command);
+	xhci->get_bw_command = NULL;
+
 	if (xhci->cmd_ring)
 		xhci_ring_free(xhci, xhci->cmd_ring);
 	xhci->cmd_ring = NULL;
@@ -2490,6 +2494,10 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 */
 	xhci->cmd_ring_reserved_trbs++;

+	xhci->get_bw_command = xhci_alloc_command_with_ctx(xhci, true, flags);
+	if (!xhci->get_bw_command)
+		goto fail;
+
 	val = readl(&xhci->cap_regs->db_off);
 	val &= DBOFF_MASK;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 965bffce301e..af1cd4f8ace9 100644
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
@@ -4414,6 +4416,18 @@ int xhci_queue_configure_endpoint(struct xhci_hcd *xhci,
 			command_must_succeed);
 }

+/* Queue a get root hub port bandwidth command TRB */
+int xhci_queue_get_rh_port_bw(struct xhci_hcd *xhci,
+		struct xhci_command *cmd, dma_addr_t in_ctx_ptr,
+		u8 dev_speed, u32 slot_id, bool command_must_succeed)
+{
+	return queue_command(xhci, cmd, lower_32_bits(in_ctx_ptr),
+		upper_32_bits(in_ctx_ptr), 0,
+		TRB_TYPE(TRB_GET_BW) | DEV_SPEED_FOR_TRB(dev_speed) |
+		SLOT_ID_FOR_TRB(slot_id),
+		command_must_succeed);
+}
+
 /* Queue an evaluate context command TRB */
 int xhci_queue_evaluate_context(struct xhci_hcd *xhci, struct xhci_command *cmd,
 		dma_addr_t in_ctx_ptr, u32 slot_id, bool command_must_succeed)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 45653114ccd7..094da42c305f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3088,6 +3088,32 @@ void xhci_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 }
 EXPORT_SYMBOL_GPL(xhci_reset_bandwidth);

+/* Get the available bandwidth of the ports under the xhci roothub */
+int xhci_get_port_bandwidth(struct xhci_hcd *xhci, u8 dev_speed)
+{
+	int				ret;
+	unsigned long			flags;
+	struct xhci_container_ctx	*ctx;
+
+	ctx = xhci->get_bw_command->in_ctx;
+
+	/* get xhci hub port bandwidth */
+	/* refer to xhci rev1_2 protocol 4.6.15*/
+	spin_lock_irqsave(&xhci->lock, flags);
+	ret = xhci_queue_get_rh_port_bw(xhci, xhci->get_bw_command, ctx->dma,
+					dev_speed, 0, false);
+	if (ret < 0) {
+		spin_unlock_irqrestore(&xhci->lock, flags);
+		return ret;
+	}
+	xhci_ring_cmd_db(xhci);
+	spin_unlock_irqrestore(&xhci->lock, flags);
+
+	wait_for_completion(xhci->get_bw_command->completion);
+
+	return ret;
+}
+
 static void xhci_setup_input_ctx_for_config_ep(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *in_ctx,
 		struct xhci_container_ctx *out_ctx,
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8c164340a2c3..a7cefa8ca7cd 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -999,6 +999,9 @@ enum xhci_setup_dev {
 /* bits 16:23 are the virtual function ID */
 /* bits 24:31 are the slot ID */

+/* bits 19:16 are the dev speed */
+#define DEV_SPEED_FOR_TRB(p)    ((p) << 16)
+
 /* Stop Endpoint TRB - ep_index to endpoint ID for this TRB */
 #define SUSPEND_PORT_FOR_TRB(p)		(((p) & 1) << 23)
 #define TRB_TO_SUSPEND_PORT(p)		(((p) & (1 << 23)) >> 23)
@@ -1549,6 +1552,8 @@ struct xhci_hcd {
 	struct xhci_virt_device	*devs[MAX_HC_SLOTS];
 	/* For keeping track of bandwidth domains per roothub. */
 	struct xhci_root_port_bw_info	*rh_bw;
+	/* For get xhci roothub port bandwidth. */
+	struct xhci_command		*get_bw_command;

 	/* DMA pools */
 	struct dma_pool	*device_pool;
@@ -1907,6 +1912,10 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 int xhci_queue_configure_endpoint(struct xhci_hcd *xhci,
 		struct xhci_command *cmd, dma_addr_t in_ctx_ptr, u32 slot_id,
 		bool command_must_succeed);
+int xhci_queue_get_rh_port_bw(struct xhci_hcd *xhci,
+		struct xhci_command *cmd, dma_addr_t in_ctx_ptr,
+		u8 dev_speed, u32 slot_id, bool command_must_succeed);
+int xhci_get_port_bandwidth(struct xhci_hcd *xhci, u8 dev_speed);
 int xhci_queue_evaluate_context(struct xhci_hcd *xhci, struct xhci_command *cmd,
 		dma_addr_t in_ctx_ptr, u32 slot_id, bool command_must_succeed);
 int xhci_queue_reset_ep(struct xhci_hcd *xhci, struct xhci_command *cmd,
--
2.43.4


