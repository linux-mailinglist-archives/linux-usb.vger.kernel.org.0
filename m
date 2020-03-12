Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5635183376
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 15:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbgCLOnJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 10:43:09 -0400
Received: from mga09.intel.com ([134.134.136.24]:50332 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727770AbgCLOnJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 10:43:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 07:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; 
   d="scan'208";a="443955887"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 07:43:07 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 7/9] xhci: Wait until link state trainsits to U0 after setting USB_SS_PORT_LS_U0
Date:   Thu, 12 Mar 2020 16:45:15 +0200
Message-Id: <20200312144517.1593-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200312144517.1593-1-mathias.nyman@linux.intel.com>
References: <20200312144517.1593-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Kai-Heng Feng <kai.heng.feng@canonical.com>

Like U3 case, xHCI spec doesn't specify the upper bound of U0 transition
time. The 20ms is not enough for some devices.

Intead of polling PLS or PLC, we can facilitate the port change event to
know that the link transits to U0 is completed.

While at it, also separate U0 and U3 case to make the code cleaner.

[variable rename to u3exit, and skip completion for usb2 ports -Mathias ]
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c  | 44 +++++++++++++++++++++++++-----------
 drivers/usb/host/xhci-mem.c  |  1 +
 drivers/usb/host/xhci-ring.c |  1 +
 drivers/usb/host/xhci.h      |  1 +
 4 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 712cd44f05ac..02f52d4f74df 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1306,7 +1306,33 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					 wIndex, link_state);
 				goto error;
 			}
+
+			if (link_state == USB_SS_PORT_LS_U0) {
+				if ((temp & PORT_PLS_MASK) == XDEV_U0)
+					break;
+
+				if (!((temp & PORT_PLS_MASK) == XDEV_U1 ||
+				    (temp & PORT_PLS_MASK) == XDEV_U2 ||
+				    (temp & PORT_PLS_MASK) == XDEV_U3)) {
+					xhci_warn(xhci, "Can only set port %d to U0 from U state\n",
+							wIndex);
+					goto error;
+				}
+				reinit_completion(&bus_state->u3exit_done[wIndex]);
+				xhci_set_link_state(xhci, ports[wIndex],
+						    USB_SS_PORT_LS_U0);
+				spin_unlock_irqrestore(&xhci->lock, flags);
+				if (!wait_for_completion_timeout(&bus_state->u3exit_done[wIndex],
+								 msecs_to_jiffies(100)))
+					xhci_dbg(xhci, "missing U0 port change event for port %d\n",
+						 wIndex);
+				spin_lock_irqsave(&xhci->lock, flags);
+				temp = readl(ports[wIndex]->addr);
+				break;
+			}
+
 			if (link_state == USB_SS_PORT_LS_U3) {
+				int retries = 16;
 				slot_id = xhci_find_slot_id_by_port(hcd, xhci,
 						wIndex + 1);
 				if (slot_id) {
@@ -1317,26 +1343,18 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					xhci_stop_device(xhci, slot_id, 1);
 					spin_lock_irqsave(&xhci->lock, flags);
 				}
-			}
-
-			xhci_set_link_state(xhci, ports[wIndex], link_state);
-
-			spin_unlock_irqrestore(&xhci->lock, flags);
-			if (link_state == USB_SS_PORT_LS_U3) {
-				int retries = 16;
-
+				xhci_set_link_state(xhci, ports[wIndex], USB_SS_PORT_LS_U3);
+				spin_unlock_irqrestore(&xhci->lock, flags);
 				while (retries--) {
 					usleep_range(4000, 8000);
 					temp = readl(ports[wIndex]->addr);
 					if ((temp & PORT_PLS_MASK) == XDEV_U3)
 						break;
 				}
-			}
-			spin_lock_irqsave(&xhci->lock, flags);
-
-			temp = readl(ports[wIndex]->addr);
-			if (link_state == USB_SS_PORT_LS_U3)
+				spin_lock_irqsave(&xhci->lock, flags);
+				temp = readl(ports[wIndex]->addr);
 				bus_state->suspended_ports |= 1 << wIndex;
+			}
 			break;
 		case USB_PORT_FEAT_POWER:
 			/*
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 884c601bfa15..9764122c9cdf 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2552,6 +2552,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		xhci->usb3_rhub.bus_state.resume_done[i] = 0;
 		/* Only the USB 2.0 completions will ever be used. */
 		init_completion(&xhci->usb2_rhub.bus_state.rexit_done[i]);
+		init_completion(&xhci->usb3_rhub.bus_state.u3exit_done[i]);
 	}
 
 	if (scratchpad_alloc(xhci, flags))
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ba512b25901a..a78787bb5133 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1681,6 +1681,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 	     (portsc & PORT_PLS_MASK) == XDEV_U1 ||
 	     (portsc & PORT_PLS_MASK) == XDEV_U2)) {
 		xhci_dbg(xhci, "resume SS port %d finished\n", port_id);
+		complete(&bus_state->u3exit_done[hcd_portnum]);
 		/* We've just brought the device into U0/1/2 through either the
 		 * Resume state after a device remote wakeup, or through the
 		 * U3Exit state after a host-initiated resume.  If it's a device
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index d74f1be26a58..fbf26b20c1e1 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1694,6 +1694,7 @@ struct xhci_bus_state {
 	/* Which ports are waiting on RExit to U0 transition. */
 	unsigned long		rexit_ports;
 	struct completion	rexit_done[USB_MAXCHILDREN];
+	struct completion	u3exit_done[USB_MAXCHILDREN];
 };
 
 
-- 
2.17.1

