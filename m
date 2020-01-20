Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB551142FBC
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 17:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729525AbgATQbG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 11:31:06 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35231 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729550AbgATQbG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jan 2020 11:31:06 -0500
Received: by mail-wr1-f65.google.com with SMTP id g17so126094wro.2
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2020 08:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ounN3zi0imbgKpbsfEs2C8qMeNLcd0eRtq+ghfuGYQw=;
        b=snHrV5UaYtwhG/1mAVN0g28aL9pRgZSRxNWIJxcloONV8g7TtwkXz34qevv4b0+Djv
         vWumO8D7s9MvaSs5Tf1v1CB2potRm0RonWfHiG/kqsHCVUVmsPTD80waSHX4kSLpRGXx
         rsN5lf64PMmnWzwhT/SAP2PC9AmkeCv04uQIFp4U6UmraQOeDNddTYea0pawPYPYHsMB
         7A/ovV5aRQa/CH0ZWmzUOlXmE7T2/zzy4rkh+cjSVLyIjy7EFSe7SoJg/tgqEBDieLmR
         jQ3j1M09/ad7iVO1iqsYob66HSOO8ELeoO/xUeSV61osw0WC+I9tv19yPDQPCgVlY9Q0
         VZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ounN3zi0imbgKpbsfEs2C8qMeNLcd0eRtq+ghfuGYQw=;
        b=QL4S867JGDcS+Tej00WFbRspQ+aG8sVRkt/o0T9v2biibpk1iI2I86u0EPomwriYsi
         X2j2NCUE+L/++IynKpcNKcXPSHK7X6w4lgkgIrNFV4Y5UsYsW31BiYWU0Xjfvx58UlVy
         4UfIt6GpR3ia01bDPJJjQ8Ct9L+uHJJy5M9+NPo/V5KY3uVTr+V5V/sIjMRVaZhR3msE
         etsJ/ZMWMjTe+oOeRQgOp5MnGGJuKr7D/tiSg6KOBQ1VwrhU2YKt/DZYmkl+o+CWI+A+
         38aAt1w5mI/innnleiPU+DKLU3+aFkzCcyH9lTeE3BgpsXgpAWfyyglpuk4jeBnoGFsf
         YZiw==
X-Gm-Message-State: APjAAAVK1IC+C8rMo2fcPewL6og5jf+Uo/0azRxORCb5TfdTOyJELpnM
        yXA5j4ukcodVI5qZZWGPyTOSJQ==
X-Google-Smtp-Source: APXvYqzqsAek5dun0Q5RAufnmOHfcCIBKXxyArSOYStiBxShzYVWPSCgi4DM0fNIw6sSdilZeVHxxw==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr291642wrr.309.1579537864214;
        Mon, 20 Jan 2020 08:31:04 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:31:03 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v2 14/19] arm64: dts: qcom: qcs404-evb: Define VBUS boost pin
Date:   Mon, 20 Jan 2020 16:31:11 +0000
Message-Id: <20200120163116.1197682-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
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
2.25.0

