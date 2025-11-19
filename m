Return-Path: <linux-usb+bounces-30717-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B879CC6F54B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67B254FDE9C
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A810D36A034;
	Wed, 19 Nov 2025 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWms6aN7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DE536A013
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562304; cv=none; b=h7AeqXoRUj6CyY1hsqLP7Rin1vmd0vIeMZ4f3txOKRc7NA0v+c744UZ0HD9I4Tg32w+hiTqmbN5pdI42h4nZbh7F6YmpBbwVQe54rI+n/XCHWordlo00zIQo6FqlqZugs5jW/BI1a/YLcaPQ7vEJRtBi1q7UO4hSOq5DI/HtSK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562304; c=relaxed/simple;
	bh=2IvBzA1pgLqXxQNKKFfO0uDlxjbBqqO4EdAze+h+Cug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GrWXldyNpWxt4Gxy/fg/dfznAdDhT326Ky3Zcow4aq9JFMMNPepdVIM0g8p91LL7ITOETq+PjUM92/vyHp0oonZeGT42hpBCGdThPQj3pBbqcy0gVU6cQphUNZRl+SLnDYu9ttwWEuADFGmvA0qjlLQsKxH+7L7UZw10rvoATyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWms6aN7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562302; x=1795098302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2IvBzA1pgLqXxQNKKFfO0uDlxjbBqqO4EdAze+h+Cug=;
  b=mWms6aN7wmrZJvQlmWYnYXNuqizd9QNfJv0QWFOnFgHRIEnE4N1tGUI+
   zchvVxO83cqZvc9i6LDTmJkr7VCnoHCUWkqPYikKpOaa/edH2B92RV9Xn
   qjXT9MooQdd7/ZuLZxdB2EJmwdqHN3wDWXjllgXD8QatpyNJsE/c5l/4c
   yQS9IrG1z1tg6zLlSuIOXbKrPTLYLONNZQJCrdzWGKiTP3R8hCqx/tw6l
   hMTEAJqO6Emh+26tInFFp+Frrh+hsffAJvqUILbnh6jwM//1LzhAAkVUn
   cZd2amTn82S2zvGvR8WjsmVSa9qEyGxMQavCG6AqwtvkmHKu7IJBu/ip7
   Q==;
X-CSE-ConnectionGUID: ABQ4hPUsSLOEUGEz9Q03YA==
X-CSE-MsgGUID: G72TjF9VRsW1Ax5EXy9qyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645563"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645563"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:59 -0800
X-CSE-ConnectionGUID: SaE7lSQnRNSufTrujdLyJw==
X-CSE-MsgGUID: y9tlbkofRj6kTnCD8aw1Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992109"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:57 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 15/23] usb: xhci: simplify handling of Structural Parameters 1 values
Date: Wed, 19 Nov 2025 16:24:09 +0200
Message-ID: <20251119142417.2820519-16-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The 32-bit read-only HCSPARAMS1 register contains the following fields:
 Bits  7:0   - Number of Device Slots (MaxSlots)
 Bits 18:8   - Number of Interrupters (MaxIntrs)
 Bits 23:19  - Reserved
 Bits 31:24  - Number of Ports (MaxPorts)

Since the register value is constant for the lifetime of the controller,
it is cached in 'xhci->hcs_params1'. However, platform drivers may
override the number of interrupters through a separate variable,
'xhci->max_interrupters', leaving only the maximum slots and ports values
still derived from the cached register.

To simplify the code and improve readability, replace 'xhci->hcs_params1'
with two dedicated 'u8' fields: 'xhci->max_slots' and 'xhci->max_ports'.
These values are initialized once and used directly instead of calling
'HCS_MAX_SLOTS()' and 'HCS_MAX_PORTS()' macros.

