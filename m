Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B730513C53C
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 15:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730390AbgAOONh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 09:13:37 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37794 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbgAOONc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 09:13:32 -0500
Received: by mail-wm1-f66.google.com with SMTP id f129so18051174wmf.2
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 06:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r9NPS5QGribeTtMFFZTTzMj+ynOYdzhVsWBEen9DiAQ=;
        b=bgELX9joHOCF4c8wcg5bLvZ9uHtZsi/3FsyK//KbYPrUw6pN7LvXNBNEYrxRO70Rop
         nn+AUaycmrXtYvRkeR229xqVRDf2p3kJhulb6igviGwnVBB+42wXPIqCsJraKKpEeWJ1
         CNeSvEpPmTnxXV7Koldzqb7XJl9y2viuiic6LeLAjr+xw2fdEeXszuCLtRfgyLkuHhRt
         eeMH73fnDAijT9U+X3STFKKzoU1lUx/oEfciCREPiErwhsKX249VKOAmAsMJolHzANSI
         SdBZfet0PZITXICNmLt778RTkTaL1pspzH57s9CdzN2nlTXpK8PDU5ajo3mSRh7uSy8D
         LEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9NPS5QGribeTtMFFZTTzMj+ynOYdzhVsWBEen9DiAQ=;
        b=lyQvqzg4k1rWb+1G7l6F6zH1o9AsUICJZqHSn6vhulu9/Szov3X9bL2cLhhf4FBUEA
         mH4/8Rb4ACGjo51KJ935AF/ixzgXFkWX5m9qUEofHSDYPArjnRBMOR07gEWKt//d2Px4
         8B+NWt+dw3IZ+dj6vOAOh12nroJgLustmXv+07S2fzGRDaZYrjJzQD7PzGFUeM5Vz8jO
         up0FirxRgVS/ZFmEGe7f/uCV1nytMlTHR5TXTOUM0qvEnShXWqG3D5RcgG9UaCjT9wpz
         aRW6URzUBfkKYJasKh8upNNwOtD5WCuavoQb6RQ02BbabVPKzdgDAAvbeQCYrevYswfX
         vLDQ==
X-Gm-Message-State: APjAAAW+eAyS6NJ0ugH5R9/7FeMEtLpWwPCgsP1WF/18CDMmx+73VgKi
        mUjRuxBZ0QGQXlrPGZdGj+utYQ==
X-Google-Smtp-Source: APXvYqw76gxyIdAYFEPqMKjvpzCtwovsDXs6SfcdlT6dpAzF6V+7DXdlLmrcgH28IHX9zjYJMtFEPg==
X-Received: by 2002:a7b:cc6a:: with SMTP id n10mr35195527wmj.170.1579097610665;
        Wed, 15 Jan 2020 06:13:30 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:30 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 19/19] arm64: dts: qcom: qcs404-evb: Enable primary USB controller
Date:   Wed, 15 Jan 2020 14:13:33 +0000
Message-Id: <20200115141333.1222676-20-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
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
2.24.0

