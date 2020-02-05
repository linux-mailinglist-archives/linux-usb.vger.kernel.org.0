Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8D7152A12
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 12:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbgBELmN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Feb 2020 06:42:13 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:54762 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbgBELmM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Feb 2020 06:42:12 -0500
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1izIpJ-0003Wg-4u; Wed, 05 Feb 2020 11:26:37 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu
Cc:     acelan.kao@canonical.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [RESEND] [PATCH v2 1/3] xhci: Ensure link state is U3 after setting USB_SS_PORT_LS_U3
Date:   Wed,  5 Feb 2020 19:26:31 +0800
Message-Id: <20200205112633.25995-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The xHCI spec doesn't specify the upper bound of U3 transition time. For
some devices 20ms is not enough, so we need to make sure the link state
is in U3 before further actions.

I've tried to use U3 Entry Capability by setting U3 Entry Enable in
config register, however the port change event for U3 transition
interrupts the system suspend process.

For now let's use the less ideal method by polling PLS.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 - Remove some redundant debug messages.
 - Use msleep loop outside if spinlock to stop pegging CPU.

 drivers/usb/host/xhci-hub.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 7a3a29e5e9d2..d3c5bcf76755 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1313,7 +1313,16 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			xhci_set_link_state(xhci, ports[wIndex], link_state);
 
 			spin_unlock_irqrestore(&xhci->lock, flags);
-			msleep(20); /* wait device to enter */
+			if (link_state == USB_SS_PORT_LS_U3) {
+				int retries = 10;
+
+				while (retries--) {
+					msleep(10); /* wait device to enter */
+					temp = readl(ports[wIndex]->addr);
+					if ((temp & PORT_PLS_MASK) == XDEV_U3)
+						break;
+				}
+			}
 			spin_lock_irqsave(&xhci->lock, flags);
 
 			temp = readl(ports[wIndex]->addr);
-- 
2.17.1

