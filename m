Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE4B155F3B
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 21:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbgBGURb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Feb 2020 15:17:31 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43152 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727697AbgBGURK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Feb 2020 15:17:10 -0500
Received: by mail-wr1-f68.google.com with SMTP id z9so355175wrs.10
        for <linux-usb@vger.kernel.org>; Fri, 07 Feb 2020 12:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Kx77RkRZ6BLkxPPbqLY1opgnPyzoSH+OO3s+PAvU9w=;
        b=NNB0eR4gF6D0akB/wLDQi7VF/G5bIzb4qKIfynYdFaZ8eTK+nyksf4OrlNCNSWq4eN
         KRa2Oyj4VLS97PAlV/QkoMEGde8ibAoR0X520f2kpy7mZPrV6g5iPywabTYNghPWzrhT
         MxWJ67kXwItgti4oSjPqWXq14BFZQqgOJAH6zYs2UU9lyzm0fnn9fUSRaYRPWjF0Z2Db
         dPdWEaiijpGMiSLrFdNVdnQZljOuQHN6XlwqvoZHSCv4esNNqTa2fo1bnUa/nGXGoh1q
         xyoQagw2WIgXTm7N4LRbDsgtmThwMnraMQgWui+YfHnHS5hb9qLT14F/ALxkL+yE+kwE
         RrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Kx77RkRZ6BLkxPPbqLY1opgnPyzoSH+OO3s+PAvU9w=;
        b=TL8WCFUpzm4gPW2eCPGU6GX8BozdugqO9HHd0oyYdyt6wosOunThvYDa8kvUYvu/DA
         bl9nM4uAiYV4I5RfWGNJ7z+/oD1vjqGFq8XIxwAMMe3YIbFz677q9IIKQyxf+VtEvLEb
         kcB0pvAALjSYICnp+29B2Lq1IuXlTRkRtZS1+9f92UTTzKf/RdSzMuCGRkncpH7deczu
         Ffh9iX6O7pCyRtbCyerSpp6Tr0p/PYIQeC+Ns/jtKl6cFT7CdZ2Q8erE6II6X+7rzb3X
         bVYd1xrP37lUSLgcVXGCYqBA2USUs7v61pndaCLyGH4iRPoDM43t0cWU06NcdDoAvoBr
         faiA==
X-Gm-Message-State: APjAAAXnAjwgVYZaYnwoSyStGCWcQSl52KRfBfvz+ZvYmEbu8RsGEQyd
        RmFcxi0wRV2KgIiUZZ/UcYtIbw==
X-Google-Smtp-Source: APXvYqyy9kx88k9/7jnobOn8K+q/1HXrmCbZ7g4EgrcNIObDg4TNQBpwDP1md3U93qBrLs5DOr57DA==
X-Received: by 2002:adf:df90:: with SMTP id z16mr678252wrl.273.1581106628513;
        Fri, 07 Feb 2020 12:17:08 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id h2sm5018542wrt.45.2020.02.07.12.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 12:17:07 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v5 16/18] arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
Date:   Fri,  7 Feb 2020 20:16:52 +0000
Message-Id: <20200207201654.641525-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VBUS is supplied by an external regulator controlled by a GPIO pin. This
patch models the regulator as regulator-usb3-vbus.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index abfb2a9a37e9..01ef59e8e5b7 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -33,6 +33,18 @@ vdd_esmps3_3p3: vdd-esmps3-3p3-regulator {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	usb3_vbus_reg: regulator-usb3-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "VBUS_BOOST_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pms405_gpios 3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_vbus_boost_pin>;
+		vin-supply = <&vph_pwr>;
+		enable-active-high;
+	};
 };
 
 &blsp1_uart3 {
-- 
2.25.0

