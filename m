Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98825118EA1
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 18:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbfLJRLZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 12:11:25 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:44592 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbfLJRLZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 12:11:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1575997876; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GCB2kEfKlMoJDOKt8Tg1TaktvZregxG9Kvxvr/Rr6Ks=;
        b=u/T7YqBHCd/741IVEz1Bf0jbIzQoapW08VpmqohOpNwt3DuMbv+6BJGVL/9WEcI91gjZwG
        lm9BVFXr/a26nI1rF2j+eJYEFa4s1GowWhO+xy0mfmMgY4qq3Ums7SBIZxGOXC3hj+bpfs
        AGRkc1kvoGdcxzWgb6R7+7AkQGv4sAU=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     od@zcrc.me, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v3 2/7] usb: musb: dma: Add support for shared IRQ
Date:   Tue, 10 Dec 2019 18:11:05 +0100
Message-Id: <20191210171110.62141-2-paul@crapouillou.net>
In-Reply-To: <20191210171110.62141-1-paul@crapouillou.net>
References: <20191210171110.62141-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The implementation of the Inventra IP in some of the Ingenic JZ47xx SoCs
does not use a separate IRQ line for DMA transfers.

Allow these SoCs to be supported by adding a flag 'dma_share_usb_irq'
in the struct musb. If set, no extra IRQ line is required, and the musb
glue will need to call the API function musbhs_dma_controller_irq()
within its interrupt handler.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v2: Rebase on 5.4-rc4
    v3: Rebase on 5.5-rc1

 drivers/usb/musb/musb_core.h |  2 ++
 drivers/usb/musb/musb_dma.h  |  1 +
 drivers/usb/musb/musbhsdma.c | 27 ++++++++++++++++++++++-----
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
index 04203b7126d5..b7c31c717800 100644
--- a/drivers/usb/musb/musb_core.h
+++ b/drivers/usb/musb/musb_core.h
@@ -392,6 +392,8 @@ struct musb {
 
 	unsigned		flush_irq_work:1;
 
+	unsigned		dma_share_usb_irq:1;
+
 	u8			address;
 	u8			test_mode_nr;
 	u16			ackpend;		/* ep0 */
diff --git a/drivers/usb/musb/musb_dma.h b/drivers/usb/musb/musb_dma.h
index 8f60271c0a9d..b3f65016a972 100644
--- a/drivers/usb/musb/musb_dma.h
+++ b/drivers/usb/musb/musb_dma.h
@@ -191,6 +191,7 @@ extern void (*musb_dma_controller_destroy)(struct dma_controller *);
 extern struct dma_controller *
 musbhs_dma_controller_create(struct musb *musb, void __iomem *base);
 extern void musbhs_dma_controller_destroy(struct dma_controller *c);
+extern irqreturn_t musbhs_dma_controller_irq(struct dma_controller *c);
 
 extern struct dma_controller *
 tusb_dma_controller_create(struct musb *musb, void __iomem *base);
diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
index 2d3751d885b4..898856e9974e 100644
--- a/drivers/usb/musb/musbhsdma.c
+++ b/drivers/usb/musb/musbhsdma.c
@@ -268,7 +268,7 @@ static int dma_channel_abort(struct dma_channel *channel)
 	return 0;
 }
 
-static irqreturn_t dma_controller_irq(int irq, void *private_data)
+static irqreturn_t dma_controller_irq_cb(int irq, void *private_data)
 {
 	struct musb_dma_controller *controller = private_data;
 	struct musb *musb = controller->private_data;
@@ -292,6 +292,9 @@ static irqreturn_t dma_controller_irq(int irq, void *private_data)
 	int_hsdma = musb_readb(mbase, MUSB_HSDMA_INTR);
 
 	if (!int_hsdma) {
+		if (musb->dma_share_usb_irq)
+			goto done;
+
 		musb_dbg(musb, "spurious DMA irq");
 
 		for (bchannel = 0; bchannel < MUSB_HSDMA_CHANNELS; bchannel++) {
@@ -384,6 +387,15 @@ static irqreturn_t dma_controller_irq(int irq, void *private_data)
 	return retval;
 }
 
+irqreturn_t musbhs_dma_controller_irq(struct dma_controller *c)
+{
+	struct musb_dma_controller *controller = container_of(c,
+			struct musb_dma_controller, controller);
+
+	return dma_controller_irq_cb(controller->irq, controller);
+}
+EXPORT_SYMBOL_GPL(musbhs_dma_controller_irq);
+
 void musbhs_dma_controller_destroy(struct dma_controller *c)
 {
 	struct musb_dma_controller *controller = container_of(c,
@@ -404,9 +416,14 @@ struct dma_controller *musbhs_dma_controller_create(struct musb *musb,
 	struct musb_dma_controller *controller;
 	struct device *dev = musb->controller;
 	struct platform_device *pdev = to_platform_device(dev);
-	int irq = platform_get_irq_byname(pdev, "dma");
+	int irq;
+
+	if (musb->dma_share_usb_irq)
+		irq = 0;
+	else
+		irq = platform_get_irq_byname(pdev, "dma");
 
-	if (irq <= 0) {
+	if (irq < 0) {
 		dev_err(dev, "No DMA interrupt line!\n");
 		return NULL;
 	}
@@ -424,8 +441,8 @@ struct dma_controller *musbhs_dma_controller_create(struct musb *musb,
 	controller->controller.channel_program = dma_channel_program;
 	controller->controller.channel_abort = dma_channel_abort;
 
-	if (request_irq(irq, dma_controller_irq, 0,
-			dev_name(musb->controller), controller)) {
+	if (irq > 0 && request_irq(irq, dma_controller_irq_cb, 0,
+				   dev_name(musb->controller), controller)) {
 		dev_err(dev, "request_irq %d failed!\n", irq);
 		musb_dma_controller_destroy(&controller->controller);
 
-- 
2.24.0

