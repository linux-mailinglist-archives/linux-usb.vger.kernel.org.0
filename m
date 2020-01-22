Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2596145BF6
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 19:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729251AbgAVS4b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 13:56:31 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46872 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729207AbgAVS4b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 13:56:31 -0500
Received: by mail-wr1-f67.google.com with SMTP id z7so185444wrl.13
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 10:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yws95nmaJZSmNzRJG51ZJDH/5MHh+qOjv+20GRqLWDg=;
        b=vZnJ4iPZ59f0fnLvjpTpglKMUam+smVSpL1yV9BVjGNp6xiw4sx/uUHhWvtctLMXJq
         faBo50ev/bAB6ZtNDkCBWjgbRXNkNi2BULhkrwOmOyczwzccOu0x5Q03ZjXbgJFPNyEE
         ZpqJ+yKC4e8QgTAEvj8KMhqJV2EGSQ/kTx1j2nBjQ7t2mtBiWHsA7D+3VLdMnGjOg4MC
         eg0DSKsDgowfnYpnqmFWwNBlBbmUZzFFLcP97i4uTxqbVAzaZ19C25G4FylUZ/XCRjb9
         /Cmm4WneylhMLASeHCaQBlfKuBRxFrxXlkaEk70iRB/yd6/9Dd7NeTJmy/lUn3MV0g3P
         JO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yws95nmaJZSmNzRJG51ZJDH/5MHh+qOjv+20GRqLWDg=;
        b=KZrmxAZp4J4HmICVX4mPvU8BLpuSl/mwAp+C5lQagFOOOcn0rrxOchZONmN8TGpLJD
         MjBFIBK1cz4cUERC/JLVHmjkf2+rEysvsoRoAhTTzEhCb6JIU7x1EJsi4l1UMhBBeoQi
         cMtNczFAi9Vlodhq871/35nr4WR59bE7/wtra4J4nLWFgAh/dLP2S69lrLsm/8d3GDwn
         UaO+sZz24JCs4EJRZmj0PIpft7Wdeb8AMGtYzqbTeuJR5at2amu9XFnluHd6RyEEmgPm
         T9mMz6lN5Q0CDYoG5Vm9+Ykod0Sm3gCNDR6q2Qi3EAA2HpkiGrLE0s6ppWEzoTRcd3x/
         AiLg==
X-Gm-Message-State: APjAAAXqhCoQGl+OLXTkGi5X4LC6Jphd084y3NX3SNF1cigyAY4MR9Wc
        IGdbaypV8BsZE9FJLuyCd6koSA==
X-Google-Smtp-Source: APXvYqwMR3wvYTUmeAvdj4H6+sCYEjV4Z7c6gYmKvbiOaaunUeGRjD8Nbs4wkgIMKzYOJrV1UsNviA==
X-Received: by 2002:a5d:50d2:: with SMTP id f18mr12507414wrt.366.1579719389239;
        Wed, 22 Jan 2020 10:56:29 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:28 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v3 13/19] arm64: dts: qcom: qcs404-evb: Define VBUS detect pin
Date:   Wed, 22 Jan 2020 18:56:04 +0000
Message-Id: <20200122185610.131930-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VBUS present/absent is presented to the SoC via a GPIO on the EVB. Define
the pin mapping for later use by gpio-usb-conn.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 501a7330dbc8..6d53dc342f97 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -4,6 +4,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include "qcs404.dtsi"
 #include "pms405.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	aliases {
@@ -270,6 +272,18 @@ rclk {
 	};
 };
 
+&pms405_gpios {
+	usb3_vbus_pin: usb3-vbus-pin {
+		pinconf {
+			pins = "gpio12";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			input-enable;
+			bias-pull-down;
+			power-source = <1>;
+		};
+	};
+};
+
 &wifi {
 	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l2_1p275>;
-- 
2.25.0

