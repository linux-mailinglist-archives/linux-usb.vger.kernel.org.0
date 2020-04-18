Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660761AEE1A
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2020 16:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgDROKg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Apr 2020 10:10:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:38830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727882AbgDROKf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 18 Apr 2020 10:10:35 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB2F522244;
        Sat, 18 Apr 2020 14:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587219034;
        bh=mbsr4pUywiBf3efxDxkiIZhl7JcP3EsZbHgjH0OG9wA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EESfvQ4cFc40DfIdl41ZhGtUS3bB5DJDl/f1dDeN9b4IXOT1lzNP0KAYblqT1/RyM
         AvZUyLxeKmVwWX1LAUW2fkxGPSYe+dmX1vLRJUmdtjKn+RF2NTapjZA5NP0K2pnuM1
         mQKnCur7xYGDQTh8D8dHkDOxTaVeN30jvosWgNVg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 68/75] xhci: Finetune host initiated USB3 rootport link suspend and resume
Date:   Sat, 18 Apr 2020 10:09:03 -0400
Message-Id: <20200418140910.8280-68-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418140910.8280-1-sashal@kernel.org>
References: <20200418140910.8280-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mathias Nyman <mathias.nyman@linux.intel.com>

[ Upstream commit ceca49382ac20e06ce04c21279c7f2868c4ec1d4 ]

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
Link: https://lore.kernel.org/r/20200312144517.1593-9-mathias.nyman@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/host/xhci-hub.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 02f52d4f74df8..a9c87eb8951e8 100644
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
2.20.1

