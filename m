Return-Path: <linux-usb+bounces-3405-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC3A7FBA1E
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 13:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28BE9B217AE
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 12:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0C956453;
	Tue, 28 Nov 2023 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSc+PvBo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F371BB
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 04:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701174611; x=1732710611;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2LmZYij6pRTsrKRDVFtSAPABo7r/SHpk2r8qYsK0Oe8=;
  b=SSc+PvBoUlvXuYwqjkVV8CMqAUklcJqKAjCWLegJVu7XFiQPYIy78xbd
   i8xXoYOvww61aVrKT+R7+jiUNeKSCpy1oq62qK/BOrrwJ3MuZgO16SA6O
   29pj7PIyOWLoFij5PtZtJvZQrHCR+GVgEuyQ7e6EJVpGIMfvZv2PEeILf
   yNi76OGqlda6DK2aPzkVTpmJthwjsrEhJ4x2sBys1aUqT/0BcBX52fnTG
   5/vZpUODoFXhoi7AxNlTvMwXg0gcG7fhM+Aqk536rfsI9brDsyDcCWVXW
   /t0q4fSsEKu/DiyMlsoHWDGica/AWUwL9XjwvuS7J5O9CnnLhP8QVSs2R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377940695"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="377940695"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 04:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1100084507"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="1100084507"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2023 04:30:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id CAEE324C; Tue, 28 Nov 2023 14:30:08 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	chunfeng.yun@mediatek.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/3] xhci: rework how real & fake ports are found
Date: Tue, 28 Nov 2023 14:25:22 +0200
Message-ID: <20231128122524.286302-2-niklas.neronin@linux.intel.com>
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

xHC hardware needs to know which roothub port a USB device is attached to
when controlling the device, so the xHCI driver stores in each device the
roothub port which it's connected behind. This is done with two different
port index values, the 'real_port' which is an index to the xHC hardware
port register array, and the 'fake_port' which is the per hub port index
used by the hub driver.

Instead of finding real & fake port separately, find the root hub port
'xhci_port' structure which contains both real & fake port values:
 - 'real_port' is equivalent to ('hw_portnum' + 1)
 - 'fake_port' is equivalent to ('hcd_portnum' + 1)
i.e. real & fake port are 'hw_portnum' & 'hcd_portnum' in one-based
format.

The 'xhci_port' structure is a better way to refer to roothub ports than
the 'real_port' & 'fake_port'. As a result, these port indexes are slated
to be replaced with a direct pointer to the root hub port. This patch
setups the ground work for the future changes.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 62116586848b..4291df1b92af 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1050,16 +1050,16 @@ void xhci_copy_ep0_dequeue_into_input_ctx(struct xhci_hcd *xhci,
  * The xHCI roothub may have ports of differing speeds in any order in the port
  * status registers.
  *
- * The xHCI hardware wants to know the roothub port number that the USB device
+ * The xHCI hardware wants to know the roothub port that the USB device
  * is attached to (or the roothub port its ancestor hub is attached to).  All we
  * know is the index of that port under either the USB 2.0 or the USB 3.0
  * roothub, but that doesn't give us the real index into the HW port status
- * registers. Call xhci_find_raw_port_number() to get real index.
+ * registers.
  */
-static u32 xhci_find_real_port_number(struct xhci_hcd *xhci,
-		struct usb_device *udev)
+static struct xhci_port *xhci_find_rhub_port(struct xhci_hcd *xhci, struct usb_device *udev)
 {
 	struct usb_device *top_dev;
+	struct xhci_hub *rhub;
 	struct usb_hcd *hcd;
 
 	if (udev->speed >= USB_SPEED_SUPER)
@@ -1071,7 +1071,8 @@ static u32 xhci_find_real_port_number(struct xhci_hcd *xhci,
 			top_dev = top_dev->parent)
 		/* Found device below root hub */;
 
-	return	xhci_find_raw_port_number(hcd, top_dev->portnum);
+	rhub = xhci_get_rhub(hcd);
+	return rhub->ports[top_dev->portnum - 1];
 }
 
 /* Setup an xHCI virtual device for a Set Address command */
@@ -1080,9 +1081,8 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 	struct xhci_virt_device *dev;
 	struct xhci_ep_ctx	*ep0_ctx;
 	struct xhci_slot_ctx    *slot_ctx;
-	u32			port_num;
+	struct xhci_port	*rhub_port;
 	u32			max_packets;
-	struct usb_device *top_dev;
 
 	dev = xhci->devs[udev->slot_id];
 	/* Slot ID 0 is reserved */
@@ -1123,17 +1123,13 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 		return -EINVAL;
 	}
 	/* Find the root hub port this device is under */
-	port_num = xhci_find_real_port_number(xhci, udev);
-	if (!port_num)
+	rhub_port = xhci_find_rhub_port(xhci, udev);
+	if (!rhub_port)
 		return -EINVAL;
-	slot_ctx->dev_info2 |= cpu_to_le32(ROOT_HUB_PORT(port_num));
-	/* Set the port number in the virtual_device to the faked port number */
-	for (top_dev = udev; top_dev->parent && top_dev->parent->parent;
-			top_dev = top_dev->parent)
-		/* Found device below root hub */;
-	dev->fake_port = top_dev->portnum;
-	dev->real_port = port_num;
-	xhci_dbg(xhci, "Set root hub portnum to %d\n", port_num);
+	dev->real_port = rhub_port->hw_portnum + 1;
+	dev->fake_port = rhub_port->hcd_portnum + 1;
+	slot_ctx->dev_info2 |= cpu_to_le32(ROOT_HUB_PORT(dev->real_port));
+	xhci_dbg(xhci, "Set root hub portnum to %d\n", dev->real_port);
 	xhci_dbg(xhci, "Set fake root hub portnum to %d\n", dev->fake_port);
 
 	/* Find the right bandwidth table that this device will be a part of.
@@ -1143,12 +1139,12 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 	 * will never be created for the HS root hub.
 	 */
 	if (!udev->tt || !udev->tt->hub->parent) {
-		dev->bw_table = &xhci->rh_bw[port_num - 1].bw_table;
+		dev->bw_table = &xhci->rh_bw[dev->real_port - 1].bw_table;
 	} else {
 		struct xhci_root_port_bw_info *rh_bw;
 		struct xhci_tt_bw_info *tt_bw;
 
-		rh_bw = &xhci->rh_bw[port_num - 1];
+		rh_bw = &xhci->rh_bw[dev->real_port - 1];
 		/* Find the right TT. */
 		list_for_each_entry(tt_bw, &rh_bw->tts, tt_list) {
 			if (tt_bw->slot_id != udev->tt->hub->slot_id)
-- 
2.42.0


