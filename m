Return-Path: <linux-usb+bounces-3407-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CFD7FBA27
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 13:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B35A5282EEA
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 12:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8516956471;
	Tue, 28 Nov 2023 12:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q066XXqe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E2FD5B
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 04:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701174627; x=1732710627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jjLN8uOlv1QGVGwRdlrqiXFppjZ48oadFd/EU2KFPCM=;
  b=Q066XXqeHKmicIEM4ieMbDZQwS6CRuM6KIfYh7TPgicf92EVPvuRx+aT
   2admESpyusu29eaitQtVoZAHStz069cBbwzzDn1nr/f7YlWElW1Wo3Cx6
   WYuJWXuRdukO0gQO/FknK9dpYaMGn0JEz5TKSRBLGX8aFHTSHIXFw2FlJ
   g/FD9u3zodyH4YCoWVgbrSM7eBVeT3HKuBJDtpeiCBAGVVXA4C4nWKh9G
   FmRX8y/r9dmDmv0yrBzyIm2kXeqMFay+V6XBwIO6pPXj1zq8ECt6Wwn7y
   ioG6X77psxKKr8t/KlkbfBnEUEabe7b46reGpEu3xMw89N5LfBSbgcK6w
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377940715"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="377940715"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 04:30:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1015898390"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="1015898390"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 28 Nov 2023 04:30:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 49F5624C; Tue, 28 Nov 2023 14:30:20 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	chunfeng.yun@mediatek.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/3] xhci: replace real & fake port with pointer to root hub port
Date: Tue, 28 Nov 2023 14:25:23 +0200
Message-ID: <20231128122524.286302-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128122524.286302-1-niklas.neronin@linux.intel.com>
References: <20231128122524.286302-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variables real & fake port lacked explicitness in their purpose, leading to
confusion. Thus, they are replaced with a pointer to the root hub port
struct xhci_port: '*rhub_port'.

'rhub_port' contains both the 'real' and 'fake' ports in a zero-based
format, which happens to be more widely used inside the xHCI driver.
To elaborate:
 - 'real_port' corresponds to ('rhub_port->hw_portnum' + 1)
 - 'fake_port' corresponds to ('rhub_port->hcd_portnum' + 1)

