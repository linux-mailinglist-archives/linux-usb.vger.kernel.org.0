Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCC44C8C7C
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 14:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235019AbiCANVu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 08:21:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234970AbiCANVj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 08:21:39 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A129D044
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 05:20:56 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id o18-20020a05600c4fd200b003826701f847so640749wmq.4
        for <linux-usb@vger.kernel.org>; Tue, 01 Mar 2022 05:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LF9kgMFX85Ga09K9b/Ao/dCg3JfyKCcVGPAMfvGhvZU=;
        b=joc0ZPemSKUrcLuqrcJDX7pUpA60Pbv32CtO/Te/5qSVtWnVsK4znw0CUnC30TWO3g
         kjBHgR1inpSJ9qiOxuLfiTo/GlVxfX2784npf8zUgfK/QW1ODq26z3YrMcnnnzLJHbWV
         /GWVHAISiEKzgw1DXSzRm38jnlvcVWp0okjcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LF9kgMFX85Ga09K9b/Ao/dCg3JfyKCcVGPAMfvGhvZU=;
        b=lFKUuZOkmJCBWv7SS/hpQLDEAKHtybX8Z95l1bQX1jrV/SDCSAmlYvb449kepMRkyM
         WTJ1DcOPskJmPc4vmZokHMvMJV/raCuNlscMe5VdzYnW25SnfHMObVzpPb3dmWJ7F+8q
         6ZlZu+qru34dMdUAvHsaMXb1QW0GXJElkyxeBRUYD00+RdSKcPHxfhSJXSsVEmHsi7FA
         JmmVzg2Ul5s7Fg5vNb9mILsYMk8UbF4GTtlH8V7SHY98zt0ROTZjRxVWR5pP7Gm2FL0W
         61sA2fUGame+yraa6NYYPJiOcncvpi/Zr1ffezgjrESDAtyahRCrtsMu4YXOTDnWvoDs
         hHNw==
X-Gm-Message-State: AOAM532NcFnESuNGhV/vgc9JMPpGixYE+wvOzM2zXn1v7evYmqIF3a+i
        o9kGZH+YyEYpiKwS2UD3CXmGmw==
X-Google-Smtp-Source: ABdhPJwnAmZtoeC8/AIV6oMl+kZFFH0eLQyXSV86ZYYQPU3UJZlxiSTP5z5PuVWFe2W039zB5LEQmQ==
X-Received: by 2002:a05:600c:3203:b0:381:b544:7970 with SMTP id r3-20020a05600c320300b00381b5447970mr1950003wmp.144.1646140855026;
        Tue, 01 Mar 2022 05:20:55 -0800 (PST)
Received: from capella.. (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id i12-20020adfe48c000000b001ef6eab4c81sm13258492wrm.96.2022.03.01.05.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 05:20:54 -0800 (PST)
From:   =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        =?UTF-8?q?=A0ipraga?= <alsi@bang-olufsen.dk>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] usb: typec: mux: add TS5USBA224 driver
Date:   Tue,  1 Mar 2022 14:20:08 +0100
Message-Id: <20220301132010.115258-5-alvin@pqrs.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301132010.115258-1-alvin@pqrs.dk>
References: <20220301132010.115258-1-alvin@pqrs.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The TS5USBA224 USB High Speed/Audio switch mux is typically used
together with a Type-C port controller such as the TUSB320LAI. Below is
a simplified typical application on an embedded platform:

 ┌─────────────────────┐                      ┌───────────────────┐
 │                     │          I2C         │                   │
 │                     ├──────────────────────┤ I2C               │
 │      TUSB320LAI     │         INT_N        │                   │
 │                     ├──────────────────────┤     System-on-    │
 │                     │                      │             Chip  │
 │ CC1 CC2             │           ┌──────────┤ GPIO              │
 └──┬───┬──────────────┘           │          │                   │
    │   │                          │          │       USBOTG      │
    │   │                          │          │    VBUS   D+  D-  │
    │   │                          │          └──────┬─────┬───┬──┘
    │   │   ┌──────────────────────│─────────────────┘     │   │
    │   │   │          ┌───────────┴──┐                    │   │
    │   │   │          │        A_SEL │                    │   │
    │   │   │          │              │                    │   │
    │   │   │          │           D+ ├────────────────────┘   │
    │   │   │          │              │                        │
    │   │   │   ┌──────┤ D+/L      D- ├────────────────────────┘
    │   │   │   │      │              │
    │   │   │   │   ┌──┤ D-/R         │                   Line_L
    │   │   │   │   │  │            L ├─────────────────────────
    ┴   ┴   ┴   ┴   ┴  │              │                   Line_R
     USB Type-C port   │            R ├─────────────────────────
                       │              │
                       │  TS5USBA224  │
                       └──────────────┘

