Return-Path: <linux-usb+bounces-7458-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5976986FD9F
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 10:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BC0F1C21AE2
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 09:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE38C38398;
	Mon,  4 Mar 2024 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sccp+cUZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD35C376F9
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 09:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544383; cv=none; b=YuVHITAVLAwmXPAulcosXn3uCWv4jDEaZKzps/0yazCLXEo5ggl4pu4zUoc/jdLa5jpZEbVMs1TXJigBCAfLe0bTnKbiuQNOFhI7QhG+jQIouFo3i0pil/64mlXHM2mZr3O2JljRdE42IPDR/oY1u7E1Q3OijlR5MdKSyKBqp6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544383; c=relaxed/simple;
	bh=BLdwy43z/rG1Rfpc+lH91NU7tpMZxCQtKA1bbNGBffA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqhFYGUSzJ1WNNpfmo4yrc4CIBhorS0F8OWDYHXvZTxLGJ7IvLupKmo5Xng67cth9jkmWtWmjkmVW0QFZu3svFqfd3dYTZaPwf3P4DVH2rDn4tS1mlTlbg5GMO34knuGXYWEXNR5+V/PmFnKzFDSpCULVyaFbiCX2MD1afBYkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sccp+cUZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d208be133bso55589111fa.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Mar 2024 01:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709544380; x=1710149180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1EHXJV66KU5I2HyAJg6Z5WojMOe0j/B2mp0hbceKc4=;
        b=sccp+cUZgRsSC+uwDV+w3YNhROGf/zJhtP6a0gNu/uqqPGd7b5s+91r1RRCoSedZHm
         Haj9Mn6LSoYgmBknkOn1tNdKVGL7qYkoehi1BEQonHVx+Brr/E+b8tMonj5Mefzq/D4J
         hB5ixmCfZv46+/kUYSYkS5M+cHDFBU8XpeGrs81qgUQyxAtZmeM/MM6MiQbj3ekWfOfa
         QuJJRKBGGoMuR5OWVA43rcWCIa/4fxNfNY67ztLCvucsJlRfDSHrZxXSSY6xdAOLTqoX
         xVmCqwG3zHocj8lQMAEBEOVMLZavOk5Ic8KrIX3/qXpHwfl8BfwCKFktyy2SckL2ojl3
         gOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544380; x=1710149180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1EHXJV66KU5I2HyAJg6Z5WojMOe0j/B2mp0hbceKc4=;
        b=n8Hetq0WhpkbydgxkTlRNt6ZCtjguy3+69GBZlXPth7JRXBuYLR1h6akriYGhbCTVr
         t7cTZEuNu3GgIoALy5k8XXtCAbpInu5hJLP35wMH9u6cvC/I/c4/wyOVZk80CReJYuTZ
         rSiYEds5+ao+d6/K53p/Iduxc4C0rRlRuSGV7RtWWuypFFp8REMdAcn7huq/xsg4+cHP
         OzFr6P9xN09kS4M2ZyVVhLofYD9Y3mI0f0Gm9zjWln6NBy4u2cQnjtfJVlO7bzGqUGDO
         W7L8k9v4rkTcN9uhjXIRz0EWwA9nKwXhb90xBjhspakZVC/jFhjOFiTdUUYCRUrC5LPk
         mEGA==
X-Forwarded-Encrypted: i=1; AJvYcCVbBh4+ZoNSKiwgJQtZjKIAE2kjB+UWHmewYP2gNauZL2/GI3TMPQXxjLMZkkNLUL7khO9cdAcf+s1UNa8A5AGB5TYp+5VPhC8K
X-Gm-Message-State: AOJu0Yy57wKhZhxMW5rPkH0VfH9HMbDFfVt/bK5FejGupOlqw8MocfHE
	5dDF8A8Imamtz1ysz5gMf8uveeuFFpl6Z5EfuJ8uezOLlYnvSqruFRjxk3r8ywo=
X-Google-Smtp-Source: AGHT+IFHo1dlHA0Un/Y5N7elzZmKF2DShDHbXQsK0ewHvAmNi2oM9Exs3hmHfZiYnClTEB82LBLgxQ==
X-Received: by 2002:a05:651c:2124:b0:2d3:b502:3ff1 with SMTP id a36-20020a05651c212400b002d3b5023ff1mr2147615ljq.11.1709544379963;
        Mon, 04 Mar 2024 01:26:19 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id r4-20020a2e9944000000b002d2a4431fc4sm1651146ljj.119.2024.03.04.01.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:26:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 04 Mar 2024 11:26:10 +0200
Subject: [PATCH v4 1/2] dt-bindings: usb: qcom,pmic-typec: add support for
 the PM4125 block
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-pm4125-typec-v4-1-f3601a16f9ea@linaro.org>
References: <20240304-pm4125-typec-v4-0-f3601a16f9ea@linaro.org>
In-Reply-To: <20240304-pm4125-typec-v4-0-f3601a16f9ea@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BLdwy43z/rG1Rfpc+lH91NU7tpMZxCQtKA1bbNGBffA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl5ZO6Nmr/dG9oq0HlsK1EjB3Po7iJeHU/LCLBI
 po6GchmI/aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeWTugAKCRCLPIo+Aiko
 1evyB/0QA+GgU8s2dhcfA5EDxnvzY/gMO5ZwB0ybL171QRpFQV+Nlw3KxQgK5nBYxQ6S7q2sztk
 Usq00lgSKxqZP5f4vUql5T3c0Ll0LCVWnDsRBiiXY+3Np7IAZGcpK+pEoAaX1Z3zwSB3icpMQO2
 cIVduE5jvS/Q9PrTAY55OIbOqJvQ6tY+lpxIlFDsZqqJG5z1/NgtLbpb6UL/G2yG5xAKQiJJ2LD
 UK/NmDpJF/o8RzHI6CaKXlflCWH/5LdSxKozCd2oKnknjTR9L4+cQSHSs940D3NqNyKJAow80Zj
 m27csqXaFkYECa7LaBF+upfyeFAdtt509xrTvFrZUP/w8KLt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The PM4125 PMIC has the same Type-C register block as the PMI632.
Likewise it doesn't support USB Power Delivery. Define the compatible
for the TypeC block found on PM4125, using PMI632 as a compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 976d1732137b..d9694570c419 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -22,6 +22,11 @@ properties:
           - enum:
               - qcom,pm6150-typec
           - const: qcom,pm8150b-typec
+      - items:
+          - enum:
+              - qcom,pm4125-typec
+          - const: qcom,pmi632-typec
+
 
   connector:
     type: object

-- 
2.39.2


