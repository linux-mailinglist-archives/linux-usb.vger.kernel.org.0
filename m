Return-Path: <linux-usb+bounces-4978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2A882C9A3
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 06:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6BC31F238DA
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 05:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655191A715;
	Sat, 13 Jan 2024 05:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i/1Ai3i7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B3618046
	for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 05:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ccb4adbffbso83420981fa.0
        for <linux-usb@vger.kernel.org>; Fri, 12 Jan 2024 21:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705124566; x=1705729366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/K+0DJkKOAkCr/6OujJMFc4kf8wuvqM0qNumbavVg68=;
        b=i/1Ai3i77M7BdHSEpy2dPwrdq/h64ikhKFMFNPjVCkEPOfV4lIX13DZ0HVj6Z1AYHh
         Jf2y65ijOY0yip+Yy6RA8MqzrpUFKrZ0ufojy5YKKF9wIUQddneSuvQzmlun+9qjde94
         /1UXpUTO7qhhZhxkxvGi0pTAERA7sSXQT0P3APWHxHMEAkrz2S8LFEUNSTBZ2cwDReNC
         SJRrsAYpr+A1EXeC/Ux1eBWUuNjCFu6fLk2TZpW+rECb60yzTxzLC6DU2xr8z35VDQMZ
         GN81F+Z9FWvAIZapI+On0nr8vVCrtaPABmmYGSEagXyBIkIRkndgUxK/uhYqSHgBlvGK
         c2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705124566; x=1705729366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/K+0DJkKOAkCr/6OujJMFc4kf8wuvqM0qNumbavVg68=;
        b=j/hz39D1NZUlZ4op5F8tllES1YWjJfu2D2KgAfjdMQBdAyJDSnpjeg6EJhhL0t75Ax
         z8aDZAHKOmbrH0UTyS0zGm/vVwuTI7nqt5L2EtMDv37hfEBkfdkSJkwJux+ub0ewLCe5
         VLy1+DjvJVE9vKZtkW0P486ofZqSRDkg7iGKeD0PZ0ciAXrmHldvJkhlSMNKhhlxLyzs
         wb0iGxXH+IG0B0Da5jHmpxooHiRlBXOr+fwtMtlP/M+mLEDAC5cpy6mUYgmzrM70oSMz
         ugthDH7ZuKo3fbImEGqNbxY7I1E7T0Ad+H2e814qRaAhdbLVbby80FzGs+DZjHVBbMmU
         +zHg==
X-Gm-Message-State: AOJu0YzQ3ZDrdLnsO8M6oSLHJzhT65tBzIBKCFZvNwI4JYNjaMPpE2tq
	DM0C7fP2MlzWu5xJrCuXxB08xdRHCsdxQQ==
X-Google-Smtp-Source: AGHT+IFj9k9Z8RKCkHf+7mKSNLWGDLEp7aTc99Eq1DEglfVpyZ2uICLKxezJVxvpFHENnYxP1bVnXQ==
X-Received: by 2002:a05:651c:332:b0:2cc:e3ae:1ca9 with SMTP id b18-20020a05651c033200b002cce3ae1ca9mr1077728ljp.1.1705124565809;
        Fri, 12 Jan 2024 21:42:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020a2eb616000000b002cc71e9168csm677719ljn.129.2024.01.12.21.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 21:42:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 07:42:41 +0200
Subject: [PATCH 04/13] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: support
 USB-C data
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v1-4-de7dfd459353@linaro.org>
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
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
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0IxH6ZQ/pvgkQeQ5Scy9Fo++yLl5788lBeDWb25jTG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBloiLQOENnNbCH86sIYE5VOHPTdZ2MUd2+oUBiu
 crA6iwxntGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaIi0AAKCRCLPIo+Aiko
 1RZGB/sFpJMDyj17cqJovnDxY1d2S70NXPtcQKawv5DDgI+yRR2rf5JTyFT/MkNIks2BndUh6JQ
 Z3ziloHRvLkxYqrzefaNBuQLymPa07JlD4zVET8FzP2r20MPcOwfoWZBcaHw1LPGgmJF3TqRsQ0
 b+OpA2gNyZqiK/Zf91sOaSxvTbI6rmUX6F6XBKN+hDrWljgvHqxisA/Kw9pABV2J5A0hta4FSLA
 iTetdQ1tY9jz2ay6mMd5uZb30CUAdBz//YMmoNbTqQT2DbiwiYebLltUcLdnG0V1pv05HHc3v58
 LaDenRPqj6o/IPnbxgoOBhoc8QJi3j62TEVxdmZrAQWM22tA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Extend the Qualcomm USB-C QMP PHY schema with the USB-C related entry
points: orientation-switch property and USB-C connection graph.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
index 868fabd44d72..da5d4cbca24c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
@@ -50,6 +50,22 @@ properties:
   "#phy-cells":
     const: 0
 
+  orientation-switch:
+    description:
+      Flag the PHY as possible handler of USB Type-C orientation switching
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the PHY
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
 required:
   - compatible
   - reg
@@ -129,4 +145,27 @@ examples:
 
       vdda-phy-supply = <&vreg_l1a_0p875>;
       vdda-pll-supply = <&vreg_l2a_1p2>;
+
+      orientation-switch;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+
+          endpoint {
+            remote-endpoint = <&pmic_typec_mux_in>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+
+          endpoint {
+            remote-endpoint = <&usb_dwc3_ss>;
+          };
+        };
+      };
     };

-- 
2.39.2