One reason for real port being one-based, is to signal other functions in
case struct 'xhci_virt_device' initialization failed, in this case the
value will remain 0. This is no longer needed, instead we check whether
or not 'rhub_port' is 'NULL'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c     |  4 +++-
 drivers/usb/host/xhci-mem.c     | 35 ++++++++++++++-------------------
 drivers/usb/host/xhci-mtk-sch.c | 14 +++++--------
 drivers/usb/host/xhci-trace.h   | 12 +++++------
 drivers/usb/host/xhci.c         | 12 +++++------
 drivers/usb/host/xhci.h         |  3 +--
 6 files changed, 35 insertions(+), 45 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 0980ade2a234..37128a777a58 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -464,13 +464,15 @@ int xhci_find_slot_id_by_port(struct usb_hcd *hcd, struct xhci_hcd *xhci,
 	int i;
 	enum usb_device_speed speed;
 
+	/* 'hcd_portnum' is zero-based, thus convert one-based 'port' to zero-based */
+	port -= 1;
 	slot_id = 0;
 	for (i = 0; i < MAX_HC_SLOTS; i++) {
 		if (!xhci->devs[i] || !xhci->devs[i]->udev)
 			continue;
 		speed = xhci->devs[i]->udev->speed;
 		if (((speed >= USB_SPEED_SUPER) == (hcd->speed >= HCD_USB3))
-				&& xhci->devs[i]->fake_port == port) {
+				&& xhci->devs[i]->rhub_port->hcd_portnum == port) {
 			slot_id = i;
 			break;
 		}
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 4291df1b92af..f312037dd4d9 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -788,15 +788,14 @@ static void xhci_free_tt_info(struct xhci_hcd *xhci,
 	bool slot_found = false;
 
 	/* If the device never made it past the Set Address stage,
-	 * it may not have the real_port set correctly.
+	 * it may not have the root hub port pointer set correctly.
 	 */
-	if (virt_dev->real_port == 0 ||
-			virt_dev->real_port > HCS_MAX_PORTS(xhci->hcs_params1)) {
-		xhci_dbg(xhci, "Bad real port.\n");
+	if (!virt_dev->rhub_port) {
+		xhci_dbg(xhci, "Bad rhub port.\n");
 		return;
 	}
 
-	tt_list_head = &(xhci->rh_bw[virt_dev->real_port - 1].tts);
+	tt_list_head = &(xhci->rh_bw[virt_dev->rhub_port->hw_portnum].tts);
 	list_for_each_entry_safe(tt_info, next, tt_list_head, tt_list) {
 		/* Multi-TT hubs will have more than one entry */
 		if (tt_info->slot_id == slot_id) {
@@ -833,7 +832,7 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 			goto free_tts;
 		INIT_LIST_HEAD(&tt_info->tt_list);
 		list_add(&tt_info->tt_list,
-				&xhci->rh_bw[virt_dev->real_port - 1].tts);
+				&xhci->rh_bw[virt_dev->rhub_port->hw_portnum].tts);
 		tt_info->slot_id = virt_dev->udev->slot_id;
 		if (tt->multi)
 			tt_info->ttport = i+1;
@@ -928,13 +927,12 @@ static void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_i
 	if (!vdev)
 		return;
 
-	if (vdev->real_port == 0 ||
-			vdev->real_port > HCS_MAX_PORTS(xhci->hcs_params1)) {
-		xhci_dbg(xhci, "Bad vdev->real_port.\n");
+	if (!vdev->rhub_port) {
+		xhci_dbg(xhci, "Bad rhub port.\n");
 		goto out;
 	}
 
-	tt_list_head = &(xhci->rh_bw[vdev->real_port - 1].tts);
+	tt_list_head = &(xhci->rh_bw[vdev->rhub_port->hw_portnum].tts);
 	list_for_each_entry_safe(tt_info, next, tt_list_head, tt_list) {
 		/* is this a hub device that added a tt_info to the tts list */
 		if (tt_info->slot_id == slot_id) {
@@ -1081,7 +1079,6 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 	struct xhci_virt_device *dev;
 	struct xhci_ep_ctx	*ep0_ctx;
 	struct xhci_slot_ctx    *slot_ctx;
-	struct xhci_port	*rhub_port;
 	u32			max_packets;
 
 	dev = xhci->devs[udev->slot_id];
@@ -1123,14 +1120,12 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 		return -EINVAL;
 	}
 	/* Find the root hub port this device is under */
-	rhub_port = xhci_find_rhub_port(xhci, udev);
-	if (!rhub_port)
+	dev->rhub_port = xhci_find_rhub_port(xhci, udev);
+	if (!dev->rhub_port)
 		return -EINVAL;
-	dev->real_port = rhub_port->hw_portnum + 1;
-	dev->fake_port = rhub_port->hcd_portnum + 1;
-	slot_ctx->dev_info2 |= cpu_to_le32(ROOT_HUB_PORT(dev->real_port));
-	xhci_dbg(xhci, "Set root hub portnum to %d\n", dev->real_port);
-	xhci_dbg(xhci, "Set fake root hub portnum to %d\n", dev->fake_port);
+	slot_ctx->dev_info2 |= cpu_to_le32(ROOT_HUB_PORT(dev->rhub_port->hw_portnum + 1));
+	xhci_dbg(xhci, "Slot ID %d: HW portnum %d, hcd portnum %d\n",
+		 udev->slot_id, dev->rhub_port->hw_portnum, dev->rhub_port->hcd_portnum);
 
 	/* Find the right bandwidth table that this device will be a part of.
 	 * If this is a full speed device attached directly to a root port (or a
@@ -1139,12 +1134,12 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 	 * will never be created for the HS root hub.
 	 */
 	if (!udev->tt || !udev->tt->hub->parent) {
-		dev->bw_table = &xhci->rh_bw[dev->real_port - 1].bw_table;
+		dev->bw_table = &xhci->rh_bw[dev->rhub_port->hw_portnum].bw_table;
 	} else {
 		struct xhci_root_port_bw_info *rh_bw;
 		struct xhci_tt_bw_info *tt_bw;
 
-		rh_bw = &xhci->rh_bw[dev->real_port - 1];
+		rh_bw = &xhci->rh_bw[dev->rhub_port->hw_portnum];
 		/* Find the right TT. */
 		list_for_each_entry(tt_bw, &rh_bw->tts, tt_list) {
 			if (tt_bw->slot_id != udev->tt->hub->slot_id)
diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 61f3f8bbdcea..27eb384a3963 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -122,10 +122,6 @@ static u32 get_bw_boundary(enum usb_device_speed speed)
 * each HS root port is treated as a single bandwidth domain,
 * but each SS root port is treated as two bandwidth domains, one for IN eps,
 * one for OUT eps.
-* @real_port value is defined as follow according to xHCI spec:
-* 1 for SSport0, ..., N+1 for SSportN, N+2 for HSport0, N+3 for HSport1, etc
-* so the bandwidth domain array is organized as follow for simplification:
-* SSport0-OUT, SSport0-IN, ..., SSportX-OUT, SSportX-IN, HSport0, ..., HSportY
 */
 static struct mu3h_sch_bw_info *
 get_bw_info(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
@@ -136,19 +132,19 @@ get_bw_info(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
 	int bw_index;
 
 	virt_dev = xhci->devs[udev->slot_id];
-	if (!virt_dev->real_port) {
-		WARN_ONCE(1, "%s invalid real_port\n", dev_name(&udev->dev));
+	if (!virt_dev->rhub_port) {
+		WARN_ONCE(1, "%s invalid rhub port\n", dev_name(&udev->dev));
 		return NULL;
 	}
 
 	if (udev->speed >= USB_SPEED_SUPER) {
 		if (usb_endpoint_dir_out(&ep->desc))
-			bw_index = (virt_dev->real_port - 1) * 2;
+			bw_index = (virt_dev->rhub_port->hw_portnum) * 2;
 		else
-			bw_index = (virt_dev->real_port - 1) * 2 + 1;
+			bw_index = (virt_dev->rhub_port->hw_portnum) * 2 + 1;
 	} else {
 		/* add one more for each SS port */
-		bw_index = virt_dev->real_port + xhci->usb3_rhub.num_ports - 1;
+		bw_index = virt_dev->rhub_port->hw_portnum + xhci->usb3_rhub.num_ports;
 	}
 
 	return &mtk->sch_array[bw_index];
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index ac47b1c0544a..1740000d54c2 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -172,8 +172,8 @@ DECLARE_EVENT_CLASS(xhci_log_free_virt_dev,
 		__field(void *, vdev)
 		__field(unsigned long long, out_ctx)
 		__field(unsigned long long, in_ctx)
-		__field(u8, fake_port)
-		__field(u8, real_port)
+		__field(int, hcd_portnum)
+		__field(int, hw_portnum)
 		__field(u16, current_mel)
 
 	),
@@ -181,13 +181,13 @@ DECLARE_EVENT_CLASS(xhci_log_free_virt_dev,
 		__entry->vdev = vdev;
 		__entry->in_ctx = (unsigned long long) vdev->in_ctx->dma;
 		__entry->out_ctx = (unsigned long long) vdev->out_ctx->dma;
-		__entry->fake_port = (u8) vdev->fake_port;
-		__entry->real_port = (u8) vdev->real_port;
+		__entry->hcd_portnum = (int) vdev->rhub_port->hcd_portnum;
+		__entry->hw_portnum = (int) vdev->rhub_port->hw_portnum;
 		__entry->current_mel = (u16) vdev->current_mel;
 		),
-	TP_printk("vdev %p ctx %llx | %llx fake_port %d real_port %d current_mel %d",
+	TP_printk("vdev %p ctx %llx | %llx hcd_portnum %d hw_portnum %d current_mel %d",
 		__entry->vdev, __entry->in_ctx, __entry->out_ctx,
-		__entry->fake_port, __entry->real_port, __entry->current_mel
+		__entry->hcd_portnum, __entry->hw_portnum, __entry->current_mel
 	)
 );
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 884b0898d9c9..c42ec454594e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2254,7 +2254,7 @@ static int xhci_check_tt_bw_table(struct xhci_hcd *xhci,
 	struct xhci_tt_bw_info *tt_info;
 
 	/* Find the bandwidth table for the root port this TT is attached to. */
-	bw_table = &xhci->rh_bw[virt_dev->real_port - 1].bw_table;
+	bw_table = &xhci->rh_bw[virt_dev->rhub_port->hw_portnum].bw_table;
 	tt_info = virt_dev->tt_info;
 	/* If this TT already had active endpoints, the bandwidth for this TT
 	 * has already been added.  Removing all periodic endpoints (and thus
@@ -2372,7 +2372,7 @@ static int xhci_check_bw_table(struct xhci_hcd *xhci,
 	if (virt_dev->tt_info) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"Recalculating BW for rootport %u",
-				virt_dev->real_port);
+				virt_dev->rhub_port->hw_portnum + 1);
 		if (xhci_check_tt_bw_table(xhci, virt_dev, old_active_eps)) {
 			xhci_warn(xhci, "Not enough bandwidth on HS bus for "
 					"newly activated TT.\n");
@@ -2385,7 +2385,7 @@ static int xhci_check_bw_table(struct xhci_hcd *xhci,
 	} else {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"Recalculating BW for rootport %u",
-				virt_dev->real_port);
+				virt_dev->rhub_port->hw_portnum + 1);
 	}
 
 	/* Add in how much bandwidth will be used for interval zero, or the
@@ -2482,14 +2482,12 @@ static int xhci_check_bw_table(struct xhci_hcd *xhci,
 		bw_used += overhead + packet_size;
 
 	if (!virt_dev->tt_info && virt_dev->udev->speed == USB_SPEED_HIGH) {
-		unsigned int port_index = virt_dev->real_port - 1;
-
 		/* OK, we're manipulating a HS device attached to a
 		 * root port bandwidth domain.  Include the number of active TTs
 		 * in the bandwidth used.
 		 */
 		bw_used += TT_HS_OVERHEAD *
-			xhci->rh_bw[port_index].num_active_tts;
+			xhci->rh_bw[virt_dev->rhub_port->hw_portnum].num_active_tts;
 	}
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
@@ -2676,7 +2674,7 @@ void xhci_update_tt_active_eps(struct xhci_hcd *xhci,
 	if (!virt_dev->tt_info)
 		return;
 
-	rh_bw_info = &xhci->rh_bw[virt_dev->real_port - 1];
+	rh_bw_info = &xhci->rh_bw[virt_dev->rhub_port->hw_portnum];
 	if (old_active_eps == 0 &&
 				virt_dev->tt_info->active_eps != 0) {
 		rh_bw_info->num_active_tts += 1;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 3ea5c092bba7..d6ecb7c541be 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -993,8 +993,7 @@ struct xhci_virt_device {
 	/* Used for addressing devices and configuration changes */
 	struct xhci_container_ctx       *in_ctx;
 	struct xhci_virt_ep		eps[EP_CTX_PER_DEV];
-	u8				fake_port;
-	u8				real_port;
+	struct xhci_port		*rhub_port;
 	struct xhci_interval_bw_table	*bw_table;
 	struct xhci_tt_bw_info		*tt_info;
 	/*
-- 
2.42.0


