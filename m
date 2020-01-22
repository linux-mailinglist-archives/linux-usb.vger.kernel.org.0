Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD33C145C03
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 19:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbgAVS53 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 13:57:29 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43985 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729137AbgAVS41 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 13:56:27 -0500
Received: by mail-wr1-f67.google.com with SMTP id d16so206063wre.10
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 10:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W1LoqEm0ztBHlPFj+2nWtTXi63kWnlasBU3cowxgKSk=;
        b=IxMrCoevHrsOr4JZg7eG+AfwFeMrW4YEuXJlDhMeUzJ2fcBTxu9wq8roZgod47aWSo
         PbreijRtTIjaRbNCqwHp/QCQhj6czZaX8yn68d2jUZvCXFg1kMa0/xJIR9mfGixl9ty0
         OGspsl8fYCExms6GWoxtlDQqZ3NQ5yyIltZzmgmwU3vz90zt1YzYdZqXE7VQ8RJkvvXB
         NEgkGWREW9QCDBMS4tV7Pz19zX4RPolVNjzXFWDu/rhD1K2MgbCMU+mvhHKcmGLpFpEN
         WqJ+94vMamwlO2sYEwAukXJ6zmsqibIdhJdmwhrBuurnwBXTz8KcrqQ5tmyZQZ22jV73
         wrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W1LoqEm0ztBHlPFj+2nWtTXi63kWnlasBU3cowxgKSk=;
        b=YLph5J2NZlFR3RqMKGAmBdi9rdMS0ocfqRIys5XlEP71PCj8vqwku+sUtbRVMu2PHa
         CHC6MztB0KLMlMhcIbbgjikXquXfgrKv8ZD4Z47SbMrJ0m5Rm6G2N0xkARtvAtVVOtvq
         OLZuZQihVAiHECFAwpj69e7owW51CBMWKCw8+xeIWmSn/vFNLWYXg9Pp3OAtOy1qhh+k
         Jqa+L1jv1UXj7YeHGSaR9VmRDGqjwrDH/W06nd869GiO5/BDGV4KLsZLGa1W6izpMVLZ
         w9UDx5jeypAFqD8Y3JeVkj1bWlfrd62qg1htBvpElxXJL/hWRi77oLO8z3jm6uqdzYCx
         +boA==
X-Gm-Message-State: APjAAAXnNm5shOdKLnXKiYD+SIoAVPrrvU/9plCfTtQe1bPhCxZJY6Tg
        kJtew9nXIJG9pfO/JGsOza2Dqg==
X-Google-Smtp-Source: APXvYqwcWSHLap8db5jzjk4LW4TPu+IcrZ2K6FRdoFLOcKJgQY9ZjStCzj7FkYaYJbUhto2TNRJIig==
X-Received: by 2002:a5d:6206:: with SMTP id y6mr12490917wru.130.1579719384258;
        Wed, 22 Jan 2020 10:56:24 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:23 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 09/19] usb: dwc3: qcom: Override VBUS when using gpio_usb_connector
Date:   Wed, 22 Jan 2020 18:56:00 +0000
Message-Id: <20200122185610.131930-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Using the gpio_usb_connector driver also means that we are not supplying
VBUS via the SoC but by an external PMIC directly.

This patch searches for a gpio_usb_connector as a child node of the core
DWC3 block and if found switches on the VBUS over-ride, leaving it up to
the role-switching code in gpio-usb-connector to switch off and on VBUS.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 261af9e38ddd..73f9f3bcec59 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -550,6 +550,16 @@ static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
 	.ss_phy_irq_index = 2
 };
 
+static bool dwc3_qcom_find_gpio_usb_connector(struct platform_device *pdev)
+{
+	struct device_node	*np = pdev->dev.of_node;
+
+	if (of_get_child_by_name(np, "gpio_usb_connector"))
+		return true;
+
+	return false;
+}
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node	*np = pdev->dev.of_node;
@@ -557,7 +567,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct dwc3_qcom	*qcom;
 	struct resource		*res, *parent_res = NULL;
 	int			ret, i;
-	bool			ignore_pipe_clk;
+	bool			ignore_pipe_clk, gpio_usb_conn;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
@@ -649,9 +659,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	}
 
 	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
+	gpio_usb_conn = dwc3_qcom_find_gpio_usb_connector(qcom->dwc3);
 
-	/* enable vbus override for device mode */
-	if (qcom->mode == USB_DR_MODE_PERIPHERAL)
+	/* enable vbus override for device mode or GPIO USB connector mode */
+	if (qcom->mode == USB_DR_MODE_PERIPHERAL || gpio_usb_conn)
 		dwc3_qcom_vbus_overrride_enable(qcom, true);
 
 	/* register extcon to override sw_vbus on Vbus change later */
-- 
2.25.0

