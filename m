Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E610145BEA
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 19:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729437AbgAVS5B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 13:57:01 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53582 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729290AbgAVS4f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 13:56:35 -0500
Received: by mail-wm1-f68.google.com with SMTP id m24so192160wmc.3
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 10:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GxnmQXYbPrwwDf1YSEYt6X6fG7RNrO9V3k1o149cooA=;
        b=kP23mj31WgCKUnhvrjKBAcU/hpuuFunRBZLEoc1K0cJotNIuh1x3It45Nj1pffVz20
         qnDD2pAH2bn8CEwoxYHGkm2KcesWw89Qm1E1avmOaG2mYc9kLr7Y8dV8D5wqVZsCBHAb
         OQBC9PmNuCZNfz+iJ6YW79BHjAwNalyzo7tTFdx/Q9V7fdrZN8wlLUsQTuSopqUVvFKT
         4HX4Az27Ma+aY6wfdMCYeJDdVCy0f3g0xeztzhL2rvu01xhM/kQQbnHGfK0koUz3WpSE
         wSjyPzitLT8udXg1e9aUD8s0dZgn6HcjpCaauTDRortpiUvCdJFl9VJGIlc2NbiFJLvK
         kvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GxnmQXYbPrwwDf1YSEYt6X6fG7RNrO9V3k1o149cooA=;
        b=U3AD3Je/u7Af3+BM9/cU/KPehlipw+t1rfvRT03B0Jn1P37gULk8xRNgDfVlET2BP2
         cPvuwEkeJJMXq9s8JR+0hUOGO0JfTgVa926+F5BUOfS6E89JoCkzIjbQkG7ap49UD33+
         5dgj8r8g9JceZOYeLxyu7la5ozPFM2QQQFxOCoeMOw3G6PQX+KJSajnLUxRGhvTVF8RG
         RaCWT/1zWE8n6tYtU4yUM8MDMGMiqRFdy71tqQAXA+UlKB3lLX4+DeF/qAy7D0z+7HZV
         sKysZXyoJJ7VWy1yT1PZ1siitmUV4B5p1eNYKt0tbq1tZVwDOO8a2OLnO44hnomtC5IK
         Nf2w==
X-Gm-Message-State: APjAAAXQWMqTJQbfXdTZKXONmUDc3tHYe6Jm+6m0Ff8fXHmVYnNr+X6g
        awnG1YKLRhcBcQUIw3UV7WJ/SPoIzDH8dA==
X-Google-Smtp-Source: APXvYqwgA0Oo0jVOKxUAxOGcmF7S6R7Jm6MbwYnbpjbBwKi7Cn/rggryXjZiSc8hPLGkAwZFAgbdjA==
X-Received: by 2002:a7b:c934:: with SMTP id h20mr4293040wml.103.1579719393648;
        Wed, 22 Jan 2020 10:56:33 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:33 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v3 17/19] arm64: dts: qcom: qcs404-evb: Raise vreg_l12_3p3 minimum voltage
Date:   Wed, 22 Jan 2020 18:56:08 +0000
Message-Id: <20200122185610.131930-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rather than set the minimum microvolt for this regulator in the USB SS PHY
driver, set it in the DTS.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 01ef59e8e5b7..0fff50f755ef 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -199,7 +199,7 @@ vreg_l11_sdc2: l11 {
 		};
 
 		vreg_l12_3p3: l12 {
-			regulator-min-microvolt = <2968000>;
+			regulator-min-microvolt = <3050000>;
 			regulator-max-microvolt = <3300000>;
 		};
 
-- 
2.25.0

