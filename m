Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4679A3BAACD
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jul 2021 03:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhGDBeE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Jul 2021 21:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhGDBeB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Jul 2021 21:34:01 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48541C061765
        for <linux-usb@vger.kernel.org>; Sat,  3 Jul 2021 18:31:27 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id t6so7527067wrm.9
        for <linux-usb@vger.kernel.org>; Sat, 03 Jul 2021 18:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1aCHfqIx1OU8E5Hf81YXPP9hGTpgNLpK3KsMYAAxRMM=;
        b=O9EZzPB6M2qU0A9VAU4mG3WBkYELV4uRugSz5aFORo7amV1CoOytGeg4iLwXvnhKKC
         GfIBPOxnBSpeDx8xzu/7N+3fVoZ7keEP63qzIEW13elB7VrFI6ObmkAFsYgrpl5lYG6D
         P5/SbjZuUtcJirDMb3jIZQ0+cLlQk3FOXU19EnAxf1uHhULn+NTtZoSlw7Xt+2Kl8jUM
         zU8hE/Nf51H6A9IqreUfGtf1wZjs9Tdpgj1y20A8ZNkxoeTcLxgcxleBYf7tD5bqDsaK
         vud8DiFCqxhMZNeUvSBmlQlIldwsE/JoS5zgQguP7v9/X6mdyNAAtBYKoXJKfZ1P4XiC
         +VnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1aCHfqIx1OU8E5Hf81YXPP9hGTpgNLpK3KsMYAAxRMM=;
        b=Mje04rsDv8KvA1cRjPaX5+LfMb8Qm9qrGIBO9T/s5mfRGHKD1FMCX2plyyMqAsEjQv
         Bdw8qDny/v8jrDhcyhQfKv+Gp+GEv1fpn17lpzf+bYXmiMgoDXwHSUD7PqcYB3Y+xIrN
         03rP3G0Z/Lhe0H0389kcQlNW25lopzOFAzQYlpN5lAX+s7DnPIGks863eMloI9VPjfmg
         4FPQZZR31l5OTcSy8soHYs1ZFRFNqwIpOF8UAalYC0+p3C/AyvtOYzh4WUo++/hy36sw
         IrR8Z5uHsbwmQtwuTtjmVnOlm+SdM5CfKcAlG3mPihZlEuE/523Yeo4MJLRcCQtHtrYf
         JILA==
X-Gm-Message-State: AOAM5332bcJTWuu4x2qCGkxS4vNQ4+ZEiW7J1XpIQtxI1iIqPxc/MwQI
        Ezagyk7Zb7FnRX4/AGswDOSSdQ==
X-Google-Smtp-Source: ABdhPJxzKsQOtx1/yTn2mfkNxLDh9GzsX2YrWszklikh6Uqm7cMcelYyJtpQyunkTFqtIJudWF/Rfw==
X-Received: by 2002:adf:ec44:: with SMTP id w4mr7843022wrn.200.1625362285794;
        Sat, 03 Jul 2021 18:31:25 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l16sm18026717wmj.47.2021.07.03.18.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 18:31:25 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 1/3] usb: dwc3: dwc3-qcom: Fix typo in the dwc3 vbus override API
Date:   Sun,  4 Jul 2021 02:33:12 +0100
Message-Id: <20210704013314.200951-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Wesley Cheng <wcheng@codeaurora.org>

There was an extra character in the dwc3_qcom_vbus_override_enable()
function.  Removed the extra character.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 49e6ca94486d..2e61302e3e91 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -115,7 +115,7 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
 	readl(base + offset);
 }
 
-static void dwc3_qcom_vbus_overrride_enable(struct dwc3_qcom *qcom, bool enable)
+static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 {
 	if (enable) {
 		dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_SS_PHY_CTRL,
@@ -136,7 +136,7 @@ static int dwc3_qcom_vbus_notifier(struct notifier_block *nb,
 	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, vbus_nb);
 
 	/* enable vbus override for device mode */
-	dwc3_qcom_vbus_overrride_enable(qcom, event);
+	dwc3_qcom_vbus_override_enable(qcom, event);
 	qcom->mode = event ? USB_DR_MODE_PERIPHERAL : USB_DR_MODE_HOST;
 
 	return NOTIFY_DONE;
@@ -148,7 +148,7 @@ static int dwc3_qcom_host_notifier(struct notifier_block *nb,
 	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, host_nb);
 
 	/* disable vbus override in host mode */
-	dwc3_qcom_vbus_overrride_enable(qcom, !event);
+	dwc3_qcom_vbus_override_enable(qcom, !event);
 	qcom->mode = event ? USB_DR_MODE_HOST : USB_DR_MODE_PERIPHERAL;
 
 	return NOTIFY_DONE;
@@ -811,7 +811,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	/* enable vbus override for device mode */
 	if (qcom->mode == USB_DR_MODE_PERIPHERAL)
-		dwc3_qcom_vbus_overrride_enable(qcom, true);
+		dwc3_qcom_vbus_override_enable(qcom, true);
 
 	/* register extcon to override sw_vbus on Vbus change later */
 	ret = dwc3_qcom_register_extcon(qcom);
-- 
2.30.1

