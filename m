Return-Path: <linux-usb+bounces-6821-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EB985CC6B
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 00:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F2C9B21800
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 23:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817E115530C;
	Tue, 20 Feb 2024 23:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b6s4GN6+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B3015530F
	for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 23:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708473539; cv=none; b=sczpsBQMhUKdQQ2TRlUlQVELBvPVvswRV5L3YG+6W83oUp3sby5EKdaVbrXfrrZW0a+TqW9p/9CATuXUgWf085ev7JrYCIgOOB0SiG1ZZIgRkRqdHMzENdmLpNPhl9KFdP4RwaXQKbNgA3UPAMZA0bUW4pqvkwgbTU39mPlMyoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708473539; c=relaxed/simple;
	bh=TSZ6sVvVq/7rSkCh4KijYcLg5W1SfP4Ts0Hhg6UuxlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bYHVgSZNA/km9LVb0XXFgd5ZdpUzXPm02GxZohrJnmxwVDYaOdcKZdXWiSO26hqUPCscumv/Kj+ZUf+q66kltE91i+BUc/nm81fVu+0KDplhlgf0I5jmdK4t//pJkpYINE9/McKpOOM5HPXYRQGFWPakMrxJsQCkqISljmOLKvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b6s4GN6+; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d23fab7708so20113671fa.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 15:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708473535; x=1709078335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89GyQnZOmqXGQ7q+2rssbbMFi5MST3tXfHQsqlea/s4=;
        b=b6s4GN6+CP//zrSoMV8IL3VfxOkhaw7Y6cTs1n0wB5Jwn0h488XEmcO2U9/BP/DaZq
         ezLtmbEhW2TpiZzKVMxf7LB+R8HmpUx3Khz8RGzxXbI0/X4SfU8D7RjDRCCk7xVKRrW2
         L55dbwpDDJ1wQFJqAJfWJH/GVKvENF+sPE3OC+zv9vC7ZOae/kkqShzlCz2Ywqn+ncSO
         FEFPLYWZ75iFZc0udj5NbVAjEMVGlpEWWh9MMf1tz45r8/4aXPRysFZAACHKQbX8SLWq
         22PD+3lnNf6FrdaAHGkVGIeqHuitUcgL45wuCcT+65e3qSLx6lkAZjBbhmGfKq2PRbun
         DwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708473535; x=1709078335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89GyQnZOmqXGQ7q+2rssbbMFi5MST3tXfHQsqlea/s4=;
        b=tDbGL+uM9POsRb5lTU4VrMThCFvVc+37CZ9uy4ER3GypSB8eevPNsqTHQ0naNTMjvg
         T9FdACSG3vdVr8DO32UJmvNCu59WKInFx84vB6lhKdx7tIoBFmYE2IMoS8he85JKsaA5
         bMpIh054XtqGXMErQfZ7/Du2beZjMVbFICXoUUjQbI/RTX5/q7wZpJ6YiNtzxmK6BUkL
         2HZzQwWX4no2xWka1zlJ23ZdGZeRKRbPrUGcpnzCYo2XehHd40rFhxnnyz0ob0EbvkDa
         lfWlH+e1Vv0fwD+Bea0N67UxELOPLeYD6M5wYptX103BdOlXwwnhWsFbMt9NE+Ly0z9c
         Ccfw==
X-Forwarded-Encrypted: i=1; AJvYcCUJxuEKlrCKK2Qhlz2lY+MnC/qeaFk4/rzIftQdE4Nr7o1ZrKeAmaN8lz0GBK7eJB8d0BdFV+8YOZqAXhTlM+HKNlHyLCamHtKq
X-Gm-Message-State: AOJu0YzAiGjhc3Qgg6uA4Ruead40ptt6YzfwWxbZ2LjyhiobYvsNLhwE
	ckL/f4uLhFAYVD9qSixhPzNtpJlOAlh1BmmiZlTt90I9C49KxIRBEEEFe7IS7IE=
X-Google-Smtp-Source: AGHT+IELatx7FjfQzfXxto8uavnci3ayAEeVSTf/dI7EZr1sRX2a+xCNSn8wWyriHejnz8vq7FssdQ==
X-Received: by 2002:a05:6512:230f:b0:512:a5d4:4663 with SMTP id o15-20020a056512230f00b00512a5d44663mr3992903lfu.9.1708473534550;
        Tue, 20 Feb 2024 15:58:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h27-20020a056512055b00b0051167de8560sm1438831lfl.38.2024.02.20.15.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 15:58:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 01:58:51 +0200
Subject: [PATCH v3 2/3] dt-bindings: usb: qcom,pmic-typec: add support for
 the PM4125 block
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pm4125-typec-v3-2-fdd0ee0465b8@linaro.org>
References: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org>
In-Reply-To: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TSZ6sVvVq/7rSkCh4KijYcLg5W1SfP4Ts0Hhg6UuxlA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl1Ty7KwSCNCP7OoWvrtBbI1IkqiI6E/0QalPq6
 KWRAPGWXyCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdU8uwAKCRCLPIo+Aiko
 1SDyB/9ISKU+JUcEtLncKVXhx7Aq5w3BtAWUnHi5r+0RL6u6twdwNyUS4lumtbq+p/Qjx3tHxLZ
 EvLXCG5dMFUxchPxMRnP+bEEx/4/+CKeyjByj58KaRMiKQi9AhgTZYL8b6oDz+ngE3cfHe8SQhP
 28MSw++Pe7GvNx+hB5QfuvFFeUmvQTNOamP0+6TPCforY302SkBXL1+QnN5FQ72hh8JpVgAXujk
 Kt4I9/BId2pD7uFZfuwoVSsOAVzAcMwKQhDzBK9o9s0JQsqxOxRZG40FTV5z8lHgPDR8LtWydep
 BZ1AVuiPRwppAg3KRTNHmWFmFqnBxo4hH/K1OaLlarMpHp7F
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The PM4125 PMIC has the same Type-C register block as the PMI632.
Likewise it doesn't support USB Power Delivery. Define the compatible
for the TypeC block found on PM4125, using PMI632 as a compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 6c0c6b337693..5527a4bc9388 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -14,9 +14,15 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,pmi632-typec
-      - qcom,pm8150b-typec
+    oneOf:
+      - enum:
+          - qcom,pmi632-typec
+          - qcom,pm8150b-typec
+      - items:
+          - enum:
+              - qcom,pm4125-typec
+          - const: qcom,pmi632-typec
+
 
   connector:
     type: object

-- 
2.39.2


