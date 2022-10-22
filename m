Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF966608D25
	for <lists+linux-usb@lfdr.de>; Sat, 22 Oct 2022 14:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiJVMUr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Oct 2022 08:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiJVMUq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Oct 2022 08:20:46 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA601D2CF3
        for <linux-usb@vger.kernel.org>; Sat, 22 Oct 2022 05:20:44 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id b1so9476309lfs.7
        for <linux-usb@vger.kernel.org>; Sat, 22 Oct 2022 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HzyxPEnOCL1DeclpAlrxibOCTRkMhfRpJWE6my73VE=;
        b=WGQx9hxRx3A0uHQ21T03hr7lApZ4yyDxMRP4F9wLuurOZRIfXJLt5pNr/9bXJxQ+iY
         LIwdvdS4A8fhFjeAgHTTRi4NHGqxknDk8/aOm6VhL4JXbhzIUvHuKF2KkFA0wF/ncdk+
         N4GOSGXsbbXvT//7qfKHcz0yUHEHO9RAfpTVpBKFQYjGJGWtAxeaqNe6IVcsQCgHwYFV
         435TA+FLOi3goPsZrAyWFdXrPH/jjAGA8LFWXcLJKBFk71/tF0BFnEdgk/7IVvTrVZFZ
         +2d0q+jQRdLAF+LwODITQeG3HCHxci5ndYLUdXlJhBE9jTC1XCPgTWB5tt6fENP3UydT
         z0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HzyxPEnOCL1DeclpAlrxibOCTRkMhfRpJWE6my73VE=;
        b=AME2k5bDzDdvdgK5s+f9Xvsxt/DAJ7z8Gpbws3WdjsneRAPRB+KRSKUJlC5VpvZkrf
         AFMz07T1t9gSYyQwTSsVxB40C+2LzqNCAq6ZQlLZxyJtmC5BdvMZPaIU1kh7xLX1P7QF
         JRuv1whbSwIQo22oEpwCzEUXzyF9/qgS4BRSd6MzsuDdGXg5mmjgc/thTmrnQRKsi4Yk
         +qBpiwZAIBqy5weRFXguizoGquxKES0h1CHau0oU6Xr5BfG7xpraRvcWOgAZ8nA52IEL
         99pf5FZbNKOxFN5UJf5CSDx74mFznj3G2iU0TF5v8aaf5j8UU6/APUaT9j4h0eFOmISG
         7+AA==
X-Gm-Message-State: ACrzQf0fDI5UoBC/f4sEb7YU1d1giZ3kX6ur4DdMgPE9BJcQCvLUiIqz
        aTlfRA5MhbbXLHzlQ0YsMMKhpg==
X-Google-Smtp-Source: AMsMyM7ENl5sTMh5GJXOWOoBLA3zqkPXRsqtGeB4FQCPgNprJmIrOHrhiaGYhBnNKb9Mvo16lxBqfw==
X-Received: by 2002:a05:6512:3a4:b0:4a4:6db7:2d6b with SMTP id v4-20020a05651203a400b004a46db72d6bmr8070432lfp.403.1666441243206;
        Sat, 22 Oct 2022 05:20:43 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id n13-20020ac2490d000000b0049b8c0571e5sm3556115lfi.113.2022.10.22.05.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 05:20:42 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 2/2 v1] usb: phy: phy-gpio-vbus-usb: Add device tree probing
Date:   Sat, 22 Oct 2022 14:18:38 +0200
Message-Id: <20221022121838.3330528-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022121149.3329641-1-linus.walleij@linaro.org>
References: <20221022121149.3329641-1-linus.walleij@linaro.org>
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

Make it possible to probe the GPIO VBUS detection driver
from the device tree compatible.

Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/phy/phy-gpio-vbus-usb.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
index f13f5530746c..a9e4355a1b65 100644
--- a/drivers/usb/phy/phy-gpio-vbus-usb.c
+++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
@@ -366,12 +366,20 @@ static const struct dev_pm_ops gpio_vbus_dev_pm_ops = {
 
 MODULE_ALIAS("platform:gpio-vbus");
 
+static const struct of_device_id gpio_vbus_of_match[] = {
+	{
+		.compatible = "phy-usb-vbus-gpio",
+	},
+	{},
+};
+
 static struct platform_driver gpio_vbus_driver = {
 	.driver = {
 		.name  = "gpio-vbus",
 #ifdef CONFIG_PM
 		.pm = &gpio_vbus_dev_pm_ops,
 #endif
+		.of_match_table = gpio_vbus_of_match,
 	},
 	.probe		= gpio_vbus_probe,
 	.remove		= gpio_vbus_remove,
-- 
2.37.3

