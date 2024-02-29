Return-Path: <linux-usb+bounces-7335-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5611D86CB0F
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 15:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1EDAB225DC
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 14:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E673132C3F;
	Thu, 29 Feb 2024 14:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5qfnrlv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3689A12F38D
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 14:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709215989; cv=none; b=XgSK20+LGckZD7Jt+Om9Oz3TOdjLDzyyCW5A9ViYdXbI/Eu77sJEuNqGpNER8Xh+2nkDocBJUg31yUpRWY8SMjbpdzEPWr+GJr0o2YpJkFe23LBSAxfG8IMbvz5oZ7CuB9h2a80vDPtBgMv5enp9wr0w/5TzHLuaY3Q5vuM4V0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709215989; c=relaxed/simple;
	bh=rN22wtC2AcLBosJ4fRQiGBqLV8WQo4mkfmRparUml+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AJcJwQrJlOsGiMfMATMCHpEadrgPPpNeTUKIC8sPe4eBHPbCYlMJ/wOZJFd0RB4x0DXwAT5scX6DNH8wq/U4rPBsUDQGq+sq1xDOlztx1JJclQcrs8OTXH+5ox3sptr0HIiedwssY1CxZIsBTJWhF4DC37BZ/ldgN7dTqpC4P6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5qfnrlv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709215988; x=1740751988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rN22wtC2AcLBosJ4fRQiGBqLV8WQo4mkfmRparUml+Q=;
  b=F5qfnrlvB45Lcb00EX8BiUm7L9Su9gIruhGu/Qo/FHSVaZbo+g8FMDYt
   bflM5Vbp4MEx1mOpz1dfdlmvlJBHbFTMh57UJQnnlQoX7C7bMIhtSf1ZC
   W0U6V/1/eMWCUBN9RMOYUfEqExfkICTPg+3l8d6+PruYur/Ys89tdJ9n3
   SQMaLyUkL1zI+WN/9tavyCmGJ/+ELusNHEplY/zYiYfBPAAp7vG7ECGd2
   a5H2typIBQAl6wZNLQJo4W+3jaxHFxvdt+XT1/BifDTGM0PVdjGZl1IQr
   OkZQEbSkVqIcEyYKJbqRkU4ofj4gnGARmRxv9Z/YD+7rQQUT87ycBb00i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3609367"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3609367"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 06:13:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937035983"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="937035983"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2024 06:13:05 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/9] xhci: rework how real & fake ports are found
Date: Thu, 29 Feb 2024 16:14:30 +0200
Message-Id: <20240229141438.619372-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
References: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@intel.com>

xHC hardware needs to know which roothub port a USB device is attached to
when controlling the device, so the xHCI driver stores in each device the
roothub port which it's connected behind. This is done with two different
port index values, the 'real_port' which is an index to the xHC hardware
port register array, and the 'fake_port' which is the per hub port index
used by the hub driver.

Instead of finding real & fake port separately, find the root hub port
'xhci_port' structure which contains both real & fake port values:
    - 'real_port' is ('hw_portnum' + 1)
    - 'fake_port' is ('hcd_portnum' + 1)
i.e. real & fake port are 'hw_portnum' & 'hcd_portnum' in one-based
format.

The 'xhci_port' structure is a better way to refer to roothub ports than
the 'real_port' & 'fake_port'. As a result, these port indexes are slated
to be replaced with a direct pointer to the root hub port. This patch
setups the ground work for the future changes.

Signed-off-by: Niklas Neronin <niklas.neronin@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 450adaca68ee..92160b96d4c0 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1051,16 +1051,16 @@ void xhci_copy_ep0_dequeue_into_input_ctx(struct xhci_hcd *xhci,
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
@@ -1072,7 +1072,8 @@ static u32 xhci_find_real_port_number(struct xhci_hcd *xhci,
 			top_dev = top_dev->parent)
 		/* Found device below root hub */;
 
-	return	xhci_find_raw_port_number(hcd, top_dev->portnum);
+	rhub = xhci_get_rhub(hcd);
+	return rhub->ports[top_dev->portnum - 1];
 }
 
 /* Setup an xHCI virtual device for a Set Address command */
@@ -1081,9 +1082,8 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 	struct xhci_virt_device *dev;
 	struct xhci_ep_ctx	*ep0_ctx;
 	struct xhci_slot_ctx    *slot_ctx;
-	u32			port_num;
+	struct xhci_port	*rhub_port;
 	u32			max_packets;
-	struct usb_device *top_dev;
 
 	dev = xhci->devs[udev->slot_id];
 	/* Slot ID 0 is reserved */
@@ -1124,17 +1124,13 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
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
@@ -1144,12 +1140,12 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
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
2.25.1


