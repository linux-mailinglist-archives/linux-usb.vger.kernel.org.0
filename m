Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECA31D211F
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 23:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729343AbgEMVgV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 17:36:21 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43542 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729339AbgEMVgV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 17:36:21 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04DLaKHp034530
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 16:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589405780;
        bh=abTLqWYnMAoQ0zECWkLggxONDZAE/sJG2xSgir4kP3M=;
        h=From:To:CC:Subject:Date;
        b=aWblXI8JRXSwduC931xxDBeW3xwIPBNaLUKTFGCoT5UtLt7RN+r+pQqoeKL4uti8S
         zdW8wa74y6YJWFqo/oK6Fsii2IfuVDmzt6qJcC1VwEMn7kCTfMdFWGhLRR6+7FeNxd
         LAfG8bapjnZ7K7RO2YiB4DOKxb7QAbBw7SwD2gp0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04DLaK0b115611
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 16:36:20 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 13
 May 2020 16:36:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 13 May 2020 16:36:20 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04DLaKo7031592;
        Wed, 13 May 2020 16:36:20 -0500
From:   Bin Liu <b-liu@ti.com>
To:     <linux-usb@vger.kernel.org>
CC:     Bin Liu <b-liu@ti.com>
Subject: [PATCH] usb: musb: return -ESHUTDOWN in urb when three-strikes error happened
Date:   Wed, 13 May 2020 16:36:20 -0500
Message-ID: <20200513213620.21541-1-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
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
 drivers/usb/musb/musb_host.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 8736f4251a22..e41d910dcad1 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -1774,9 +1774,9 @@ void musb_host_rx(struct musb *musb, u8 epnum)
 		status = -EPIPE;
 
 	} else if (rx_csr & MUSB_RXCSR_H_ERROR) {
-		musb_dbg(musb, "end %d RX proto error", epnum);
+		dev_err(musb->controller, "ep%d RX three-strikes error", epnum);
 
-		status = -EPROTO;
+		status = -ESHUTDOWN;
 		musb_writeb(epio, MUSB_RXINTERVAL, 0);
 
 		rx_csr &= ~MUSB_RXCSR_H_ERROR;
-- 
2.17.1

