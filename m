Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59A6F182202
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 20:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731069AbgCKTQP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 15:16:15 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44096 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731183AbgCKTOy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Mar 2020 15:14:54 -0400
Received: by mail-wr1-f65.google.com with SMTP id l18so4090516wru.11
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2020 12:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2FvaQYbh+DmrT5z3VnA+Z2hjXjMayiHnru+yMFyYikU=;
        b=DPWQJm2K/cI6KBQ4ezXYmGMA25WEQ0ytHwNBg4ktboMQIFi6QjJRR73DRuP1QwgyDj
         9X/j+a7cxRkLSovdPvsZ6F+0BjpNKW2Ob+l7HXzXVa7f1URSmV0BcI6ZrXJ2CqdHlkqc
         I6RATi2h+yO31tVEmcny45DoKPlOOUarpT5g2EgiRsLErYeac3mbQrpp4R86wTJAUyFr
         bVfLxzd043elz0qc/kicrIzJ0X1JDNIMOxB6j+Ce+O+ai8hH4jyIw9YWKhY1nacgvaQx
         jxBi0J52wjhqqkgYogryjDJ4l3pMQ7xVmpvkiXPv/oT6eLeiyg/EZQaxzLjN/r5BKZV+
         eLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2FvaQYbh+DmrT5z3VnA+Z2hjXjMayiHnru+yMFyYikU=;
        b=peoZQJzlMJUk/Mf7//Pgq4D9DyZwrEOmsVjQ0qCpgunz4URyP1avNNQOSzmetWs1vn
         afVnBk7gHSNzjx9wojqMWHWYLeY+O/D8q7LrTEKi44/zRT0T+17Gh/oHw3y407WHi5h3
         X/6MCpriDsCuPEwmlVm+YJrLaLpWMtBeVAz6M8No0PFCdA0rW2enyjOjtI1Pd4CyaPJK
         4/jUFw6lNeLJDxYd4tCwcUrkqCNpST6Rd2le934co/4Ujg4qk1fg3mXStEEzUWSZ1LxJ
         eE5OTZXuJ4Mkq1iehRid5p7kXN1b2w0W5Z5Fq5X4hKwEkqS12Mc8LOfUwHL5vJhAbf2G
         LfoQ==
X-Gm-Message-State: ANhLgQ0HuXTC0kdPzSe91AAqL7EzDwVY8vNGenxe7FzHo+C4aD8t3qlx
        EgJtupVAvYEkUy846e4WM0vcmQ==
X-Google-Smtp-Source: ADFU+vtpowS0bzwahGC7y224TiYbPRgsAKOlwjrIN096zE6Y/8gR2auOuAGzRIpzTboXSxLs3FbKtA==
X-Received: by 2002:a05:6000:12c3:: with SMTP id l3mr5912716wrx.70.1583954093196;
        Wed, 11 Mar 2020 12:14:53 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id n24sm32958496wra.61.2020.03.11.12.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:14:52 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 4/7] usb: dwc3: qcom: Add support for usb-conn-gpio connectors
Date:   Wed, 11 Mar 2020 19:14:58 +0000
Message-Id: <20200311191501.8165-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds a routine to find a usb-conn-gpio in the main DWC3 code.
This will be useful in a subsequent patch where we will reuse the current
extcon VBUS notifier with usb-conn-gpio.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Felipe Balbi <balbi@kernel.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 1dfd024cd06b..6f4b2b3cffce 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -550,6 +550,21 @@ static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
 	.ss_phy_irq_index = 2
 };
 
+static bool dwc3_qcom_find_gpio_usb_connector(struct platform_device *pdev)
+{
+	struct device_node	*np;
+	bool			retval = false;
+
+	np = of_get_child_by_name(pdev->dev.of_node, "connector");
+	if (np) {
+		if (of_device_is_compatible(np, "gpio-usb-b-connector"))
+			retval = true;
+	}
+	of_node_put(np);
+
+	return retval;
+}
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node	*np = pdev->dev.of_node;
-- 
2.25.1

