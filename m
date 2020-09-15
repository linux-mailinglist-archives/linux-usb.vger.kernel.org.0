Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1531226ADAF
	for <lists+linux-usb@lfdr.de>; Tue, 15 Sep 2020 21:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727737AbgIOTfe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 15:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgIOTbe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Sep 2020 15:31:34 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29593C061797
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2020 12:31:32 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d19so1870340pld.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2020 12:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H/84KilK/yYDMqufI+fBihaymg1pJldWkGRLE+l3DQE=;
        b=HerVUrgPph0zlRiFhPoYvKWEpao1oZETxmQapcrIWiGPHFmlHH3eruPAHqF6sl3wBQ
         57zOjsD6mbX/9IWin9wq5XTRQivLhsB7vxMDRNydY0bDpJykaA104NKOQvJTalIodWME
         9UyALo+PRO4jvlkwT3R4NQezWa4QRMzF/zF5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H/84KilK/yYDMqufI+fBihaymg1pJldWkGRLE+l3DQE=;
        b=tgQmhGBRBUaU3Km0Z/q6YtvDHl8BLPjzUJo2bHuJgT7kEvuPiW8XL5JK1gZOD2mW5p
         VpXp1z/A5tMhX883DYvYlzqdwIEyY4xdGZX3nrx5AIXBjy27pbDjC7yBIJF/M79RAy8I
         0+CjlTboCcSNGyFkQjX/Mprfsdqqb1xdYlQ3NLmiUrfEAN7iL+4fGcJSSREkjSSwOCME
         9+9UQMJ9hCBiSdREOLsUjXpFpUHyiKQG01ET3tkbbn+26/+BghQ2zk9nf+bmPyNueMhh
         z4VCU1SgnZQJLKOLaWq9kLK3Og7JBjKBtIIXnBv1gkOxXdKb3j+OnzeSJhYQULCoZKiE
         2ZSQ==
X-Gm-Message-State: AOAM533Ou2qJMK9bawyImJGoEgwm2/QFRzIk9S1ASW0B60CTi31BrRgi
        1BKsAwaG7aTHFwjrLledrny4sw==
X-Google-Smtp-Source: ABdhPJz2BH4aN9m5Pjn2y0ZasLLXxhEDmhLCBpS2FE4HSo2+hTi8vG4iL+uZbkQeBJK3AuqtAv4teQ==
X-Received: by 2002:a17:902:9349:b029:d0:cb2d:f26c with SMTP id g9-20020a1709029349b02900d0cb2df26cmr20038047plp.5.1600198291608;
        Tue, 15 Sep 2020 12:31:31 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id r15sm12456663pgg.17.2020.09.15.12.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 12:31:31 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] usb: dwc3: qcom: Honor wakeup enabled/disabled state
Date:   Tue, 15 Sep 2020 12:31:27 -0700
Message-Id: <20200915123123.1.I44954d9e1169f2cf5c44e6454d357c75ddfa99a2@changeid>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dwc3-qcom currently enables wakeup interrupts unconditionally
when suspending, however this should not be done when wakeup is
disabled (e.g. through the sysfs attribute power/wakeup). Only
enable wakeup interrupts when device_may_wakeup() returns true.

Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/usb/dwc3/dwc3-qcom.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index e1e78e9824b1..56d14c09506d 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -251,8 +251,10 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 	for (i = qcom->num_clocks - 1; i >= 0; i--)
 		clk_disable_unprepare(qcom->clks[i]);
 
+	if (device_may_wakeup(qcom->dev))
+		dwc3_qcom_enable_interrupts(qcom);
+
 	qcom->is_suspended = true;
-	dwc3_qcom_enable_interrupts(qcom);
 
 	return 0;
 }
@@ -265,7 +267,8 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
 	if (!qcom->is_suspended)
 		return 0;
 
-	dwc3_qcom_disable_interrupts(qcom);
+	if (device_may_wakeup(qcom->dev))
+		dwc3_qcom_disable_interrupts(qcom);
 
 	for (i = 0; i < qcom->num_clocks; i++) {
 		ret = clk_prepare_enable(qcom->clks[i]);
-- 
2.28.0.618.gf4bc123cb7-goog

