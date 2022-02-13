Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0194B3B7C
	for <lists+linux-usb@lfdr.de>; Sun, 13 Feb 2022 14:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236169AbiBMNF6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Feb 2022 08:05:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236161AbiBMNF5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Feb 2022 08:05:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 40D175B88E
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 05:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644757551;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MdaT+Ez5YT/CHAs9bbKyNuiCjdqbvspAYl8e3zW7vf0=;
        b=a5m7A3EYDtJSVZhRoqZ9E8oNYqqf3MqZKwJHSCGpxTRw7IJNAFrq9bDZnXJN9Zyxq5tVux
        7QTRVjW2yOdIqV8Or1+HcqLrVXmLyfl0jIxvNSwUN+ikc1tipYAVjZ7xblVeKPaygDgtBY
        drWmb8B0MPVmThI2mmjciz1LhkfNgD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-GoDPmHT8O1uZxfp7lql-kg-1; Sun, 13 Feb 2022 08:05:45 -0500
X-MC-Unique: GoDPmHT8O1uZxfp7lql-kg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A354A1091DA1;
        Sun, 13 Feb 2022 13:05:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.92])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 150A47B9F7;
        Sun, 13 Feb 2022 13:05:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 6/9] phy: ti: tusb1210: Improve ulpi_read()/_write() error checking
Date:   Sun, 13 Feb 2022 14:05:21 +0100
Message-Id: <20220213130524.18748-7-hdegoede@redhat.com>
In-Reply-To: <20220213130524.18748-1-hdegoede@redhat.com>
References: <20220213130524.18748-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

ulpi_read() and ulpi_write() calls can fail. Add wrapper functions to log
errors when this happens and add error checking to the read + write of
the phy parameters from the TUSB1210_VENDOR_SPECIFIC2 register.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/phy/ti/phy-tusb1210.c | 62 +++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/ti/phy-tusb1210.c b/drivers/phy/ti/phy-tusb1210.c
index 15c1c79e5c29..bf7793afdc84 100644
--- a/drivers/phy/ti/phy-tusb1210.c
+++ b/drivers/phy/ti/phy-tusb1210.c
@@ -26,6 +26,33 @@ struct tusb1210 {
 	u8 vendor_specific2;
 };
 
+static int tusb1210_ulpi_write(struct tusb1210 *tusb, u8 reg, u8 val)
+{
+	int ret;
+
+	ret = ulpi_write(tusb->ulpi, reg, val);
+	if (ret)
+		dev_err(&tusb->ulpi->dev, "error %d writing val 0x%02x to reg 0x%02x\n",
+			ret, val, reg);
+
+	return ret;
+}
+
+static int tusb1210_ulpi_read(struct tusb1210 *tusb, u8 reg, u8 *val)
+{
+	int ret;
+
+	ret = ulpi_read(tusb->ulpi, reg);
+	if (ret >= 0) {
+		*val = ret;
+		ret = 0;
+	} else {
+		dev_err(&tusb->ulpi->dev, "error %d reading reg 0x%02x\n", ret, reg);
+	}
+
+	return ret;
+}
+
 static int tusb1210_power_on(struct phy *phy)
 {
 	struct tusb1210 *tusb = phy_get_drvdata(phy);
@@ -35,8 +62,8 @@ static int tusb1210_power_on(struct phy *phy)
 
 	/* Restore the optional eye diagram optimization value */
 	if (tusb->vendor_specific2)
-		ulpi_write(tusb->ulpi, TUSB1210_VENDOR_SPECIFIC2,
-			   tusb->vendor_specific2);
+		return tusb1210_ulpi_write(tusb, TUSB1210_VENDOR_SPECIFIC2,
+					   tusb->vendor_specific2);
 
 	return 0;
 }
@@ -55,33 +82,34 @@ static int tusb1210_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct tusb1210 *tusb = phy_get_drvdata(phy);
 	int ret;
+	u8 reg;
 
