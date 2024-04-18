Return-Path: <linux-usb+bounces-9444-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1608A9338
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 08:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEA0F1C20A7B
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 06:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA2B2E3F7;
	Thu, 18 Apr 2024 06:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jv9VtSF6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7452375B
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 06:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422323; cv=none; b=cPsN+Kaxm9TuBXU+7nlstinoTUNoqWSDaswjb9gh6MuDFfHL54redMFyBbZU8DymzeNYGW+K1a6UtO2aYTbAkRxwud6mQZ6QbsbU71Pnqn/ZwJx+fzxjlb82uMUYuRISFCp9tDE65RRX8zkG7J+Ks/ZxG7SILszWbXmRasCG0Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422323; c=relaxed/simple;
	bh=Qyzrud7crPo74pZD8E9P8dWXUAXZm54kyHXrDz6cx78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AF05kuXLSd5jBoTAScvk7X9ADDV7ipw8OT1T9RGxGyU4Qr2nmzYkokQM3R2i2gune7UNICNvYY3deWS3kioP8pdZKT6IyjwjPuAk7hrpLjSqXfSspfB2wg6UH3pdKPIw3LRW8ay+TEgJ411sYCwHui0Qsdshu+H2cQLhveWEtYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jv9VtSF6; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-516d3776334so529221e87.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2024 23:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713422319; x=1714027119; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mz+oQAakD3CTuuZK4gdHTXA/bAuX31xNREQB78SAO4=;
        b=Jv9VtSF6uMticxFRzBbYiyV8MDNQUO1il9qawbJBQQhMiqfqjBOcVISX24rv+9xYFF
         B+T2hzXIWSMyTj7pbS4bSR+fwzyr/2kzP2kLPcyGlnrbXG4JdOtgKYgtiNq4626GPBiO
         zwY6yJ0v74fD11BD0xoPhB5ZLyq0tutLof4qSzub7vxR2ONXNxbfMF9/7uE7QqcsNRFu
         hCPJj0WTMptRHA43PstALzvn9wHKptqNzJl0EqERL6JH7SztG0l9Yd2XyGOMImIwA3sI
         dO4pvC254o7ZtOS1Ez90/zqL86JvAVUZtZgiXZEQPIIN0xXMesptisnAiiDPQDu0kvv8
         7Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713422319; x=1714027119;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mz+oQAakD3CTuuZK4gdHTXA/bAuX31xNREQB78SAO4=;
        b=iJgkopP6GuOqCpTJ1tvro5H4oifg03DpM5zViUsXxH8NOZb6J7kP/+YdJYbTZyI33D
         2MnAWKb7sCuxgFOfV/HoysKuXEfd22Yn7j+JyY2xPhPXQMvTISJSfOs1D7+zi+zBo7e1
         CRbvylBZIMXkiD/aAvHtZAaM6rWYE9mZZlEIsoLHGljA4omyimWIab75fl7KIrib8nD/
         OEeFbs66cU4eXRLVdNs44yRA97y2yTdPxtBjp/X/Z06W8esRvKBHmw9YgGP9/8annk77
         ErIvURli0zxJ2VlCyA7X+HytwMbeyxDUGnRmT3cWmZEs3d3UABl/paYBTeCnI7r86Ku5
         sGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa06vvIpyEU4tQk9P0gCXwipxAp3R4q6cBl9lkUZlbwq/1tiO+Dms9mJKzYp7X3rQkQZlvMhAjeA9ndvO9DlPPnrZpXly/xQJw
X-Gm-Message-State: AOJu0Yw4HqNQIAGlEdC6wCJQByzWeT9WVwNK2HWOPE74T8nfZwm3f59a
	AZidNNEEVJREk1BLPdVf6/1NZQR/FrywWcZPxCcvvYYn5y1UfBBFJKMkata7Cvw=
X-Google-Smtp-Source: AGHT+IHM13hChlrjutediaXInDHIF891c7FIjmXCaxwsPSDoGNbpaLs6INPbnOEWcQQt9WV+VyF/Xw==
X-Received: by 2002:a19:7506:0:b0:516:d0d5:6f60 with SMTP id y6-20020a197506000000b00516d0d56f60mr805542lfe.38.1713422318695;
        Wed, 17 Apr 2024 23:38:38 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x11-20020ac2488b000000b0051593cfb556sm121213lfc.239.2024.04.17.23.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 23:38:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 18 Apr 2024 09:38:35 +0300
