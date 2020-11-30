Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F2C2C7FFB
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 09:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbgK3IdX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 03:33:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727094AbgK3IdX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 03:33:23 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A191C0613CF
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 00:32:42 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id i17so16476148ljd.3
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 00:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yC6xJG3NVKTMtVPRPIG6905xDFoqZHa6VwMcDAxGvFM=;
        b=kpTN4dWUDDMXO1PoFnvMZYwOImLNaFb+VXW1UanB/dVL4U3BxwU5HJfnLcOFy2MwTF
         MhTGZQSKiBNwrfNzSaOO0oyciTkwHXjAeZhSUyv3OJd3HSnleUZYIH2NBEvRkH7QA0l3
         wAh1vNP0pv7igWhFOXz6M3IcjItdPwBs5zvfxQE9HlX/vnWo6HknBxpbvfm6rsd4t5x+
         60qP9BHucy7rmPkhII3esrCs2heaRnzyXgpC8phHKvmDpiqAXROevVMlr2CbkVkXUQ2X
         NF0z902fCdyUotqZoNVUfLvmwUxErMB4GjFAV4u+807EXWyiIESDd1iIoPdruMRvycDw
         NCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yC6xJG3NVKTMtVPRPIG6905xDFoqZHa6VwMcDAxGvFM=;
        b=iMvrEjoTuVbp/LEeazCyESSBDROBsi5/64J7zQDAOt+2kKigkMVzuYfJ9f9a2gOv4p
         7gOZXrFrrnNCNc1pBWgth+oT7nwhfcQ6aul9Z5uObTucb4ShwhVQJ+Hw2pKGhc63BcDw
         wSVgr73MuGrOu82ZjlSMdzVZA3/LFSHk097cFTc6tfpmNFafDEU+9USst9ANI8bIr4al
         Z38CcrVUm5NEQ7zhU9kLZqL/BKSQAL5yFR5Th5gHIiyjGq3K41PNA+z2I1FJe918NcPS
         QiDCo+xCnueire4ZPowtIttoSGlzud4+n4BB2Y7CpyPsoxcy2COPE8AlkoauVSsyjXpZ
         fJMA==
X-Gm-Message-State: AOAM530zIDFkcw8uF6GO6V6loRACc167PDIxZslzDKomIwHvaCV/6o6b
        RuTsDmWBWuk4LK5XJLDJGuEXtZerjaj2jolX
X-Google-Smtp-Source: ABdhPJzNtKL1HcPJOrLH74epfJg89R/Ahcc3SQHgfaY44u+e9ku3/dHs9rS3gWRsrlaxW06PVEN+4Q==
X-Received: by 2002:a05:651c:48f:: with SMTP id s15mr8942119ljc.412.1606725160816;
        Mon, 30 Nov 2020 00:32:40 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id 7sm2742700ljq.34.2020.11.30.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 00:32:40 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH] usb: ohci-omap: Fix descriptor conversion
Date:   Mon, 30 Nov 2020 09:30:33 +0100
Message-Id: <20201130083033.29435-1-linus.walleij@linaro.org>
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
 arch/arm/mach-omap1/board-osk.c | 2 +-
 drivers/usb/host/ohci-omap.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index 144b9caa935c..a720259099ed 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -288,7 +288,7 @@ static struct gpiod_lookup_table osk_usb_gpio_table = {
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

