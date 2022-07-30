Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDAD585B7A
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jul 2022 20:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235053AbiG3SFY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Jul 2022 14:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiG3SFW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 30 Jul 2022 14:05:22 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 148F1DFD1
        for <linux-usb@vger.kernel.org>; Sat, 30 Jul 2022 11:05:20 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3F20684070;
        Sat, 30 Jul 2022 20:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1659204317;
        bh=KCMJNxOlmmd5SLo7qoWefFHPanzq17ftVjmQu3yTNBE=;
        h=From:To:Cc:Subject:Date:From;
        b=KoZYATS4d8dRY709vTCu1lknXSUFze0yG5XzrFrKXxlyn2hY02HKM/9PPRtJxnV+4
         0e7XLYR4wimCfR82VBZbhd/pwUayisZKTGg4dUuTv+iq2x0MpZliQFvH1Fa/yddGAS
         jmKshpNlelosRggvgYRd4UVSKW/MWBeeV94vH/1jAqOIsNMDShgqifWHmCa324POh3
         VFr9ZFArduOX6He8lz3bSStKUtEuuD7Ah+A0W1PcWK0+NcMkR58ds9WziS93x1Tq7v
         8z8dz0TEaF9ist5d2w5LgvkuVCQmrpQx1jaElR+ch57pn6cw93jMb6aY+OfqVPaFP9
         /vD3XsfeeN08A==
From:   Marek Vasut <marex@denx.de>
To:     linux-usb@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 1/2] extcon: usbc-tusb320: Factor out extcon into dedicated functions
Date:   Sat, 30 Jul 2022 20:04:59 +0200
Message-Id: <20220730180500.152004-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Move extcon code into separate functions in preparation for addition of
USB TYPE-C support. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>
To: linux-usb@vger.kernel.org
---
 drivers/extcon/extcon-usbc-tusb320.c | 75 +++++++++++++++++-----------
 1 file changed, 46 insertions(+), 29 deletions(-)

diff --git a/drivers/extcon/extcon-usbc-tusb320.c b/drivers/extcon/extcon-usbc-tusb320.c
index 6ba3d89b106d0..aced4bbb455dc 100644
--- a/drivers/extcon/extcon-usbc-tusb320.c
+++ b/drivers/extcon/extcon-usbc-tusb320.c
@@ -184,19 +184,9 @@ static struct tusb320_ops tusb320l_ops = {
 	.get_revision = tusb320l_get_revision,
 };
 
-static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
+static void tusb320_extcon_irq_handler(struct tusb320_priv *priv, u8 reg)
 {
-	struct tusb320_priv *priv = dev_id;
 	int state, polarity;
-	unsigned reg;
-
-	if (regmap_read(priv->regmap, TUSB320_REG9, &reg)) {
-		dev_err(priv->dev, "error during i2c read!\n");
-		return IRQ_NONE;
-	}
-
-	if (!(reg & TUSB320_REG9_INTERRUPT_STATUS))
-		return IRQ_NONE;
 
 	state = (reg >> TUSB320_REG9_ATTACHED_STATE_SHIFT) &
 		TUSB320_REG9_ATTACHED_STATE_MASK;
@@ -219,6 +209,22 @@ static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
 	extcon_sync(priv->edev, EXTCON_USB_HOST);
 
 	priv->state = state;
+}
+
+static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
+{
+	struct tusb320_priv *priv = dev_id;
+	unsigned int reg;
+
+	if (regmap_read(priv->regmap, TUSB320_REG9, &reg)) {
+		dev_err(priv->dev, "error during i2c read!\n");
+		return IRQ_NONE;
+	}
+
+	if (!(reg & TUSB320_REG9_INTERRUPT_STATUS))
+		return IRQ_NONE;
+
+	tusb320_extcon_irq_handler(priv, reg);
 
 	regmap_write(priv->regmap, TUSB320_REG9, reg);
 
@@ -230,8 +236,32 @@ static const struct regmap_config tusb320_regmap_config = {
 	.val_bits = 8,
 };
 
-static int tusb320_extcon_probe(struct i2c_client *client,
-				const struct i2c_device_id *id)
+static int tusb320_extcon_probe(struct tusb320_priv *priv)
+{
+	int ret;
+
+	priv->edev = devm_extcon_dev_allocate(priv->dev, tusb320_extcon_cable);
+	if (IS_ERR(priv->edev)) {
+		dev_err(priv->dev, "failed to allocate extcon device\n");
+		return PTR_ERR(priv->edev);
+	}
+
+	ret = devm_extcon_dev_register(priv->dev, priv->edev);
+	if (ret < 0) {
+		dev_err(priv->dev, "failed to register extcon device\n");
+		return ret;
+	}
+
+	extcon_set_property_capability(priv->edev, EXTCON_USB,
+				       EXTCON_PROP_USB_TYPEC_POLARITY);
+	extcon_set_property_capability(priv->edev, EXTCON_USB_HOST,
+				       EXTCON_PROP_USB_TYPEC_POLARITY);
+
+	return 0;
+}
+
+static int tusb320_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
 {
 	struct tusb320_priv *priv;
 	const void *match_data;
@@ -257,12 +287,6 @@ static int tusb320_extcon_probe(struct i2c_client *client,
 
 	priv->ops = (struct tusb320_ops*)match_data;
 
-	priv->edev = devm_extcon_dev_allocate(priv->dev, tusb320_extcon_cable);
-	if (IS_ERR(priv->edev)) {
-		dev_err(priv->dev, "failed to allocate extcon device\n");
-		return PTR_ERR(priv->edev);
-	}
-
 	if (priv->ops->get_revision) {
 		ret = priv->ops->get_revision(priv, &revision);
 		if (ret)
@@ -272,16 +296,9 @@ static int tusb320_extcon_probe(struct i2c_client *client,
 			dev_info(priv->dev, "chip revision %d\n", revision);
 	}
 
-	ret = devm_extcon_dev_register(priv->dev, priv->edev);
-	if (ret < 0) {
-		dev_err(priv->dev, "failed to register extcon device\n");
+	ret = tusb320_extcon_probe(priv);
+	if (ret)
 		return ret;
-	}
-
-	extcon_set_property_capability(priv->edev, EXTCON_USB,
-				       EXTCON_PROP_USB_TYPEC_POLARITY);
-	extcon_set_property_capability(priv->edev, EXTCON_USB_HOST,
-				       EXTCON_PROP_USB_TYPEC_POLARITY);
 
 	/* update initial state */
 	tusb320_irq_handler(client->irq, priv);
@@ -313,7 +330,7 @@ static const struct of_device_id tusb320_extcon_dt_match[] = {
 MODULE_DEVICE_TABLE(of, tusb320_extcon_dt_match);
 
 static struct i2c_driver tusb320_extcon_driver = {
-	.probe		= tusb320_extcon_probe,
+	.probe		= tusb320_probe,
 	.driver		= {
 		.name	= "extcon-tusb320",
 		.of_match_table = tusb320_extcon_dt_match,
-- 
2.35.1

