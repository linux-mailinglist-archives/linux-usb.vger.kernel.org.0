Return-Path: <linux-usb+bounces-5746-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A2C8464B1
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 00:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A3A71F24E0D
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 23:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2019F481B4;
	Thu,  1 Feb 2024 23:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIkIUID9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E05481A3
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 23:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706831721; cv=none; b=QnS4iNo4NiyRD5tVx3pqOD67pK6JbPQv9B3GnF8aqfhDXWwyHTBJLo20qC1TDqy8aNcGAFo3QoUOO/dHYjy8ZKUiqknXjS5KVC2ULYevLZUwthBuatcE7JNfQRX/t+DUj2w8C9ZoLZg/sfQRI5w9Tdk4t1iP/1ikkLVbUm0y5hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706831721; c=relaxed/simple;
	bh=0eZHbojO1p7nGaE0OniBB2PkwucXMA/5bAUgl3QPkm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pI7vXo0sbfeAlydroSdg/kZWKBnt2N8Ne2Aj4bQ9S5SAQ4ymgV3xVaLzkuCXjTP2JxHWPjv4w8NtidXG+S61WM7MB3Qy5aqUrPox+j5RG2xD+NaJB1SDDRLPIe/vwaPBeMqfsyI8FmFfabGRmVjnkIDJIQmWjTwvtF9cu1NJLG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UIkIUID9; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5112a04c7acso2459175e87.3
        for <linux-usb@vger.kernel.org>; Thu, 01 Feb 2024 15:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706831718; x=1707436518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcC+rtSSEgtdVhSmUmFq1LOn8tehp7Chpbw5WuxF47o=;
        b=UIkIUID9ZgR/zjFaDefSC3GpWx+F61PlrD741B5eJOpkm8WcgzChaaE8YQGs6qKMfX
         1WC730Oea0EE2skLP7Kl1sDrQ1przAxrk5MmCooV90EBCGT5x14b+BYNTIHKLF8xWxi2
         8ea26/YLLiF/xJu117QGUNMDhNTpohY/6XG+gppezUslTImX1lEpWLncOGWGHRlaOtEM
         pRrSHinpZTDR5Ly2OHhSHBr1m6+YFy8jVw/34scuiCzNv1TJbHsod4Wag5GukwymIYrY
         DL3yq/CRnT5T8WvDOAkP1D9UKArYdJGtWYC/1Slv5SXZiJu5GaajJcZvZBLDReEzQJ1z
         WHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706831718; x=1707436518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcC+rtSSEgtdVhSmUmFq1LOn8tehp7Chpbw5WuxF47o=;
        b=Ne1eCjtvdQBy5WOfV65EVbfpODtJGzFJ6QqbB+ogEqVmA4rgfU3HlLWzbwaFNUNZCY
         h0PwhNJJTwUeFTK9UH3gVBq05rdR2lEK4TL+wISjUgGBrr02fVhkjN+sLohW41Onnwug
         zkS8ZaUoJ/H5BgMvVzA2uf9g1EHyMvKb9Hzkkh+Ov9yyRUAA23qCtz/HnUSlkflWPOCe
         Gcxh2lvxFMhEr/7nLtKAVwTJ2BwfjzwyLTshB4S+c5ZKSOXvSYdb0Q632JeQrVI1r9a8
         r7CWrJQs6siHvMfHfVG+j9PxZf0J0Bfhxn4+t8VMWqm0IlYxHOHmVisSaWNvwFj/dNrl
         XsKg==
X-Gm-Message-State: AOJu0Yxgg2nihNAYKLOWyrC7yaaKkwkocslDJiH3LSdpGAFiHNod+bbD
	+3V/OAdJktJ5Avqwfxrf2Edsn7n6hvx7+ejy404lJwPs34cxS3/R/Yj4Qi1ON8c=
