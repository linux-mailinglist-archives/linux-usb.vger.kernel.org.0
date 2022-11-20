Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA9D06314A0
	for <lists+linux-usb@lfdr.de>; Sun, 20 Nov 2022 15:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiKTOPS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Nov 2022 09:15:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiKTOPR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Nov 2022 09:15:17 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C471FCC2
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 06:15:16 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id BBD0A852EF;
        Sun, 20 Nov 2022 15:15:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1668953715;
        bh=JbRVYfBBk8gWdOQc5gYmWy8OSwkvFmvB+0K8k3ytj3s=;
        h=From:To:Cc:Subject:Date:From;
        b=W54mT2qSaF1Qw8gNq4g6bnB9i6srReXM91b+59IAnNBc3rlpNhrYU3e1kiYOXO+XV
         1UAYYzaaqmB+12da4Po+4FsJs31hHwTtRCtURvJ0kIbrOuerMzWtWk4GS9I2//5tQl
         9e1zoz7E2gpgr+Hx5GOsj80X19wOdJGqxDR7O8euB67n+hh/tVhsOyiN9gDSGZ45UL
         TwVXCSyUJYVUTLW6kl/DNcsdCQ/rWnCWInGHsU/5xZvlf3UrSzcfCONVF6Zle6ryG3
         +MaBrvoUqWoj9AIeAGsAavBC94iRjyiy0/omJgz60KDWlsFrJyEG771G7rsa3GOItz
         x2SWtdD4AWKRQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-usb@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH] extcon: usbc-tusb320: Update state on probe even if no IRQ pending
Date:   Sun, 20 Nov 2022 15:15:09 +0100
Message-Id: <20221120141509.81012-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently this driver triggers extcon and typec state update in its
probe function, to read out current state reported by the chip and
report the correct state to upper layers. This synchronization is
performed correctly, but only in case the chip indicates a pending
interrupt in reg09 register.

This fails to cover the situation where all interrupts reported by
the chip were already handled by Linux before reboot, then the system
rebooted, and then Linux starts again. In this case, the TUSB320 no
longer reports any interrupts in reg09, and the state update does not
perform any update as it depends on that interrupt indication.

Fix this by turning tusb320_irq_handler() into a thin wrapper around
tusb320_state_update_handler(), where the later now contains the bulk
of the code of tusb320_irq_handler(), but adds new function parameter
"force_update". The "force_update" parameter can be used by the probe
function to assure that the state synchronization is always performed,
independent of the interrupt indicated in reg09. The interrupt handler
tusb320_irq_handler() callback uses force_update=false to avoid state
updates on potential spurious interrupts and retain current behavior.

Fixes: 06bc4ca115cdd ("extcon: Add driver for TI TUSB320")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alvin Šipraga <alsi@bang-olufsen.dk>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/extcon/extcon-usbc-tusb320.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/extcon/extcon-usbc-tusb320.c b/drivers/extcon/extcon-usbc-tusb320.c
index 2a120d8d3c272..9dfa545427ca1 100644
--- a/drivers/extcon/extcon-usbc-tusb320.c
+++ b/drivers/extcon/extcon-usbc-tusb320.c
@@ -313,9 +313,9 @@ static void tusb320_typec_irq_handler(struct tusb320_priv *priv, u8 reg9)
 		typec_set_pwr_opmode(port, TYPEC_PWR_MODE_USB);
 }
 
-static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
+static irqreturn_t tusb320_state_update_handler(struct tusb320_priv *priv,
+						bool force_update)
 {
-	struct tusb320_priv *priv = dev_id;
 	unsigned int reg;
 
 	if (regmap_read(priv->regmap, TUSB320_REG9, &reg)) {
@@ -323,7 +323,7 @@ static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
-	if (!(reg & TUSB320_REG9_INTERRUPT_STATUS))
+	if (!force_update && !(reg & TUSB320_REG9_INTERRUPT_STATUS))
 		return IRQ_NONE;
 
 	tusb320_extcon_irq_handler(priv, reg);
@@ -340,6 +340,13 @@ static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
+{
+	struct tusb320_priv *priv = dev_id;
+
+	return tusb320_state_update_handler(priv, false);
+}
+
 static const struct regmap_config tusb320_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -466,7 +473,7 @@ static int tusb320_probe(struct i2c_client *client,
 		return ret;
 
 	/* update initial state */
-	tusb320_irq_handler(client->irq, priv);
+	tusb320_state_update_handler(priv, true);
 
 	/* Reset chip to its default state */
 	ret = tusb320_reset(priv);
@@ -477,7 +484,7 @@ static int tusb320_probe(struct i2c_client *client,
 		 * State and polarity might change after a reset, so update
 		 * them again and make sure the interrupt status bit is cleared.
 		 */
-		tusb320_irq_handler(client->irq, priv);
+		tusb320_state_update_handler(priv, true);
 
 	ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
 					tusb320_irq_handler,
-- 
2.35.1

