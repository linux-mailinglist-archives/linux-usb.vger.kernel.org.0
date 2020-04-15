Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815661AB18F
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 21:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405998AbgDOT1L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 15:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404835AbgDOT0z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Apr 2020 15:26:55 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D96C061A10
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2020 12:26:55 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id l14so5007807ljj.5
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2020 12:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0aVQgT7jKSEznWNpRgGO+yN2q9lFco+Z1b9ppmXFNjU=;
        b=RX4vJv9f9mxGhaw8NFQyFFZE4uvZXLDkXWfa9yR67D2bSyYbN0eTaDphb3Baov3oiu
         SrTNKB9uCPZ0FNy6/jmqEhtBVZPXnJGsWVBui6nzhbe1Sk7vEmHer/lvN6L06jpG1W+W
         2Dyr6K7Ha03FX3ovSYagX5JBDl3gO4eASzdMMMZkrFnZeZZ3h80/mt+MiDju//qn/Vw7
         f+8HsHT6P6N+peTyBGsLdhPyGSW2bXJbicHptDHahfH2GXTgRAHbGLJm513h+jqgJrM3
         v0Jny2DKINjMdOxMOW/fjC1dXLSorNoUtA2J9nfiVyLSphIuoANFCQ7agPvwv7cSyjAg
         hs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0aVQgT7jKSEznWNpRgGO+yN2q9lFco+Z1b9ppmXFNjU=;
        b=E/bjVj7UtE36qTjman5mWhJtRzOF4IEPFsuX7OBbdmhJLr109SEijir53HNASt16yi
         MKNXeP1tNCZj4FnoASQiuQXv1Cg4kZilO1iBlluwrP/Xcz4OyEYYWh5S8O2eBAW7P+qH
         iF0Dp+5sA3CP4YY7wtvQAl1BGPrjUSF2ekaLAqwu4V7142wnWDDCEQBOB+kDV1F8CePQ
         rc4pUUSZhkDdD02d/3CFG4de2FeNvXAEMMT0nkbRnUmLYK6dFmYcBbaRIcRYlIKwETy6
         TdrpIK8zyxc5EyPw+93KXzkUKfUgs1w1AYjJ3mBPZYZBZDIXmwr+7x9m6IEh+IkAf7uG
         dd8A==
X-Gm-Message-State: AGi0PubfrXFVvCypBA2hsXbBoVED/k+l17LU0LeKXbHpQUfkP4eDUy8d
        xMtSQyiDekx1i9CTAMUcEVyJ/8sblyY=
X-Google-Smtp-Source: APiQypLULP/IJ+0c/HE/njTD0Ima3rpuWtmLr8+yh5Y/BlYzlpbWAHzLWS6DxLbjCMOSnpD64qTv0w==
X-Received: by 2002:a2e:878a:: with SMTP id n10mr4141840lji.130.1586978813346;
        Wed, 15 Apr 2020 12:26:53 -0700 (PDT)
