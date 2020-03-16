Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9BA187489
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 22:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732668AbgCPVLp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 17:11:45 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:48418 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732656AbgCPVLp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 17:11:45 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBbTC052382;
        Mon, 16 Mar 2020 16:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584393097;
        bh=1KBh4DoM6jfc2UTXBoUUdKcbbc740CIcdm2uBWclaFg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JOxYOmv/KThifYjLFlbgd7aSkLkcbw+ca/jdgLM2A8tVauGVLm8K/t03WH4ep6mUa
         t+To+AmxfobpA6/4GlALYnSZnfkPW66bzjo/hCO8Mm1RcqvQeN+AgeoHOplP+7eluk
         BKsYfYmpLJJaA+RBoJLU6uSqoJGrS2TenQilreb4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02GLBbmt024275
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Mar 2020 16:11:37 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 16:11:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 16:11:37 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBbLg119954;
        Mon, 16 Mar 2020 16:11:37 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 4/8] usb: musb: jz4740: Register USB role switch
Date:   Mon, 16 Mar 2020 16:11:32 -0500
Message-ID: <20200316211136.2274-5-b-liu@ti.com>
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

Register a USB role switch, in order to get notified by the connector
driver when the USB role changes. The notification is then transmitted
to the PHY.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/Kconfig  |  1 +
 drivers/usb/musb/jz4740.c | 48 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index c4b349e074c1..3268adb7d7cf 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -113,6 +113,7 @@ config USB_MUSB_JZ4740
 	depends on MIPS || COMPILE_TEST
 	depends on USB_MUSB_GADGET
 	depends on USB=n || USB_OTG_BLACKLIST_HUB
+	select USB_ROLE_SWITCH
 
 config USB_MUSB_MEDIATEK
 	tristate "MediaTek platforms"
diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index aa32b5af0c1f..7f813bdaf1d1 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -12,13 +12,16 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/usb/role.h>
 #include <linux/usb/usb_phy_generic.h>
 
 #include "musb_core.h"
 
 struct jz4740_glue {
 	struct platform_device	*pdev;
+	struct musb		*musb;
 	struct clk		*clk;
+	struct usb_role_switch	*role_sw;
 };
 
 static irqreturn_t jz4740_musb_interrupt(int irq, void *__hci)
@@ -72,11 +75,40 @@ static const struct musb_hdrc_config jz4740_musb_config = {
 	.fifo_cfg_size	= ARRAY_SIZE(jz4740_musb_fifo_cfg),
 };
 
+static int jz4740_musb_role_switch_set(struct usb_role_switch *sw,
+				       enum usb_role role)
+{
+	struct jz4740_glue *glue = usb_role_switch_get_drvdata(sw);
+	struct usb_phy *phy = glue->musb->xceiv;
+
+	switch (role) {
+	case USB_ROLE_NONE:
+		atomic_notifier_call_chain(&phy->notifier, USB_EVENT_NONE, phy);
+		break;
+	case USB_ROLE_DEVICE:
+		atomic_notifier_call_chain(&phy->notifier, USB_EVENT_VBUS, phy);
+		break;
+	case USB_ROLE_HOST:
+		atomic_notifier_call_chain(&phy->notifier, USB_EVENT_ID, phy);
+		break;
+	}
+
+	return 0;
+}
+
 static int jz4740_musb_init(struct musb *musb)
 {
 	struct device *dev = musb->controller->parent;
+	struct jz4740_glue *glue = dev_get_drvdata(dev);
+	struct usb_role_switch_desc role_sw_desc = {
+		.set = jz4740_musb_role_switch_set,
+		.driver_data = glue,
+		.fwnode = dev_fwnode(dev),
+	};
 	int err;
 
+	glue->musb = musb;
+
 	if (dev->of_node)
 		musb->xceiv = devm_usb_get_phy_by_phandle(dev, "phys", 0);
 	else
@@ -88,6 +120,12 @@ static int jz4740_musb_init(struct musb *musb)
 		return err;
 	}
 
+	glue->role_sw = usb_role_switch_register(dev, &role_sw_desc);
+	if (IS_ERR(glue->role_sw)) {
+		dev_err(dev, "Failed to register USB role switch");
+		return PTR_ERR(glue->role_sw);
+	}
+
 	/*
 	 * Silicon does not implement ConfigData register.
 	 * Set dyn_fifo to avoid reading EP config from hardware.
@@ -99,10 +137,20 @@ static int jz4740_musb_init(struct musb *musb)
 	return 0;
 }
 
+static int jz4740_musb_exit(struct musb *musb)
+{
+	struct jz4740_glue *glue = dev_get_drvdata(musb->controller->parent);
+
+	usb_role_switch_unregister(glue->role_sw);
+
+	return 0;
+}
+
 static const struct musb_platform_ops jz4740_musb_ops = {
 	.quirks		= MUSB_DMA_INVENTRA | MUSB_INDEXED_EP,
 	.fifo_mode	= 2,
 	.init		= jz4740_musb_init,
+	.exit		= jz4740_musb_exit,
 #ifdef CONFIG_USB_INVENTRA_DMA
 	.dma_init	= musbhs_dma_controller_create_noirq,
 	.dma_exit	= musbhs_dma_controller_destroy,
-- 
2.17.1

