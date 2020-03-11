Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9576B1821D9
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 20:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731266AbgCKTPL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 15:15:11 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38278 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731253AbgCKTPK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Mar 2020 15:15:10 -0400
Received: by mail-wr1-f66.google.com with SMTP id t11so4138715wrw.5
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2020 12:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fbg485QKna2b69d8FHcT3LYQMvhx0JZtSFBQiPdMzVM=;
        b=JlzDOlI0yDSSMkIg6ar9CLb9t31EZmXDy15Ow0IJLfQQ4tLxMvEND+RLhVuafmTBE8
         +vaTfnD/vLmH50r2pK8JW+Z/+lh0j9Zynd4C7bvXVFruOHacPSoAhowGkaOOfDkpvtqe
         kyqN0kesd408XNFClw5wx6Kl8COU5zEnObcLiDVmKAJ1q7P1Dcfbisb8xVvNZZFytCfL
         12gLkmPqqsn+8JMXuzcFmBsOAiKwxrHVVG/L45O5r6BAFPij/6WfuIhc4BEBUPqZ750g
         Ag+A2ryg4RBuZiGOZ1fdjSyRPUl2wz+hwgYtBhuHhm+ezFPLKu7HAjW+NYi61mSHcx8+
         Ej2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fbg485QKna2b69d8FHcT3LYQMvhx0JZtSFBQiPdMzVM=;
        b=pc/7pofHq4/TJZORu1bBSVxon2deCgX9QjzbbS0xawFls/iA7KqYc7vMH6AO+/pPqs
         qvgjDhX8fpavrXfZGuHKvo9o0hFHLMpuDd82IAG30P42x1JOyqMtpmtek4V25q5yJPm6
         xdv9Id3EW046QFYRY05n/6Q+gGIL8byOfB5dFov5SYcH7cDGdH9fcK0+opvyTYDiyL0O
         l5Doh6EcyK5BJ5iapG9ck1ck89CrgAi1LjP/udLQqKARyUwSws+fT1kQiZ3tdykybz2w
         IrlRHlqZ6CiUy8mFBxpAyVOrmO7iFyl+Jp2SNZ/LrCHR4Pc/XwO4KKb+KSPhKZoOFFpU
         oY5A==
X-Gm-Message-State: ANhLgQ0P7rFlSUAoXaqCEKkMJ1iz55r59xkIFDs4lgw7YRRjpYOL1bcH
        9d4NggcjfmrxeykutLNKKFJVog==
X-Google-Smtp-Source: ADFU+vv1nYKfcNDhvjwMYTymxjutUmijFvLu33jJ/7akEhBtdcYxLiY+yQ36d0nm00t477+td91huw==
X-Received: by 2002:a5d:4049:: with SMTP id w9mr2384540wrp.158.1583954107275;
        Wed, 11 Mar 2020 12:15:07 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c85sm9687437wmd.48.2020.03.11.12.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:15:06 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
Date:   Wed, 11 Mar 2020 19:15:15 +0000
Message-Id: <20200311191517.8221-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
References: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
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
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index cb893ca76901..4b529a6077d2 100644
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
2.25.1

