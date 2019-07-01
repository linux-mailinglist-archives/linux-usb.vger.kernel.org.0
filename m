Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDDD53B0F5
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 10:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388504AbfFJImW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 04:42:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42076 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388427AbfFJImV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jun 2019 04:42:21 -0400
Received: by mail-wr1-f66.google.com with SMTP id x17so8231471wrl.9
        for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2019 01:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/JaaoIAXOHk6r3bUaQxdq6m85g1r1iKBVjxqAQyHOKY=;
        b=KPlC0asTsYkXAfvDqUgZ/ZaGrDo+NxM0SUTauF0UbE0oVpuEWnIjRW0d4d4eK3voTD
         pge6GUVTA/fOzY986+f87X1ppOF9lBX/SJnB6PLo3ZBMUM4btr9ZgT52VrVoUYg6DjxP
         GDwl2RYwc3KZFbYYOUO3ZrWlaGx5HYX4zfLwpGSgW/2GTQ7xbl0Alf4DCt3G1sYvnqSW
         2Av4JLFjVKf7QTkUgs1H7ADEuNQ5LzdMzUJaFzpVBAtRA/8TYBBSW9Q0lsFsJos8ocay
         nmgNOyF2wm1/PaAVAYW9o9Jr1cxdmnCAS9Qj9m/op6h7efURq90aW+ZwaKXNAbnSK7wP
         aIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/JaaoIAXOHk6r3bUaQxdq6m85g1r1iKBVjxqAQyHOKY=;
        b=qSgjDPt4lcikUeWR8uHL4IjyHidB+0fumBc0gNVq+OJCX8ogE6u9vWFHEI1zoBLjc4
         8YobOIQH+yqNhiMGR4I7migra4dk6YG2pr9hJJuXkyfbmhkORwLx29+v+uoaR35CgXCK
         pVSv5yoFKA2zVa0wVC3IKqUEpUg4+2lXw6e2OC+pU0Fiv03+yCgUB/4zropbBE43zBM8
         C7mN1Yg/YQSKiGTwJl9G0na0wweqqHRGvt+uzE1GOBCLCf1ZOAjjokytY3uYWfkROJ7y
         MYiSpnfxaJ+SxAj08uUdy9Dh+zKKjMhH9hjvQO0n4eAtMRdwSJdP7ShpoTiiWa0ETKfa
         BHdA==
X-Gm-Message-State: APjAAAXEpgc7KqfwwsWVHGjvn+ouuyvoontc2lzgRnwosjAvgLyXdRqi
        71bSzTWFbB7kBR936YLdbgLQUA==
X-Google-Smtp-Source: APXvYqzQZOiDnuYFcAlCqVwbD8w92qHikrlYd/QR16F3PP1kyMO+vT8BZ4gvbN767L0PA0e6vy3+bQ==
X-Received: by 2002:adf:e5d2:: with SMTP id a18mr30727001wrn.212.1560156139427;
        Mon, 10 Jun 2019 01:42:19 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a125sm9929670wmf.42.2019.06.10.01.42.18
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
Subject: [PATCH v3 4/8] pinctrl: qcom: sdm845: Provide ACPI support
Date:   Mon, 10 Jun 2019 09:42:09 +0100
Message-Id: <20190610084213.1052-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610084213.1052-1-lee.jones@linaro.org>
References: <20190610084213.1052-1-lee.jones@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch provides basic support for booting with ACPI instead
of the currently supported Device Tree.  When doing so there are a
couple of differences which we need to taken into consideration.

Firstly, the SDM850 ACPI tables omit information pertaining to the
4 reserved GPIOs on the platform.  If Linux attempts to touch/
initialise any of these lines, the firmware will restart the
platform.

Secondly, when booting with ACPI, it is expected that the firmware
will set-up things like; Regulators, Clocks, Pin Functions, etc in
their ideal configuration.  Thus, the possible Pin Functions
available to this platform are not advertised when providing the
higher GPIOD/Pinctrl APIs with pin information.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig          |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c | 36 ++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 2e66ab72c10b..aafbe932424f 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -168,7 +168,7 @@ config PINCTRL_SDM660
 
 config PINCTRL_SDM845
        tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
-       depends on GPIOLIB && OF
+       depends on GPIOLIB && (OF || ACPI)
        select PINCTRL_MSM
        help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index c97f20fca5fd..98a438dba711 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -1277,6 +1278,10 @@ static const struct msm_pingroup sdm845_groups[] = {
 	UFS_RESET(ufs_reset, 0x99f000),
 };
 
+static const int sdm845_acpi_reserved_gpios[] = {
+	0, 1, 2, 3, 81, 82, 83, 84, -1
+};
+
 static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.pins = sdm845_pins,
 	.npins = ARRAY_SIZE(sdm845_pins),
@@ -1287,11 +1292,39 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.ngpios = 150,
 };
 
+static const struct msm_pinctrl_soc_data sdm845_acpi_pinctrl = {
+	.pins = sdm845_pins,
+	.npins = ARRAY_SIZE(sdm845_pins),
+	.groups = sdm845_groups,
+	.ngroups = ARRAY_SIZE(sdm845_groups),
+	.reserved_gpios = sdm845_acpi_reserved_gpios,
+	.ngpios = 150,
+};
+
 static int sdm845_pinctrl_probe(struct platform_device *pdev)
 {
-	return msm_pinctrl_probe(pdev, &sdm845_pinctrl);
+	int ret;
+
+	if (pdev->dev.of_node) {
+		ret = msm_pinctrl_probe(pdev, &sdm845_pinctrl);
+	} else if (has_acpi_companion(&pdev->dev)) {
+		ret = msm_pinctrl_probe(pdev, &sdm845_acpi_pinctrl);
+	} else {
+		dev_err(&pdev->dev, "DT and ACPI disabled\n");
+		return -EINVAL;
+	}
+
+	return ret;
 }
 
+#if CONFIG_ACPI
+static const struct acpi_device_id sdm845_pinctrl_acpi_match[] = {
+	{ "QCOM0217"},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, sdm845_pinctrl_acpi_match);
+#endif
+
 static const struct of_device_id sdm845_pinctrl_of_match[] = {
 	{ .compatible = "qcom,sdm845-pinctrl", },
 	{ },
@@ -1302,6 +1335,7 @@ static struct platform_driver sdm845_pinctrl_driver = {
 		.name = "sdm845-pinctrl",
 		.pm = &msm_pinctrl_dev_pm_ops,
 		.of_match_table = sdm845_pinctrl_of_match,
+		.acpi_match_table = ACPI_PTR(sdm845_pinctrl_acpi_match),
 	},
 	.probe = sdm845_pinctrl_probe,
 	.remove = msm_pinctrl_remove,
-- 
2.17.1

