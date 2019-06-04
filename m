Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA6734495
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 12:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbfFDKpQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 06:45:16 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37956 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfFDKpI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jun 2019 06:45:08 -0400
Received: by mail-wm1-f68.google.com with SMTP id t5so14192856wmh.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Jun 2019 03:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2HLapY/4ckHjahK5LJcjODvHB1d03rrvr/gU9+ztXyQ=;
        b=h3nEBCdfV7YoBlTlbe54J+YSDIvFJyXTob8NuoluPo7EfSZZElzYcZr6vSJWljnUnv
         dWRhGXI+d9hH5RgiAEGyaeZmndgWDOABLjIe3Fmy5TenMX9By9v01G8ZKdnulQokaH6A
         FKRiNN1x249LHRm8hy9rPBQnyYz1oVhCtEeYxPQomujeraH88eVU2RDpZYk8KZlLVtqR
         SOc/OCn6T89mrbQHSERwodJdfezyYN4154BMhcEWEUhOTb5rv7f8twOa0IADvr5wEn8c
         MacizzPwwOcliiupf2xtn0WwMsVCTUP3KKg8y95UkCtqVxXdgJrcDkPOTEsE0rsVuYCR
         c/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2HLapY/4ckHjahK5LJcjODvHB1d03rrvr/gU9+ztXyQ=;
        b=lNMfvXqx4fXmMWuMGhwR1KWJ+s6ikmLIh4aBToTwIID24HABa+UyARTkxdKnigBBmb
         4WNYaquRIb4HzaKc26M98YXLiljn+tr2cBzK5SJEYcc5uFmO6Jpgt/S/cI9P93JR28IH
         ei3GX0GVWlLYEZkicRM9yK9PSoupLQm3oCEuDWCSpwrAuEI74fPAnqLr7ZOEJIekPmCD
         Be7dHw+iLU1/kFqvKc4oKaT1MUsJW9+G34fASrTsyvAhuUgWJN13UP11kwEP1q4WTOte
         zvkmDH0x054GGN2239hyF8zca4A4uLwqhn3xfnZSIkTZVKgwKU5zrI+yae42Bzt/wyHG
         hk+w==
X-Gm-Message-State: APjAAAXev4S1pHYRUYJokJXHlK2JCaGKhhS+V2rldptbbzOp46zDPLZR
        fLWCsQkz9yqAVCljDddU+EaRaQ==
X-Google-Smtp-Source: APXvYqwAauLGrWOKVC2+6EC+g6TCNYY/YXSe0eNOWSn2KLwlCqvwxZRRPlOIe8/uut8i0itw+ONz9A==
X-Received: by 2002:a1c:b4d4:: with SMTP id d203mr18294440wmf.34.1559645106162;
        Tue, 04 Jun 2019 03:45:06 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t140sm2718623wmt.0.2019.06.04.03.45.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:45:05 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 7/8] usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
Date:   Tue,  4 Jun 2019 11:44:54 +0100
Message-Id: <20190604104455.8877-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604104455.8877-1-lee.jones@linaro.org>
References: <20190604104455.8877-1-lee.jones@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When booting with Device Tree, the current default boot configuration
table option, the request to boot via 'host mode' comes from the
"dr_mode" property.  A property of the same name can be used inside
ACPI tables too.  However it is missing from the SDM845's ACPI tables
so we have to supply this information using Platform Device Properites
instead.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 349bf549ee44..f21fdd6cdd1a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -468,6 +468,11 @@ static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
 
+static const struct property_entry dwc3_qcom_acpi_properties[] = {
+	PROPERTY_ENTRY_STRING("dr_mode", "host"),
+	{}
+};
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
@@ -603,6 +608,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 			goto platform_unalloc;
 		}
 
+		ret = platform_device_add_properties(qcom->dwc3,
+						     dwc3_qcom_acpi_properties);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to add properties\n");
+			goto platform_unalloc;
+		}
+
 		ret = platform_device_add(qcom->dwc3);
 		if (ret) {
 			dev_err(&pdev->dev, "failed to add device\n");
-- 
2.17.1

