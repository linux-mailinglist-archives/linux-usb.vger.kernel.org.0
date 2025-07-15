Return-Path: <linux-usb+bounces-25823-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97936B0535A
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 09:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D341C7B7EE8
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 07:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB59276026;
	Tue, 15 Jul 2025 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BGYnPXzJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2C0274B2D
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 07:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564592; cv=none; b=uyaeUCijLJKzNEv3OaROfmlo+TyKBHIfuhOuSo9jGul5XpqMRVkxLf0zw6XgfS3PSa2VFUJoOq6Td2gfl0p0qr9yo2dxsR1l8AUp6ozpqodOZAoacKqP3hk4WQyLVWc3EkrfZK4ZkLCnoUVVTZ0VD0G+thp7h5zGEc07FfZ1rp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564592; c=relaxed/simple;
	bh=sF0BBqSfmmjGnkvMWcmZuM22C376Bznvzv1cD7u8WVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0jUyDnxgvrMWndeYAT1IEB7edoF2WuuKVPTi5sMGpHTZtIh8q8HrejIgHbEo5hhmCzkXdOsb+7we2ye991+t0EL5eBVXczhGKg4YGlmk3TjmoLsIFzdXmPYAQ/Cah6z2i1jB5/01zxbj4NB56Dwgtj9dFJnalZj9Dl8PO0FdCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BGYnPXzJ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so4154783f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 00:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752564589; x=1753169389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMdbbj4BEowCYzs/Z3M6B78NShV/42oHTUmjX6X1bd0=;
        b=BGYnPXzJqVh5O2j8Zp2czkrFZebhECxO+QZiatbUk+MX57bX1qXDVHy8/WVgiuxWyv
         qCyT8pT1M/SjIT9gZNXhwuhM9P2pctwTphybsKo2HXlWs56iwAyDUcHKR3PWNLokktzg
         IB/um+6zfynUQ7GTywEaCXDCyOcHCOp8VZhJy3V+b3qqAn755s93eOtrbc01ZvMMTrle
         kVjU3IXQeJrgKbb8HPWPDUilk3n4FL1as2/xnmYAuBzIWoyWv7ITERARInI2SMBTBQgs
         Z/6QqjkclDGxrFWMQhrb05Op8HRRBBUIPaEY1VDZF9A6I3u7TSEjcy5pYQAtNLkTLb8Y
         S45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564589; x=1753169389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMdbbj4BEowCYzs/Z3M6B78NShV/42oHTUmjX6X1bd0=;
        b=qdNa5LI2ON1D+t7V6+4E3KOjjCZKybA8FIOh7giu2uYfxdlStUvGkjCVWIpoYdGJiZ
         XTkdPVQqczAx//P04Y1NNjqt2T9m9E0k+QxS2XfiD6VxgT8nUMvFB99OyutUe8kmEQLG
         MmlUnGS4QDuucMt0ZBwZes8lwEVkHd0uGSRV6wi7LomZOFz7QSHVyEUaxD41eBU40SGm
         F8pN5/ZOYcNYGf4sCIsFFRhR9ZhNcS3yoVK0vnnX0jGgxby89Dybd245tA/XD4GlI+8L
         1oHfsvDJB3iEohZYDZKPTXI05Xv68fBuqcmX48gXND8bK7Hg9Rrh18/JfnKu6DT22csS
         aQzA==
X-Forwarded-Encrypted: i=1; AJvYcCUdx8IiAzC1tmx1HZ2PCDw4UyWIW1OUQdOgIYqe+RF0prK6FKICG3x0KsB6sdvT+OYp+Efn7+A25JE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJS37WXH85Uv5CBf/mIrKgkiWbV5ZCGj3RB8Qc5NR0wEI/idVv
	f62RhSFH3sHVcdZBTl7aw3u0SwtFQd1hfBDfpYjhcLMxbfqO/dEQfPIbAbgeBtFivxE=
X-Gm-Gg: ASbGncu7xWvHGXJxPXagCRxVkyVSJrJ0pkZLwLyjtjIFgc9SNh2pE7it1afpWMJq6vK
	oAXzWhkE32xoGNc07GbkufyNH0P/uaFe2aqFpcXdEwVhU8gtffHJou6Pxwh6zwsz/rDWf2vB+8H
	MKG3sAV2SnQ1lz+aZVWnN0XdyCgOYkJuNGwwnD9BWJUc853hZC3qtZbZsjiDS37MZ6NuiLEgDi7
	FdmGR99Cg4b9XIa2DSbdANTyS8zaPuxnub/jUpV/nswmd1AeQ4sGTQPGOq4/PJdOsOG0qqOXE8t
	PPDkU5I9x/DJbQ1/K3LvpJT8DLuK9i6r3dUuko/GmfddNqjwuWrI5qMJp35lMNn2we1NeEYKFdf
	klO4nXy//D9ctqkt2CLLFSdmgQokpreDPUlpL9xfU3e2cIZMZHsJ2bV58
X-Google-Smtp-Source: AGHT+IH7xZihVzIA5RnWD6NyU0bUqw560Kv27vVv2rhTAzSisPpc8YG7ahtot4M4YwZjZtNx8Gr9kQ==
X-Received: by 2002:a05:6000:985:b0:3a5:2949:6c38 with SMTP id ffacd0b85a97d-3b60a1bad1emr1118577f8f.52.1752564588929;
        Tue, 15 Jul 2025 00:29:48 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455f8fc5a01sm106703395e9.32.2025.07.15.00.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:29:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:29:34 +0200
Subject: [PATCH v3 1/4] dt-bindings: usb: qcom,snps-dwc3: Add Milos
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-eusb-phy-v3-1-6c3224085eb6@fairphone.com>
References: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
In-Reply-To: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752564584; l=1322;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=sF0BBqSfmmjGnkvMWcmZuM22C376Bznvzv1cD7u8WVI=;
 b=kWHGuSS6cgAT+8EY14LUc3Wr8wswBjOovjk3j3OcaOlQzDYtixwgSAbOWluwm+7/DADGH77OD
 /ATYlXH1wgcD7S06O+brsLKzuyArP0bc9RfmMxcb0S24PBta83t8Lqx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Milos dwc3 compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8dac5eba61b45bc2ea78b23ff38678f909e21317..dfd084ed90242f0e77cb2cde16023c3421c5dfab 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,milos-dwc3
           - qcom,msm8953-dwc3
           - qcom,msm8994-dwc3
           - qcom,msm8996-dwc3
@@ -338,6 +339,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-dwc3
               - qcom,qcm2290-dwc3
               - qcom,qcs615-dwc3
               - qcom,sar2130p-dwc3
@@ -453,6 +455,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-dwc3
               - qcom,x1e80100-dwc3
     then:
       properties:

-- 
2.50.1


