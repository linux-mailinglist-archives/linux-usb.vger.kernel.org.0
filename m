Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2E6627D21
	for <lists+linux-usb@lfdr.de>; Mon, 14 Nov 2022 12:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237039AbiKNL4t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Nov 2022 06:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236995AbiKNL4c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Nov 2022 06:56:32 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B986248D9
        for <linux-usb@vger.kernel.org>; Mon, 14 Nov 2022 03:52:13 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so18784009lfb.13
        for <linux-usb@vger.kernel.org>; Mon, 14 Nov 2022 03:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=490Ahm7yaCTQkYNJWQbuTL/BW7+rQHebePQfeeMmwms=;
        b=NbJ2xWM59vGj5Q4Ani3KZYob6uYLhu545lKWD1FXdO1GmeZs377Gx0qkVGilK5G1qq
         B6ajpQaojSxMxxNMbPYxPMgUgSd0CapE2YybDt9or9tZ9W3W5AWV8OLPdMFP4Q5SY65l
         34r3VlTq3nPt4iT8qpuUbaCLmAGz6+qfgRm2NN3qKjTktAfgqUNeRpjNosQCh2J3JnyW
         elbQT7JuhiMTuTDE/twVEY/hc7MbVVjgZc3T9sAH4Gg5Q2yTZKtfyenUqhGc0WJ5bnLX
         edpCTPRVvHPh67DeD6wA/bDxR/hXJIJ67JKlfFJsHTA1+7fg6oB1HFYSkmHZsXLjV7Cm
         BNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=490Ahm7yaCTQkYNJWQbuTL/BW7+rQHebePQfeeMmwms=;
        b=ENtLhcfKhvkEJ/sMTKXYo8m9QwOzjhB3ETCBN+mFM53v6og3Fe84uV3eUF75Ip28i3
         4ho2z3kEKILvnxkkAUviP5iW+LWonxay4Oe6rp4giIr2ehrHDPyq28Rovw4HPPYZ31TV
         bu58iGTppzvoaMH/d1LctNRWYjUai+iG8hmW/HDtDpAICLqXe81/yTtojCWSFBfPs9a0
         BYfVmnWP5Fww7LXEOYYEFagLJj5F+AXiGk8ekEdhMHH+S0m3EkPbRUhPhFNFwDCETMyU
         Bj0KSX6lWZiQOLPwN8nQmqFPfeYiyicn/Zt/DAbpm3GcZPcY93zSLuoj31+8xqSIcI1u
         rBFg==
X-Gm-Message-State: ANoB5pmMhRpkEENpRESEkOlFvDY9YLF6/vVJMVDY8dWOmC4nz2RS2Qbm
        6lRAsHiaJ3OxMfZyFWuGWXVO2w==
X-Google-Smtp-Source: AA0mqf5aInL6CGbekkcCLO6Q/9AWq2rxeNDM4dHGxZKTfnpdVX9Syelrj6Syo+HCWbOQd2MIdTjlmQ==
X-Received: by 2002:a05:6512:329c:b0:494:79b6:c7a2 with SMTP id p28-20020a056512329c00b0049479b6c7a2mr4426474lfe.513.1668426731461;
        Mon, 14 Nov 2022 03:52:11 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm1981531ljh.132.2022.11.14.03.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 03:52:11 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/4] fotg210-udc: Support optional external PHY
Date:   Mon, 14 Nov 2022 12:51:59 +0100
Message-Id: <20221114115201.302887-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221114115201.302887-1-linus.walleij@linaro.org>
References: <20221114115201.302887-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds support for an optional external PHY to the FOTG210
UDC driver.

Tested with the GPIO VBUS PHY driver on the Gemini SoC.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/fotg210-udc.c | 72 +++++++++++++++++++++++++++++++
 drivers/usb/fotg210/fotg210-udc.h |  2 +
 2 files changed, 74 insertions(+)

diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index b3106e4b3194..4026103330e1 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -15,6 +15,8 @@
 #include <linux/platform_device.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
+#include <linux/usb/otg.h>
+#include <linux/usb/phy.h>
 
 #include "fotg210.h"
 #include "fotg210-udc.h"
