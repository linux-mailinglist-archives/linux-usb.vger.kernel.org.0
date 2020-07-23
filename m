Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0952522B197
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbgGWOm1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728704AbgGWOm1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:27 -0400
IronPort-SDR: MaUwx8X7sDFF3FT7RzmBN6yGp0OkHHWlvZqyeigOURyvTWBz879ZMlsMkNWPMUTRQx2IOwBsss
 ZMFYRWrtFA7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607359"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607359"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:26 -0700
IronPort-SDR: BczJbQZHxORGlGJA2ZSahhWs0SEvkr2cjKjVgzIaTUiyZoknn0QijhklmFLA5dIWonhQKG03NO
 y4lEHNUHinmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672355"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:24 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/27] xhci: Make debug message consistent with bus and port number
Date:   Thu, 23 Jul 2020 17:45:04 +0300
Message-Id: <20200723144530.9992-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Kai-Heng Feng <kai.heng.feng@canonical.com>

Current xhci debug message doesn't always output bus number, so it's
hard to figure out it's from USB2 or USB3 root hub.

In addition to that, some port numbers are offset to 0 and others are
offset to 1. Use the latter to match the USB core.

So use "bus number - port index + 1" to make debug message consistent.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 41 +++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 073c54e42223..c3554e37e09f 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1241,7 +1241,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			temp = readl(ports[wIndex]->addr);
 			/* Disable port */
 			if (link_state == USB_SS_PORT_LS_SS_DISABLED) {
-				xhci_dbg(xhci, "Disable port %d\n", wIndex);
+				xhci_dbg(xhci, "Disable port %d-%d\n",
+					 hcd->self.busnum, wIndex + 1);
 				temp = xhci_port_state_to_neutral(temp);
 				/*
 				 * Clear all change bits, so that we get a new
@@ -1257,7 +1258,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 			/* Put link in RxDetect (enable port) */
 			if (link_state == USB_SS_PORT_LS_RX_DETECT) {
-				xhci_dbg(xhci, "Enable port %d\n", wIndex);
+				xhci_dbg(xhci, "Enable port %d-%d\n",
+					 hcd->self.busnum, wIndex + 1);
 				xhci_set_link_state(xhci, ports[wIndex],
 							link_state);
 				temp = readl(ports[wIndex]->addr);
@@ -1289,8 +1291,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					goto error;
 				}
 
-				xhci_dbg(xhci, "Enable compliance mode transition for port %d\n",
-						wIndex);
+				xhci_dbg(xhci, "Enable compliance mode transition for port %d-%d\n",
+					 hcd->self.busnum, wIndex + 1);
 				xhci_set_link_state(xhci, ports[wIndex],
 						link_state);
 
@@ -1304,8 +1306,9 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			}
 			/* Can't set port link state above '3' (U3) */
 			if (link_state > USB_SS_PORT_LS_U3) {
-				xhci_warn(xhci, "Cannot set port %d link state %d\n",
-					 wIndex, link_state);
+				xhci_warn(xhci, "Cannot set port %d-%d link state %d\n",
+					  hcd->self.busnum, wIndex + 1,
+					  link_state);
 				goto error;
 			}
 
@@ -1340,8 +1343,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				spin_unlock_irqrestore(&xhci->lock, flags);
 				if (!wait_for_completion_timeout(&bus_state->u3exit_done[wIndex],
 								 msecs_to_jiffies(100)))
-					xhci_dbg(xhci, "missing U0 port change event for port %d\n",
-						 wIndex);
+					xhci_dbg(xhci, "missing U0 port change event for port %d-%d\n",
+						 hcd->self.busnum, wIndex + 1);
 				spin_lock_irqsave(&xhci->lock, flags);
 				temp = readl(ports[wIndex]->addr);
 				break;
@@ -1386,15 +1389,15 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			writel(temp, ports[wIndex]->addr);
 
 			temp = readl(ports[wIndex]->addr);
-			xhci_dbg(xhci, "set port reset, actual port %d status  = 0x%x\n", wIndex, temp);
+			xhci_dbg(xhci, "set port reset, actual port %d-%d status  = 0x%x\n",
+				 hcd->self.busnum, wIndex + 1, temp);
 			break;
 		case USB_PORT_FEAT_REMOTE_WAKE_MASK:
 			xhci_set_remote_wake_mask(xhci, ports[wIndex],
 						  wake_mask);
 			temp = readl(ports[wIndex]->addr);
-			xhci_dbg(xhci, "set port remote wake mask, "
-					"actual port %d status  = 0x%x\n",
-					wIndex, temp);
+			xhci_dbg(xhci, "set port remote wake mask, actual port %d-%d status  = 0x%x\n",
+				 hcd->self.busnum, wIndex + 1, temp);
 			break;
 		case USB_PORT_FEAT_BH_PORT_RESET:
 			temp |= PORT_WR;
@@ -1635,8 +1638,8 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			msleep(XHCI_PORT_POLLING_LFPS_TIME);
 			spin_lock_irqsave(&xhci->lock, flags);
-			xhci_dbg(xhci, "port %d polling in bus suspend, waiting\n",
-				 port_index);
+			xhci_dbg(xhci, "port %d-%d polling in bus suspend, waiting\n",
+				 hcd->self.busnum, port_index + 1);
 			goto retry;
 		}
 		/* bail out if port detected a over-current condition */
@@ -1654,7 +1657,8 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 				xhci_dbg(xhci, "Bus suspend bailout, port connect change\n");
 				return -EBUSY;
 			}
-			xhci_dbg(xhci, "port %d not suspended\n", port_index);
+			xhci_dbg(xhci, "port %d-%d not suspended\n",
+				 hcd->self.busnum, port_index + 1);
 			t2 &= ~PORT_PLS_MASK;
 			t2 |= PORT_LINK_STROBE | XDEV_U3;
 			set_bit(port_index, &bus_state->bus_suspended);
@@ -1784,7 +1788,8 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 		if ((xhci->quirks & XHCI_MISSING_CAS) &&
 		    (hcd->speed >= HCD_USB3) &&
 		    xhci_port_missing_cas_quirk(ports[port_index])) {
-			xhci_dbg(xhci, "reset stuck port %d\n", port_index);
+			xhci_dbg(xhci, "reset stuck port %d-%d\n",
+				 hcd->self.busnum, port_index + 1);
 			clear_bit(port_index, &bus_state->bus_suspended);
 			continue;
 		}
@@ -1831,8 +1836,8 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 		sret = xhci_handshake(ports[port_index]->addr, PORT_PLC,
 				      PORT_PLC, 10 * 1000);
 		if (sret) {
-			xhci_warn(xhci, "port %d resume PLC timeout\n",
-				  port_index);
+			xhci_warn(xhci, "port %d-%d resume PLC timeout\n",
+				  hcd->self.busnum, port_index + 1);
 			continue;
 		}
 		xhci_test_and_clear_bit(xhci, ports[port_index], PORT_PLC);
-- 
2.17.1

