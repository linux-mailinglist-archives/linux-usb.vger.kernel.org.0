Return-Path: <linux-usb+bounces-25616-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C31AFE3F7
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 11:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB2861C43872
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 09:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663D6287243;
	Wed,  9 Jul 2025 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="kOugYCjH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570A828540F
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052730; cv=none; b=ezfvO/W48mxvmCEZAmc/hA1CGpr7ASfmkTR+bi8HjwR+0qnUCT5d4adNUyGRGEAPUSY3ossgWPs8WnbW8ryxWYWc/J1rrlcREj+BtoaXeoD9bPVB1s/setIjnSWtzuTOJdLYb08s1Tm4t71wEKDtnOk6i8JiyugoU5LMKrx6isE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052730; c=relaxed/simple;
	bh=ypwpLrRTvDMuCRzzHaQyRH1tZrFg5WTx+gHcQSKkU3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n4NrzF/vQZ4TE5IGha4HGyEQtQejg0Xn2dk87sg68lA5ASScXX0UNVgWg+mn0Wucjv3GUfDyWzWDJJq4yJCIiIiTwy1ostK1NesW3SL3nN1nKRIEQDVV+mQ0cQzz2CK/y1bHg3NehXL3ts70Bvo8pU+lsHZHkU6ETQ6I0j65/mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=kOugYCjH; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso10240737a12.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 02:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752052725; x=1752657525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k19wXpNqnFMbk5R7eovbUjQ7UB0GYLr4+9IyBRmyPec=;
        b=kOugYCjHPsGx+ilJfEi2PN7DnIQyn4utaBS1iMlc6XqP3z9VR4x0LSMq2WelbJ5aHP
         5et4bNen8HjWu6jB3PkVJyAIFvSLXzQ/D1Yi1ggiDYoDckkoVp8ar4pGHpbURUyAvFNo
         R2JLJX7g1XxPqU0u1K/ay94qYd0tQPYOCcSF7mh6WhvklIpKOhtjpP+mP6hWQv5OgU3o
         gEloaS0VdDKeewyHBEESEBD2iw7SH007W5xtdXkZN9++fqy4pYxO8PBWrVdsQlbPLbCc
         f6NOmTTx9N7v0pxxwHk8qycHDTEbpaBH/o/wdfzLJPSyjqk4YEqv4nYbuB9zSl9MFI46
         673w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052725; x=1752657525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k19wXpNqnFMbk5R7eovbUjQ7UB0GYLr4+9IyBRmyPec=;
        b=IEnLVbkefFtpM8XF7tmtpnecl/pFepRyoiySWI/XTxKj73nR2E1WZT4B4/r3eP9I5o
         06yY8dGENHNZ6pA8DfjCHodkUoTrLShKsgb/RE/EDo/15NQvLZ5NwlEWRa1pCDnPM4Go
         GRRgRQY0UizBqflbvmFd27hAbgyzWJF8JDu9RnV8KELZOgdhx5dGmpGX7WLbsK34AMPp
         MaB3lCqgY7RH+9PLQXLjfGtYiFrYv68yKLHD4eiUQl0cgqod5wWG147r+wOVBa4A68kO
         ItQnoYpxrn9tLZw7IaYtyz5lu4U67Q05vDS0XRD01d6WrdHhi97LspWarvZGHIgBL+bj
         BETQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzN3ujQmMlbVkkJAWpiaxPxOqOCxv4CfmADD0+uEspRAwgzprBA4UZy2Y+q7/Mv/0edOmOfXpzV5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1eAzWMfDF751DR1/ikUpL0BSMD9vqcoepXzjCv5LxUy8MFRHy
	GWjIg+J6fCBDaZCiH1YNcinSCuDg/68DWJmE82TLD2G2WAobx9scw71M7TIvnZfQwFE=
X-Gm-Gg: ASbGncsyPOoHvpp9D6JVLZv7vwysnnvvJxY2LgqAl3e8bSJJZBETRQieLPYFnxUUb+a
	NVWufLGNVvrkjdY2KdDGK8NEitK0h/ARvEUPQP/4Nwub4pOFDboB+T5HiL8xP6DvybYhbTVPc2/
	nvdYoX7hfsvu0Ue86CRizPCkBLkGabBSteoSa/AsF/pYkDBkbahFGF94k5qexSiC6onnsK0sAs/
	rNjQMd5HzJROgNhh7RRO5WhezPNO49folBJ3PtDrk2VUlM75c2yE+73Wfs64Vc5VIgqyT0viIZP
	SoHRf8EElVgUsvjSGetZnk+MNk/FHouRTIdFNnda/lNFKOmuvDnZTeV49/s/PTe007ruiQCOy1o
	ibdqgCrA+UZ4FXi+5xynIOvvQFTQuW3Ne
X-Google-Smtp-Source: AGHT+IEldUKbclROxgKKvDj16YdbKCkfb5vsSnzNDwXOeeA+MdVlRejqQ2rYPeZd+UWqDhaqfEndNA==
X-Received: by 2002:a17:907:3f1d:b0:add:f191:d851 with SMTP id a640c23a62f3a-ae6cf70f6ecmr193619966b.32.1752052724529;
        Wed, 09 Jul 2025 02:18:44 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e737sm1060116866b.142.2025.07.09.02.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:18:44 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 11:18:17 +0200
Subject: [PATCH v2 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write
 from init sequence
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-phy-v2-3-4790eeee7ae0@fairphone.com>
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
In-Reply-To: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752052719; l=1183;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ypwpLrRTvDMuCRzzHaQyRH1tZrFg5WTx+gHcQSKkU3w=;
 b=qWz3s8ZAOTflgxuX1N6dBmF5nLHnOvsOGcagHqbmagvbHIa4s4DGNR3HHtOQx/6KBWkS49b78
 y8aXmLEU/40BkHdwOhmwGYx/yUn4lOmbIbaH1RiDiedOPOnvRiI1YBJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
sequence is missing setting the CMN_CTRL_OVERRIDE_EN bit back to 0 at
the end, as per the 'latest' HPG revision (as of November 2023).

[0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fda3246e09dd39e16e2ab43cd1329

Fixes: 80090810f5d3 ("phy: qcom: Add QCOM SNPS eUSB2 driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/phy-snps-eusb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index b73a1d7e57b32cfdfbe314ab938ec54746ed53be..e232b8b4d29100b8fee9e913e2124788af09f2aa 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -437,6 +437,9 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
 				    USB2_SUSPEND_N_SEL, 0);
 
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
+				    CMN_CTRL_OVERRIDE_EN, 0);
+
 	return 0;
 }
 

-- 
2.50.0


