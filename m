Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3BD91573F2
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 13:07:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgBJMHn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 07:07:43 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36001 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgBJMHh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 07:07:37 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so10320627wma.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2020 04:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KGT7cuK2WmOqPM+GaMHuk0IBAIiJJMcrNXcAAtNhvDs=;
        b=cSdwBSRMX3Aviq82QTMjScosxXkhdcMKYXoCNznVnwf+pkT9GThDTgnxYeYSzHGkdA
         X5S5i7/xsj8W7RsOvC38JfGnwnYxs833tS/WOzyc0S/7XQVRfRxw+jkCZbhGr2Wgb+9f
         YzS2MIotiyOFzUnmJZCvqU4sPL/nH37ljbksCXL/vgYwNi+8pwIKcuWTbJO6qQ10szJ8
         fGGhKCXq7bAfyTEeE7/BWOvVth6cCBzmZ8H8VBkVubuVmn8Duqo0kTl43iVp8GHCO2oS
         Ri/QbwUB1mM8fLYmZCR9q90hOh0QLYP2gnm0XoZtPOgbiJSHY8Ta++XtTqUlh2kufx/J
         gKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KGT7cuK2WmOqPM+GaMHuk0IBAIiJJMcrNXcAAtNhvDs=;
        b=LZ3OSQ8yiiOOQ0vdUUQ/eGMhGje3zcNOreZtIazX1lF0Nnb5bpIlzGrXFigcgbab0y
         PtstqyEG0lJg0koEFnY9B+80Ltn83ou6F7L+3o7StVc7nF7Xq0r5BvHy5i1l145M1jm4
         0s0wh0nOmKMai+XbJwInOSVcWwczz1aOgDzCELmr3tLZJ43/qsRSnoEE42Vp8Q35FOry
         SLzx/yYeIRlNGAV1gJHf4wCF5LZYULtE9hTFMIG6dtUuYKfE4jpWna9Y0K4ZU5xIJ/H0
         gn6XtDNQuNCOU3PtDaMNM/IDAlHCpCyOFfn71/GTxK+r9Cz+4fIGMLYHov6xWjr0LVzz
         Yq9A==
X-Gm-Message-State: APjAAAVYvWRvx8rA7vjlFMcUIxFOadFhSiQD7m6qjg6Z1lSUqNKLCGNC
        O9Uim1/JImWTpj3x2p5v1dRzPQ==
X-Google-Smtp-Source: APXvYqyv8Db0ftvNxYsY8Fq9tIPM31b2DAu4z/a5J2irS2r7eqCCS0uE20oXnZMMubtd3YEE0oVtdA==
X-Received: by 2002:a1c:688a:: with SMTP id d132mr16089761wmc.189.1581336455638;
        Mon, 10 Feb 2020 04:07:35 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:35 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v6 12/18] usb: dwc3: qcom: Enable gpio-usb-conn based role-switching
Date:   Mon, 10 Feb 2020 12:07:17 +0000
Message-Id: <20200210120723.91794-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds the ability to receive a notification from the DRD code for
role-switch events and in doing so it introduces a disjunction between
gpio-usb-conn or extcon mode.

This is what we want to do, since the two methods are mutually exclusive.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index fc66ca3316ef..48e43dbc88cf 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -571,6 +571,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
 	struct resource		*res, *parent_res = NULL;
+	struct dwc3		*dwc;
 	int			ret, i;
 	bool			ignore_pipe_clk;
 
@@ -669,8 +670,16 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (qcom->mode == USB_DR_MODE_PERIPHERAL)
 		dwc3_qcom_vbus_overrride_enable(qcom, true);
 
-	/* register extcon to override sw_vbus on Vbus change later */
-	ret = dwc3_qcom_register_extcon(qcom);
+	if (dwc3_qcom_find_gpio_usb_connector(qcom->dwc3)) {
+		/* Using gpio-usb-conn register a notifier for VBUS */
+		dwc = platform_get_drvdata(qcom->dwc3);
+		qcom->vbus_nb.notifier_call = dwc3_qcom_vbus_notifier;
+		ret = dwc3_role_switch_notifier_register(dwc, &qcom->vbus_nb);
+	} else {
+		/* register extcon to override sw_vbus on Vbus change later */
+		ret = dwc3_qcom_register_extcon(qcom);
+	}
+
 	if (ret)
 		goto depopulate;
 
@@ -702,8 +711,11 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 {
 	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
 	int i;
 
+	dwc3_role_switch_notifier_unregister(dwc, &qcom->vbus_nb);
+
 	of_platform_depopulate(dev);
 
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
-- 
2.25.0

