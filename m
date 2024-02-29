Return-Path: <linux-usb+bounces-7337-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0E886CB11
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 15:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DBEC28465B
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 14:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F9D1350E3;
	Thu, 29 Feb 2024 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tg/JyIJp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AC5133987
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 14:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709215992; cv=none; b=MkhF18Wcnw2c87UxZHW6SeL5UsNx1xnr48L3RPVPS0grUR103H/Qnl8/4PJSmZA8/PPN0Wpbg8UQe5Qk18OhvD2LZcJB2wKakMGloLwhbZ5IVPQ1UenxFoIttcgU7CgTu5MkElrHjltO4N2W911ccVl3WrrG8sAJCmgTGkkk3TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709215992; c=relaxed/simple;
	bh=egMcKs/5AGhUqO8IiOHkCvShRU2hYYR2V2bry0tk53g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I4p/9ZoC0aenv+OWFAYZymTTjrwVDTlrAt5WGNXcOGW9iaGoAvIPt5czEbMLbUNNfUA+4ws8FH3VHBFQH4Lemss1dFGvFtz/jKYKneLGIyAFU6iF3CEWWHaijhy6vi/Wcajx97RQwKHYdt5E32ix1lESZy2jA8qA8dLqXToOaFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tg/JyIJp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709215991; x=1740751991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=egMcKs/5AGhUqO8IiOHkCvShRU2hYYR2V2bry0tk53g=;
  b=Tg/JyIJpHBZcCDIj6rG150l3RfORLdYnIZHDkZtPalhJx0JUhUBgQZXx
   tSf6gNkDECmPfApgNfoiVIgYIlxlgxUzrbN7KbAaf9s0RzfFyBTszQgZb
   rvd3g/L49aycJJBZn7xqCu6jUsx2uaWjyUrhhw9Fnzc/2PVOVoHVYsFAa
   tnPX2fZjknYtZ4kWeTed94t0wY2x1JGfhWMBiUlNw7ulj/a+6G/LK+zGa
   xAXEyOOLclvdZAOHIzgrn04vXx4fYcMw3wCuEdwS8zV9o30CYKtuA1LkV
   oFuzY7HbrVgYebTaO6Swl9xP0YSCSLUGkm19DKuyfcTVXIuc3XKzp89MK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3609378"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3609378"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 06:13:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937035989"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="937035989"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2024 06:13:09 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/9] xhci: save slot ID in struct 'xhci_port'
Date: Thu, 29 Feb 2024 16:14:32 +0200
Message-Id: <20240229141438.619372-4-mathias.nyman@linux.intel.com>
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

Slot ID is a index of a virtual device in struct 'xhci_hcd->devs[]'.
Previously, to get the slot ID associated with a port, we had to loop
through all devices and compare ports, which is very inefficient.
Instead, the slot ID (of the device which is directly connected to the
port), is added to the its corresponding 'xhci_port' struct. As a result,
finding the port's device is quick and easy.

Function 'xhci_find_slot_id_by_port()' is removed, as it is no longer
needed.

Signed-off-by: Niklas Neronin <niklas.neronin@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c  | 71 ++++++------------------------------
 drivers/usb/host/xhci-mem.c  |  5 +++
 drivers/usb/host/xhci-pci.c  | 10 ++---
 drivers/usb/host/xhci-ring.c | 11 ++----
 drivers/usb/host/xhci.h      |  4 +-
 5 files changed, 26 insertions(+), 75 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 37128a777a58..61f083de6e19 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -448,40 +448,6 @@ u32 xhci_port_state_to_neutral(u32 state)
 }
 EXPORT_SYMBOL_GPL(xhci_port_state_to_neutral);
 
