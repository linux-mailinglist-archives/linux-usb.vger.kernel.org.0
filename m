Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA0BE152A13
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 12:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgBELmL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Feb 2020 06:42:11 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:54762 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgBELmL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Feb 2020 06:42:11 -0500
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1izIpN-0003Ww-0f; Wed, 05 Feb 2020 11:26:41 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu
Cc:     acelan.kao@canonical.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [RESEND] [PATCH v2 2/3] xhci: Wait until link state trainsits to U0 after setting USB_SS_PORT_LS_U0
Date:   Wed,  5 Feb 2020 19:26:32 +0800
Message-Id: <20200205112633.25995-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200205112633.25995-1-kai.heng.feng@canonical.com>
References: <20200205112633.25995-1-kai.heng.feng@canonical.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Like U3 case, xHCI spec doesn't specify the upper bound of U0 transition
time. The 20ms is not enough for some devices.

Intead of polling PLS or PLC, we can facilitate the port change event to
know that the link transits to U0 is completed.

While at it, also separate U0 and U3 case to make the code cleaner.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 - Seperate U0 and U3 case.
 - Prevent setting U0 from non-U state.
 - Move the completion from per port to bus_state.

 drivers/usb/host/xhci-hub.c  | 43 +++++++++++++++++++++++++-----------
 drivers/usb/host/xhci-mem.c  |  2 ++
 drivers/usb/host/xhci-ring.c |  1 +
 drivers/usb/host/xhci.h      |  1 +
 4 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index d3c5bcf76755..0a5d8b28b99f 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1297,7 +1297,32 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
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
+				reinit_completion(&bus_state->link_change_done[wIndex]);
+				xhci_set_link_state(xhci, ports[wIndex], USB_SS_PORT_LS_U0);
+				spin_unlock_irqrestore(&xhci->lock, flags);
+				if (!wait_for_completion_timeout(&bus_state->link_change_done[wIndex],
+								 msecs_to_jiffies(100)))
+					xhci_dbg(xhci, "missing U0 port change event for port %d\n",
+						 wIndex);
+				spin_lock_irqsave(&xhci->lock, flags);
+				temp = readl(ports[wIndex]->addr);
+				break;
+			}
+
 			if (link_state == USB_SS_PORT_LS_U3) {
+				int retries = 10;
 				slot_id = xhci_find_slot_id_by_port(hcd, xhci,
 						wIndex + 1);
 				if (slot_id) {
@@ -1308,26 +1333,18 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					xhci_stop_device(xhci, slot_id, 1);
 					spin_lock_irqsave(&xhci->lock, flags);
 				}
-			}
-
-			xhci_set_link_state(xhci, ports[wIndex], link_state);
-
-			spin_unlock_irqrestore(&xhci->lock, flags);
-			if (link_state == USB_SS_PORT_LS_U3) {
-				int retries = 10;
-
+				xhci_set_link_state(xhci, ports[wIndex], USB_SS_PORT_LS_U3);
+				spin_unlock_irqrestore(&xhci->lock, flags);
 				while (retries--) {
 					msleep(10); /* wait device to enter */
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
index 3b1388fa2f36..aceb8c1af775 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2531,6 +2531,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		xhci->usb3_rhub.bus_state.resume_done[i] = 0;
 		/* Only the USB 2.0 completions will ever be used. */
 		init_completion(&xhci->usb2_rhub.bus_state.rexit_done[i]);
+		init_completion(&xhci->usb2_rhub.bus_state.link_change_done[i]);
+		init_completion(&xhci->usb3_rhub.bus_state.link_change_done[i]);
 	}
 
 	if (scratchpad_alloc(xhci, flags))
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d23f7408c81f..4d0f8dab069a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1677,6 +1677,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 	     (portsc & PORT_PLS_MASK) == XDEV_U1 ||
 	     (portsc & PORT_PLS_MASK) == XDEV_U2)) {
 		xhci_dbg(xhci, "resume SS port %d finished\n", port_id);
+		complete(&bus_state->link_change_done[hcd_portnum]);
 		/* We've just brought the device into U0/1/2 through either the
 		 * Resume state after a device remote wakeup, or through the
 		 * U3Exit state after a host-initiated resume.  If it's a device
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 13d8838cd552..b5d443ce0750 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1694,6 +1694,7 @@ struct xhci_bus_state {
 	/* Which ports are waiting on RExit to U0 transition. */
 	unsigned long		rexit_ports;
 	struct completion	rexit_done[USB_MAXCHILDREN];
+	struct completion	link_change_done[USB_MAXCHILDREN];
 };
 
 
-- 
2.17.1

