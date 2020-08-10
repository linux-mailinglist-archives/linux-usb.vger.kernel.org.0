Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60C924073D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 16:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgHJOIB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 10:08:01 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33172 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgHJOIA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Aug 2020 10:08:00 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1k58Sz-0006s4-Sh; Mon, 10 Aug 2020 14:07:58 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     mathias.nyman@intel.com
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org (open list:USB XHCI DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] xhci: Do warm-reset when both CAS and XDEV_RESUME are set
Date:   Mon, 10 Aug 2020 22:07:53 +0800
Message-Id: <20200810140753.6639-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sometimes re-plugging a USB device during system sleep renders the device
useless:
[  173.418345] xhci_hcd 0000:00:14.0: Get port status 2-4 read: 0x14203e2, return 0x10262
...
[  176.496485] usb 2-4: Waited 2000ms for CONNECT
[  176.496781] usb usb2-port4: status 0000.0262 after resume, -19
[  176.497103] usb 2-4: can't resume, status -19
[  176.497438] usb usb2-port4: logical disconnect

Because PLS equals to XDEV_RESUME, xHCI driver reports U3 to usbcore,
despite of CAS bit is flagged.

So proritize CAS over XDEV_RESUME to let usbcore handle warm-reset for
the port.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/usb/host/xhci-hub.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index c3554e37e09f..4e14e164cb68 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -740,15 +740,6 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci,
 {
 	u32 pls = status_reg & PORT_PLS_MASK;
 
-	/* resume state is a xHCI internal state.
-	 * Do not report it to usb core, instead, pretend to be U3,
-	 * thus usb core knows it's not ready for transfer
-	 */
-	if (pls == XDEV_RESUME) {
-		*status |= USB_SS_PORT_LS_U3;
-		return;
-	}
-
 	/* When the CAS bit is set then warm reset
 	 * should be performed on port
 	 */
@@ -770,6 +761,16 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci,
 		 */
 		pls |= USB_PORT_STAT_CONNECTION;
 	} else {
+		/*
+		 * Resume state is an xHCI internal state.  Do not report it to
+		 * usb core, instead, pretend to be U3, thus usb core knows
+		 * it's not ready for transfer.
+		 */
+		if (pls == XDEV_RESUME) {
+			*status |= USB_SS_PORT_LS_U3;
+			return;
+		}
+
 		/*
 		 * If CAS bit isn't set but the Port is already at
 		 * Compliance Mode, fake a connection so the USB core
-- 
2.17.1

