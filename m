Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01B62C032E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 11:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgKWKXz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 05:23:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgKWKXy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 05:23:54 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11524C0613CF
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2020 02:23:53 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id v14so825809lfo.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2020 02:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s0MEgY28uT7zUD4FBkpaIkXeQ71utsAniKwN5z6xBsw=;
        b=Z+UkOHryKIpfWD36tt2Z8LrJlvKHmFZegqNGEYSvAp2iSa7MdEJq7GWx1l/Gr7LmF3
         d7q5A/vJJGuiNO2uGclfyJDKLWRv0NcGTkJ9nXX9OJGzCpYurpyPFlZP9ORM2uf8Mr3C
         JBvhz9Q+/3kGbWu2ocxn3G5DIwPQvH6M6uVeGW2371M9balqmJB4t59B8XiZW8PFnvRz
         2Fd1i0mvOO+X/ThhtYKAQH8vXIxKG0C12TzicupDNqRSMZouJNfsPMsjpIJiYfKmddBg
         1ltFRq6H1i6x7qIe9GzaLI+kUjD1gyM520l1CI3JOk8u3WeRHcRzcS057lPiGIF62tb7
         EsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s0MEgY28uT7zUD4FBkpaIkXeQ71utsAniKwN5z6xBsw=;
        b=HtaAA9B9+kF7BVL2QaAfz+cSmgZDvfemgaOaD6NLQKm0gOBFjz8GwkgHWppfIdmU/d
         iGIdJNA5RFOxdS8yGTv6skepHOwF6J6FcbxEmbxZZGqStXq1bAmyVf/A6kwar2mg5p/5
         oZ9MqwbPXlBb+QOH5Bo85iHrKv9eeRgYp3dL6n8s/wEJTzadmJEYACHUgE9RfZiiWDGP
         Wnc/2fNDrwAhk/HA59jztOCbQ5ToEql8uh/hrCVGpVriaIe8y/ml/keZx3DAChAcfnUk
         bk8TnKaTRVGbQKGUsWpPme8/I15D3aTelOiQKtbfXFKWuPGlKHTRRGNLPghMJ79VX+Nu
         0sOg==
X-Gm-Message-State: AOAM530bRVKDXhqADz5pGiIkQl+bKNiEIiNnTAQTdadvFcFF5/0RNUnS
        4emE8AEs/sfm/DpPFBPYy1Y9RQ==
X-Google-Smtp-Source: ABdhPJyT3HwOnQanvFqrmShOJmP0YlPfRx15PjGh5Y5ucx7A9CSNL08+LVMM68QvCkWtNioXbleUGQ==
X-Received: by 2002:a19:952:: with SMTP id 79mr15067359lfj.559.1606127031438;
        Mon, 23 Nov 2020 02:23:51 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id n8sm1341173lfq.2.2020.11.23.02.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 02:23:50 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: [PATCH] usb: isp1301-omap: Convert to use GPIO descriptors
Date:   Mon, 23 Nov 2020 11:23:46 +0100
Message-Id: <20201123102346.48284-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This modernized the ISP1301 a bit by switching it to provide
a GPIO descriptor from the H2 board if used.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap1/board-h2.c     | 22 ++++++++++++++++++++--
 drivers/usb/phy/phy-isp1301-omap.c | 21 +++++++++++++--------
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-omap1/board-h2.c b/arch/arm/mach-omap1/board-h2.c
index cb7ce627ffe8..c40cf5ef8607 100644
--- a/arch/arm/mach-omap1/board-h2.c
+++ b/arch/arm/mach-omap1/board-h2.c
@@ -16,6 +16,7 @@
  * Copyright (C) 2004 Nokia Corporation by Imre Deak <imre.deak@nokia.com>
  */
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
@@ -46,6 +47,9 @@
 #include "common.h"
 #include "board-h2.h"
 
+/* The first 16 SoC GPIO lines are on this GPIO chip */
+#define OMAP_GPIO_LABEL			"gpio-0-15"
+
 /* At OMAP1610 Innovator the Ethernet is directly connected to CS1 */
 #define OMAP1610_ETHR_START		0x04000300
 
