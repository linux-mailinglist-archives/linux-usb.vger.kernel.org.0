Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 883EA120F32
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2019 17:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfLPQT0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Dec 2019 11:19:26 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53982 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbfLPQT0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Dec 2019 11:19:26 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBGGJPBM060369;
        Mon, 16 Dec 2019 10:19:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576513165;
        bh=4YKtq9MNzHDyH7Hr39FXJT+OrU2K0+nbgbNm++XMBzM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=bKd1/PpAJvdxDyxVB6XGdedGDwx4JpE0njyprWAaVuqMWpqeP8NsUMcOcVfxXrBXl
         Df61zhgF5jPYF/oAvs5TShZPcoT78l//Sixm2Jz+hqJaGRPEmSotQyHSjdEMjUcEM7
         GeMJXGCP1JcSfN69GTyq7ljsuXVHpGx7g1vLbo/4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBGGJP8T048646
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Dec 2019 10:19:25 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Dec 2019 10:19:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Dec 2019 10:19:25 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGGJO5c105067;
        Mon, 16 Dec 2019 10:19:24 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 1/2] usb: musb: dma: Correct parameter passed to IRQ handler
Date:   Mon, 16 Dec 2019 10:18:43 -0600
Message-ID: <20191216161844.772-2-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191216161844.772-1-b-liu@ti.com>
References: <20191216161844.772-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

The IRQ handler was passed a pointer to a struct dma_controller, but the
argument was then casted to a pointer to a struct musb_dma_controller.

Fixes: 427c4f333474 ("usb: struct device - replace bus_id with dev_name(), dev_set_name()")

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
Cc: stable@vger.kernel.org
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musbhsdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
index 5fc6825745f2..2d3751d885b4 100644
--- a/drivers/usb/musb/musbhsdma.c
+++ b/drivers/usb/musb/musbhsdma.c
@@ -425,7 +425,7 @@ struct dma_controller *musbhs_dma_controller_create(struct musb *musb,
 	controller->controller.channel_abort = dma_channel_abort;
 
 	if (request_irq(irq, dma_controller_irq, 0,
-			dev_name(musb->controller), &controller->controller)) {
+			dev_name(musb->controller), controller)) {
 		dev_err(dev, "request_irq %d failed!\n", irq);
 		musb_dma_controller_destroy(&controller->controller);
 
-- 
2.17.1

