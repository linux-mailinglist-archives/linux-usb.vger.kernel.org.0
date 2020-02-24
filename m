Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F603169BDE
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2020 02:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbgBXBka (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Feb 2020 20:40:30 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:48598 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgBXBk3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Feb 2020 20:40:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582508423; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GObN9rhaFO9t/i2pLNrh4fBLu0SZEBlNmPj4z+RrW3I=;
        b=MNy3b7n1bvLadwjh362n6BG/743PuiKjzxC22Uvh+1arKfDI7kWdRiuQsl6JBesFcXuXWo
        sEcAi7/VVX2cRQqkjwN9THBcbT07qUSo0tnmdUPEFkYMl0qsaHv1DCcRsD4vkdZ8Fl2qiC
        2903t0/4gA/SA9PUEFsvQe4BVMTEc1g=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     od@zcrc.me, linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v2 2/5] usb: musb: jz4740: Add support for DMA
Date:   Sun, 23 Feb 2020 22:40:05 -0300
Message-Id: <20200224014008.27114-2-paul@crapouillou.net>
In-Reply-To: <20200224014008.27114-1-paul@crapouillou.net>
References: <20200224014008.27114-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for using the DMA channels built into the Inventra IP.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v2: No change

 drivers/usb/musb/Kconfig  |  2 +-
 drivers/usb/musb/jz4740.c | 20 ++++++++++++++------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index eb2ded1026ee..c4b349e074c1 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -144,7 +144,7 @@ config USB_UX500_DMA
 
 config USB_INVENTRA_DMA
 	bool 'Inventra'
-	depends on USB_MUSB_OMAP2PLUS || USB_MUSB_MEDIATEK
+	depends on USB_MUSB_OMAP2PLUS || USB_MUSB_MEDIATEK || USB_MUSB_JZ4740
 	help
 	  Enable DMA transfers using Mentor's engine.
 
diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index bc0109f4700b..aa32b5af0c1f 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -24,11 +24,14 @@ struct jz4740_glue {
 static irqreturn_t jz4740_musb_interrupt(int irq, void *__hci)
 {
 	unsigned long	flags;
-	irqreturn_t	retval = IRQ_NONE;
+	irqreturn_t	retval = IRQ_NONE, retval_dma = IRQ_NONE;
 	struct musb	*musb = __hci;
 
 	spin_lock_irqsave(&musb->lock, flags);
 
+	if (IS_ENABLED(CONFIG_USB_INVENTRA_DMA) && musb->dma_controller)
+		retval_dma = dma_controller_irq(irq, musb->dma_controller);
+
 	musb->int_usb = musb_readb(musb->mregs, MUSB_INTRUSB);
 	musb->int_tx = musb_readw(musb->mregs, MUSB_INTRTX);
 	musb->int_rx = musb_readw(musb->mregs, MUSB_INTRRX);
@@ -46,7 +49,10 @@ static irqreturn_t jz4740_musb_interrupt(int irq, void *__hci)
 
 	spin_unlock_irqrestore(&musb->lock, flags);
 
-	return retval;
+	if (retval == IRQ_HANDLED || retval_dma == IRQ_HANDLED)
+		return IRQ_HANDLED;
+
+	return IRQ_NONE;
 }
 
 static struct musb_fifo_cfg jz4740_musb_fifo_cfg[] = {
@@ -93,14 +99,14 @@ static int jz4740_musb_init(struct musb *musb)
 	return 0;
 }
 
-/*
- * DMA has not been confirmed to work with CONFIG_USB_INVENTRA_DMA,
- * so let's not set up the dma function pointers yet.
- */
 static const struct musb_platform_ops jz4740_musb_ops = {
 	.quirks		= MUSB_DMA_INVENTRA | MUSB_INDEXED_EP,
 	.fifo_mode	= 2,
 	.init		= jz4740_musb_init,
+#ifdef CONFIG_USB_INVENTRA_DMA
+	.dma_init	= musbhs_dma_controller_create_noirq,
+	.dma_exit	= musbhs_dma_controller_destroy,
+#endif
 };
 
 static const struct musb_hdrc_platform_data jz4740_musb_pdata = {
@@ -142,6 +148,8 @@ static int jz4740_probe(struct platform_device *pdev)
 	}
 
 	musb->dev.parent		= dev;
+	musb->dev.dma_mask		= &musb->dev.coherent_dma_mask;
+	musb->dev.coherent_dma_mask	= DMA_BIT_MASK(32);
 
 	glue->pdev			= musb;
 	glue->clk			= clk;
-- 
2.25.0

