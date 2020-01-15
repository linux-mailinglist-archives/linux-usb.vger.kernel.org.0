Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F05313C2A1
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgAONZw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:25:52 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51346 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbgAONZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:50 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPn5Z100006;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=Yf/J6iht2corlOWu2FBkiHE9x3QCTxDg3ic6t+CvvX8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=bNyvSq8pf71om+eEgemmTXzK7nNoUHtw6zP7SEUleyzrz837FnaNSU6AFTE6cTtFn
         47jl7k61/jRfcXT2CDzR5MZNSvIcFm/VyAeoYsDlVqQ0zfOy/FmNe/1VoR91lMeglZ
         DvFKIOIoTf6x2gnE8y4/ldlz3u69iqXebtyBWIxk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPnXD086463
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:49 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm3B066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 13/25] usb: musb: jz4740: Constify jz4740_musb_pdata struct
Date:   Wed, 15 Jan 2020 07:25:35 -0600
Message-ID: <20200115132547.364-14-b-liu@ti.com>
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

By moving around the jz4740_musb_pdata structure, we can have the
.platform_ops field initialized, so that we don't have to initialize it
manually in the probe function. Therefore, the struct can be const now.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/jz4740.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 9aca12f99c9f..1400e5763d44 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -66,11 +66,6 @@ static const struct musb_hdrc_config jz4740_musb_config = {
 	.fifo_cfg_size = ARRAY_SIZE(jz4740_musb_fifo_cfg),
 };
 
-static struct musb_hdrc_platform_data jz4740_musb_platform_data = {
-	.mode   = MUSB_PERIPHERAL,
-	.config = &jz4740_musb_config,
-};
-
 static int jz4740_musb_init(struct musb *musb)
 {
 	struct device *dev = musb->controller->parent;
@@ -107,10 +102,16 @@ static const struct musb_platform_ops jz4740_musb_ops = {
 	.init		= jz4740_musb_init,
 };
 
+static const struct musb_hdrc_platform_data jz4740_musb_pdata = {
+	.mode		= MUSB_PERIPHERAL,
+	.config		= &jz4740_musb_config,
+	.platform_ops	= &jz4740_musb_ops,
+};
+
 static int jz4740_probe(struct platform_device *pdev)
 {
 	struct device			*dev = &pdev->dev;
-	struct musb_hdrc_platform_data	*pdata = &jz4740_musb_platform_data;
+	const struct musb_hdrc_platform_data *pdata = &jz4740_musb_pdata;
 	struct platform_device		*musb;
 	struct jz4740_glue		*glue;
 	struct clk                      *clk;
@@ -144,8 +145,6 @@ static int jz4740_probe(struct platform_device *pdev)
 	glue->musb			= musb;
 	glue->clk			= clk;
 
-	pdata->platform_ops		= &jz4740_musb_ops;
-
 	platform_set_drvdata(pdev, glue);
 
 	ret = platform_device_add_resources(musb, pdev->resource,
-- 
2.17.1

