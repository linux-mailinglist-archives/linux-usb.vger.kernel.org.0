Return-Path: <linux-usb+bounces-7457-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7987986FD9D
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 10:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0717E1F241AB
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 09:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E05C381B6;
	Mon,  4 Mar 2024 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VttFqjIW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFDE376EB
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544382; cv=none; b=bFBuYjQhkgHOL3Li3w9ib6RlpypWUAotM7ko3jQf+J6UzRHF3xIrAARGnUNU56gJaYpOal10+L344y3mGXxHyv+liPXS35jr3R5uaFrxFBxmv9fTT5Kdc0S8JftN21qRsqAtR2thzC8zvuJFwjoQRCtAgB46hageEXSJLc3DIH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544382; c=relaxed/simple;
	bh=WQYQfS6aUkX9o0NX7LLOdwDv8WNwi2RW8SpDoQNepNU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UEy48SB3MTwBCnhn7wfjb/oK+djdSzDmqnYPX+PLMKhLJCje8qAhwhpwfF0bUE7hNPM7zG2+41A/J958dCR2acoKnPl2zWVzqa1pi70+d4ti7Nz+NXDTiJ6e9Y6XzgMyD4/40X9Y8oSQyw89xcIGqO4Oauh55BYX/65zVh3VBxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VttFqjIW; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d23d301452so46595491fa.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Mar 2024 01:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709544379; x=1710149179; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j54H3xjPvKakblap7fVbI2AqT2NedCgkHYeiL6Tnltw=;
        b=VttFqjIWq0sP/XAce8sGBwhRzhXGX7EkDVZpRoaxqA5N049KFK5IrrPcyBw2osGoEP
         jtJ/5xek6MWHQGpgriN4JKPHdrtYE1TGJ317CUeP/FMhRPND2Po/wNfNT3UjuEcZR8Q7
         jKXfIG745mRa5C4SO4BnfkjcEJXLImoUeBG4dql0gxDVkF5QCwa9HlX4QM+oYUm8hzWm
         kcG5j7lswQEwcVkS+71/yjLJxCLCsy7DP4uODYIxXjGjwrzOfiYI0tG3GMPDEzX1dfkT
         6iRND65F8eZGp8yekpVswJ4z9j3WYZpyO2uGG6s3pIqn8lAJNECSJw8DqLLwk2gyAxD7
         WGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544379; x=1710149179;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j54H3xjPvKakblap7fVbI2AqT2NedCgkHYeiL6Tnltw=;
        b=t6x5XAvKBKgPH4kDwfb9LAM/gk+yT2LrZvDGu0Zv5d7SyKTA4Kpo9Ns5qzZ2DAX7GE
         naQwu0+vSkybLcrP9eVgcLjUSloifWlS5tyoAETlzLcLk4MgLQSi3bq9v5oFHPQIor2Y
         N66jZVpTlCEYwSB3asxoTze1sUpwqATvhtPku8eZeklZ6Z/zTNBERljNIz5s6d9I+RGJ
         vCf2Q6edfoFQpjZ4rAohL514v1B6z+eT6XQlAbiB3e2IAnk+CXJWCKQceeVLEAYpzeeI
         kF6O+8e8pdjzO67UKnwnv12WsUhuv4wM3qk0iKj9zca6MKV4cDaum73eZiiIP2DOUJ+n
         /cBw==
X-Forwarded-Encrypted: i=1; AJvYcCX8cgYKPF8K+yci6qbvwm9AjSAQbORAO3HnUbRZ7dUchiBil/+/xAYe6cvNDY6AXIRpqovdDWkljcNtqqPxItykBAsiWt6gZOqt
X-Gm-Message-State: AOJu0YyDIKdJIPUfkbxUMHkWQ/MEbuXNUWnvR6bDg1+3ph8PyfNg9QH4
	CdtkRqHbWpwrQA2Mdd30R0Ddnai6vMMRegAr0hKXcstqdBZqmmIE1FbFxI76k/s=
X-Google-Smtp-Source: AGHT+IHSaS3bBs9iHNUFNQvmIIlJaQpWYfFoxR0ZoeSzRi6ORy7M9epEEDPF4mjU5yc9qGByAvvQiQ==
X-Received: by 2002:a05:651c:1031:b0:2d2:5129:4ffd with SMTP id w17-20020a05651c103100b002d251294ffdmr5770007ljm.53.1709544378976;
        Mon, 04 Mar 2024 01:26:18 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id r4-20020a2e9944000000b002d2a4431fc4sm1651146ljj.119.2024.03.04.01.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:26:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/2] arm64: dts: qcom: qrb2210-rb1: enable Type-C
 support
Date: Mon, 04 Mar 2024 11:26:09 +0200
Message-Id: <20240304-pm4125-typec-v4-0-f3601a16f9ea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALGT5WUC/2XO0QqCMBTG8VeRXbc4Z2rbuuo9ogvbjjoolU0kE
 d+9KUFpN4PvwO/PJhbIOwrsnEzM0+CCa5s4skPCTF00FXFn42YCRAaIknfPDEXO+7Ejw5UCsNq
 ALsiwSDpPpXutuest7tqFvvXjWh9wuX5CKWxDA3LgpCyAliS0xsvDNYVvj62v2FIaxFfHZ6dF1
 CikRKtyGb/0p9MfLXCn06hLa4EIslN+Vxs9z/MbND+S5iUBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WQYQfS6aUkX9o0NX7LLOdwDv8WNwi2RW8SpDoQNepNU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl5ZO53kIV9jpNFXjLhbT2MXWaJR+zSI3viOucD
 hpx4bAYbYOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeWTuQAKCRCLPIo+Aiko
 1eXjCACpbe3bwOgjDpynikmMSVdPlX4cJjTOURNiqlZvSk01JW/ES/l7n9bAoSKrfwfDVpv9zLw
 tYfdlLlMnXPeAL96zt3auUAZXqDiHebkbB/KHaFio+JM3FrX7sfLWftshK+IHnb2Khe9Luixshw
 s0aGtqJ97eRtPlmTfQ6rJUqP9eMda5lpEjegPNtcNqasUi7lewdHc1hidxmMKo9zAZl/k7cda0T
 DZJ71FU0IuS8uX5NIZF8BtDrxiOQazM1eLPEPmTCvF4eXN/A0Kjgh9+9+cqXvGPcrhmr5iqaDdJ
 R0njok039e1fxt4JtAIOMqxq+//y92Kg/xsbLHUguQAITbE0
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
Robotics RB2 platform) and implement Type-C handling for the Qualcomm
Robotics RB1 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Rebased on top of linux-next, dropping applied patches
- Link to v3: https://lore.kernel.org/r/20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org

Changes in v3:
- Fixed the commit subject for the regulators patch (Mark Brown)
- Rebased on top of linux-next, dropping applied patches
- Link to v2: https://lore.kernel.org/r/20240202-pm4125-typec-v2-0-12771d85700d@linaro.org

Changes in v2:
- Removed unnecessary conditional expansion, covered by existing compat
  string (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org

---
Dmitry Baryshkov (2):
      dt-bindings: usb: qcom,pmic-typec: add support for the PM4125 block
      arm64: dts: qcom: qrb2210-rb1: enable USB-C port handling

 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   |  5 ++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 42 +++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 60 +++++++++++++++++++---
 3 files changed, 99 insertions(+), 8 deletions(-)
---
base-commit: 67908bf6954b7635d33760ff6dfc189fc26ccc89
change-id: 20240117-pm4125-typec-8800d9c09aec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


