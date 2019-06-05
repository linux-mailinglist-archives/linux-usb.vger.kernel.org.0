Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB83835B6D
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 13:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbfFELnM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 07:43:12 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:32796 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727410AbfFELnL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 07:43:11 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so1588293wmh.0
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2019 04:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=slZHnEyI/3MoxuWJDHsmJjpXD82N/IlcEekyL2S9VGE=;
        b=j2KSLfxvw6LpCJS/q1Nf891vaquUjMnjhjHXaXKoNlaNzIsTXGlKgIESq9y0v20BQr
         ZrA//WM6B3HdAGlJ81JT9BHzbVGmBgirG05tlCUS9ecIsCh3FKd+KD9NlgCEok9awU0Z
         Im1qfaKG6HeX/aXkgj5tg/rDIXO8cYV+PgRRyHkM/ELMWg3Msw5/a0JLuq1sYrG7Lqe6
         qUQQCD4zZGB8cnfGOv0LIkW0y4ZT3RPbUPMMtH+MveZSRCaTP2svASVC6GvSh25s1oLW
         3R4BK00UPLvxseS4xz8nb8pLNI7pAGEE1H7j+sTuvYEJWeC9wYe3recdfqkXnR2JG4rA
         Zjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=slZHnEyI/3MoxuWJDHsmJjpXD82N/IlcEekyL2S9VGE=;
        b=IIuwktP1kgX9htBfP75jeFaNn1KTE9L6MPF2gvLichHAece1UeJbikMeMtL+Xoqs6l
         BkxIB99A/IJpPn1HrNPTZUTembFCz8Q+QAnlDK3uaH+C7FmZgiNWmLO7G6V7ASElItaP
         Q3vnFoED7dQ8DI+KrrJgItarsOIfb7kqjVfgPZKk5VejwgLH6vlG+H2oNw7p+d6rjb/O
         DmYpjxZug8jSdom+TlEDyxgoPOTCH4y8Dv8EBgLiEF7+bFRSz804QYxsQlFoZeJkSkKP
         EDrkn7EBqDg3fJMwiVpvMI15OzEqMBld9tSV5//XXtVbtrqxy3vUsDihomZciAtxrfK+
         lYcA==
X-Gm-Message-State: APjAAAUp/F/E9ZuG57BWo1noQ3ogo4bPUoAt1H8QmdnQkTv/UM+tR9pR
        p9v89B2tgyUIDE1PCZRS2nyARw==
X-Google-Smtp-Source: APXvYqxVTptCcX2uGixf0N44Kl5OHSxzgZYUvfvy2V4qwpWpSrfBEjEmKdSrH6pQUVJdJFXxKpsnzw==
X-Received: by 2002:a1c:3d82:: with SMTP id k124mr21709121wma.162.1559734989668;
        Wed, 05 Jun 2019 04:43:09 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id 34sm27718740wre.32.2019.06.05.04.43.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 04:43:09 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 3/8] pinctrl: msm: Add ability for drivers to supply a reserved GPIO list
Date:   Wed,  5 Jun 2019 12:42:57 +0100
Message-Id: <20190605114302.22509-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605114302.22509-1-lee.jones@linaro.org>
References: <20190605114302.22509-1-lee.jones@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When booting MSM based platforms with Device Tree or some ACPI
implementations, it is possible to provide a list of reserved pins
via the 'gpio-reserved-ranges' and 'gpios' properties respectively.
However some ACPI tables are not populated with this information,
thus it has to come from a knowledgable device driver instead.

Here we provide the MSM common driver with additional support to
parse this informtion and correctly populate the widely used
'valid_mask'.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 18 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index ee8119879c4c..3ac740b36508 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -607,8 +607,23 @@ static int msm_gpio_init_valid_mask(struct gpio_chip *chip)
 	int ret;
 	unsigned int len, i;
 	unsigned int max_gpios = pctrl->soc->ngpios;
+	const int *reserved = pctrl->soc->reserved_gpios;
 	u16 *tmp;
 
+	/* Driver provided reserved list overrides DT and ACPI */
+	if (reserved) {
+		bitmap_fill(chip->valid_mask, max_gpios);
+		for (i = 0; reserved[i] >= 0; i++) {
+			if (i >= max_gpios || reserved[i] >= max_gpios) {
+				dev_err(pctrl->dev, "invalid list of reserved GPIOs\n");
+				return -EINVAL;
+			}
+			clear_bit(reserved[i], chip->valid_mask);
+		}
+
+		return 0;
+	}
+
 	/* The number of GPIOs in the ACPI tables */
 	len = ret = device_property_read_u16_array(pctrl->dev, "gpios", NULL,
 						   0);
@@ -964,6 +979,9 @@ static void msm_gpio_irq_handler(struct irq_desc *desc)
 
 static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
 {
+	if (pctrl->soc->reserved_gpios)
+		return true;
+
 	return device_property_read_u16_array(pctrl->dev, "gpios", NULL, 0) > 0;
 }
 
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index c12048e54a6f..23b93ae92269 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -121,6 +121,7 @@ struct msm_pinctrl_soc_data {
 	bool pull_no_keeper;
 	const char *const *tiles;
 	unsigned int ntiles;
+	const int *reserved_gpios;
 };
 
 extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
-- 
2.17.1

