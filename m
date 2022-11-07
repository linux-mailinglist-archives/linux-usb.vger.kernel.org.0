Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04B7F61EE3B
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 10:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbiKGJIJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 04:08:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbiKGJH6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 04:07:58 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3797D167D4
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 01:07:57 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id i21so16428057edj.10
        for <linux-usb@vger.kernel.org>; Mon, 07 Nov 2022 01:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xx5tJV+VJyItj+vrgYOnwXxDZAezPx0YoT/Cqlipao=;
        b=mD9PE1fuRXhYxhwfO1pUx1reoDZ/uojqrvJB7QslbbFmRS6z9snUTNU3vkphyCweii
         80UACwqk/79pf5SknSPa37ng+C40N/MztlKJksb46a2D3THiRXpLR9R9UIPvelgnvqob
         klIYCm1+LKeb0a/Kuq6YJxZV9tFBgEu10J+QHxSiFJWHbMAWGFtqkmCPEm2bO2FcjCUr
         JZB+crHIliqQdxGCmwIIkLtv7ALv2+/5IWVa/YoOKuSyMLbCk8II3TjrMkSNNE9+CKvl
         4rvVhA0Muc/YffrMXWcpW15sM8Esam4jkd/69WTzn7pvq+yrB8R4Tiv21hMAip9/Lfal
         3I6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xx5tJV+VJyItj+vrgYOnwXxDZAezPx0YoT/Cqlipao=;
        b=2GOTlnaodIR0TKhmCGZi2iHvduovWim6X6k38dsxDrdVeEjdLwOI/FzgC/WyYNQz0p
         hXVyU14QDgANbClzHlcM1iMudJQ3Co1CaLzpP94Qqjbn3r8CAi5w/tuTen/PnGcOhkPC
         ffnqhTUrcWxn136tLjpft7ka0PBCS1ImYZWj9oq1vArglbAA/07f34+U/cODTGa9dbdn
         SLremf+KnlJjWlrwpldPeCmOlVZG667Lqil4tQzqMEaUJkC6qfcH0Jwakxncvp7j+EL/
         V+P/3Xw81Y1grLo4B5g0AxUkdlGi1xyUd8fXGVJQM1gOsLyyRh/CpkpUhhdGZjU7/7b5
         Z8DA==
X-Gm-Message-State: ACrzQf21YXY9RUf0Zsna7u1InqoAOE6LTC0ALNyu58jlPVCi9mrTLFc6
        hd/rRMhsLpalW2CdLHpuK1dybw==
X-Google-Smtp-Source: AMsMyM4SCWYswmdQLsr0TW2iJuRuwZ6HTS2Rb1SI4ROMGPAGTngJDTClA1R0rKexLFeEMDVrsOAAgA==
X-Received: by 2002:a05:6402:2201:b0:44f:443e:2a78 with SMTP id cq1-20020a056402220100b0044f443e2a78mr47889908edb.76.1667812075798;
        Mon, 07 Nov 2022 01:07:55 -0800 (PST)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id o7-20020a056402038700b0046150ee13besm3781658edv.65.2022.11.07.01.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 01:07:55 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] USB: bcma: Make GPIO explicitly optional
Date:   Mon,  7 Nov 2022 10:07:53 +0100
Message-Id: <20221107090753.1404679-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

What the code does is to not check the return value from
devm_gpiod_get() and then avoid using an erroneous GPIO descriptor
with IS_ERR_OR_NULL().

This will miss real errors from the GPIO core that should not be
ignored, such as probe deferral.

Instead request the GPIO as explicitly optional, which means that
if it doesn't exist, the descriptor returned will be NULL.

Then we can add error handling and also avoid just doing this on
the device tree path, and simplify the site where the optional
GPIO descriptor is used.

There were some problems with cleaning up this GPIO descriptor
use in the past, but this is the proper way to deal with it.

Cc: Rafał Miłecki <rafal@milecki.pl>
Cc: Chuhong Yuan <hslester96@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/host/bcma-hcd.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 2df52f75f6b3..7558cc4d90cc 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -285,7 +285,7 @@ static void bcma_hci_platform_power_gpio(struct bcma_device *dev, bool val)
 {
 	struct bcma_hcd_device *usb_dev = bcma_get_drvdata(dev);
 
-	if (IS_ERR_OR_NULL(usb_dev->gpio_desc))
+	if (!usb_dev->gpio_desc)
 		return;
 
 	gpiod_set_value(usb_dev->gpio_desc, val);
@@ -406,9 +406,11 @@ static int bcma_hcd_probe(struct bcma_device *core)
 		return -ENOMEM;
 	usb_dev->core = core;
 
-	if (core->dev.of_node)
-		usb_dev->gpio_desc = devm_gpiod_get(&core->dev, "vcc",
-						    GPIOD_OUT_HIGH);
+	usb_dev->gpio_desc = devm_gpiod_get_optional(&core->dev, "vcc",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(usb_dev->gpio_desc))
+		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
+				     "error obtaining VCC GPIO");
 
 	switch (core->id.id) {
 	case BCMA_CORE_USB20_HOST:
-- 
2.34.1

