Return-Path: <linux-usb+bounces-5745-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C078464AF
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 00:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E64028C212
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 23:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E4A47F65;
	Thu,  1 Feb 2024 23:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0rgbQCW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D53481A4
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 23:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706831720; cv=none; b=SSeR75JwyzO1O3VvYm9Ep9LQczjaZ8VcRdH+dOh9w4NJNSbIuCPg1Bn1vJgZE04AxXAEBrO0q5tSO4W89zlw+uq3ita+OfPFqdBeirgfi0rZcvrbslq1E0nJ0tI1/+soh/NWb/9r9FLTlN4hmrR17uc4KQrMd+vRDGGC/mJTQbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706831720; c=relaxed/simple;
	bh=TSZ6sVvVq/7rSkCh4KijYcLg5W1SfP4Ts0Hhg6UuxlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s0ktuudwiucPB4sgvnlds8RznyRzhhgLWBXc/zUR/m/Zm7cCuz46qu24BirwmIJnP6EGUv9MkC6gH6aZ1MaHb7Irv91ZFaABKKbz5O+PXNboXEPwxazmXjQvr/3KhYsFdXT3mgPUFo79dN7gfbbX5bE+5jntJnshouqAHNLXe2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0rgbQCW; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5110fae7af5so2170514e87.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Feb 2024 15:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706831717; x=1707436517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89GyQnZOmqXGQ7q+2rssbbMFi5MST3tXfHQsqlea/s4=;
        b=N0rgbQCWlMlgq8w79TcAnFxUwhFdNPgIa/KiHnZvMMyqQtfqLPBqeMrYiOmCtpanIy
         B5K8JwkJflu0oLjLB040R7dXmtnvYb0o3p/3z7wtxCtq/w6wJD7gYvVpogBuJFzHiDqq
         SK7kec+HKhI2QVaCAcj6UBQaI6oBQs9HsUffyE18QPTcW7Qm6MB6bK7DfTZrYNy45P68
         82Y+FGmujsEn4YcJ2UY0m5aya1ttWAKc8IHh66tbhPu7b+jDoH0q9MbXJJunnTHdzrkg
         CSYX3lcmIBU6dIwPHC8y5hP/Ud3Htk27UVSltAQgSV4kyiTlRvracEtQ4DvG/QWfWfIk
         xGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706831717; x=1707436517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89GyQnZOmqXGQ7q+2rssbbMFi5MST3tXfHQsqlea/s4=;
        b=Z7WT3ZrQEjGj0LIhO5ydmanzwuky4hxBRF1ZB39yxxNtecfi33yr/AOY/MysfmOion
         ALk3rM00vUfcM1XX87CfClShpB6iKwc+Jxd1zPUCYdANCu9AgwBnl8MgN3mlY7Y7NoL6
         oK2kP6vMad9pl7QIloUUuEi2vMwo+fg0vUbpu5/QFGWMy+zrWqWj07GbEDI16WtMCStl
         M5o3v6cRkOANTW96obm08R9iFAx6VtBrRwkpc3Ibg0H2lyXIKBGvPIe+vivzlkZLv+0v
         yiLco4bOipIyvHv4rql+kI9VKRKVfJ2cxmN3Jz6nnZFfwznKuKQbQtmdpRpobRILpAFO
         26JA==
X-Gm-Message-State: AOJu0YzanufLQLBr/QF1wDcdWLSLXlk2/ZXYUakWJr1ECiP/0d6Yl3di
	KvlLAJ8ro2F6Hj9P+Zd10i9DENXAson4LP0lDfwtZ3B4y1mvVohBrtQtFm12ZdE=
X-Google-Smtp-Source: AGHT+IGHnMj43LZDjbVliFtL4KsRdnl2Sv7xG1IjA7xA6O0sB4HuiM+2JyjBcSBJhZHeK2IK8shnGA==
X-Received: by 2002:ac2:4550:0:b0:50e:7b5e:b64b with SMTP id j16-20020ac24550000000b0050e7b5eb64bmr2966710lfm.49.1706831716935;
        Thu, 01 Feb 2024 15:55:16 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUwDRtkQtWWeBICKhHG0gKDREj5nlcC53Lf8pdVv8A+9GcAUsdqOkzs8rPG8Xyxzfvg5nkV6wk5d1Dc9YXi4qEWDMAFpVELjELsEw/KFqF2m/2xJPNg0ZR387+wTbdUY/Vbwj9+2kKtS4g0nzL95e955RmjWP9Y4+74FzmzpMXMwWJ0DPWoUAoCbaMsq+XTEYgf2UdL2+q33RqynWSscSXRxn2hnoA71A4qeuiYGGl/onnLGosdKmw0yUmU9rvo2zUqrTlfx6VJYG84uP+IoYs4jYP1uAKvSar0K9GSK9Wgg5xKyVXGWmPCLT+W0qraHkDfOyr2iU1AM6mcbpg9qKc3A3WCKYieY6+zsHvlN6hqZc9d+7FZeu2WhC753J1y+Xbv/vkbwnm8TGZjHPn5tIghq8yOgsbdGZ206A2siA2qdUKdcK0s
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u13-20020ac24c2d000000b0050eacc0c80bsm106754lfq.131.2024.02.01.15.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 15:55:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 02 Feb 2024 01:55:09 +0200
Subject: [PATCH v2 2/4] dt-bindings: usb: qcom,pmic-typec: add support for
 the PM4125 block
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240202-pm4125-typec-v2-2-12771d85700d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TSZ6sVvVq/7rSkCh4KijYcLg5W1SfP4Ts0Hhg6UuxlA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlvC9iQN6HkpflJVs89ewpVk9H9roQCKeZyUi3/
 rLtENXga6CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbwvYgAKCRCLPIo+Aiko
 1RbWB/9VkS/i+gHlpxdh4tfBrjzuad42RO6cpdsdnXqtMdpVm7zCYEiGl8aHZu4EuOSab6QD+C+
 xoiaGqUmnD7PmQlt4I5jo9GIACdtAx2H3XeSrFScLovH0TvtOv9ZLqlhEIKwWSi1HoslU7768nE
 2VyR40i6GV8C0qMTIU2q/HLV2tRjvmyoSizUVXC1m3Lj7SNDV4icImebvnATg71mquMLAjdQ/Mt
 bfKMqew9ZiGfkC4Gi5FNJL5zB8DvC0eVzs79kmy5Ix7inUi8Q4sgBgRxONzG6T5442KqzwjuymY
 LLnYVW7UjNrOwS3MC9xbXyQySfE4cc4b8mPXfe2OYZ+rvG+S
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


