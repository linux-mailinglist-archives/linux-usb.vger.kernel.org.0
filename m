Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25B28155F37
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 21:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgBGUR1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Feb 2020 15:17:27 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33694 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727727AbgBGURM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Feb 2020 15:17:12 -0500
Received: by mail-wr1-f65.google.com with SMTP id u6so422909wrt.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Feb 2020 12:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GxnmQXYbPrwwDf1YSEYt6X6fG7RNrO9V3k1o149cooA=;
        b=XdGvRM1jQNNGbmwIKcSWJjBh8JOeiCxK4OS7VAHHwRA03rsuvS5ltYTvsddx6QKa6W
         /9JXD/qGrb75b+iZ+7hokw3oGYaFUn0HnZ6Q6qwJJMUEunjaOaNXujuj9kKagByu49rO
         e/1MdqZ20M+NSuwXbERde3et0+nbQEQIMWEkaLi5p0JV4vnXs39lXc7zOci/LOaV9RjW
         XjeUsJsERQ1x/4U7P00ry/9se7F1/0P2zIT5bbyEIbn28W2m+dNdjmLV62wiv/y0yR80
         A38YctsEFbwLIil1dY7Jo3C+sK56MhAEqIABRx59x5lwAPK6tTXof8veAfCU/jVpJTLM
         2fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GxnmQXYbPrwwDf1YSEYt6X6fG7RNrO9V3k1o149cooA=;
        b=EphRiE5oWYLIDp5e5NXl9rYu2SD86L1aduWudEH9dsRqIdoxrVc2Knj1Rn2NUoAMmH
         GWhV+S/ueuuEvc11bQnyXf+4UXGGuaAptiPYVcCDn8cCRh8qkLnmiCYqN1mgNchNoxha
         xkdbA7yxTJfXsj90ZzRCoFa4c5pSSvCn5VeUz3l1FhZ9PyxLoiAV2KlnsfwC60WcW3An
         Haasw7r9Q+hwK2+xb+n+CHs5137Bve+NESXoSY4zdBR2FoNjnxcZprZw7246EeYa/KXN
         TKPV3vfZ9s5Vid5VErgV5tBAzJA0dwobanBrUbr56qqf9Zr70Mj8OL2fO+TOjywaEu5g
         iRug==
X-Gm-Message-State: APjAAAU+bCOR9izbWQv5YkJLv6JHRV8wepD22zo54I1JslAQG//6yhu/
        5CCQvjPMXHU1EmHhNbEd7/XYgQ==
X-Google-Smtp-Source: APXvYqw4m1nAzCcKWbUCHltE70KG+pDfiu/OJ58cE22NwNawLDEp/LCLNUlQCpfQ9fnNV9S2Frp9Eg==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr803886wrv.198.1581106629641;
        Fri, 07 Feb 2020 12:17:09 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id h2sm5018542wrt.45.2020.02.07.12.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 12:17:09 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v5 17/18] arm64: dts: qcom: qcs404-evb: Raise vreg_l12_3p3 minimum voltage
Date:   Fri,  7 Feb 2020 20:16:53 +0000
Message-Id: <20200207201654.641525-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
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