-/**
- * xhci_find_slot_id_by_port() - Find slot id of a usb device on a roothub port
- * @hcd: pointer to hcd of the roothub
- * @xhci: pointer to xhci structure
- * @port: one-based port number of the port in this roothub.
- *
- * Return: Slot id of the usb device connected to the root port, 0 if not found
- */
-
-int xhci_find_slot_id_by_port(struct usb_hcd *hcd, struct xhci_hcd *xhci,
-		u16 port)
-{
-	int slot_id;
-	int i;
-	enum usb_device_speed speed;
-
-	/* 'hcd_portnum' is zero-based, thus convert one-based 'port' to zero-based */
-	port -= 1;
-	slot_id = 0;
-	for (i = 0; i < MAX_HC_SLOTS; i++) {
-		if (!xhci->devs[i] || !xhci->devs[i]->udev)
-			continue;
-		speed = xhci->devs[i]->udev->speed;
-		if (((speed >= USB_SPEED_SUPER) == (hcd->speed >= HCD_USB3))
-				&& xhci->devs[i]->rhub_port->hcd_portnum == port) {
-			slot_id = i;
-			break;
-		}
-	}
-
-	return slot_id;
-}
-EXPORT_SYMBOL_GPL(xhci_find_slot_id_by_port);
-
 /*
  * Stop device
  * It issues stop endpoint command for EP 0 to 30. And wait the last command
@@ -932,7 +898,6 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 	struct xhci_bus_state *bus_state;
 	struct xhci_hcd	*xhci;
 	struct usb_hcd *hcd;
-	int slot_id;
 	u32 wIndex;
 
 	hcd = port->rhub->hcd;
@@ -988,13 +953,11 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 		spin_lock_irqsave(&xhci->lock, *flags);
 
 		if (time_left) {
-			slot_id = xhci_find_slot_id_by_port(hcd, xhci,
-							    wIndex + 1);
-			if (!slot_id) {
+			if (!port->slot_id) {
 				xhci_dbg(xhci, "slot_id is zero\n");
 				return -ENODEV;
 			}
-			xhci_ring_device(xhci, slot_id);
+			xhci_ring_device(xhci, port->slot_id);
 		} else {
 			int port_status = readl(port->addr);
 
@@ -1204,7 +1167,6 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 	unsigned long flags;
 	u32 temp, status;
 	int retval = 0;
-	int slot_id;
 	struct xhci_bus_state *bus_state;
 	u16 link_state = 0;
 	u16 wake_mask = 0;
@@ -1334,15 +1296,13 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				goto error;
 			}
 
-			slot_id = xhci_find_slot_id_by_port(hcd, xhci,
-							    portnum1);
-			if (!slot_id) {
+			if (!port->slot_id) {
 				xhci_warn(xhci, "slot_id is zero\n");
 				goto error;
 			}
 			/* unlock to execute stop endpoint commands */
 			spin_unlock_irqrestore(&xhci->lock, flags);
-			xhci_stop_device(xhci, slot_id, 1);
+			xhci_stop_device(xhci, port->slot_id, 1);
 			spin_lock_irqsave(&xhci->lock, flags);
 
 			xhci_set_link_state(xhci, port, XDEV_U3);
@@ -1465,14 +1425,12 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 			if (link_state == USB_SS_PORT_LS_U3) {
 				int retries = 16;
-				slot_id = xhci_find_slot_id_by_port(hcd, xhci,
-								    portnum1);
-				if (slot_id) {
+				if (port->slot_id) {
 					/* unlock to execute stop endpoint
 					 * commands */
 					spin_unlock_irqrestore(&xhci->lock,
 								flags);
-					xhci_stop_device(xhci, slot_id, 1);
+					xhci_stop_device(xhci, port->slot_id, 1);
 					spin_lock_irqsave(&xhci->lock, flags);
 				}
 				xhci_set_link_state(xhci, port, USB_SS_PORT_LS_U3);
@@ -1586,13 +1544,11 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			}
 			bus_state->port_c_suspend |= 1 << wIndex;
 
-			slot_id = xhci_find_slot_id_by_port(hcd, xhci,
-					portnum1);
-			if (!slot_id) {
+			if (!port->slot_id) {
 				xhci_dbg(xhci, "slot_id is zero\n");
 				goto error;
 			}
-			xhci_ring_device(xhci, slot_id);
+			xhci_ring_device(xhci, port->slot_id);
 			break;
 		case USB_PORT_FEAT_C_SUSPEND:
 			bus_state->port_c_suspend &= ~(1 << wIndex);
@@ -1823,10 +1779,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 		if (!portsc_buf[port_index])
 			continue;
 		if (test_bit(port_index, &bus_state->bus_suspended)) {
-			int slot_id;
-
-			slot_id = xhci_find_slot_id_by_port(hcd, xhci,
-							    port_index + 1);
+			int slot_id = ports[port_index]->slot_id;
 			if (slot_id) {
 				spin_unlock_irqrestore(&xhci->lock, flags);
 				xhci_stop_device(xhci, slot_id, 1);
@@ -1879,7 +1832,6 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 	struct xhci_bus_state *bus_state;
 	unsigned long flags;
 	int max_ports, port_index;
-	int slot_id;
 	int sret;
 	u32 next_state;
 	u32 temp, portsc;
@@ -1972,9 +1924,8 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 			continue;
 		}
 		xhci_test_and_clear_bit(xhci, ports[port_index], PORT_PLC);
-		slot_id = xhci_find_slot_id_by_port(hcd, xhci, port_index + 1);
-		if (slot_id)
-			xhci_ring_device(xhci, slot_id);
+		if (ports[port_index]->slot_id)
+			xhci_ring_device(xhci, ports[port_index]->slot_id);
 	}
 	(void) readl(&xhci->op_regs->command);
 
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 9fa68fa17ac7..c4b3e425bd19 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -907,6 +907,8 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, int slot_id)
 
 	if (dev->udev && dev->udev->slot_id)
 		dev->udev->slot_id = 0;
+	if (dev->rhub_port && dev->rhub_port->slot_id == slot_id)
+		dev->rhub_port->slot_id = 0;
 	kfree(xhci->devs[slot_id]);
 	xhci->devs[slot_id] = NULL;
 }