Subject: [PATCH v3] dt-bindings: usb: qcom,pmic-typec: update example to
 follow connector schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-typec-fix-example-v3-1-08f649b6f368@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOq/IGYC/33NSwqDMBCA4atI1p2Sl1pd9R6lixgnGrBGEgmKe
 PdGVy2ULv8Z5puNBPQWA6mzjXiMNlg3phCXjOhejR2CbVMTTrmkgnOY1wk1GLsALuo1DQiirRq
 GWt1y0ZJ0N3lM69N8PFP3NszOr+eLyI7pPy0yoFA0lGkhS8kqvA92VN5dne/IwUX+QQj2i+DAw
 OSFMQalEaX+IvZ9fwOjHTTn9gAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3487;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qyzrud7crPo74pZD8E9P8dWXUAXZm54kyHXrDz6cx78=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIL/tVs+hlgiNVLSZTiNSJ8YafMnzmEbBk/GoD
 Tz5JBgdCxKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiC/7QAKCRCLPIo+Aiko
 1fgzB/0ZlfzlK7/uyjO++WeyRA6F5z/Yw4DB3zB4MQnFjXrVubshik+vl8x2DwF5efpEQhoETGx
 0TGbJxMnz1vPcvYagG374q/hMLZpgTiVWKwTmDQxAYBaBhWTbmK5Zk7vtbak87W/aB75sb6QLOO
 pg9PtfTHzyruRKZ3oaxpGj6V28RHOl38ft1iqBD//KkbQHrpnZA7DNi/VISmZsj5gPaEJlXA2Tw
 zud4dJch98iBsl2c8Njxp4D2Zo2m7cyY7pTwHUbNvzcl9YvG+zumYYp1FLGODS00NP52Iaazrz8
 qqVOLycPVCO3qAIPBy2DVJazZJz8evMHtbNWRRjG2Go/+XMb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Update Qualcomm PMIC Type-C examples to follow the USB-C connector
schema. The USB-C connector should have three ports (USB HS @0,
SSTX/RX @1 and SBU @2 lanes). Reorder ports accordingly and add SBU port
connected to the SBU mux (e.g. FSA4480).

Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Update examples to follow usb-c-connector schema wrt. ports definitions.
---
Changes in v3:
- Dropped the Fixes tag (Greg, Conor)
- Link to v2: https://lore.kernel.org/r/20240331-typec-fix-example-v2-1-f56fffe4f37c@linaro.org

Changes in v2:
- Dropped patch removing the role-switching port. We do not use it, but
  it can become useful by other designs.
- Link to v1: https://lore.kernel.org/r/20240322-typec-fix-example-v1-0-6b01c347419e@linaro.org
---
 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   | 34 +++++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 0cdc60b76fbd..6d3ef364672e 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -193,15 +193,22 @@ examples:
 
                     port@0 {
                         reg = <0>;
-                        pmic_typec_mux_out: endpoint {
-                            remote-endpoint = <&usb_phy_typec_mux_in>;
+                        pmic_typec_hs_in: endpoint {
+                            remote-endpoint = <&usb_hs_out>;
                         };
                     };
 
                     port@1 {
                         reg = <1>;
-                        pmic_typec_role_switch_out: endpoint {
-                            remote-endpoint = <&usb_role_switch_in>;
+                        pmic_typec_ss_in: endpoint {
+                            remote-endpoint = <&usb_phy_typec_ss_out>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+                        pmic_typec_sbu: endpoint {
+                            remote-endpoint = <&usb_mux_sbu>;
                         };
                     };
                 };
@@ -213,8 +220,8 @@ examples:
         dr_mode = "otg";
         usb-role-switch;
         port {
-            usb_role_switch_in: endpoint {
-                remote-endpoint = <&pmic_typec_role_switch_out>;
+            usb_hs_out: endpoint {
+                remote-endpoint = <&pmic_typec_hs_in>;
             };
         };
     };
@@ -222,8 +229,19 @@ examples:
     usb-phy {
         orientation-switch;
         port {
-            usb_phy_typec_mux_in: endpoint {
-                remote-endpoint = <&pmic_typec_mux_out>;
+            usb_phy_typec_ss_out: endpoint {
+                remote-endpoint = <&pmic_typec_ss_in>;
+            };
+        };
+    };
+
+    usb-mux {
+        orientation-switch;
+        mode-switch;
+
+        port {
+            usb_mux_sbu: endpoint {
+                remote-endpoint = <&pmic_typec_sbu>;
             };
         };
     };

---
base-commit: 4eab358930711bbeb85bf5ee267d0d42d3394c2c
change-id: 20240322-typec-fix-example-3d9b1eca853d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


