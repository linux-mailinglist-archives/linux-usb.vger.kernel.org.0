Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925052CA287
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 13:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbgLAMSv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 07:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728293AbgLAMSv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 07:18:51 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE16C0613D3
        for <linux-usb@vger.kernel.org>; Tue,  1 Dec 2020 04:18:10 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id q13so3658321lfr.10
        for <linux-usb@vger.kernel.org>; Tue, 01 Dec 2020 04:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lEozHbiwDqYzqO0logJ5Zb+6XwsFfBOGvVznIxZx74Q=;
        b=NO4edueZLu/V6icqSnsDVDBJKAhgk6EVOQcywihLBGzQcOuJc383wkkIk/oYUY8ddJ
         rgQKyzfKN5OB4cbhnRpxfGgVG0Zi6aXQKoG6o4o8hLhIXMeqGLSqjUO9OUHA63UriHoN
         KHm+/i4kddBAJLnXPQGoacU9M0uMR4eF1N+pawPV/VsgBRQ5jOYkck3uSjHfyRj+85Xl
         +EP1kVzMTSwYotUZBIprUhKo+IOSOdnketX+8ovePlijS4uLfC9lTFXp4WVClt9DNkqr
         MWEHOl/ongiIlbV8jiuDupkmWJ0WMl2+ZxNMf2C8jNKU+PITPFaImXYeK1kGtqLIuSzU
         3XNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lEozHbiwDqYzqO0logJ5Zb+6XwsFfBOGvVznIxZx74Q=;
        b=QsO1LX8RMBv6KoPLUmi3pPQYN+NawAVLPtYzjpqpsEZg43umjw44Dq265bv3zgiq2P
         wKghPFRSwkMA3AD8ib76XYUDQnpPCNnQt/pkhHb7r2H6zXXlNHMhV9sBAbb6fYTB1CXW
         DjAWxGrHNmvz0G4AuizAVxvvGHLnmQjvwRg1mo0CquxV0ZC9rgpmaIPHaEaJNWimnSFa
         msEZ0wzJV/6xQOowRAUc7y9tcmN4TE+cXVkkacXC7HundEdKk4oio0FzezksgMWjqWJl
         9cZHTpzRuJx6/ilmuDQ0FamI+wvYUHkBcOm7PDYQMwvWOf4l9UepNalWmD4qLsohYmbO
         ogTA==
X-Gm-Message-State: AOAM531yNI1uuDw6rAd4SEz0++KxsRwur1QTMJHbv8xa5uXxfGnhls1s
        JjyBDWno5pvLYrFaBtBRN0nxvDHjBIwsbBWO
X-Google-Smtp-Source: ABdhPJybfeenEcwtfxF1WiJUyzRWVpIhF+R+uP5nBZhwBxnPJlxe3qpP+3t7a+jpnrO4Jm7FguANTg==
X-Received: by 2002:a19:c181:: with SMTP id r123mr1092542lff.335.1606825089125;
        Tue, 01 Dec 2020 04:18:09 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id q16sm185066ljj.32.2020.12.01.04.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 04:18:08 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH v2] usb: ohci-omap: Fix descriptor conversion
Date:   Tue,  1 Dec 2020 13:16:06 +0100
Message-Id: <20201201121606.235982-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There were a bunch of issues with the patch converting the
OMAP1 OSK board to use descriptors for controlling the USB
host:

- The chip label was incorrect
- The GPIO offset was off-by-one
- The code should use sleeping accessors

This patch tries to fix all issues at the same time.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Fixes: 15d157e87443 ("usb: ohci-omap: Convert to use GPIO descriptors")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Also free the GPIO in the boardfile bootstrap code so that
  the driver can later on properly grab it.
---
 arch/arm/mach-omap1/board-osk.c | 4 +++-
 drivers/usb/host/ohci-omap.c    | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index 144b9caa935c..0a4c9b0b13b0 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -203,6 +203,8 @@ static int osk_tps_setup(struct i2c_client *client, void *context)
 	 */
 	gpio_request(OSK_TPS_GPIO_USB_PWR_EN, "n_vbus_en");
 	gpio_direction_output(OSK_TPS_GPIO_USB_PWR_EN, 1);
+	/* Free the GPIO again as the driver will request it */
+	gpio_free(OSK_TPS_GPIO_USB_PWR_EN);
 
 	/* Set GPIO 2 high so LED D3 is off by default */
 	tps65010_set_gpio_out_value(GPIO2, HIGH);
@@ -288,7 +290,7 @@ static struct gpiod_lookup_table osk_usb_gpio_table = {
 	.dev_id = "ohci",
 	.table = {
 		/* Power GPIO on the I2C-attached TPS65010 */
-		GPIO_LOOKUP("i2c-tps65010", 1, "power", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("tps65010", 0, "power", GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP(OMAP_GPIO_LABEL, 9, "overcurrent",
 			    GPIO_ACTIVE_HIGH),
 	},
diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index 9ccdf2c216b5..6374501ba139 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -91,14 +91,14 @@ static int omap_ohci_transceiver_power(struct ohci_omap_priv *priv, int on)
 				| ((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
 			       INNOVATOR_FPGA_CAM_USB_CONTROL);
 		else if (priv->power)
-			gpiod_set_value(priv->power, 0);
+			gpiod_set_value_cansleep(priv->power, 0);
 	} else {
 		if (machine_is_omap_innovator() && cpu_is_omap1510())
 			__raw_writeb(__raw_readb(INNOVATOR_FPGA_CAM_USB_CONTROL)
 				& ~((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
 			       INNOVATOR_FPGA_CAM_USB_CONTROL);
 		else if (priv->power)
-			gpiod_set_value(priv->power, 1);
+			gpiod_set_value_cansleep(priv->power, 1);
 	}
 
 	return 0;
-- 
2.26.2

