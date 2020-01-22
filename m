Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2447D145BD9
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 19:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbgAVS4f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 13:56:35 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55589 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729277AbgAVS4e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 13:56:34 -0500
Received: by mail-wm1-f65.google.com with SMTP id q9so180423wmj.5
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 10:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Kx77RkRZ6BLkxPPbqLY1opgnPyzoSH+OO3s+PAvU9w=;
        b=nimU/LM/GmWwEqMZ1R1DBF3ixewkPrqu9MKxcANuV5XhZSMGawF0kAJ90zatF8Wk6Q
         4EnMJ+MiLs5gMXeCXUCyuXOoF9d2oZHe2k9VpZoqWR0Tqtv/QrlyKgBTpc2BALacVLNh
         0EHvgWUXo7x7dfQGt3V/GZ5bDlV17IolYRGqcnAKepjyKSN8wG1nsm8EFGZmYlSAErO1
         Vk9m3vthY9Bkq5XwSdVxtdAO89+i6gXt2qIaeJERQwC2pw9B19y/0d0Pv1AMVkQ3OVAr
         INTiIyfkFvAS7qx48Zozq7ySGI8E9GrdxIv0AprS7Mu9AEIn6TedcqkXmW/dnESF+KyL
         OXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Kx77RkRZ6BLkxPPbqLY1opgnPyzoSH+OO3s+PAvU9w=;
        b=gLj0ssAPwJPKKOW5qQpryqpQ41egBtckpdHKzt/6NP58JEvixbD92h9OB8I+/pFfln
         vqD+t26efp7NuXmdkdL4R7VZ3omI0nCUWvoD+JLggnJODPxuE/dQGFOY/pLBzDPsV5w6
         tfVI50MncqsmL6EL+ap5yYwI/IbIkbLSp4ZUZmML6gAwIth6Qxl36hJZKvIfDSgLCULI
         Mca1H1GUb7XYRcmQs12Bp1hgDhnZ8DIU8jnKxV9L2Pk95Vm2ZB55LRZXvu1rhI/j3/R0
         F8Ltj94w+ZaSzV58/ize1+53I2TUVrlmTbB44UvaDj0uqDrEz8u6b3KgYjTer/zH+C5r
         dnyA==
X-Gm-Message-State: APjAAAUFz4tz0Apya0bhVFen2f1ctgVZukYLmyviA6lnL8yj/VEmTtt0
        bxT3YS/ruZ83kP6IzIArfXlh3g==
X-Google-Smtp-Source: APXvYqwVqPVLGjeGaPZUz4tHdwCIhaBwIWmHqxUY8sIc2gAQdn2BnZnw5GNe/UyuRjKbEAmGhe5jtg==
X-Received: by 2002:a7b:c3cf:: with SMTP id t15mr4216125wmj.135.1579719392571;
        Wed, 22 Jan 2020 10:56:32 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:32 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v3 16/19] arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
Date:   Wed, 22 Jan 2020 18:56:07 +0000
Message-Id: <20200122185610.131930-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
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

