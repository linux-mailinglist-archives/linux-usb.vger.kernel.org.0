Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD0923B0FC
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 10:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388634AbfFJIms (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 04:42:48 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51201 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388481AbfFJImW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jun 2019 04:42:22 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207so2726772wma.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2019 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9rm9ccpuGtAMzIOW1NWstMoYndtXNXfoUtRC4Q0MWiI=;
        b=O3IPYAnJIDAl9EBtH7E8TaBsbNYtCKJBzNXBhBSGchgmycGXMZ+SeXXWnHSJOF+E1x
         lQJx8GEVyLHbCQSfwQGcmlHAXj/qpJqdYd+xa6Ge30LjoqMMj+e3DI1Mf5jTQdOnB7lv
         qBdw4GPvolTSV9zkgu3+9mYCaajae+noAZGPuKK4G0hfX8CoHLO+xuJwymz43tAPCRTS
         oFAksS5WtCnQ7hjeAO1Bx0DsLKc7CGuGhzCCjiYBjfnFqYs9mTkBQ+gLf+CtMSny0UhA
         EEWQm6DVSKX1xMXFHmiAC7i0TC6/CjOQCe/Z53vgI+f5Bs62A+INNhrLfdctLDZ8DOfP
         EVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9rm9ccpuGtAMzIOW1NWstMoYndtXNXfoUtRC4Q0MWiI=;
        b=lYdM4eWxvtq5fzFUFUh+cJcxlGwhMBHcWwDCpZ32D/OXI8Xcu+aWCA8onEKZfW+9lf
         fikJabMr4yv4w8wnKUW6FJf3GYVGEiLj7dP4IF+blmS48fNxXb4tcF47FXBw3FEv2c29
         iu6iU6soj2yPVrJ5tCYhGngdNhYjOzOZqwoV9bqqVDCTfnDR4j0NT60p+bXs0xk57jko
         9Lv6j39VothS92HXhgXmrfvKh2iLyHKLcfUwR7KPdJY4clmzGzdy05CCAl9KoGaqmtMC
         88Nlg9ck5JWXtGm1jkA87imREqzhGxXPRFSRww1mxwa3vu7t4jYd3P7N/SjLoc37HcGe
         Q94g==
X-Gm-Message-State: APjAAAVcWjQ+aqfW+Wsy1tbIqk512d+F3zDqR5s8BFVtOdJ8jy+hK+3m
        24Oe/n3hO8jCmN3krBoKq+f+mw==
X-Google-Smtp-Source: APXvYqy0TzWjN//I98gsrjpi6bkDoeqKWl3h2z+48UmR2v8GC9sKAVPvXFf6vTUnnB6w26x9gz61Hg==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr13074978wma.114.1560156140428;
        Mon, 10 Jun 2019 01:42:20 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a125sm9929670wmf.42.2019.06.10.01.42.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 01:42:19 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 5/8] soc: qcom: geni: Add support for ACPI
Date:   Mon, 10 Jun 2019 09:42:10 +0100
Message-Id: <20190610084213.1052-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610084213.1052-1-lee.jones@linaro.org>
References: <20190610084213.1052-1-lee.jones@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When booting with ACPI as the active set of configuration tables,
all; clocks, regulators, pin functions ect are expected to be at
their ideal values/levels/rates, thus the associated frameworks
are unavailable.  Ensure calls to these APIs are shielded when
ACPI is enabled.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 6b8ef01472e9..d5cf953b4337 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
@@ -450,6 +451,9 @@ int geni_se_resources_off(struct geni_se *se)
 {
 	int ret;
 
+	if (has_acpi_companion(se->dev))
+		return 0;
+
 	ret = pinctrl_pm_select_sleep_state(se->dev);
 	if (ret)
 		return ret;
@@ -487,6 +491,9 @@ int geni_se_resources_on(struct geni_se *se)
 {
 	int ret;
 
+	if (has_acpi_companion(se->dev))
+		return 0;
+
 	ret = geni_se_clks_on(se);
 	if (ret)
 		return ret;
@@ -724,12 +731,14 @@ static int geni_se_probe(struct platform_device *pdev)
 	if (IS_ERR(wrapper->base))
 		return PTR_ERR(wrapper->base);
 
-	wrapper->ahb_clks[0].id = "m-ahb";
-	wrapper->ahb_clks[1].id = "s-ahb";
-	ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
-	if (ret) {
-		dev_err(dev, "Err getting AHB clks %d\n", ret);
-		return ret;
+	if (!has_acpi_companion(&pdev->dev)) {
+		wrapper->ahb_clks[0].id = "m-ahb";
+		wrapper->ahb_clks[1].id = "s-ahb";
+		ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
+		if (ret) {
+			dev_err(dev, "Err getting AHB clks %d\n", ret);
+			return ret;
+		}
 	}
 
 	dev_set_drvdata(dev, wrapper);
-- 
2.17.1

