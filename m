Return-Path: <linux-usb+bounces-5009-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D5982CE7D
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 21:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF2F1B2227A
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 20:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F2AD297;
	Sat, 13 Jan 2024 20:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sOX3yMWl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91931DDB6
	for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 20:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e7b273352so8179464e87.1
        for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 12:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179354; x=1705784154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1plu6Fal9qcn1Wtuu6vQETPtirp4Q/rK0fLCOiwCIQY=;
        b=sOX3yMWlrYTCA72q6WHJDSVm5xlCpqai8be1yV2bVl0Xkjkv72aSE7cn4ov3WM4tix
         w5O6aWEYmKfBmpkExmOa4ionDobEG/4dCtVWGoyU3jrRFl2jKDhWtjRNt04U8KhhqTRX
         MpDv/CBZXGfbY89/xdiq1mewkA/JgWg2311eUKeBGDiDNk3CY+JTDX7iTFtJQ3569A0Z
         YgOL1slt80x8/ERl2hqmhG9J4i2sdgGDElkWXJX6t9BSxGAqOGX6zQCncuK2lC/fwnXP
         Ncvpqhok0oAkIa8hDUNTvS7EtnXkhql8JjBZMn4UslAuEraCx5WVB7gLDB1jitZepD4j
         mICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179354; x=1705784154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1plu6Fal9qcn1Wtuu6vQETPtirp4Q/rK0fLCOiwCIQY=;
        b=KVFPyHP1bVw+mlwnvb3bpPaP8Yjx0O6l5MyR7YYGTZkkoJwibVt59HAlFt6pCC7x0R
         Z4o0+xmyP+VV7wTy3fqubfjlN10//ZVbHsJujUnziXN/b3mX1tfaOED1Y5Nq+4CwDd5R
         lT8Vo9gmJbo7a6e5hvg16kjQZrEEZFYuxLb2/bpTQMeBRQDwlO9DVyxj1okzU0TCujhF
         eB6weeq8af7jC4ildH6EdD2iMof+3Lhf5MeSyShc//HNCusmxq/Qe3/VwcXnUdBnbzeS
         YFRi4iqvv3JI9VC0jRnI5o5Otlc5W7AOuSKFeIy0+kL/rByRnbuRxC42kXRRM0QL/wIK
         IjUw==
X-Gm-Message-State: AOJu0YwJvC0tXQUUeLaKPBR4sE7prW7nb1RNFU3k7wNx1e8TQrP/mdDa
	S2Ijni8WlnjqsPCNm+CvCtHzdB1xN+QHIw==
X-Google-Smtp-Source: AGHT+IHORlq9+U1/d6OKAala6qvGFXXcT/6vQiMppG/2djQE9ccrg+xAnQp4SuIWs9e263XdPhtkkg==
X-Received: by 2002:a05:6512:1093:b0:50e:76ca:f772 with SMTP id j19-20020a056512109300b0050e76caf772mr1858405lfg.32.1705179354550;
        Sat, 13 Jan 2024 12:55:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:55:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 22:55:44 +0200
Subject: [PATCH v2 01/15] dt-bindings: regulator: qcom,usb-vbus-regulator:
 add support for PMI632
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v2-1-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VO6sCRtukMYbFqUkroEE9VOEtJ3mqzFoVaUfeIJHtBE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlovjW7nZvT4zErpZjmTbBBPpayrTlb/U+ld6ZT
 TNO51eWMViJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaL41gAKCRCLPIo+Aiko
 1aKRB/9T87tU2zgTRJrbRdVu/6xwFDLYjttlV8t8cBlJkGj6+rNwF/WsD3D4S6v4zHiQSxjLSBH
 rk6JLOaz5bzEYv2q6OdZRT1yd2b5VXDhqwkOs9ofgCkv8ukCADqL5nplKN9hxwRBMR3kVNEUZLB
 vkXnWnSimW09fQIxo5gY2l5DbeZP+zvuwV9CDGxIVF//Q/1hhfve4JuF7nvp+gYbaFBJSW9K6H4
 id1sh/0OYL6qzsCqphACfPchFXreLG1XnE1piM0TmFSLJxnwF5xMrk0WEV1MhhUgAM/j6LBs1Ng
 SYUbuwFIoGwU0oooy+x14OtaPUAmGCcBbkXBBXuWHKpDm59V
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The VBUS register block on the PMI632 PMIC shares the design with the
PM8150B one. Define corresponding compatible string, having the
qcom,pm8150b-vbus-reg as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml   | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index 534f87e98716..66dcd5ce03e6 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -19,8 +19,13 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8150b-vbus-reg
+    oneOf:
+      - enum:
+          - qcom,pm8150b-vbus-reg
+      - items:
+          - enum:
+              - qcom,pmi632-vbus-reg
+          - const: qcom,pm8150b-vbus-reg
 
   reg:
     maxItems: 1

-- 
2.39.2


