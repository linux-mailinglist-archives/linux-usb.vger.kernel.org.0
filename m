Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0783F120F33
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2019 17:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfLPQT1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Dec 2019 11:19:27 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44630 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfLPQT0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Dec 2019 11:19:26 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBGGJPkW106013;
        Mon, 16 Dec 2019 10:19:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576513165;
        bh=FFOrGeAuRo555BWK2j9ZJimAfD8hzUwNJfablXebSfE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hvRpK3aW678NoOQ0oeD+kteyKqMVIt3dIxBfR5B07+Di5x80VqAQ0ek3fufCl3Dtf
         Y+OLOo15nthYh42yDqq6hj0ohrgm+7MJNLzdISy6ndm6vfF9cEMmjAe7CxV2GoT906
         n0EtMLPplz5/HtgQRGcDZuzq7X/iAHa1gs17FvWA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBGGJP3D007148
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Dec 2019 10:19:25 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Dec 2019 10:19:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Dec 2019 10:19:25 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGGJO5d105067;
        Mon, 16 Dec 2019 10:19:24 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 2/2] usb: musb: jz4740: Silence error if code is -EPROBE_DEFER
Date:   Mon, 16 Dec 2019 10:18:44 -0600
Message-ID: <20191216161844.772-3-b-liu@ti.com>
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

Avoid printing any error message if the error code is -EPROBE_DEFER.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/musb/jz4740.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 5261f8dfedec..e3b8c84ccdb8 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -75,14 +75,17 @@ static struct musb_hdrc_platform_data jz4740_musb_platform_data = {
 static int jz4740_musb_init(struct musb *musb)
 {
 	struct device *dev = musb->controller->parent;
+	int err;
 
 	if (dev->of_node)
 		musb->xceiv = devm_usb_get_phy_by_phandle(dev, "phys", 0);
 	else
 		musb->xceiv = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
 	if (IS_ERR(musb->xceiv)) {
-		dev_err(dev, "No transceiver configured\n");
-		return PTR_ERR(musb->xceiv);
+		err = PTR_ERR(musb->xceiv);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "No transceiver configured: %d", err);
+		return err;
 	}
 
 	/* Silicon does not implement ConfigData register.
-- 
2.17.1