This change reduces code clutter without increasing memory usage.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c | 15 ++++-----------
 drivers/usb/host/xhci-hub.c     |  2 +-
 drivers/usb/host/xhci-mem.c     | 31 +++++++++++++------------------
 drivers/usb/host/xhci-pci.c     |  2 +-
 drivers/usb/host/xhci-ring.c    |  6 ++----
 drivers/usb/host/xhci.c         | 21 ++++++++++-----------
 drivers/usb/host/xhci.h         |  3 ++-
 7 files changed, 33 insertions(+), 47 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index d32ac8f84691..ae50b667a548 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -613,20 +613,16 @@ void xhci_debugfs_remove_slot(struct xhci_hcd *xhci, int slot_id)
 static void xhci_debugfs_create_ports(struct xhci_hcd *xhci,
 				      struct dentry *parent)
 {
-	unsigned int		num_ports;
 	char			port_name[8];
 	struct xhci_port	*port;
 	struct dentry		*dir;
 
-	num_ports = HCS_MAX_PORTS(xhci->hcs_params1);
-
 	parent = debugfs_create_dir("ports", parent);
 
-	while (num_ports--) {
-		scnprintf(port_name, sizeof(port_name), "port%02d",
-			  num_ports + 1);
+	for (int i = 0; i < xhci->max_ports; i++) {
+		scnprintf(port_name, sizeof(port_name), "port%02d", i + 1);
 		dir = debugfs_create_dir(port_name, parent);
-		port = &xhci->hw_ports[num_ports];
+		port = &xhci->hw_ports[i];
 		debugfs_create_file("portsc", 0644, dir, port, &port_fops);
 	}
 }
@@ -634,7 +630,6 @@ static void xhci_debugfs_create_ports(struct xhci_hcd *xhci,
 static int xhci_port_bw_show(struct xhci_hcd *xhci, u8 dev_speed,
 				struct seq_file *s)
 {
-	unsigned int			num_ports;
 	unsigned int			i;
 	int				ret;
 	struct xhci_container_ctx	*ctx;
@@ -645,8 +640,6 @@ static int xhci_port_bw_show(struct xhci_hcd *xhci, u8 dev_speed,
 	if (ret < 0)
 		return ret;
 
-	num_ports = HCS_MAX_PORTS(xhci->hcs_params1);
-
 	ctx = xhci_alloc_port_bw_ctx(xhci, 0);
 	if (!ctx) {
 		pm_runtime_put_sync(dev);
@@ -661,7 +654,7 @@ static int xhci_port_bw_show(struct xhci_hcd *xhci, u8 dev_speed,
 	/* print all roothub ports available bandwidth
 	 * refer to xhci rev1_2 protocol 6.2.6 , byte 0 is reserved
 	 */
-	for (i = 1; i < num_ports+1; i++)
+	for (i = 1; i <= xhci->max_ports; i++)
 		seq_printf(s, "port[%d] available bw: %d%%.\n", i,
 				ctx->bytes[i]);
 err_out:
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index c4c85312b04c..cf358e5c6642 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -700,7 +700,7 @@ static int xhci_enter_test_mode(struct xhci_hcd *xhci,
 	/* Disable all Device Slots */
 	xhci_dbg(xhci, "Disable all slots\n");
 	spin_unlock_irqrestore(&xhci->lock, *flags);
-	for (i = 1; i <= HCS_MAX_SLOTS(xhci->hcs_params1); i++) {
+	for (i = 1; i <= xhci->max_slots; i++) {
 		if (!xhci->devs[i])
 			continue;
 
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 9a6a8d9f3770..2bbbf64a32c8 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -951,7 +951,7 @@ static void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_i
 		/* is this a hub device that added a tt_info to the tts list */
 		if (tt_info->slot_id == slot_id) {
 			/* are any devices using this tt_info? */
-			for (i = 1; i < HCS_MAX_SLOTS(xhci->hcs_params1); i++) {
+			for (i = 1; i < xhci->max_slots; i++) {
 				vdev = xhci->devs[i];
 				if (vdev && (vdev->tt_info == tt_info))
 					xhci_free_virt_devices_depth_first(
@@ -1899,7 +1899,7 @@ EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
 void xhci_mem_cleanup(struct xhci_hcd *xhci)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
-	int i, j, num_ports;
+	int i, j;
 
 	cancel_delayed_work_sync(&xhci->cmd_timer);
 
@@ -1918,8 +1918,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed command ring");
 	xhci_cleanup_command_queue(xhci);
 
-	num_ports = HCS_MAX_PORTS(xhci->hcs_params1);
-	for (i = 0; i < num_ports && xhci->rh_bw; i++) {
+	for (i = 0; i < xhci->max_ports && xhci->rh_bw; i++) {
 		struct xhci_interval_bw_table *bwt = &xhci->rh_bw[i].bw_table;
 		for (j = 0; j < XHCI_MAX_INTERVAL; j++) {
 			struct list_head *ep = &bwt->interval_bw[j].endpoints;
@@ -1928,7 +1927,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 		}
 	}
 
-	for (i = HCS_MAX_SLOTS(xhci->hcs_params1); i > 0; i--)
+	for (i = xhci->max_slots; i > 0; i--)
 		xhci_free_virt_devices_depth_first(xhci, i);
 
 	dma_pool_destroy(xhci->segment_pool);
@@ -1964,7 +1963,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	if (!xhci->rh_bw)
 		goto no_bw;
 
-	for (i = 0; i < num_ports; i++) {
+	for (i = 0; i < xhci->max_ports; i++) {
 		struct xhci_tt_bw_info *tt, *n;
 		list_for_each_entry_safe(tt, n, &xhci->rh_bw[i].tts, tt_list) {
 			list_del(&tt->tt_list);
@@ -2165,7 +2164,7 @@ static void xhci_create_rhub_port_array(struct xhci_hcd *xhci,
 	if (!rhub->ports)
 		return;
 
-	for (i = 0; i < HCS_MAX_PORTS(xhci->hcs_params1); i++) {
+	for (i = 0; i < xhci->max_ports; i++) {
 		if (xhci->hw_ports[i].rhub != rhub ||
 		    xhci->hw_ports[i].hcd_portnum == DUPLICATE_ENTRY)
 			continue;
@@ -2188,19 +2187,17 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 {
 	void __iomem *base;
 	u32 offset;
-	unsigned int num_ports;
 	int i, j;
 	int cap_count = 0;
 	u32 cap_start;
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 
-	num_ports = HCS_MAX_PORTS(xhci->hcs_params1);
-	xhci->hw_ports = kcalloc_node(num_ports, sizeof(*xhci->hw_ports),
-				flags, dev_to_node(dev));
+	xhci->hw_ports = kcalloc_node(xhci->max_ports, sizeof(*xhci->hw_ports),
+				      flags, dev_to_node(dev));
 	if (!xhci->hw_ports)
 		return -ENOMEM;
 
-	for (i = 0; i < num_ports; i++) {
+	for (i = 0; i < xhci->max_ports; i++) {
 		xhci->hw_ports[i].port_reg = &xhci->op_regs->port_regs[i];
 		xhci->hw_ports[i].hw_portnum = i;
 
@@ -2208,11 +2205,10 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		init_completion(&xhci->hw_ports[i].u3exit_done);
 	}
 
-	xhci->rh_bw = kcalloc_node(num_ports, sizeof(*xhci->rh_bw), flags,
-				   dev_to_node(dev));
+	xhci->rh_bw = kcalloc_node(xhci->max_ports, sizeof(*xhci->rh_bw), flags, dev_to_node(dev));
 	if (!xhci->rh_bw)
 		return -ENOMEM;
-	for (i = 0; i < num_ports; i++) {
+	for (i = 0; i < xhci->max_ports; i++) {
 		struct xhci_interval_bw_table *bw_table;
 
 		INIT_LIST_HEAD(&xhci->rh_bw[i].tts);
@@ -2244,9 +2240,8 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 	offset = cap_start;
 
 	while (offset) {
-		xhci_add_in_port(xhci, num_ports, base + offset, cap_count);
-		if (xhci->usb2_rhub.num_ports + xhci->usb3_rhub.num_ports ==
-		    num_ports)
+		xhci_add_in_port(xhci, xhci->max_ports, base + offset, cap_count);
+		if (xhci->usb2_rhub.num_ports + xhci->usb3_rhub.num_ports == xhci->max_ports)
 			break;
 		offset = xhci_find_next_ext_cap(base, offset,
 						XHCI_EXT_CAPS_PROTOCOL);
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 2ba0261a29c1..585b2f3117b0 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -896,7 +896,7 @@ static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
 	if (!(xhci->quirks & XHCI_RESET_TO_DEFAULT))
 		return 0;
 
-	for (i = 0; i < HCS_MAX_PORTS(xhci->hcs_params1); i++) {
+	for (i = 0; i < xhci->max_ports; i++) {
 		port = &xhci->hw_ports[i];
 		portsc = xhci_portsc_readl(port);
 
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index f1582360d96a..0ac7f9870d3d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1394,7 +1394,7 @@ void xhci_hc_died(struct xhci_hcd *xhci)
 	xhci_cleanup_command_queue(xhci);
 
 	/* return any pending urbs, remove may be waiting for them */
-	for (i = 0; i <= HCS_MAX_SLOTS(xhci->hcs_params1); i++) {
+	for (i = 0; i <= xhci->max_slots; i++) {
 		if (!xhci->devs[i])
 			continue;
 		for (j = 0; j < 31; j++)
@@ -1994,7 +1994,6 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 	struct usb_hcd *hcd;
 	u32 port_id;
 	u32 portsc, cmd_reg;
-	int max_ports;
 	unsigned int hcd_portnum;
 	struct xhci_bus_state *bus_state;
 	bool bogus_port_status = false;
@@ -2006,9 +2005,8 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 			  "WARN: xHC returned failed port status event\n");
 
 	port_id = GET_PORT_ID(le32_to_cpu(event->generic.field[0]));
-	max_ports = HCS_MAX_PORTS(xhci->hcs_params1);
 
-	if ((port_id <= 0) || (port_id > max_ports)) {
+	if ((port_id <= 0) || (port_id > xhci->max_ports)) {
 		xhci_warn(xhci, "Port change event with invalid port ID %d\n",
 			  port_id);
 		return;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index dbe64ea47936..ad5ef294d4f3 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -291,8 +291,7 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
 	if (upper_32_bits(val))
 		xhci_write_64(xhci, 0, &xhci->op_regs->cmd_ring);
 
-	intrs = min_t(u32, HCS_MAX_INTRS(xhci->hcs_params1),
-		      ARRAY_SIZE(xhci->run_regs->ir_set));
+	intrs = min_t(u32, xhci->max_interrupters, ARRAY_SIZE(xhci->run_regs->ir_set));
 
 	for (i = 0; i < intrs; i++) {
 		struct xhci_intr_reg __iomem *ir;
@@ -484,15 +483,13 @@ static void xhci_hcd_page_size(struct xhci_hcd *xhci)
 static void xhci_enable_max_dev_slots(struct xhci_hcd *xhci)
 {
 	u32 config_reg;
-	u32 max_slots;
 
-	max_slots = HCS_MAX_SLOTS(xhci->hcs_params1);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "xHC can handle at most %d device slots",
-		       max_slots);
+		       xhci->max_slots);
 
 	config_reg = readl(&xhci->op_regs->config_reg);
 	config_reg &= ~HCS_SLOTS_MASK;
-	config_reg |= max_slots;
+	config_reg |= xhci->max_slots;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Setting Max device slots reg = 0x%x",
 		       config_reg);
@@ -4235,7 +4232,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 		xhci_err(xhci, "Error while assigning device slot ID: %s\n",
 			 xhci_trb_comp_code_string(command->status));
 		xhci_err(xhci, "Max number of devices this xHCI host supports is %u.\n",
-			 HCS_MAX_SLOTS(xhci->hcs_params1));
+			 xhci->max_slots);
 		xhci_free_command(xhci, command);
 		return 0;
 	}
@@ -5416,6 +5413,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	 */
 	struct device		*dev = hcd->self.sysdev;
 	int			retval;
+	u32			hcs_params1;
 
 	/* Accept arbitrarily long scatter-gather lists */
 	hcd->self.sg_tablesize = ~0;
@@ -5441,7 +5439,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	xhci->run_regs = hcd->regs +
 		(readl(&xhci->cap_regs->run_regs_off) & RTSOFF_MASK);
 	/* Cache read-only capability registers */
-	xhci->hcs_params1 = readl(&xhci->cap_regs->hcs_params1);
+	hcs_params1 = readl(&xhci->cap_regs->hcs_params1);
 	xhci->hcs_params2 = readl(&xhci->cap_regs->hcs_params2);
 	xhci->hcs_params3 = readl(&xhci->cap_regs->hcs_params3);
 	xhci->hci_version = HC_VERSION(readl(&xhci->cap_regs->hc_capbase));
@@ -5449,10 +5447,11 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	if (xhci->hci_version > 0x100)
 		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
 
+	xhci->max_slots = HCS_MAX_SLOTS(hcs_params1);
+	xhci->max_ports = HCS_MAX_PORTS(hcs_params1);
 	/* xhci-plat or xhci-pci might have set max_interrupters already */
-	if ((!xhci->max_interrupters) ||
-	    xhci->max_interrupters > HCS_MAX_INTRS(xhci->hcs_params1))
-		xhci->max_interrupters = HCS_MAX_INTRS(xhci->hcs_params1);
+	if ((!xhci->max_interrupters) || xhci->max_interrupters > HCS_MAX_INTRS(hcs_params1))
+		xhci->max_interrupters = HCS_MAX_INTRS(hcs_params1);
 
 	xhci->quirks |= quirks;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 3d644d16d9fb..fface54dbc7a 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1500,7 +1500,6 @@ struct xhci_hcd {
 	struct xhci_doorbell_array __iomem *dba;
 
 	/* Cached register copies of read-only HC data */
-	__u32		hcs_params1;
 	__u32		hcs_params2;
 	__u32		hcs_params3;
 	__u32		hcc_params;
@@ -1511,6 +1510,8 @@ struct xhci_hcd {
 	/* packed release number */
 	u16		hci_version;
 	u16		max_interrupters;
+	u8		max_slots;
+	u8		max_ports;
 	/* imod_interval in ns (I * 250ns) */
 	u32		imod_interval;
 	u32		page_size;
-- 
2.43.0


