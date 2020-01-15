Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B75813C52F
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 15:13:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730320AbgAOON1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 09:13:27 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36577 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729288AbgAOON0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 09:13:26 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so6908wma.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 06:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1UUsfm6fOWyuTi0Eboq7gj4QxZv+6wLGX1zbgK1JIts=;
        b=n5cjwfekoTs0bO7Gxvi12pv32MHjFchOy4wcgupRYkss/PEsjx3qEK66BQokfVb7Mg
         TKJkJFAde6xt/JPDtBi3nowq2BrdCqSacHLXdNkPDtQn4sq9KsZ9F9OmPcUwx697FhJF
         5s0lR6MeA5p6sBKpNb/t77MqWSmjLy3S6oQspuEk01/JWWnK93i7/fY0o80Kx0f/dAea
         hqJ7M0m+3W3Cgsp1tjyMw+sZtOxPVfBHREC8P3YD0ED2Na36PFtNKqbhwoqlis8wzRLw
         NI2DOtC9GOHyKpzbjZnaMdM9BuqxTthrTBcyFuqQyt0yDhFXkYGTspqouOpNmPVIbC1Y
         58Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1UUsfm6fOWyuTi0Eboq7gj4QxZv+6wLGX1zbgK1JIts=;
        b=qm2uLM20Jy+sz1zriG6oDegs7i6mOwwKSWGmMq+R4igN3I7hOkPAOAb6YbN/GusDzA
         lgN6OP8dVOlR1/rsd84sI3WhXBOELeFB3S+T9Y9sT/gJUlJKZpNXIiFVnbU4ZxirmtHj
         relOYJ1Y6TifgcqOZz+Ysn001CYZf/FfGPRN79ByVRlISWTsvn1+FTfzU+BLlaq9VYvs
         wKZ5p+pGNGwGdJW83x8iCUJgLeUFQOWT7tLe4SYe2BVLx0ZciAA1CzO6E2Mz0Z6Qi4fr
         CJNpHWCT0fcI4A9ChMNkaKzkYWqAnihzBGejCfuWrtCq0Uue4RTfhH5lNmyCUd/P8BqV
         mcng==
X-Gm-Message-State: APjAAAXo6ttT2018pj39AqyrvVzGmaqFeyUci+eHb8yZyP3jtS/XTXqt
        ++GWwvoujDUwmzE5BN3PArXvGA==
X-Google-Smtp-Source: APXvYqyfm3VxeVbpM723JQEBDho1BTKeTG1rCAIcodpK1fXm1E5JFt7BimzeXmAV1Uoc+Vrw7qiSvg==
X-Received: by 2002:a05:600c:10cd:: with SMTP id l13mr35273221wmd.102.1579097604577;
        Wed, 15 Jan 2020 06:13:24 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:23 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 14/19] arm64: dts: qcom: qcs404-evb: Define VBUS boost pin
Date:   Wed, 15 Jan 2020 14:13:28 +0000
Message-Id: <20200115141333.1222676-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 6d53dc342f97..b6147b5ab5cb 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -273,6 +273,14 @@ rclk {
 };
 
 &pms405_gpios {
+	usb_vbus_boost_pin: usb-vbus-boost-pin {
+		pinconf {
+			pins = "gpio3";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-low;
+			power-source = <1>;
+		};
+	};
 	usb3_vbus_pin: usb3-vbus-pin {
 		pinconf {
 			pins = "gpio12";
-- 
2.24.0

