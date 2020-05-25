Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962811E04E2
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 04:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388741AbgEYCux (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 May 2020 22:50:53 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59890 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388564AbgEYCuv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 May 2020 22:50:51 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04P2ooum103754;
        Sun, 24 May 2020 21:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590375050;
        bh=WEUMpXROMWu1AVmEFdar0/KkiZdyiuwnGx+mZ+gOYzE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=y2CjKflTGLGv384A6wOB0R9JwSqisw+FBN/1Y07b6ZfEKizhu47WLmRAbKsKB9QY2
         OW9GseYsHNb2JckUqt1tmCMVOJYnlAdaiQxioZJpFnMz3rNlCYTw5kFulvImnRo78f
         AkYfujM95FltkmCFR33pc6RWrc15QMXSeClm1F3k=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04P2ooPY113225
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 24 May 2020 21:50:50 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 24
 May 2020 21:50:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 24 May 2020 21:50:50 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04P2onNn023969;
        Sun, 24 May 2020 21:50:50 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 5/6] usb: musb: jz4740: Prevent lockup when CONFIG_SMP is set
Date:   Sun, 24 May 2020 21:50:48 -0500
Message-ID: <20200525025049.3400-6-b-liu@ti.com>
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

From: Paul Cercueil <paul@crapouillou.net>

The function dma_controller_irq() locks up the exact same spinlock we
locked before calling it, which obviously resulted in a deadlock when
CONFIG_SMP was enabled. This flew under the radar as none of the boards
supported by this driver needs SMP.

Fixes: 57aadb46bd63 ("usb: musb: jz4740: Add support for DMA")

Cc: stable@vger.kernel.org
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/jz4740.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index e64dd30e80e7..c4fe1f4cd17a 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -30,11 +30,11 @@ static irqreturn_t jz4740_musb_interrupt(int irq, void *__hci)
 	irqreturn_t	retval = IRQ_NONE, retval_dma = IRQ_NONE;
 	struct musb	*musb = __hci;
 
-	spin_lock_irqsave(&musb->lock, flags);
-
 	if (IS_ENABLED(CONFIG_USB_INVENTRA_DMA) && musb->dma_controller)
 		retval_dma = dma_controller_irq(irq, musb->dma_controller);
 
+	spin_lock_irqsave(&musb->lock, flags);
+
 	musb->int_usb = musb_readb(musb->mregs, MUSB_INTRUSB);
 	musb->int_tx = musb_readw(musb->mregs, MUSB_INTRTX);
 	musb->int_rx = musb_readw(musb->mregs, MUSB_INTRRX);
-- 
2.17.1

