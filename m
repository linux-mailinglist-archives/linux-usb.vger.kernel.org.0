Return-Path: <linux-usb+bounces-23435-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FADA9BF51
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 09:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEAA0463F74
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 07:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EC9233D91;
	Fri, 25 Apr 2025 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="XCoVsl5Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048A8230BCC
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 07:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564940; cv=none; b=ahjO2qFZ9bqzZQNCczcHQw/TPdHIa0oSo9R6rLa/nRTfi5DAPWA3w3E1Dq778x05H3WzXjv0X3XktmN7IxW6OJpKDg80nuBWco71okOhfwZbboN6cJqfSUeaBsglbsduYwHZ1gDk4cPOrRkBlawtN/eN3zkjiV2wd+6lgC5HGP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564940; c=relaxed/simple;
	bh=LA7q9pHIp9WcS0ADH7ddcSsLNvm3BotUh4LJ/goiaag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GWg0kOeIrSrBWS6OCHIkORA6g9mTV8JRJfmUksRD1AcZq9bEDRTVNNZlGKk419fggIbgxF0qyEadQ5t4PiBkd7qgEVoIOxlAe1O7vbf+/6zOsq1gaPiObQrpbcQipUOHyw+zy+a7S9hWHfg1cYdi7S7SdfDWfT+QD5McOi3Li18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=XCoVsl5Z; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso15209535e9.0
        for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 00:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745564935; x=1746169735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mm0mORpqXwGhjKCx6UTWDuYwmgBU3yr6fMoZERP6FVU=;
        b=XCoVsl5ZxXwuomrxsqaEHsivgCge0RZPjrPu23jrVlGpFiC/k86I+zPjAHowiux/5L
         5QvX4wtz/hrjEY4FSXtIftAWc6lmn3FVySpCHbeHMnSX723/np7uYB1Ymdk7pPGImEf6
         hIuRh7g0iUXvvn7rn5iKawAOGQsVQukJYDnp5qr3eqvoXaW7faDlKNMla+PT9mbvu3ln
         G7LxInQQnBN/5+zAQDz3j+JYY9P55SZQyv+48ctbym9iH7XhAb8n5OnakM6DRCYGUOS0
         WP+j6fHLhZXb6qOK/XvpFg26VAtoiq8tKy2RZgxee7NQxJeFCfqLkOVzbN7N7DNQWReI
         /TJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564935; x=1746169735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mm0mORpqXwGhjKCx6UTWDuYwmgBU3yr6fMoZERP6FVU=;
        b=S3t+gcLyy29pTdhB2CiAZ1M3wQbgZZngZhq/mnsVI25SsLufxmP+9JwlH729X6lPkE
         S0XLRqCoSgDW0Ke9qrdGNppXWP4Mh5/s1kD9w5CfuAPgg3nV2+6gDo6yKICqDo42fFKR
         Fo3Gog3uQASXQqTrGqaOaIf6plaqUQ+mv2f+v/AH9BX8LHDVSiUdf/70rJqKMetiNWKq
         JN94aTh5wFq+P3moWjX1CIirUmG9EIKB72qoVLDwyEfS1cxWxIKdRgBsgyS+2z5LlMhQ
         daHVtJA5LI6sqtKE/Y56DKygY7DoopqYsA1BRTt+FZ1y9OspWRoyAJnqd3EhuQoTPXEK
         WRHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfUAHCKYZYx66uME7TWly/QicU5MgSL34HHgDCm5zQ2A29m5jd0PDxlhrQu9Ht2e6A/tKIsLa0WRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZHy5T6xS3WAbdb8KHqsYy1E//Rd9uyW1htICYRLKalYgj+wyk
	wpG42QGkLwEncj7OVEX450pJz/oqoztn05ZrGZ5/Bqi06BMIp0zegVkYaP5lvng=
X-Gm-Gg: ASbGnctKVfmKd1Ag9ySJGRPeIy72n1NmB/ZeuBKV6Aod+dM4JoipJAUR1i04b7hfS4Y
	sqSH+RAJCkzSSvPWL5K5z2b8aeX+gb3Ewr4iGJc9HW2NeQY80E2yodVit4ROJImo8xKCPvMZIqA
	w7JRkie6noApWLc9I0q/BVv0BRNSsH1k9lO3ySldVhkwKBUrXLrvtB2MmiqcqmVVqN7KJQvjN36
	L+CEpy/6xGGZHA98cQTImHecxW1gGfaw4Zik38cv1iuH3ldtFBVHy7XxROPwPanbU1PWQMcAoRi
	TtGs+n4vUKU1tRz1HBkkQWbEoblN7s/cZvs85Lh+nw9vGxIJUyJY6E3iaIFHD1ez4hZIm5qHOCi
	VEcmmZ8WHxKapsS50uRKiKM+56hQ6/DrW1Q9YaeXTDEVvlUM+XSRHQwOF
X-Google-Smtp-Source: AGHT+IGLT5RMGJOi31Z4EljlBM6Dn6ye/misUQytVMeOZB5sQxwZhioVj8uoLgVjDj0pdiM3s3HzmQ==
X-Received: by 2002:a05:600c:4ec6:b0:440:66a4:8d1a with SMTP id 5b1f17b1804b1-440a65ba116mr6484755e9.7.1745564935206;
        Fri, 25 Apr 2025 00:08:55 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm46202735e9.24.2025.04.25.00.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:08:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 09:08:14 +0200
Subject: [PATCH v3 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 OCP96011 audio switch
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-pmic-glink-dp-v3-3-cc9c2aeb42fb@fairphone.com>
References: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
In-Reply-To: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add a node for the OCP96011 on the board which is used to handle USB-C
analog audio switch and handles the SBU mux for DisplayPort-over-USB-C.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index ea9f5517e8a083e37c4b7432322bd6d18fea84a5..e0470be9142caa4bac4285a191725bbd60e706fa 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -750,7 +750,19 @@ vreg_l7p: ldo7 {
 	};
 
 	/* Pixelworks @ 26 */
-	/* FSA4480 USB audio switch @ 42 */
+
+	typec-mux@42 {
+		compatible = "ocs,ocp96011", "fcs,fsa4480";
+		reg = <0x42>;
+
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc-supply = <&vreg_bob>;
+
+		mode-switch;
+		orientation-switch;
+	};
+
 	/* AW86927FCR haptics @ 5a */
 };
 

-- 
2.49.0


