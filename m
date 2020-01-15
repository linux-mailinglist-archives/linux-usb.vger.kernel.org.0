Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE7C313C2A9
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbgAONZ5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:25:57 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53866 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729058AbgAONZv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:51 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPoJX073262;
        Wed, 15 Jan 2020 07:25:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094750;
        bh=WyWKeC5Icb3f7mD/8/JyPUeLRi9B+VFyFiUeOuelIRE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=H265pzIcUuHKSoKPfBT79HJjLrZ4WoxcgXJm9/BMD8EaCiWCBaP38fhEBPiVP62Fv
         wqsaE61gTUMxHJaGuJbnFNLWXxhKyGyuHeZMsvSZfLMvLsi5QbLClB3LDimduQWXx0
         5M+2h3xHHiyxnUuFPs8TnsGZeBmNSJL+o7bm0vb0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPojm018817;
        Wed, 15 Jan 2020 07:25:50 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm3J066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 21/25] usb: musb: Add noirq type of dma create interface
Date:   Wed, 15 Jan 2020 07:25:43 -0600
Message-ID: <20200115132547.364-22-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115132547.364-1-b-liu@ti.com>
References: <20200115132547.364-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Min Guo <min.guo@mediatek.com>

Add noirq type of dma create interface for platform which do not
have dedicated DMA interrupt line, move musbhsdma macro definition
to musb_dma.h

Signed-off-by: Min Guo <min.guo@mediatek.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musb_dma.h  |  9 ++++++
 drivers/usb/musb/musbhsdma.c | 54 ++++++++++++++++++++++++------------
 2 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/musb/musb_dma.h b/drivers/usb/musb/musb_dma.h
index 8f60271c0a9d..4b4d8dc5d3f2 100644
--- a/drivers/usb/musb/musb_dma.h
+++ b/drivers/usb/musb/musb_dma.h
@@ -35,6 +35,12 @@ struct musb_hw_ep;
  *    whether shared with the Inventra core or separate.
  */
 
+#define MUSB_HSDMA_BASE		0x200
+#define MUSB_HSDMA_INTR		(MUSB_HSDMA_BASE + 0)
+#define MUSB_HSDMA_CONTROL	0x4
+#define MUSB_HSDMA_ADDRESS	0x8
+#define MUSB_HSDMA_COUNT	0xc
+
 #define	DMA_ADDR_INVALID	(~(dma_addr_t)0)
 
 #ifdef CONFIG_MUSB_PIO_ONLY
@@ -191,6 +197,9 @@ extern void (*musb_dma_controller_destroy)(struct dma_controller *);
 extern struct dma_controller *
 musbhs_dma_controller_create(struct musb *musb, void __iomem *base);
 extern void musbhs_dma_controller_destroy(struct dma_controller *c);
+extern struct dma_controller *
+musbhs_dma_controller_create_noirq(struct musb *musb, void __iomem *base);
+extern irqreturn_t dma_controller_irq(int irq, void *private_data);
 
 extern struct dma_controller *
 tusb_dma_controller_create(struct musb *musb, void __iomem *base);
diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
index 2d3751d885b4..bcc0fbf42ba8 100644
--- a/drivers/usb/musb/musbhsdma.c
+++ b/drivers/usb/musb/musbhsdma.c
@@ -10,12 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include "musb_core.h"
-
-#define MUSB_HSDMA_BASE		0x200
-#define MUSB_HSDMA_INTR		(MUSB_HSDMA_BASE + 0)
-#define MUSB_HSDMA_CONTROL		0x4
-#define MUSB_HSDMA_ADDRESS		0x8
-#define MUSB_HSDMA_COUNT		0xc
+#include "musb_dma.h"
 
 #define MUSB_HSDMA_CHANNEL_OFFSET(_bchannel, _offset)		\
 		(MUSB_HSDMA_BASE + (_bchannel << 4) + _offset)
@@ -268,7 +263,7 @@ static int dma_channel_abort(struct dma_channel *channel)
 	return 0;
 }
 
-static irqreturn_t dma_controller_irq(int irq, void *private_data)
+irqreturn_t dma_controller_irq(int irq, void *private_data)
 {
 	struct musb_dma_controller *controller = private_data;
 	struct musb *musb = controller->private_data;
@@ -383,6 +378,7 @@ static irqreturn_t dma_controller_irq(int irq, void *private_data)
 	spin_unlock_irqrestore(&musb->lock, flags);
 	return retval;
 }
+EXPORT_SYMBOL_GPL(dma_controller_irq);
 
 void musbhs_dma_controller_destroy(struct dma_controller *c)
 {
@@ -398,18 +394,10 @@ void musbhs_dma_controller_destroy(struct dma_controller *c)
 }
 EXPORT_SYMBOL_GPL(musbhs_dma_controller_destroy);
 
-struct dma_controller *musbhs_dma_controller_create(struct musb *musb,
-						    void __iomem *base)
+static struct musb_dma_controller *
+dma_controller_alloc(struct musb *musb, void __iomem *base)
 {
 	struct musb_dma_controller *controller;
-	struct device *dev = musb->controller;
-	struct platform_device *pdev = to_platform_device(dev);
-	int irq = platform_get_irq_byname(pdev, "dma");
-
-	if (irq <= 0) {
-		dev_err(dev, "No DMA interrupt line!\n");
-		return NULL;
-	}
 
 	controller = kzalloc(sizeof(*controller), GFP_KERNEL);
 	if (!controller)
@@ -423,6 +411,25 @@ struct dma_controller *musbhs_dma_controller_create(struct musb *musb,
 	controller->controller.channel_release = dma_channel_release;
 	controller->controller.channel_program = dma_channel_program;
 	controller->controller.channel_abort = dma_channel_abort;
+	return controller;
+}
+
+struct dma_controller *
+musbhs_dma_controller_create(struct musb *musb, void __iomem *base)
+{
+	struct musb_dma_controller *controller;
+	struct device *dev = musb->controller;
+	struct platform_device *pdev = to_platform_device(dev);
+	int irq = platform_get_irq_byname(pdev, "dma");
+
+	if (irq <= 0) {
+		dev_err(dev, "No DMA interrupt line!\n");
+		return NULL;
+	}
+
+	controller = dma_controller_alloc(musb, base);
+	if (!controller)
+		return NULL;
 
 	if (request_irq(irq, dma_controller_irq, 0,
 			dev_name(musb->controller), controller)) {
@@ -437,3 +444,16 @@ struct dma_controller *musbhs_dma_controller_create(struct musb *musb,
 	return &controller->controller;
 }
 EXPORT_SYMBOL_GPL(musbhs_dma_controller_create);
+
+struct dma_controller *
+musbhs_dma_controller_create_noirq(struct musb *musb, void __iomem *base)
+{
+	struct musb_dma_controller *controller;
+
+	controller = dma_controller_alloc(musb, base);
+	if (!controller)
+		return NULL;
+
+	return &controller->controller;
+}
+EXPORT_SYMBOL_GPL(musbhs_dma_controller_create_noirq);
-- 
2.17.1