Received: from localhost.localdomain (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id u7sm13511102lfu.3.2020.04.15.12.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 12:26:52 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Tobias Schramm <t.schramm@manjaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yueyao Zhu <yueyao@google.com>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org
Subject: [PATCH] usb: fusb302: Convert to use GPIO descriptors
Date:   Wed, 15 Apr 2020 21:24:48 +0200
Message-Id: <20200415192448.305257-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This converts the FUSB302 driver to use GPIO descriptors.
The conversion to descriptors per se is pretty straight-forward.

In the process I discovered that:

1. The driver uses a completely undocumented device tree binding
   for the interrupt GPIO line, "fcs,int_n". Ooops.

2. The undocumented binding, presumably since it has not seen
   review, is just "fcs,int_n", lacking the compulsory "-gpios"
   suffix and also something that is not a good name because
   the "_n" implies the line is inverted which is something we
   handle with flags in the device tree. Ooops.

3. Possibly the driver should not be requesting the line as a
   GPIO and request the corresponding interrupt line by open
   coding, the GPIO chip is very likely doubleing as an IRQ
   controller and can probably provide an interrupt directly
   for this line with interrupts-extended = <&gpio0 ...>;

4. Possibly the IRQ should just be tagged on the I2C client node
   in the device tree like apparently ACPI does, as it overrides
   this IRQ with client->irq if that exists.

But now it is too late to do much about that and as I can see
this is used like this in the Pinebook which is a shipping product
so let'a just contain the mess and move on.

The property currently appears in:
arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts

Create a quirk in the GPIO OF library to allow this property
specifically to be specified without the "-gpios" suffix, we have
other such bindings already.

Cc: Tobias Schramm <t.schramm@manjaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Yueyao Zhu <yueyao@google.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This is now covered as far as GPIO is concerned but you might
want to look into creating proper bindings for this or
correcting the devicetree.
---
 drivers/gpio/gpiolib-of.c        | 21 +++++++++++++++++++++
 drivers/usb/typec/tcpm/fusb302.c | 32 +++++++++-----------------------
 2 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ccc449df3792..20c2c428168e 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -460,6 +460,24 @@ static struct gpio_desc *of_find_arizona_gpio(struct device *dev,
 	return of_get_named_gpiod_flags(dev->of_node, con_id, 0, of_flags);
 }
 
+static struct gpio_desc *of_find_usb_gpio(struct device *dev,
+					  const char *con_id,
+					  enum of_gpio_flags *of_flags)
+{
+	/*
+	 * Currently this USB quirk is only for the Fairchild FUSB302 host which is using
+	 * an undocumented DT GPIO line named "fcs,int_n" without the compulsory "-gpios"
+	 * suffix.
+	 */
+	if (!IS_ENABLED(CONFIG_TYPEC_FUSB302))
+		return ERR_PTR(-ENOENT);
+
+	if (!con_id || strcmp(con_id, "fcs,int_n"))
+		return ERR_PTR(-ENOENT);
+
+	return of_get_named_gpiod_flags(dev->of_node, con_id, 0, of_flags);
+}
+
 struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 			       unsigned int idx, unsigned long *flags)
 {
@@ -504,6 +522,9 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 	if (PTR_ERR(desc) == -ENOENT)
 		desc = of_find_arizona_gpio(dev, con_id, &of_flags);
 
+	if (PTR_ERR(desc) == -ENOENT)
+		desc = of_find_usb_gpio(dev, con_id, &of_flags);
+
 	if (IS_ERR(desc))
 		return desc;
 
diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index b498960ff72b..b28facece43c 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -9,14 +9,13 @@
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/extcon.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/proc_fs.h>
 #include <linux/regulator/consumer.h>
@@ -83,7 +82,7 @@ struct fusb302_chip {
 	struct work_struct irq_work;
 	bool irq_suspended;
 	bool irq_while_suspended;
-	int gpio_int_n;
+	struct gpio_desc *gpio_int_n;
 	int gpio_int_n_irq;
 	struct extcon_dev *extcon;
 
@@ -1618,30 +1617,17 @@ static void fusb302_irq_work(struct work_struct *work)
 
 static int init_gpio(struct fusb302_chip *chip)
 {
-	struct device_node *node;
+	struct device *dev = chip->dev;
 	int ret = 0;
 
-	node = chip->dev->of_node;
-	chip->gpio_int_n = of_get_named_gpio(node, "fcs,int_n", 0);
-	if (!gpio_is_valid(chip->gpio_int_n)) {
-		ret = chip->gpio_int_n;
-		dev_err(chip->dev, "cannot get named GPIO Int_N, ret=%d", ret);
-		return ret;
-	}
-	ret = devm_gpio_request(chip->dev, chip->gpio_int_n, "fcs,int_n");
-	if (ret < 0) {
-		dev_err(chip->dev, "cannot request GPIO Int_N, ret=%d", ret);
-		return ret;
-	}
-	ret = gpio_direction_input(chip->gpio_int_n);
-	if (ret < 0) {
-		dev_err(chip->dev,
-			"cannot set GPIO Int_N to input, ret=%d", ret);
-		return ret;
+	chip->gpio_int_n = devm_gpiod_get(dev, "fcs,int_n", GPIOD_IN);
+	if (IS_ERR(chip->gpio_int_n)) {
+		dev_err(dev, "failed to request gpio_int_n\n");
+		return PTR_ERR(chip->gpio_int_n);
 	}
-	ret = gpio_to_irq(chip->gpio_int_n);
+	ret = gpiod_to_irq(chip->gpio_int_n);
 	if (ret < 0) {
-		dev_err(chip->dev,
+		dev_err(dev,
 			"cannot request IRQ for GPIO Int_N, ret=%d", ret);
 		return ret;
 	}
-- 
2.25.2

