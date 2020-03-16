Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 321ED187488
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 22:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732666AbgCPVLm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 17:11:42 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35914 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732656AbgCPVLj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 17:11:39 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBcuW086225;
        Mon, 16 Mar 2020 16:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584393098;
        bh=ONmtI61hTVRXFpGbO1EfT1XNiYZUKV6wQoe/qSeXDoI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=oqq4N+tdEY39ldPttDnv0offhGuLYIgO9QSR3PlMfn8zZLfCx/wM2zgv/SCsbsCev
         hLjN0yWBcfrQxMpr9vXKZ77m64axRIQjDwatM6RYytBPW9QuUwEXeJBoPSZ3FgWT5i
         oz70EY/XoN0dkkn84iHKUJ4b6fy4JD5/s4fUrA90=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02GLBcxD077005
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Mar 2020 16:11:38 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 16:11:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 16:11:37 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBbLh119954;
        Mon, 16 Mar 2020 16:11:37 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 5/8] usb: musb: jz4740: Unconditionally depend on devicetree
Date:   Mon, 16 Mar 2020 16:11:33 -0500
Message-ID: <20200316211136.2274-6-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200316211136.2274-1-b-liu@ti.com>
References: <20200316211136.2274-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

The jz4740-musb driver is unconditionally probed from devicetree, so we
can add a hard dependency on devicetree. This makes the code a bit
cleaner, and is more future-proof as the platform data is now retrieved
using of_device_get_match_data().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/Kconfig  |  1 +
 drivers/usb/musb/jz4740.c | 14 +++++++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index 3268adb7d7cf..3b0d1c20ebe6 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -110,6 +110,7 @@ config USB_MUSB_UX500
 
 config USB_MUSB_JZ4740
 	tristate "JZ4740"
+	depends on OF
 	depends on MIPS || COMPILE_TEST
 	depends on USB_MUSB_GADGET
 	depends on USB=n || USB_OTG_BLACKLIST_HUB
diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 7f813bdaf1d1..22eebe43ae1e 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -166,7 +166,7 @@ static const struct musb_hdrc_platform_data jz4740_musb_pdata = {
 static int jz4740_probe(struct platform_device *pdev)
 {
 	struct device			*dev = &pdev->dev;
-	const struct musb_hdrc_platform_data *pdata = &jz4740_musb_pdata;
+	const struct musb_hdrc_platform_data *pdata;
 	struct platform_device		*musb;
 	struct jz4740_glue		*glue;
 	struct clk			*clk;
@@ -176,6 +176,12 @@ static int jz4740_probe(struct platform_device *pdev)
 	if (!glue)
 		return -ENOMEM;
 
+	pdata = of_device_get_match_data(dev);
+	if (!pdata) {
+		dev_err(dev, "missing platform data");
+		return -EINVAL;
+	}
+
 	musb = platform_device_alloc("musb-hdrc", PLATFORM_DEVID_AUTO);
 	if (!musb) {
 		dev_err(dev, "failed to allocate musb device");
@@ -242,20 +248,18 @@ static int jz4740_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id jz4740_musb_of_match[] = {
-	{ .compatible = "ingenic,jz4740-musb" },
+	{ .compatible = "ingenic,jz4740-musb", .data = &jz4740_musb_pdata },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, jz4740_musb_of_match);
-#endif
 
 static struct platform_driver jz4740_driver = {
 	.probe		= jz4740_probe,
 	.remove		= jz4740_remove,
 	.driver		= {
 		.name	= "musb-jz4740",
-		.of_match_table = of_match_ptr(jz4740_musb_of_match),
+		.of_match_table = jz4740_musb_of_match,
 	},
 };
 
-- 
2.17.1