@@ -1008,11 +1010,19 @@ static int fotg210_udc_start(struct usb_gadget *g,
 {
 	struct fotg210_udc *fotg210 = gadget_to_fotg210(g);
 	u32 value;
+	int ret;
 
 	/* hook up the driver */
 	driver->driver.bus = NULL;
 	fotg210->driver = driver;
 
+	if (!IS_ERR_OR_NULL(fotg210->phy)) {
+		ret = otg_set_peripheral(fotg210->phy->otg,
+					 &fotg210->gadget);
+		if (ret)
+			dev_err(fotg210->dev, "can't bind to phy\n");
+	}
+
 	/* enable device global interrupt */
 	value = ioread32(fotg210->reg + FOTG210_DMCR);
 	value |= DMCR_GLINT_EN;
@@ -1054,6 +1064,9 @@ static int fotg210_udc_stop(struct usb_gadget *g)
 	struct fotg210_udc *fotg210 = gadget_to_fotg210(g);
 	unsigned long	flags;
 
+	if (!IS_ERR_OR_NULL(fotg210->phy))
+		return otg_set_peripheral(fotg210->phy->otg, NULL);
+
 	spin_lock_irqsave(&fotg210->lock, flags);
 
 	fotg210_init(fotg210);
@@ -1069,12 +1082,50 @@ static const struct usb_gadget_ops fotg210_gadget_ops = {
 	.udc_stop		= fotg210_udc_stop,
 };
 
+/**
+ * fotg210_phy_event - Called by phy upon VBus event
+ * @nb: notifier block
+ * @action: phy action, is vbus connect or disconnect
+ * @data: the usb_gadget structure in fotg210
+ *
+ * Called by the USB Phy when a cable connect or disconnect is sensed.
+ *
+ * Returns NOTIFY_OK or NOTIFY_DONE
+ */
+static int fotg210_phy_event(struct notifier_block *nb, unsigned long action,
+			     void *data)
+{
+	struct usb_gadget *gadget = data;
+
+	if (!gadget)
+		return NOTIFY_DONE;
+
+	switch (action) {
+	case USB_EVENT_VBUS:
+		usb_gadget_vbus_connect(gadget);
+		return NOTIFY_OK;
+	case USB_EVENT_NONE:
+		usb_gadget_vbus_disconnect(gadget);
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static struct notifier_block fotg210_phy_notifier = {
+	.notifier_call = fotg210_phy_event,
+};
+
 int fotg210_udc_remove(struct platform_device *pdev)
 {
 	struct fotg210_udc *fotg210 = platform_get_drvdata(pdev);
 	int i;
 
 	usb_del_gadget_udc(&fotg210->gadget);
+	if (!IS_ERR_OR_NULL(fotg210->phy)) {
+		usb_unregister_notifier(fotg210->phy, &fotg210_phy_notifier);
+		usb_put_phy(fotg210->phy);
+	}
 	iounmap(fotg210->reg);
 	free_irq(platform_get_irq(pdev, 0), fotg210);
 
@@ -1114,6 +1165,22 @@ int fotg210_udc_probe(struct platform_device *pdev)
 	if (fotg210 == NULL)
 		goto err;
 
+	fotg210->dev = dev;
+
+	fotg210->phy = devm_usb_get_phy_by_phandle(dev->parent, "usb-phy", 0);
+	if (IS_ERR(fotg210->phy)) {
+		ret = PTR_ERR(fotg210->phy);
+		if (ret == -EPROBE_DEFER)
+			goto err;
+		dev_info(dev, "no PHY found\n");
+		fotg210->phy = NULL;
+	} else {
+		ret = usb_phy_init(fotg210->phy);
+		if (ret)
+			goto err;
+		dev_info(dev, "found and initialized PHY\n");
+	}
+
 	for (i = 0; i < FOTG210_MAX_NUM_EP; i++) {
 		_ep[i] = kzalloc(sizeof(struct fotg210_ep), GFP_KERNEL);
 		if (_ep[i] == NULL)
@@ -1185,6 +1252,9 @@ int fotg210_udc_probe(struct platform_device *pdev)
 		goto err_req;
 	}
 
+	if (!IS_ERR_OR_NULL(fotg210->phy))
+		usb_register_notifier(fotg210->phy, &fotg210_phy_notifier);
+
 	ret = usb_add_gadget_udc(dev, &fotg210->gadget);
 	if (ret)
 		goto err_add_udc;
@@ -1194,6 +1264,8 @@ int fotg210_udc_probe(struct platform_device *pdev)
 	return 0;
 
 err_add_udc:
+	if (!IS_ERR_OR_NULL(fotg210->phy))
+		usb_unregister_notifier(fotg210->phy, &fotg210_phy_notifier);
 	free_irq(ires->start, fotg210);
 
 err_req:
diff --git a/drivers/usb/fotg210/fotg210-udc.h b/drivers/usb/fotg210/fotg210-udc.h
index 08c32957503b..e3067d22a895 100644
--- a/drivers/usb/fotg210/fotg210-udc.h
+++ b/drivers/usb/fotg210/fotg210-udc.h
@@ -234,6 +234,8 @@ struct fotg210_udc {
 
 	unsigned long		irq_trigger;
 
+	struct device			*dev;
+	struct usb_phy			*phy;
 	struct usb_gadget		gadget;
 	struct usb_gadget_driver	*driver;
 
-- 
2.38.1