-	ret = ulpi_read(tusb->ulpi, ULPI_OTG_CTRL);
+	ret = tusb1210_ulpi_read(tusb, ULPI_OTG_CTRL, &reg);
 	if (ret < 0)
 		return ret;
 
 	switch (mode) {
 	case PHY_MODE_USB_HOST:
-		ret |= (ULPI_OTG_CTRL_DRVVBUS_EXT
+		reg |= (ULPI_OTG_CTRL_DRVVBUS_EXT
 			| ULPI_OTG_CTRL_ID_PULLUP
 			| ULPI_OTG_CTRL_DP_PULLDOWN
 			| ULPI_OTG_CTRL_DM_PULLDOWN);
-		ulpi_write(tusb->ulpi, ULPI_OTG_CTRL, ret);
-		ret |= ULPI_OTG_CTRL_DRVVBUS;
+		tusb1210_ulpi_write(tusb, ULPI_OTG_CTRL, reg);
+		reg |= ULPI_OTG_CTRL_DRVVBUS;
 		break;
 	case PHY_MODE_USB_DEVICE:
-		ret &= ~(ULPI_OTG_CTRL_DRVVBUS
+		reg &= ~(ULPI_OTG_CTRL_DRVVBUS
 			 | ULPI_OTG_CTRL_DP_PULLDOWN
 			 | ULPI_OTG_CTRL_DM_PULLDOWN);
-		ulpi_write(tusb->ulpi, ULPI_OTG_CTRL, ret);
-		ret &= ~ULPI_OTG_CTRL_DRVVBUS_EXT;
+		tusb1210_ulpi_write(tusb, ULPI_OTG_CTRL, reg);
+		reg &= ~ULPI_OTG_CTRL_DRVVBUS_EXT;
 		break;
 	default:
 		/* nothing */
 		return 0;
 	}
 
-	return ulpi_write(tusb->ulpi, ULPI_OTG_CTRL, ret);
+	return tusb1210_ulpi_write(tusb, ULPI_OTG_CTRL, reg);
 }
 
 static const struct phy_ops phy_ops = {
@@ -95,11 +123,14 @@ static int tusb1210_probe(struct ulpi *ulpi)
 {
 	struct tusb1210 *tusb;
 	u8 val, reg;
+	int ret;
 
 	tusb = devm_kzalloc(&ulpi->dev, sizeof(*tusb), GFP_KERNEL);
 	if (!tusb)
 		return -ENOMEM;
 
+	tusb->ulpi = ulpi;
+
 	tusb->gpio_reset = devm_gpiod_get_optional(&ulpi->dev, "reset",
 						   GPIOD_OUT_LOW);
 	if (IS_ERR(tusb->gpio_reset))
@@ -119,7 +150,9 @@ static int tusb1210_probe(struct ulpi *ulpi)
 	 * diagram optimization and DP/DM swap.
 	 */
 
-	reg = ulpi_read(ulpi, TUSB1210_VENDOR_SPECIFIC2);
+	ret = tusb1210_ulpi_read(tusb, TUSB1210_VENDOR_SPECIFIC2, &reg);
+	if (ret)
+		return ret;
 
 	/* High speed output drive strength configuration */
 	if (!device_property_read_u8(&ulpi->dev, "ihstx", &val))
@@ -133,15 +166,16 @@ static int tusb1210_probe(struct ulpi *ulpi)
 	if (!device_property_read_u8(&ulpi->dev, "datapolarity", &val))
 		u8p_replace_bits(&reg, val, (u8)TUSB1210_VENDOR_SPECIFIC2_DP_MASK);
 
-	ulpi_write(ulpi, TUSB1210_VENDOR_SPECIFIC2, reg);
+	ret = tusb1210_ulpi_write(tusb, TUSB1210_VENDOR_SPECIFIC2, reg);
+	if (ret)
+		return ret;
+
 	tusb->vendor_specific2 = reg;
 
 	tusb->phy = ulpi_phy_create(ulpi, &phy_ops);
 	if (IS_ERR(tusb->phy))
 		return PTR_ERR(tusb->phy);
 
-	tusb->ulpi = ulpi;
-
 	phy_set_drvdata(tusb->phy, tusb);
 	ulpi_set_drvdata(ulpi, tusb);
 	return 0;
-- 
2.33.1