@@ -334,7 +338,19 @@ static struct i2c_board_info __initdata h2_i2c_board_info[] = {
 		I2C_BOARD_INFO("tps65010", 0x48),
 		.platform_data	= &tps_board,
 	}, {
-		I2C_BOARD_INFO("isp1301_omap", 0x2d),
+		.type = "isp1301_omap",
+		.addr = 0x2d,
+		.dev_name = "isp1301",
+	},
+};
+
+static struct gpiod_lookup_table isp1301_gpiod_table = {
+	.dev_id = "isp1301",
+	.table = {
+		/* Active low since the irq triggers on falling edge */
+		GPIO_LOOKUP(OMAP_GPIO_LABEL, 2,
+			    NULL, GPIO_ACTIVE_LOW),
+		{ },
 	},
 };
 
@@ -406,8 +422,10 @@ static void __init h2_init(void)
 	h2_smc91x_resources[1].end = gpio_to_irq(0);
 	platform_add_devices(h2_devices, ARRAY_SIZE(h2_devices));
 	omap_serial_init();
+
+	/* ISP1301 IRQ wired at M14 */
+	omap_cfg_reg(M14_1510_GPIO2);
 	h2_i2c_board_info[0].irq = gpio_to_irq(58);
-	h2_i2c_board_info[1].irq = gpio_to_irq(2);
 	omap_register_i2c_bus(1, 100, h2_i2c_board_info,
 			      ARRAY_SIZE(h2_i2c_board_info));
 	omap1_usb_init(&h2_usb_config);
diff --git a/drivers/usb/phy/phy-isp1301-omap.c b/drivers/usb/phy/phy-isp1301-omap.c
index d50bf4f6a660..e3497bc3cb75 100644
--- a/drivers/usb/phy/phy-isp1301-omap.c
+++ b/drivers/usb/phy/phy-isp1301-omap.c
@@ -1208,9 +1208,6 @@ static int isp1301_remove(struct i2c_client *i2c)
 #ifdef	CONFIG_USB_OTG
 	otg_unbind(isp);
 #endif
-	if (machine_is_omap_h2())
-		gpio_free(2);
-
 	set_bit(WORK_STOP, &isp->todo);
 	del_timer_sync(&isp->timer);
 	flush_work(&isp->work);
@@ -1480,6 +1477,7 @@ isp1301_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 {
 	int			status;
 	struct isp1301		*isp;
+	int irq;
 
 	if (the_transceiver)
 		return 0;
@@ -1543,20 +1541,27 @@ isp1301_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 #endif
 
 	if (machine_is_omap_h2()) {
+		struct gpio_desc *gpiod;
+
 		/* full speed signaling by default */
 		isp1301_set_bits(isp, ISP1301_MODE_CONTROL_1,
 			MC1_SPEED);
 		isp1301_set_bits(isp, ISP1301_MODE_CONTROL_2,
 			MC2_SPD_SUSP_CTRL);
 
-		/* IRQ wired at M14 */
-		omap_cfg_reg(M14_1510_GPIO2);
-		if (gpio_request(2, "isp1301") == 0)
-			gpio_direction_input(2);
+		gpiod = devm_gpiod_get(&i2c->dev, NULL, GPIOD_IN);
+		if (IS_ERR(gpiod)) {
+			dev_err(&i2c->dev, "cannot obtain H2 GPIO\n");
+			goto fail;
+		}
+		gpiod_set_consumer_name(gpiod, "isp1301");
+		irq = gpiod_to_irq(gpiod);
 		isp->irq_type = IRQF_TRIGGER_FALLING;
+	} else {
+		irq = i2c->irq;
 	}
 
-	status = request_irq(i2c->irq, isp1301_irq,
+	status = request_irq(irq, isp1301_irq,
 			isp->irq_type, DRIVER_NAME, isp);
 	if (status < 0) {
 		dev_dbg(&i2c->dev, "can't get IRQ %d, err %d\n",
-- 
2.26.2

