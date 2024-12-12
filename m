Return-Path: <linux-usb+bounces-18431-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B629EE76E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 14:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE633188796D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 13:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B0F21516E;
	Thu, 12 Dec 2024 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GsQjTLrg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB91213E97
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734008930; cv=none; b=SiugtI6IgBysCF7o5Jq959aJv6aNwaMv4MOQoHsjSHhNjII60BP/+dau+cbzjoz/T1NQFygWKDBO2t7KIiz5WCG3OZqTzFQYdHkTDqHQMRRBk33CezFOR12u9pRlWRB3jdCt0kmHtzwTxZR5E8PyZcw6F4dZcKFs9D6sD/DPtA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734008930; c=relaxed/simple;
	bh=VtMKVUgiuFNrjD+MOUtkdFqKPINjhq3zvD6DSKRrTCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CKNKJuyoI3YzI1KmpopC2/c+DWOKwqq3aZ4RQDr4yLGExPFSSB7hhYimgBj7C1jTt7YujGJNYJq7zVzIClJIDVlKciMHgIRvbjv0nJMaAXyX3P0kL8/xUlNCXNCNcl+2a5PTu1zTXGupK4vjQHaTMNc1qpaYZWatwIRhaOvbHEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GsQjTLrg; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9a68480164so84237066b.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 05:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734008926; x=1734613726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+CFAWmD+WHNtDn2sWiPUE7SCXR+4z8SWkq0gx9HvZo=;
        b=GsQjTLrgU+pXR8S076PEqRG1O/s9YRMYxrkj4sX0v1AHUE8v9GnuJgRhcBVTYuGnzV
         Qd1u/pqY9W+FKyVI7smCOS2Q1vfi/YBmuBPwgOGizBHu24wAFZFM78xx2zAAn55oewPM
         4KHwegCb5p8nbfeQY0fHvKxT14zMoh7YTMI8tgIX6mdeRUkWRqB07vwHrQsIoghMBhGs
         V8T9IajlnnqokC0cAXO58HW6nGoWLhq6WUvIPv2DdV5aum8m/euPe976Qsgui/iwh2nx
         jleCgqc0JOgP0+73f2YmZ46we6NLpb8QREaP5Xhjtk+yhbKew5JfcIln6PlBYWSXNruI
         2HlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734008926; x=1734613726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+CFAWmD+WHNtDn2sWiPUE7SCXR+4z8SWkq0gx9HvZo=;
        b=qSZJa7seC0LSIn7taE5rJ5penm2GNQJ1RGIFeKRn0CQTOdZe9zINt8XOXJkb7wDJI5
         TsqGPD+yb2HY1/YvPTH8zxJOaqqczndcqDkPDQWBN5WuBytd72eV85i2WRBdSkb3xfTo
         7dam7jVo0Kb5j2lcWchgcFnBQ1EUwEn9p4l2T+f/QeXfvNH9pIafxs2BDhhDwbjLq9kN
         z4IEu4x0B4KbZDt5Pz5/wglOV45cb4q/yJ+Q/RLdG9TUA3omTuQFUxAQs9z79hJYqXlN
         /oqp7uw7ZHCv3e9wxsPot9gA8T46lJQD+eQswiINNx/39zxZGR4JEVNfsXZP/2Npq61y
         TtaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrGMaNNSYdZyi9Ra1y6PQP59jVaJ0EAB27sadpTUuIG5dlKPkAnDqbvjuOstA/yMipYwqwBPKC+eI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrmxd+1igwig5JZvvBfj797eTPyRptrFJhrwAdfEp4quKtNVEn
	aYI79DW5EeI0tq4X6yEe1AJ1YBVHZnYlziJbdaMghCRO1mLyKmF77UB9PDctEYM=
X-Gm-Gg: ASbGncvZUSBuPfRTekx2rJt39auxKaj7ybfgYL0j/mB8geSGoTYwkANWHphAJhVd+tt
	z9HMZbbWJxXU70ob+84aTme3YacM3BwJexMLLlfBvA1HzxmUZJbFKerWo5VcjdeWS3tOHe0RHrn
	bJP23il8nlLjE5GPTFdrFxX1srjPzCMmACnWfRrTdrEbdQqtvBDfbRYz4gmZrj7cNy4KQdlQUWa
	EL+sJJE31GL6vjQb1PIqM90LIaJDWuS/bj83Oh0E/JtQTxc6/9uptBrcI3jKqezEy7EgA==
