Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5C7183377
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 15:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgCLOnK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 10:43:10 -0400
Received: from mga09.intel.com ([134.134.136.24]:50332 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727775AbgCLOnJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 10:43:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 07:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; 
   d="scan'208";a="443955919"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 07:43:08 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 8/9] xhci: Finetune host initiated USB3 rootport link suspend and resume
Date:   Thu, 12 Mar 2020 16:45:16 +0200
Message-Id: <20200312144517.1593-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200312144517.1593-1-mathias.nyman@linux.intel.com>
References: <20200312144517.1593-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Depending on the current link state the steps to resume the link to U0
varies. The normal case when a port is suspended (U3) we set the link
to U0 and wait for a port event when U3exit completed and port moved to
U0.

If the port is in U1/U2, then no event is issued, just set link to U0

If port is in Resume or Recovery state then the device has already
initiated resume, and this host initiated resume is racing against it.
Port event handler for device initiated resume will set link to U0,
just wait for the port to reach U0 before returning.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 02f52d4f74df..a9c87eb8951e 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1307,20 +1307,34 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				goto error;
 			}
 
+			/*
+			 * set link to U0, steps depend on current link state.
+			 * U3: set link to U0 and wait for u3exit completion.
+			 * U1/U2:  no PLC complete event, only set link to U0.
+			 * Resume/Recovery: device initiated U0, only wait for
+			 * completion
+			 */
 			if (link_state == USB_SS_PORT_LS_U0) {
-				if ((temp & PORT_PLS_MASK) == XDEV_U0)
-					break;
+				u32 pls = temp & PORT_PLS_MASK;
+				bool wait_u0 = false;
 
-				if (!((temp & PORT_PLS_MASK) == XDEV_U1 ||
-				    (temp & PORT_PLS_MASK) == XDEV_U2 ||
-				    (temp & PORT_PLS_MASK) == XDEV_U3)) {
-					xhci_warn(xhci, "Can only set port %d to U0 from U state\n",
-							wIndex);
-					goto error;
+				/* already in U0 */
+				if (pls == XDEV_U0)
+					break;
+				if (pls == XDEV_U3 ||
+				    pls == XDEV_RESUME ||
+				    pls == XDEV_RECOVERY) {
+					wait_u0 = true;
+					reinit_completion(&bus_state->u3exit_done[wIndex]);
+				}
+				if (pls <= XDEV_U3) /* U1, U2, U3 */
+					xhci_set_link_state(xhci, ports[wIndex],
+							    USB_SS_PORT_LS_U0);
+				if (!wait_u0) {
+					if (pls > XDEV_U3)
+						goto error;
+					break;
 				}
-				reinit_completion(&bus_state->u3exit_done[wIndex]);
-				xhci_set_link_state(xhci, ports[wIndex],
-						    USB_SS_PORT_LS_U0);
 				spin_unlock_irqrestore(&xhci->lock, flags);
 				if (!wait_for_completion_timeout(&bus_state->u3exit_done[wIndex],
 								 msecs_to_jiffies(100)))
-- 
2.17.1