@@ -1124,6 +1126,9 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 	dev->rhub_port = xhci_find_rhub_port(xhci, udev);
 	if (!dev->rhub_port)
 		return -EINVAL;
+	/* Slot ID is set to the device directly below the root hub */
+	if (!udev->parent->parent)
+		dev->rhub_port->slot_id = udev->slot_id;
 	slot_ctx->dev_info2 |= cpu_to_le32(ROOT_HUB_PORT(dev->rhub_port->hw_portnum + 1));
 	xhci_dbg(xhci, "Slot ID %d: HW portnum %d, hcd portnum %d\n",
 		 udev->slot_id, dev->rhub_port->hw_portnum, dev->rhub_port->hcd_portnum);
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b534ca9752be..1843f3d5b1e6 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -820,7 +820,6 @@ static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
 	struct xhci_hcd		*xhci = hcd_to_xhci(hcd);
 	struct xhci_port	*port;
 	struct usb_device	*udev;
-	unsigned int		slot_id;
 	u32			portsc;
 	int			i;
 
@@ -843,15 +842,14 @@ static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
 		if ((portsc & PORT_PLS_MASK) != XDEV_U3)
 			continue;
 
-		slot_id = xhci_find_slot_id_by_port(port->rhub->hcd, xhci,
-						    port->hcd_portnum + 1);
-		if (!slot_id || !xhci->devs[slot_id]) {
+		if (!port->slot_id || !xhci->devs[port->slot_id]) {
 			xhci_err(xhci, "No dev for slot_id %d for port %d-%d in U3\n",
-				 slot_id, port->rhub->hcd->self.busnum, port->hcd_portnum + 1);
+				 port->slot_id, port->rhub->hcd->self.busnum,
+				 port->hcd_portnum + 1);
 			continue;
 		}
 
-		udev = xhci->devs[slot_id]->udev;
+		udev = xhci->devs[port->slot_id]->udev;
 
 		/* if wakeup is enabled then don't disable the port */
 		if (udev->do_remote_wakeup && do_wakeup)
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d4a28ac4967f..95ed26114ee8 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1870,7 +1870,6 @@ static void handle_port_status(struct xhci_hcd *xhci,
 	u32 port_id;
 	u32 portsc, cmd_reg;
 	int max_ports;
-	int slot_id;
 	unsigned int hcd_portnum;
 	struct xhci_bus_state *bus_state;
 	bool bogus_port_status = false;
@@ -1922,9 +1921,8 @@ static void handle_port_status(struct xhci_hcd *xhci,
 
 	if (hcd->speed >= HCD_USB3 &&
 	    (portsc & PORT_PLS_MASK) == XDEV_INACTIVE) {
-		slot_id = xhci_find_slot_id_by_port(hcd, xhci, hcd_portnum + 1);
-		if (slot_id && xhci->devs[slot_id])
-			xhci->devs[slot_id]->flags |= VDEV_PORT_ERROR;
+		if (port->slot_id && xhci->devs[port->slot_id])
+			xhci->devs[port->slot_id]->flags |= VDEV_PORT_ERROR;
 	}
 
 	if ((portsc & PORT_PLC) && (portsc & PORT_PLS_MASK) == XDEV_RESUME) {
@@ -1982,9 +1980,8 @@ static void handle_port_status(struct xhci_hcd *xhci,
 		 * so the roothub behavior is consistent with external
 		 * USB 3.0 hub behavior.
 		 */
-		slot_id = xhci_find_slot_id_by_port(hcd, xhci, hcd_portnum + 1);
-		if (slot_id && xhci->devs[slot_id])
-			xhci_ring_device(xhci, slot_id);
+		if (port->slot_id && xhci->devs[port->slot_id])
+			xhci_ring_device(xhci, port->slot_id);
 		if (bus_state->port_remote_wakeup & (1 << hcd_portnum)) {
 			xhci_test_and_clear_bit(xhci, port, PORT_PLC);
 			usb_wakeup_notification(hcd->self.root_hub,
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 634ab517a776..6f4bf98a6282 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1462,6 +1462,8 @@ struct xhci_port {
 	unsigned int		lpm_incapable:1;
 	unsigned long		resume_timestamp;
 	bool			rexit_active;
+	/* Slot ID is the index of the device directly connected to the port */
+	int			slot_id;
 	struct completion	rexit_done;
 	struct completion	u3exit_done;
 };
@@ -1944,8 +1946,6 @@ unsigned long xhci_get_resuming_ports(struct usb_hcd *hcd);
 #endif	/* CONFIG_PM */
 
 u32 xhci_port_state_to_neutral(u32 state);
-int xhci_find_slot_id_by_port(struct usb_hcd *hcd, struct xhci_hcd *xhci,
-		u16 port);
 void xhci_ring_device(struct xhci_hcd *xhci, int slot_id);
 
 /* xHCI contexts */
-- 
2.25.1


