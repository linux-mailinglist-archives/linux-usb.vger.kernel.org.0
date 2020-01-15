Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA84713C2AC
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729091AbgAON0B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:26:01 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51348 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbgAONZv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:51 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnqv100010;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=Wlv2+k4Inr/X4dHxvmynD/KAbfMProOMyfybITpPKB8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BKQ13Yfm+dAOXTL9LSqWc2P36P7FaOjiWzkagyDW44NZGZs9AvpuSnOnRxmbxt1qF
         Ur/iJRXM64yY9JpyegrXhOgYMw09/S3N4pH7FJ5EVO1EmxXe9csNQ/wBt4g54FhuiV
         m4kQj/JT1yEZQl/5aJMoCDC1Ymd4Y35+5nv/9h4Q=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPn7h086466
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:49 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm3A066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 12/25] usb: musb: jz4740: Add local dev variable to clean up probe
Date:   Wed, 15 Jan 2020 07:25:34 -0600
Message-ID: <20200115132547.364-13-b-liu@ti.com>
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

From: Paul Cercueil <paul@crapouillou.net>

Clean up the probe function by using a local 'struct device *dev'
variable, instead of referencing &pdev->dev everytime.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/jz4740.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 03c555679e5e..9aca12f99c9f 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -109,36 +109,37 @@ static const struct musb_platform_ops jz4740_musb_ops = {
 
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
 
 	glue->musb			= musb;
 	glue->clk			= clk;
@@ -150,19 +151,19 @@ static int jz4740_probe(struct platform_device *pdev)
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
2.17.1

