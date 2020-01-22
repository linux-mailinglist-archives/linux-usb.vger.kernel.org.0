Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7227E145BE1
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 19:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgAVS4k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 13:56:40 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39518 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729339AbgAVS4j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 13:56:39 -0500
Received: by mail-wm1-f68.google.com with SMTP id 20so186454wmj.4
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 10:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+TYQNQQWESi4gKsyKl1vTO3f1E3mp/r/avow7BgHKMw=;
        b=EACekihjpCPMuOqdeZaEjVRHAd/Nobwhg9yODd2M/hZHedkApPn8slvoG9T2pBI39L
         XDk82lRDLU9B9xV8Bx5mfx6RI2SNXEqCXD8kOJXNi8PEu3k5wxPp5cY743k/FZzNBpjR
         zgEBxu+06xNAMyYJYk8nyudSpf/l0G3qDxLQwaEb2lZ38fO3LpepH9nE2aBor+ek8o8z
         L5qj0F2fXq02YhiH6rMll2KCB+/KESOOajBQkmso3N1Pk/9PoIoh/I55PdJEFjiSaOnr
         moWt3Hryn4u0yJeUQLL7f9+tRudAZn0AknxhmOZwuFLdVsLfuUqCrCM8AooW9E9DqyID
         eSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+TYQNQQWESi4gKsyKl1vTO3f1E3mp/r/avow7BgHKMw=;
        b=HLZk6QJWKizBRG7MaFL284LWJlXGC2woji8typeyFyicYUuo9w8wO5n9Zlov1GrRLx
         uPHVjdrwe3cQhxTXe2JvGV/xqmAu066DKWdpo77Qjcb9lakbQSs22rYkWilfR6F/1qvz
         d65E45A4SSLHxVBdlE3WADzgZ48D5Q6Teh6AoyZdRwt6e5UAPOsEM4bxuSByrgGmJ3f/
         UhkpuN5rohS9d+wZJAFGZTzAV2Of20g4RwBgY+QwuE6QefoHrOLVIzTYxKiLrUVEGsR4
         t3yfiyFIFc6jSDspHiwLyfbA8//hf6k2EXwUZNEiP3EGWdGW+hZnDuuqP+1u2w43pWgm
         f4Jw==
X-Gm-Message-State: APjAAAU6BiwARrfFFD9xwgjDW4yLnVBsvDPaMQD0XUjMpn1IM6JcYLTw
        itRyx5p9Kl3FQk+dGy7RCszm+g==
X-Google-Smtp-Source: APXvYqwFeZF6Nc6JIvCGJNF9g5Rv0fQCMT+vAOEUUcrAKz5qIfdz87a+PSp7C2abxVLFjFKkp7Lccw==
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr4356860wmf.100.1579719395769;
        Wed, 22 Jan 2020 10:56:35 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:35 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v3 19/19] arm64: dts: qcom: qcs404-evb: Enable primary USB controller
Date:   Wed, 22 Jan 2020 18:56:10 +0000
Message-Id: <20200122185610.131930-20-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch enables the primary USB controller which has

- One USB3 SS PHY using gpio-usb-conn
- One USB2 HS PHY in device mode only and no connector driver
  associated.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 07d6d793a922..a2cbca3a6124 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -329,6 +329,35 @@ &usb2_phy_sec {
 	status = "okay";
 };
 
+&usb3 {
+	status = "okay";
+	dwc3@7580000 {
+		usb-role-switch;
+		usb_con: gpio_usb_connector {
+			compatible = "gpio-usb-b-connector";
+			label = "USB-C";
+			id-gpio = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+			vbus-supply = <&usb3_vbus_reg>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&usb3_id_pin>, <&usb3_vbus_pin>;
+			status = "okay";
+		};
+	};
+};
+
+&usb2_phy_prim {
+	vdd-supply = <&vreg_l4_1p2>;
+	vdda1p8-supply = <&vreg_l5_1p8>;
+	vdda3p3-supply = <&vreg_l12_3p3>;
+	status = "okay";
+};
+
+&usb3_phy {
+	vdd-supply = <&vreg_l3_1p05>;
+	vdda1p8-supply = <&vreg_l5_1p8>;
+	status = "okay";
+};
+
 &wifi {
 	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l2_1p275>;
-- 
2.25.0

