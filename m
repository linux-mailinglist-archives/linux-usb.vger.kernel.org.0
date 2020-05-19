Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 140B51D9DDF
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 19:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729185AbgESR2Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 13:28:25 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35452 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgESR2Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 May 2020 13:28:25 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04JHSOv5050329;
        Tue, 19 May 2020 12:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589909304;
        bh=6q1dmDPPdeYuTngEg/cG5cKV714Z+2tgCClivy9i6Xg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=jDfMdk73ckGz0d/VxtIMo5X0h+JKieMl4MbEsVeCGdYsBZQO8TywQWx5k0nXbuEW9
         MUpO0tY9eo6f6yRXXvTFfmvGcqHxyNuMcjA384skMZjYpZpDUOgyaJd1OF9VwShF9N
         rKnPNXgiyq6YUKRR2Vxwb0KYoByuds45iSfKAy5I=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04JHSOA3034096;
        Tue, 19 May 2020 12:28:24 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 19
 May 2020 12:28:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 19 May 2020 12:28:23 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04JHSNih011491;
        Tue, 19 May 2020 12:28:23 -0500
From:   Bin Liu <b-liu@ti.com>
To:     <linux-usb@vger.kernel.org>
CC:     Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>
Subject: [PATCH v2] usb: musb: return -ESHUTDOWN in urb when three-strikes error happened
Date:   Tue, 19 May 2020 12:28:23 -0500
Message-ID: <20200519172823.7428-1-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200514162604.GA9571@rowland.harvard.edu>
References: <20200514162604.GA9571@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When a USB device attached to a hub got disconnected, MUSB controller
generates RXCSR_RX_ERROR interrupt for the 3-strikes-out error.

Currently the MUSB host driver returns -EPROTO in current URB, then the
USB device driver could immediately resubmit the URB which causes MUSB
generate RXCSR_RX_ERROR interrupt again. This circle causes interrupt
storm then the hub never got a chance to report the USB device detach.

To fix the interrupt storm, change the URB return code to -ESHUTDOWN for
MUSB_RXCSR_H_ERROR interrupt, so that the USB device driver will not
immediately resubmit the URB.

Signed-off-by: Bin Liu <b-liu@ti.com>
---
v2: added inline comments

 drivers/usb/musb/musb_host.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 8736f4251a22..8b7d22a0c0fb 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -1774,9 +1774,15 @@ void musb_host_rx(struct musb *musb, u8 epnum)
 		status = -EPIPE;
 
 	} else if (rx_csr & MUSB_RXCSR_H_ERROR) {
-		musb_dbg(musb, "end %d RX proto error", epnum);
+		dev_err(musb->controller, "ep%d RX three-strikes error", epnum);
 
-		status = -EPROTO;
+		/*
+		 * The three-strikes error could only happen when the USB
+		 * device is not accessible, for example detached or powered
+		 * off. So return the fatal error -ESHUTDOWN so hopefully the
+		 * USB device drivers won't immediately resubmit the same URB.
+		 */
+		status = -ESHUTDOWN;
 		musb_writeb(epio, MUSB_RXINTERVAL, 0);
 
 		rx_csr &= ~MUSB_RXCSR_H_ERROR;
-- 
2.17.1

