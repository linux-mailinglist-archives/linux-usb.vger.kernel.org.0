Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 029321821CF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 20:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731222AbgCKTO7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 15:14:59 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37007 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731210AbgCKTO6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Mar 2020 15:14:58 -0400
Received: by mail-wm1-f67.google.com with SMTP id a141so3397728wme.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2020 12:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z91zScAZZwulAyvz3u3tr6aLJzcsPLOyuebpL+WCLno=;
        b=r1el2UpdttKCVTo/Phr0FTb83h+6MEFUdXPmm4p8xDLISKy4paWoEmm8CM7JMi90MX
         8LmMTuCQvO7Bq9oSq0GPGpRj7JeM8uxk+4wRo09oNwhWKNpLuVxC/N4EmGzhLposlCVC
         A0OFwe+GJjE7LhizNca0Sia0ncEtfYZGL0ZSZYFOdefk0lZvc6Fx0i6remRMGo2mKeB+
         Kk/SCvJ9V2RAZOPZcpnztzT/rXtQ299Jd3KoUHROGDLGVshjqKEoXcnu/8fI5JOXwt2O
         Vc3DUO2PvWYHTPnkt9tJeOvPu0mbrhaj6WoOC0y+sJ/wULALRa+X/uSC+r6pfBo8MIRU
         SuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z91zScAZZwulAyvz3u3tr6aLJzcsPLOyuebpL+WCLno=;
        b=JhacA3DhjQazzRXQpaPhKs8tBgUSBUjuXA5ELS1mYeuNhqem1uATV2w3vdDoHzxHTJ
         rRxE5Mq8n3JWTrXR5Ck32SGk3fKY4R9BIQk7LGU00nfRy7upTpBS+0+6D1SRrY9faL9Q
         +kPJRsL5fGvPFjDHM974RPirmeF1HCENDx7U7Q2UDzUHjWMmBwajewjpLRnvP04DpEH5
         q01m8KG5LxIzj4LhuM4JccVLg3XyWzXt4m6rnjuFf8vwVt0FQd69V8fz4U3rBJG0D8OR
         1cUHXrZ6uTqEFDmkZAmusZLuWkamDH2hui9ipc2iUSrM+njcGzCV06fB8GLM7T8cDv96
         02DA==
X-Gm-Message-State: ANhLgQ126eZbxYXV5eqYiDaXYEKMaGHRyO2Y3+0vpeEn2UlOAaYzSeJE
        +7MGdzejbjecM1EnfKwPEqIXGw==
X-Google-Smtp-Source: ADFU+vvuhvgtiuMVWq5U8ezUlV4NbLmjf0dUAE8V/9qJPXi4TIiZ/VIBKWQAmz5mjTginjpk5wI9ag==
X-Received: by 2002:a1c:2747:: with SMTP id n68mr254288wmn.14.1583954096913;
        Wed, 11 Mar 2020 12:14:56 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id n24sm32958496wra.61.2020.03.11.12.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:14:56 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 7/7] usb: dwc3: qcom: Enable gpio-usb-conn based role-switching
Date:   Wed, 11 Mar 2020 19:15:01 +0000
Message-Id: <20200311191501.8165-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
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
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