X-Google-Smtp-Source: AGHT+IE3enyxAZVTqzPEUAe7qjEY3Y3tdXWOW27/BAvY2zKNMjeRl3maRC1dSdmgDBrCWszACK6JCg==
X-Received: by 2002:a17:906:1da1:b0:aa5:2a57:1779 with SMTP id a640c23a62f3a-aa6c1d33ccbmr351498166b.59.1734008926316;
        Thu, 12 Dec 2024 05:08:46 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:3c0e:7a2d:e7e3:9cf8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6845ab4absm605843366b.73.2024.12.12.05.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 05:08:45 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 12 Dec 2024 14:08:24 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: x1e80100-qcp: Add FSUSB42 USB
 switches
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-x1e80100-qcp-dp-v1-2-37cb362a0dfe@linaro.org>
References: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
In-Reply-To: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

Unlike most X1E boards, the QCP does not have Parade PS8830 retimers on the
three USB-C ports. Instead, there are FSUSB42 USB switches for each port
that handle orientation switching for the SBU lines. The overall setup is
similar to the gpio-sbu-mux defined for sc8280xp-crd and the ThinkPad X13s.

Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 154 ++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 5ef030c60abe2998d093ee60a6754a90cd5aaf72..cc0561debdb0b5c89f5d7f298d34f1feaf183b61 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -84,6 +84,14 @@ pmic_glink_ss0_ss_in: endpoint {
 						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss0_sbu: endpoint {
+						remote-endpoint = <&usb_1_ss0_sbu_mux>;
+					};
+				};
 			};
 		};
 
@@ -112,6 +120,14 @@ pmic_glink_ss1_ss_in: endpoint {
 						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss1_sbu: endpoint {
+						remote-endpoint = <&usb_1_ss1_sbu_mux>;
+					};
+				};
 			};
 		};
 
@@ -140,6 +156,14 @@ pmic_glink_ss2_ss_in: endpoint {
 						remote-endpoint = <&usb_1_ss2_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss2_sbu: endpoint {
+						remote-endpoint = <&usb_1_ss2_sbu_mux>;
+					};
+				};
 			};
 		};
 	};
@@ -256,6 +280,63 @@ vreg_nvme: regulator-nvme {
 
 		regulator-boot-on;
 	};
+
+	usb-1-ss0-sbu-mux {
+		compatible = "onnn,fsusb42", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_1_ss0_sbu_default>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			usb_1_ss0_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_ss0_sbu>;
+			};
+		};
+	};
+
+	usb-1-ss1-sbu-mux {
+		compatible = "onnn,fsusb42", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 179 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_1_ss1_sbu_default>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			usb_1_ss1_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_ss1_sbu>;
+			};
+		};
+	};
+
+	usb-1-ss2-sbu-mux {
+		compatible = "onnn,fsusb42", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 171 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 170 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_1_ss2_sbu_default>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			usb_1_ss2_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_ss2_sbu>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -872,6 +953,79 @@ wake-n-pins {
 		};
 	};
 
+	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
+		mode-pins {
+			pins = "gpio166";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+			output-high;
+		};
+
+		oe-n-pins {
+			pins = "gpio168";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		sel-pins {
+			pins = "gpio167";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+	};
+
+	usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
+		mode-pins {
+			pins = "gpio177";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+			output-high;
+		};
+
+		oe-n-pins {
+			pins = "gpio179";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		sel-pins {
+			pins = "gpio178";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+
+	usb_1_ss2_sbu_default: usb-1-ss2-sbu-state {
+		mode-pins {
+			pins = "gpio169";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+			output-high;
+		};
+
+		oe-n-pins {
+			pins = "gpio171";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		sel-pins {
+			pins = "gpio170";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio191";
 		function = "gpio";

-- 
2.47.0


