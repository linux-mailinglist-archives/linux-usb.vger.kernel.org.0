Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 255451E04E1
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 04:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388742AbgEYCux (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 May 2020 22:50:53 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59884 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388450AbgEYCuv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 May 2020 22:50:51 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04P2ooNS103750;
        Sun, 24 May 2020 21:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590375050;
        bh=NUWycC2SXXYO8B9Yzs08GTXNQIgLGElyOSZbaQLH+ro=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=nvIYRXQ4b0kxZPrGSeESBnHI3n4bn8myDsQWFBPJns8jvMlsFv/Ew3tiJFKyUT3XZ
         eSRLhO0VLXG4B4AAWCX2RYVl1WApahPeSUxUJ6Fj5+d4zNh7XfkZ0QJYiKhDNbE4DZ
         p3eg/BayLS2eM+LmW3FK1+OzpnRemxgcrGeSiCso=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04P2ooJ4113215
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 24 May 2020 21:50:50 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 24
 May 2020 21:50:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 24 May 2020 21:50:50 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04P2onNm023969;
        Sun, 24 May 2020 21:50:49 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 4/6] usb: musb: mediatek: add reset FADDR to zero in reset interrupt handle
Date:   Sun, 24 May 2020 21:50:47 -0500
Message-ID: <20200525025049.3400-5-b-liu@ti.com>
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

From: Macpaul Lin <macpaul.lin@mediatek.com>

When receiving reset interrupt, FADDR need to be reset to zero in
peripheral mode. Otherwise ep0 cannot do enumeration when re-plugging USB
cable.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Acked-by: Min Guo <min.guo@mediatek.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/mediatek.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index 6196b0e8d77d..eebeadd26946 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -208,6 +208,12 @@ static irqreturn_t generic_interrupt(int irq, void *__hci)
 	musb->int_rx = musb_clearw(musb->mregs, MUSB_INTRRX);
 	musb->int_tx = musb_clearw(musb->mregs, MUSB_INTRTX);
 
+	if ((musb->int_usb & MUSB_INTR_RESET) && !is_host_active(musb)) {
+		/* ep0 FADDR must be 0 when (re)entering peripheral mode */
+		musb_ep_select(musb->mregs, 0);
+		musb_writeb(musb->mregs, MUSB_FADDR, 0);
+	}
+
 	if (musb->int_usb || musb->int_tx || musb->int_rx)
 		retval = musb_interrupt(musb);
 
-- 
2.17.1

