Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 927B81E04DE
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 04:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388738AbgEYCuv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 May 2020 22:50:51 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56040 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388505AbgEYCuv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 May 2020 22:50:51 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04P2oo0l126647;
        Sun, 24 May 2020 21:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590375050;
        bh=QG7vPFGJBOh3u6js/mTsZROIMJxU7h4IeBPEJ5xuvPk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=jztwQugVWLuxwMtNNgWz0yyxcD62dj5w6YZLA0qxhiWhU0QnfCV5NonvVIqtt2cFb
         Zz2FG5gIoAuE+9x2iUYynSlzkY4Qa/oG4Ww/y2Wxgvm/w2z6KE04FWBJw3Hq7K8VP6
         ZX0pJ62sWKpB0EPx55Nx4w691nt0JkSOTcyENrGs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04P2ooe9058394
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 24 May 2020 21:50:50 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 24
 May 2020 21:50:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 24 May 2020 21:50:49 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04P2onNj023969;
        Sun, 24 May 2020 21:50:49 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 1/6] usb: musb: return -ESHUTDOWN in urb when three-strikes error happened
Date:   Sun, 24 May 2020 21:50:44 -0500
Message-ID: <20200525025049.3400-2-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525025049.3400-1-b-liu@ti.com>
References: <20200525025049.3400-1-b-liu@ti.com>
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

