Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 706CA11F4C4
	for <lists+linux-usb@lfdr.de>; Sat, 14 Dec 2019 23:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfLNWLk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Dec 2019 17:11:40 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:54858 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbfLNWLk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Dec 2019 17:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1576361492; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+zQHJ3gLit5IhLe/zuHFmWxfhYl3+WSX+PcJve0AmrY=;
        b=EOgd/lazTYooj/nA4HGGpKIVi+4Lm4d1uDm+Za7Qe7UDHYCDN0wZsT17r05PzgRBq8izs3
        FsATWUUoe6ZyN+WoyP5B3KyDmcJ2solVmtCqoGlmghiGbIsVy5dvdrTWZIxnAgGSxD2Sfs
        e1EtivSMM/+N76cX2oSK6jOIXuWYdVk=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     od@zcrc.me, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/6] usb: musb: jz4740: Add local dev variable to clean up probe
Date:   Sat, 14 Dec 2019 23:11:22 +0100
Message-Id: <20191214221126.93116-2-paul@crapouillou.net>
In-Reply-To: <20191214221126.93116-1-paul@crapouillou.net>
References: <20191214221126.93116-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Clean up the probe function by using a local 'struct device *dev'
variable, instead of referencing &pdev->dev everytime.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/musb/jz4740.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 16d4120ba145..b31b028e5ee7 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -116,36 +116,37 @@ static const struct musb_platform_ops jz4740_musb_ops = {
 
 static int jz4740_probe(struct platform_device *pdev)
 {
+	struct device			*dev = &pdev->dev;
 	struct musb_hdrc_platform_data	*pdata = &jz4740_musb_platform_data;
 	struct platform_device		*musb;
 	struct jz4740_glue		*glue;
 	struct clk                      *clk;
 	int				ret;
 
-	glue = devm_kzalloc(&pdev->dev, sizeof(*glue), GFP_KERNEL);
+	glue = devm_kzalloc(dev, sizeof(*glue), GFP_KERNEL);
 	if (!glue)
 		return -ENOMEM;
 
 	musb = platform_device_alloc("musb-hdrc", PLATFORM_DEVID_AUTO);
 	if (!musb) {
-		dev_err(&pdev->dev, "failed to allocate musb device\n");
+		dev_err(dev, "failed to allocate musb device");
 		return -ENOMEM;
 	}
 
-	clk = devm_clk_get(&pdev->dev, "udc");
+	clk = devm_clk_get(dev, "udc");
 	if (IS_ERR(clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
+		dev_err(dev, "failed to get clock");
 		ret = PTR_ERR(clk);
 		goto err_platform_device_put;
 	}
 
 	ret = clk_prepare_enable(clk);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to enable clock\n");
+		dev_err(dev, "failed to enable clock");
 		goto err_platform_device_put;
 	}
 
-	musb->dev.parent		= &pdev->dev;
+	musb->dev.parent		= dev;
 	musb->dev.dma_mask		= &musb->dev.coherent_dma_mask;
 	musb->dev.coherent_dma_mask	= DMA_BIT_MASK(32);
 
@@ -159,19 +160,19 @@ static int jz4740_probe(struct platform_device *pdev)
 	ret = platform_device_add_resources(musb, pdev->resource,
 					    pdev->num_resources);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to add resources\n");
+		dev_err(dev, "failed to add resources");
 		goto err_clk_disable;
 	}
 
 	ret = platform_device_add_data(musb, pdata, sizeof(*pdata));
 	if (ret) {
-		dev_err(&pdev->dev, "failed to add platform_data\n");
+		dev_err(dev, "failed to add platform_data");
 		goto err_clk_disable;
 	}
 
 	ret = platform_device_add(musb);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register musb device\n");
+		dev_err(dev, "failed to register musb device");
 		goto err_clk_disable;
 	}
 
-- 
2.24.0

