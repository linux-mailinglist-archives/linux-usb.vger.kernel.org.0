Return-Path: <linux-usb+bounces-25822-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F22BB0533C
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 09:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D4281882B6C
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 07:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CD2274B36;
	Tue, 15 Jul 2025 07:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="E6ZPNxYU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6843272E4E
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 07:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564590; cv=none; b=qmhUIWSx6X79Kdkl0gS/6fMCWWXWKJg6EFDJmHCPjJ9jq7fOFDCavOWI37IYz+d7cnVYBWLO4LWw2ZY8CPU3nexqkyzKhjeRYeHCbMy2YE7l2csNvJ36WX+W7VndbR/SDeXavuDy2LZY9e3ET1Fn9KeDS9g1FFYNxFXUfIHt/X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564590; c=relaxed/simple;
	bh=fbYN3aPb3XXCiKQcnuxlj3EeuZKZPuonSYvZ100x1TE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OCu8SKGlsFQwNGFBP0AdAqGbKU1VX+CKzfpBjs0k1vgPKRYnv9XDbwDUb3zecnfIdkF8E1OiGb2znKRfBjtNKefIJLmsRGIZQgRJstxyMQWDVt4HNkw4L/LDC26KujXsT7Eo+dSR06Gba3qnM2EQVHT1FTOWNT8gdFkCGyDcoxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=E6ZPNxYU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-454f428038eso34196475e9.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 00:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752564587; x=1753169387; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f6fKdp/I3oAtJ41AZWsqTeQzY0qXnxN3fwHvXO8WXa4=;
        b=E6ZPNxYUQZEUp2kfYTVx+u++gszDAwN5h1/4yViI0XrX9W+5a4cREaW3fzw/DlDexa
         ms5ooQ43n+UohTJTeNd7TBZNxrSAxHeaSazntEJTdJAbx3fuK+C1nk2YOv+nM/6BcvA4
         g6HCwh4iRCPOLo3TnornCSWtFYe3FW+4elQK8hz+dfeB+3cn0mJSWDfw1lZgOIE0047u
         pCS6C4SS1agIVmKUjjbUbNAfk/f9znMXO+HR+MyM9qayEEvT/9yBJbzF+dxjXm/DX/vn
         dQ4/hKbsiCs2jw304NcvXNBT51NeWdCF8KYfxiPAUOGTSOB919Z6rPN5wtyHjNxM7PB9
         1Vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564587; x=1753169387;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6fKdp/I3oAtJ41AZWsqTeQzY0qXnxN3fwHvXO8WXa4=;
        b=a8QVRLMwzjWBw9dg0EVGjPsFsJ5w3SlEEAYSxjQ5asVoSt9T5xCepvFeI5vmZ857hB
         yX+zccTigM2SGK//AwszCeAaDF7c3761iTz1mSQlO2vuz8vN2sr9wsp9DshG7jrsSlBx
         1oMYjmfFLbEptCPL/a1z3VR7+/DQYIO5sdETIInn2+/v/GyaaeVlog3ju/nDugEArcr/
         wb3pxLWWZI3tewBgDfpYDIT8MAfmf7YzRXDek58zFhdQpLfrQxlr7+iNgZiBjcEeKGjc
         /owbWGQafHsorCzZ7GLt9sdsgXGISo39suHXHvMwjg9qcvPnKn7SL5K48OppPqrkEyvO
         IQOw==
X-Forwarded-Encrypted: i=1; AJvYcCX1lFF/VvxbzkraqE6AbsrpKC6wxz5+/yoXBwHfNCHAMBV5VMK6wdwmeYH0qypyb85ivVxyQyb5RtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcS9jBfB0WMjf15LrXlysA3yQQb5rdJZjad1in+T3L1G/B3ZYp
	GBw66oU7KiZzN2yDQJYY01zJi/wn5ng1m3Ca/wLjL0qlLxtJCmGLrIIogFRx3eiuHrw=
X-Gm-Gg: ASbGncvgwBMJ7ZXcCUZuJj+j3R0X1aFv3U3NgNnx40Gh6saHYyRveF0sX0Ad39ciYTG
	DBVaCpjF1iaIF7mYGaut4cYzTGrWTjzCEN5I70ZzUiwMIceAiVrQDJQX9lIX0wLVxmgSJ/chSFz
	+yIEsmy40brndxJZibiJAassYq0Yj9OfNJvaTIlLZ46w7T0zZfpRwkvodh4rIKMCNEcRZsyQ6sA
	2CBWo//9XjUgtWmb22negq50XatIvpQdF1dKzJXo9hwGjac2Xm7Hklh0Eo4cKUQnS7QQOW+Czn8
	mtCEYKpD1bjjvGnvE8AS5QMzUnyHVPakBfGqKtLYLic3xlN+RcgNpjr1CaOVWBbZ3PrCwETGjJP
	JlTn474KpWDNEHywauneqQRNPvTmtJn84ea1KKAIdeTE9aNKl7K+U7dbg
X-Google-Smtp-Source: AGHT+IGG5/C3xBwiXlZfBkTPzKSCxIpXMT5JelM0B6XvmfLgCo3iFhVlka1xI/0VqzDpufUqJcL89w==
X-Received: by 2002:a05:600c:350f:b0:456:11a6:a511 with SMTP id 5b1f17b1804b1-45611a6a7e3mr67459555e9.20.1752564586974;
        Tue, 15 Jul 2025 00:29:46 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455f8fc5a01sm106703395e9.32.2025.07.15.00.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:29:45 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/4] Changes for the eUSB2 PHY on Milos
Date: Tue, 15 Jul 2025 09:29:33 +0200
Message-Id: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF0DdmgC/2XNwQ6DIAyA4VcxnMdSUGF62nssOyDUwUExsJEZ4
 7sPTZYls7e/Sb8uJGJwGElbLCRgctH5MUd5Koi2anwgdSY34cBrEBxoHKQoa4qv2NHJztSUnep
 EddGmZyRfTQF7997F2z23dfHpw7w/SGzbfq36YCVGgTaVkQJBCKnZtVcuTNaPeNZ+IJuX+M+Q0
 BwNno1KNoB5pEL4N9Z1/QBi9jRk9gAAAA==
X-Change-ID: 20250620-sm7635-eusb-phy-d3bab648cdf1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752564584; l=1471;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=fbYN3aPb3XXCiKQcnuxlj3EeuZKZPuonSYvZ100x1TE=;
 b=Rjj/7cfLdOoBVZeq1Uex30CfHl4mVnyxTojkjaBXB3wvxI+1Sg0gPtk3KypHpCgYRDpZMiCTv
 fBxKY9XYn3nBqH3/pWsaQOIzRV1+9BRmnl1PtkcifgHnhb/tPXnWY7h
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the eUSB2 PHY on Milos and add some driver changes for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Make "extra register write" commit unconditional for all targets,
  write the register directly as per Konrad's suggestion
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com

Changes in v2:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Clarify commit message for "Add missing write from init sequence"
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com

---
Luca Weiss (4):
      dt-bindings: usb: qcom,snps-dwc3: Add Milos compatible
      dt-bindings: phy: qcom,snps-eusb2: document the Milos Synopsys eUSB2 PHY
      phy: qcom: phy-qcom-snps-eusb2: Add missing write from init sequence
      phy: qcom: phy-qcom-snps-eusb2: Update init sequence per HPG 1.0.2

 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml      | 3 +++
 drivers/phy/phy-snps-eusb2.c                                   | 5 ++++-
 3 files changed, 8 insertions(+), 1 deletion(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-eusb-phy-d3bab648cdf1

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