X-Google-Smtp-Source: AGHT+IHosEMcqBUHTEZpasXS5xEmUDDxFLXtMaQSRid+DdCROCxyQx0gIn3ND1WVMzEcvoHI19hCLg==
X-Received: by 2002:a05:6512:3b08:b0:511:199a:750f with SMTP id f8-20020a0565123b0800b00511199a750fmr309925lfv.20.1706831717757;
        Thu, 01 Feb 2024 15:55:17 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUyhPNcZBBNkM8lUH9gYSPG4u8g5Fg/noap3FWz7iN0UGLb25RZVuaPdBUASpnGE382ruX/r3y4GstVtGCP0uK225HprzE+M4BEzniLQh3PrxPv9Zhum6kzTTLaTbTBtqD28Ny1RIkSP7wL3dysyz1CmQhcqk7llaNWbBBEd95MrVFcPp/eLizpVxpToARdKQSMOCGH16zdK/Yi/wOd/dDCXu648I/hxQQr9ISPAzHqDRU+y5pfZ8IXQKZKqbLJMv3Ep2DK9+6uB0dX4gfg9iCZJycD/YbYglOFeFGngTIPqfmDFVHFFLUnM281we+F6cxujAXjgPPgh8yt6fDoxBDOLAQ0eNJZp3Ipt8FrQ/L/9glLM3kBTgb0U1BPFTMM2pra3anS5Uzn/nWoL8bBhHuW3+4FomX0jgIS0Rs9wZ7bkx6MiVU4
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u13-20020ac24c2d000000b0050eacc0c80bsm106754lfq.131.2024.02.01.15.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 15:55:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 02 Feb 2024 01:55:10 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: pm4125: define USB-C related
 blocks
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240202-pm4125-typec-v2-3-12771d85700d@linaro.org>
References: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
In-Reply-To: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0eZHbojO1p7nGaE0OniBB2PkwucXMA/5bAUgl3QPkm0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlvC9iKGZjFsfuMGqWB2oNcRMw/WkLp5ZhSIzgT
 skDDeSlVhiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbwvYgAKCRCLPIo+Aiko
 1bFDB/0SbgKczUzZE8o1xzUk+p7UoADgw5wM6fDuKjjTlQN+ZvYFAElxegPGJWXu/JzH+uGzdcA
 r+vvKOpk7hfyiLscCtSom5KdM/hKdBVvoZ02Fu2netXFaoEy9+TzyQ79fqvXtOH2qNZuvtCpCUF
 vwGlJuVxqNhAEnvstTqKj5n9FesrKwS3Ty/zvqVpgLIGunmDgb9fx4jpDiEy5XRmDLR5hRSF6mT
 4B3EhPDnkNa70C6WG6sVEE6Tj8ueDYIIwtLU8sP47TPHXZSN0oLefaofXZhoF9GIY8TQTBcu/OH
 wKIqiyi3dOMBPh7LiURd8RRLXGDsym/IKqE8MLk3rG+P9vRQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define VBUS regulator and the Type-C handling block as present on the
Quacomm PM4125 PMIC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index d886a9e4b091..cf8c822e80ce 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -36,6 +36,36 @@ pm4125_resin: resin {
 			};
 		};
 
+		pm4125_vbus: usb-vbus-regulator@1100 {
+			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
+			reg = <0x1100>;
+			status = "disabled";
+		};
+
+		pm4125_typec: typec@1500 {
+			compatible = "qcom,pm4125-typec", "qcom,pmi632-typec";
+			reg = <0x1500>;
+			interrupts = <0x0 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x15 0x07 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "or-rid-detect-change",
+					  "vpd-detect",
+					  "cc-state-change",
+					  "vconn-oc",
+					  "vbus-change",
+					  "attach-detach",
+					  "legacy-cable-detect",
+					  "try-snk-src-detect";
+			vdd-vbus-supply = <&pm4125_vbus>;
+
+			status = "disabled";
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;

-- 
2.39.2


