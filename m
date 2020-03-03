Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51649177D00
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 18:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730702AbgCCRML (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Mar 2020 12:12:11 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54177 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730676AbgCCRMJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Mar 2020 12:12:09 -0500
Received: by mail-wm1-f65.google.com with SMTP id g134so2806035wme.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2020 09:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OjQamL43DyX5ZKZxf76rV+ncjDjjqwHBvZnOMO71+5w=;
        b=qrCUZFKTC26uiV3nWZX+HnZvyKjvdogewT44WMI46nlrCqDj0HF5Z1tU/RBRyGnv6e
         XuHz34+k9XTdGzKbGVuyvu1Gv0gj5TXl1pdX7vkHVn2a+Ra2tqf4QIOl+0iOrkZrBRHG
         acyQFA1tjPXzY+rts+qubM6YHC+Ox8un4bDXVkM+8nV/DBKTGTyjqf/iSDJcTrj5kxTk
         wRUs7dCyko+YZnC6K6/DMoXHNSnCmF/YC/k2dn9NydXeOJZwvIGr0SRVhM75Rvccdswr
         sD7oagf/vnF5lB/VcbZ5i5gttuR8v4Q55greTjSJeZobtzEuHFbrDEO39crTqIZkz7ax
         x8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OjQamL43DyX5ZKZxf76rV+ncjDjjqwHBvZnOMO71+5w=;
        b=ta2ik8knn/XAXv3uMG/Fq4tH4sULVQPcA8q9bVAfNSZkI1zrAiS7QJgFqm22cdR1ct
         Lg6LHUCuADlA0s7EBny3WDB3KVm4EcL1Wfo02s2B1/oFiEFKD/pGnxa/lrNZ49lTLsW6
         t5y5CEnLd4YqnNyZygPQPeplYZoI024P0ylXjYXNrypUQnSXmOHnirUu1DIRF6peyxuR
         BTeU2qFnx62fJq67oPRuTGji3Gwr5G1hwPs01R0ZnctcaZ2lH3gmKUZwVQXnw1VofLlh
         5fNt7eUkg/CyrSr8dd44cROGvrqfkM72JIvOAVfENbX6Gz+EhS7dt2RfNUH2JYsvTWIX
         fNbA==
X-Gm-Message-State: ANhLgQ0OyYCh/41w6TVzabWSPe67dzNX3URB7E78pBJZ/vWsfrahHFTZ
        0XByWoxLtp6VVnBx/kJXFqRdEw==
X-Google-Smtp-Source: ADFU+vsjOLSBRTWQQ5+w29BeK4bsLgwDfVpvP7UETnHiuzQw5xkU3zKeMsfaQUmL8yjS8uItlXC1uw==
X-Received: by 2002:a7b:c109:: with SMTP id w9mr5208820wmi.54.1583255527125;
        Tue, 03 Mar 2020 09:12:07 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:12:06 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 12/18] usb: dwc3: qcom: Enable gpio-usb-conn based role-switching
Date:   Tue,  3 Mar 2020 17:11:53 +0000
Message-Id: <20200303171159.246992-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
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
index 6f4b2b3cffce..f6a7ede5953e 100644
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
2.25.1

