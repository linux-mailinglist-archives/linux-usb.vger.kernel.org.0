Return-Path: <linux-usb+bounces-25085-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D802AE7C57
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 11:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 834524A3F75
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 09:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3C629E0FA;
	Wed, 25 Jun 2025 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="viGbI74M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D8429A9CD
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842882; cv=none; b=FgXKVr12oSIp1jr/k5LtmZi37nsuwT7QqV2GLRcWHUCeo1YKW0utzHk79XTn3Hi4ayTWYYZlMguZcY6KfSqVdQx+fZQ5RVp2fqzF21vDNTPA+j8j1IGYDj4T7L1ffQWlMTYN0wZJbwpTckdMTmwNShgvJ81/wiInnrl2mDY8xbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842882; c=relaxed/simple;
	bh=PAGDNepLOywQBabUDSRzPENpMzvIh8vhIPwgCFVMPTE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XZoXL2muRrwLNdun7qt41qCrG2zMX9f/T4x/MhgcE3396bkGYfr0A+UM1ZK1CawO1HW3e8q1hreEAkfdETsfsBMkTCJsTB/gOw8wO/Q0Gj9IC4Zc3M4dJ0pKoYNYC6XLxOpcnLG24/yDZbbg2vAWk/20u+3E6cKiw3DOhGDkKZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=viGbI74M; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-adb4e36904bso1241707066b.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842879; x=1751447679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tNPdorLxClaT/uQLIG+PJ7OfFR9MMk+m2oDiINzPpBY=;
        b=viGbI74MkQ4mBIlVJVUITiIYtPdofzw6+SzUrQurZ1/Ds/YVNC82s8VXaalXILQOl3
         LbkGtBcMOcqKlLL0Xj25tCa8AomWs7GqGTG4t/ffUVJ2sbEI+Pmwfeo8s74ykq1mxTQn
         IAgietsITqYemsdRkokbmq2N0jXjDuS6Clu5qDnCqOKhM5oqeFU+E/jfSytxQBwxYfEm
         4nTb9xPf+8Y5zcrUaiOkrLfwyGuv/F3Q6LcoZoDKL3vEwLKLLz5sirQkS7nBZytYRR9y
         VJeFcSU2uLwswC6HFyqDO0jKXTpicJIjKrafRojewK0z6TzoJQaM8oGYSzoTTZ0d9Xa+
         /RdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842879; x=1751447679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNPdorLxClaT/uQLIG+PJ7OfFR9MMk+m2oDiINzPpBY=;
        b=eYN7Vze+B2TAMTVhslZ5UFQhA36R1EJEx5J/YIr/ib/BvotSIlyCRgbo09ZI6SE4ve
         0F/4cxjK0oepk9/ES/BLfBgDtsuguaP593XEjCF+IEtA641HqcUF/6bfGXalHXPkznfi
         w9wYnC3AYdC79NT/g/iMQSeY0si2bLW20d+pOFXs1p78H70+S/yHGi08L/OTTpoGnM8l
         CoHII/popDqFL96IAZWUyG7hYU9uBbJ8prArZOi4MamAuRleLnXXQOhClXnT7Qh7/PqZ
         m7/HrC66twSlMOijsFZawLDX8JWoQ+f4JRDYh8JJy85qg9URgn6yVRTIleI/v8hd+npC
         EXRw==
X-Forwarded-Encrypted: i=1; AJvYcCUIJzWFn7vxMybWzKQT5v/Yehhwsa6qp4v7lI0l1d8rRpSQJo2wJsSXWnra/HW/0dpe64u9PvAfOX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxroybIH0RfClE0OYowEqnSuiA6ak3ewLwsutoGjjNTQjXPaEr/
	SqevpBULd97qneCdmG/p47XdkdDHGhqH4QlbLG4LmSvRfoJmkArr1TrvFtoFYX4L2j4=
X-Gm-Gg: ASbGncvlvx6Noh/KW7hcx2Na6oILlN4iOl4U0AMhDCOyYX8dk1e45LcGVYGdkhu2a2V
	D8L9ODJdNB/b6bEJ7wBYAro9FFJh8mTw1noLWAN3AXdmaH255oxNnpWtTMwL8C8+X4BGBk6+/7U
	9nCNuxpHYQdNi5zLNp+vVVyF9CTM//Q+40cfhjolP83A1EOZxvKr2A31/ARXDm/Jms2euuFaMU1
	SwEtQIZ0/fTK0+3lrPrY7IqOXumSEv0ufG9QnnnLQ3ChUp8V66HBpuOADZLdd58h2sh+WeYuk4X
	L7rQ53RPqOcm1dueGg9/W6+KcT7d/ypK9bo1Q2Q64q/4v3GEfN1OZmO61tBj7XPi1uhwcKhBIOE
	4PYYgSE/2uqTxTeKFX9cCBkTUeaOtW/gd
X-Google-Smtp-Source: AGHT+IHpq9unqR2oaBvwa38Bk0ZRvwuj5rdTKcuQ+rG7jUe/JThlIksCFQb3sLZOckPwpcJlB25wYg==
X-Received: by 2002:a17:907:d2dc:b0:ad8:959c:c565 with SMTP id a640c23a62f3a-ae0be7fdea7mr236805266b.6.1750842878906;
        Wed, 25 Jun 2025 02:14:38 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083c95sm1021480166b.91.2025.06.25.02.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:14:38 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Changes for the eUSB2 PHY on SM7635
Date: Wed, 25 Jun 2025 11:14:28 +0200
Message-Id: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPS9W2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMD3eJcczNjU93U0uIk3YKMSt0U46TEJDMTi+SUNEMloK6CotS0zAq
 widGxtbUAVRupiGEAAAA=
X-Change-ID: 20250620-sm7635-eusb-phy-d3bab648cdf1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842877; l=875;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PAGDNepLOywQBabUDSRzPENpMzvIh8vhIPwgCFVMPTE=;
 b=RIhv8EznDuMD7oLSF0eD0DTG+LFSs9onAwJO9X6ATkc4ve/pGpLEQM3tBajj27EkSJyGXiNRG
 gika5+0wZNRDRMnR7hBSfSIOi5tnmca0nZU59SyhOSKu6R+orpFTrxv
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the eUSB2 PHY on SM7635 and add some driver changes for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: usb: qcom,snps-dwc3: Add SM7635 compatible
      dt-bindings: phy: qcom,snps-eusb2: document the SM7635 Synopsys eUSB2 PHY
      phy: qcom: phy-qcom-snps-eusb2: Add missing write from init sequence
      phy: qcom: phy-qcom-snps-eusb2: Add extra register write for SM7635

 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml      | 3 +++
 drivers/phy/phy-snps-eusb2.c                                   | 9 +++++++++
 3 files changed, 13 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-eusb-phy-d3bab648cdf1

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