This driver controls the TS5USBA224 via the A_SEL pin. In addition, it
registers itself as a Type-C mux device. In the above scenario, the
driver may be notified via the port controller driver if the CC pins
indicate that an Audio Accessory is connected or not.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/usb/typec/mux/Kconfig      |  10 +++
 drivers/usb/typec/mux/Makefile     |   1 +
 drivers/usb/typec/mux/ts5usba224.c | 102 +++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 drivers/usb/typec/mux/ts5usba224.c

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index edead555835e..82c25b117652 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -19,4 +19,14 @@ config TYPEC_MUX_INTEL_PMC
 	  control the USB role switch and also the multiplexer/demultiplexer
 	  switches used with USB Type-C Alternate Modes.
 
+config TYPEC_MUX_TS5USBA224
+	tristate "TI TS5USBA224 USB High Speed/Audio switch mux driver"
+	select GPIOLIB
+	help
+	  Say Y or M if your system has a TI TS5USBA224 USB High Speed/Audio
+	  switch mux controller paired with a USB Type-C port controller.
+
+	  If you choose to build this driver as a dynamically linked module, the
+	  module will be called ts5usba224.ko.
+
 endmenu
diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
index 280a6f553115..4b5f318656a0 100644
--- a/drivers/usb/typec/mux/Makefile
+++ b/drivers/usb/typec/mux/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+= pi3usb30532.o
 obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)	+= intel_pmc_mux.o
+obj-$(CONFIG_TYPEC_MUX_TS5USBA224)	+= ts5usba224.o
diff --git a/drivers/usb/typec/mux/ts5usba224.c b/drivers/usb/typec/mux/ts5usba224.c
new file mode 100644
index 000000000000..4935dc8a0725
--- /dev/null
+++ b/drivers/usb/typec/mux/ts5usba224.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * TI TS5USBA224 USB 2.0/audio switch mux driver
+ *
+ * Copyright (c) 2021 Alvin Šipraga <alsi@bang-olufsen.dk>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_mux.h>
+
+struct ts5usba224 {
+	struct device *dev;
+	struct typec_mux *mux;
+	struct gpio_desc *a_sel;
+};
+
+static int ts5usba224_mux_set(struct typec_mux *mux,
+			      struct typec_mux_state *state)
+{
+	struct ts5usba224 *chip = typec_mux_get_drvdata(mux);
+
+	switch (state->mode) {
+	case TYPEC_MODE_AUDIO:
+		gpiod_set_value_cansleep(chip->a_sel, 1);
+		dev_dbg(chip->dev, "audio switch enabled\n");
+		break;
+	case TYPEC_STATE_USB:
+	case TYPEC_MODE_USB2:
+	default:
+		dev_dbg(chip->dev, "audio switch disabled\n");
+		gpiod_set_value_cansleep(chip->a_sel, 0);
+		break;
+	}
+
+	return 0;
+}
+
+static int ts5usba224_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct typec_mux_desc mux_desc = {};
+	struct ts5usba224 *chip;
+	int ret;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = dev;
+
+	chip->a_sel = devm_gpiod_get(dev, "asel", GPIOD_OUT_LOW);
+	if (IS_ERR(chip->a_sel)) {
+		ret = PTR_ERR(chip->a_sel);
+		return dev_err_probe(dev, ret, "failed to get A_SEL GPIO\n");
+	}
+
+	mux_desc.drvdata = chip;
+	mux_desc.fwnode = dev->fwnode;
+	mux_desc.set = ts5usba224_mux_set;
+
+	chip->mux = typec_mux_register(dev, &mux_desc);
+	if (IS_ERR(chip->mux))
+		return PTR_ERR(chip->mux);
+
+	platform_set_drvdata(pdev, chip);
+
+	return 0;
+}
+
+static int ts5usba224_remove(struct platform_device *pdev)
+{
+	struct ts5usba224 *chip = platform_get_drvdata(pdev);
+
+	typec_mux_unregister(chip->mux);
+
+	return 0;
+}
+
+static const struct of_device_id ts5usba224_of_match[] = {
+	{ .compatible = "ti,ts5usba224", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ts5usba224_of_match);
+
+static struct platform_driver ts5usba224_driver = {
+	.driver = {
+		.name = "ts5usba224",
+		.of_match_table = of_match_ptr(ts5usba224_of_match),
+	},
+	.probe  = ts5usba224_probe,
+	.remove = ts5usba224_remove,
+};
+
+module_platform_driver(ts5usba224_driver);
+
+MODULE_AUTHOR("Alvin Šipraga <alsi@bang-olufsen.dk>");
+MODULE_DESCRIPTION("TI TS5USBA224 mux driver");
+MODULE_LICENSE("GPL");
-- 
2.35.1

