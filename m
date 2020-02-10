Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23F0215740D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 13:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgBJMIV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 07:08:21 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35444 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727738AbgBJMHj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 07:07:39 -0500
Received: by mail-wr1-f67.google.com with SMTP id w12so7371520wrt.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2020 04:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XNnWmRJxPTDDJICmaDWfmQ5x36dMwtg4YdELGjqA9ik=;
        b=lL081FFmyi/DIMyE07yeQ1zuo3jdvDlpGt/WoWlp8MiWlpnVQ0WD+PHpBpYC1Ea898
         go8ZoE3G9nqdVOAfCKU88TKed7ncataZTlELRRaYR6oQzGn1IGhRA0Y6StPVxsknibwy
         IgMKCGNklIQxp+DMLmiysyFhmjK2bbR4kBSE42bTqMtOu7nCLupC0IlGV6+d52lQKMyN
         x3cFS7z5gWZjogFLyN6xXp7k002mbsIQR96CjpE7aUavSo1zVyaP2C2UahmF6qbF8dSr
         +gr+s5mSmg+UAgAA/GDxuopc1dkHdKSPAeg8Ow8/g60oaJgQz9Q7IzG4tcDM05hq2qI0
         Eb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XNnWmRJxPTDDJICmaDWfmQ5x36dMwtg4YdELGjqA9ik=;
        b=OghHtbJuRHoKZXVvbPPOw+XgbmCpVmhPX7sUOlFRKlDCgE0VApp+BupQBxPJqRvPci
         nBgq0Se6g3DLCUoNwNh+VHoLCj1/dKnNPI87ipc1tmaTATpLje4SqYXGIfwEO/fmd1sd
         DJnOVhYNQ6FU7r3lPfgZUx3p+hcu9UXI8PKY4agOE1kLOangjyFFZq879flm3ZG0cBlU
         72T+O2KjlkDZpeQn1BG58IReLqo86XPbUwv+3y9sDshBTiKO7w1H58v8K9Fmm864kYlh
         bVj7d+Oozije1h5whlQG6f2rfNrlaZ9rw3WCV4PSrUxmOW9sxzCLPc3p0L+CCZ+o/7oZ
         y9yQ==
X-Gm-Message-State: APjAAAUW1GpZMkb35wFU09E0x4kZJILtHmqKNdO37SXJrkfkv5TcjUDc
        0QSGk/Cvz4FhZc3S8ujmWY0rXw==
X-Google-Smtp-Source: APXvYqzWjVye17eAFI99zsG/SY5npLH5qj/05tyjekfpLzQ6CxG75uJjpcOS9TM31i7xFCu0VAoOAQ==
X-Received: by 2002:adf:df03:: with SMTP id y3mr1714572wrl.260.1581336457982;
        Mon, 10 Feb 2020 04:07:37 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:37 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v6 14/18] arm64: dts: qcom: qcs404-evb: Define VBUS pins
Date:   Mon, 10 Feb 2020 12:07:19 +0000
Message-Id: <20200210120723.91794-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Defines VBUS detect and VBUS boost for the QCS404 EVB.

Detect:
VBUS present/absent is presented to the SoC via a GPIO on the EVB. Define
the pin mapping for later use by gpio-usb-conn.

Boost:
An external regulator is used to trigger VBUS on/off via GPIO. This patch
defines the relevant GPIO in the EVB dts.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 501a7330dbc8..b6147b5ab5cb 100644
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
@@ -270,6 +272,26 @@ rclk {
 	};
 };
 
+&pms405_gpios {
+	usb_vbus_boost_pin: usb-vbus-boost-pin {
+		pinconf {
+			pins = "gpio3";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-low;
+			power-source = <1>;
+		};
+	};
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

