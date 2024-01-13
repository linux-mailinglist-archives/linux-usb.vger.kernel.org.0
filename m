Return-Path: <linux-usb+bounces-4974-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3EC82C999
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 06:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD85AB216F2
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 05:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FE0168C2;
	Sat, 13 Jan 2024 05:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfdJfoz7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B69134C2
	for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cd17a979bcso81300551fa.0
        for <linux-usb@vger.kernel.org>; Fri, 12 Jan 2024 21:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705124564; x=1705729364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1plu6Fal9qcn1Wtuu6vQETPtirp4Q/rK0fLCOiwCIQY=;
        b=hfdJfoz7oCk/cT+HhO9R0mWi6EHg6w6/bneEfBTVEsw4J/TIy6AKutcfhBJ8Wyywgj
         NcqX3Uy9AX8lvBLaqPVqlsfGRQu3gs6N/RdK4Fj026uen7OZhTzZMLKsV/FKR9VEYnBL
         n03zdubCxxsOkv4sCzpRp97HyZONo3hEdL+pRHhScYfunE36x9Kp5R2iLuUVQ5zA5w0q
         WU2oX280RGFrZNeZDlBuZJbruRMejKJygkCYr9vE2cp8Qj7toD54SEtMc6VWCVBXXtZ0
         35zOmrWNi3ObYJo+Vo1WG/34fPXooVmp2gqvshutb5PJa8smHI2Nc4cvNkSLfNKIl8UO
         ZWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705124564; x=1705729364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1plu6Fal9qcn1Wtuu6vQETPtirp4Q/rK0fLCOiwCIQY=;
        b=ZXthPxfMiot5eqIvufJLI6TsWOhsh/Lon4v2eNJZMEj1W97kobSMfZmlYxyqQS2PKb
         P09lwxwYcpZUk1coN+RjolJ7Yz+OUN0/ed00q8FFbFJzF/PX88R7A27EjQJZ01xbsJA2
         xFtZiGmqFYuza+AspBpQN+N6OL3wE5Pp+QEAXfuzDlO6XlogA8/k1Igv+k52Asv343Ck
         WGqGFX013RIMz7zPQRGlHLeMi8WyGAVP7fQ5B5PW1WXjvAPqH3Klkf8EMumwOL0Mdf7q
         vPHcqergghAkuUJfssf4gNqLgiMdq/TcvcSNbDnd8aMICDGzVCl/4RRvp9ztkUSy8c4C
         qCvQ==
X-Gm-Message-State: AOJu0Yx37HCGQCNrBC4zhUxcYs0/QN2/4WBfslDzZOZ1vBef+WPeZzZX
	UeTe7EDD37ybB+fZBrRwh18ZQ+Kbo1mQyg==
X-Google-Smtp-Source: AGHT+IFd1jPpJPDKDRrkgYEFhTbv5z5l7BYXN+JECjDlZMmNU14o63+C2Gmf4IDFn8+YmejCRRIslQ==
X-Received: by 2002:a2e:9614:0:b0:2cc:c895:7140 with SMTP id v20-20020a2e9614000000b002ccc8957140mr637588ljh.73.1705124563714;
        Fri, 12 Jan 2024 21:42:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020a2eb616000000b002cc71e9168csm677719ljn.129.2024.01.12.21.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 21:42:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 07:42:38 +0200
Subject: [PATCH 01/13] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 support for PMI632
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v1-1-de7dfd459353@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VO6sCRtukMYbFqUkroEE9VOEtJ3mqzFoVaUfeIJHtBE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBloiLQLfTXIowNMw1HcfpGXvc8pKu+5bdoQQ0PL
 deZL6vAXBeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaIi0AAKCRCLPIo+Aiko
 1c1BB/9X3V4VUltARNirVryclPWLymp+ODlBtn2/MwSLhsc4VHMGsr3DnsRZmZUwzjgFw4SXtwB
 3N6Lx9lYkcDDwmjixCxUaC+84PZkqj0TgX3diLz3ioz4U+F3OUGLVMaoE6MJloAe9ISaJJLFI2r
 ipbJEbX7X5qK8g8HkJa4ngBTh49qG6HgPUsIftLwCAR/sNPcrI7NbxE4Jbpi81N65HFmmTcAMCE
 LNK6xeCXRkHGQF/IY3sofOkqqiq+7emxD+EIyUtPK5PkaAIoaIDTIeXHj2j+GOmZfMb9iPiHd22
 3hk6RdL6gqy9ykUlI+/VhhkF7qLXmScxPILjdChVlxregXY1
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


