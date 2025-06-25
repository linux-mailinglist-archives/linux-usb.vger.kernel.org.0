Return-Path: <linux-usb+bounces-25087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E60AE7C69
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 11:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC48E1C21D60
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 09:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E523129E0E0;
	Wed, 25 Jun 2025 09:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1GjBIvz3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE05A29E103
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842884; cv=none; b=eATtXb82/IXdQ4hRMfQVldxb9MhBxw6PPiZo2/t1f/pJcRdF8P+nJOE3nyB/xWW44paTUMEv2rsJqWqYarP2hFvHC1S6ICjC/oq6jsA8KZ6f9Ifep/yQGChUQKPAzIIoDvLRUnQh2BwyVdodHoQgeLreCUOPbesW7KfR3gjyiHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842884; c=relaxed/simple;
	bh=HKY7AzgHHOMUKSqDSyXSmqFr6rS8cg0ALPFDJvvYf80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWcWE8WTd0968nSOZ/ZAgpwixEVm4BWAocAMfeyy2bm+HudLwM30w6Q6ZVjAl/wj6X+qJjnYBfgf1Gc43/mYFrmvSneJMTlf/5uLs+gFeyNtn56ysd6eCvKV/6Q+8zWue2wkRVc6LEvWmvbDHKtnv3W3/RyVJ/rp8GUfazXvKAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1GjBIvz3; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-adb2e9fd208so237424166b.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842881; x=1751447681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaodSZscksOv8tm14xnsYu3NQ9jnag2C5XRSXbuw1WQ=;
        b=1GjBIvz36b1r+IthEhw8y67JdzzAB9NTRvfVnbimVWoJelvUV7/9GcBb1tIGAbsxvB
         TnqrQYRZOfNGqpwmiSRSOnJefcmVH/YPy1Nk748GZY8s1U8Q5ESdFR5VT1Gyt7MenqjO
         knhfiP1W/PogDdJG9MQn+Uo1kK/MtkXX+oaXbFu0HoEab+PSQqDN4JpruzTEMfBPHgDK
         CJ7+ZFOKl1gc5m4RNFUfEHG7LEaK9CRq46Ew666CpwPakB+fQ6s1tVP1bjXnDwBPA86/
         2rtmVAt3dLpskSGFrAFi7BlLBpPmVzldClCsYiIwDvk1eLSx2qCGQy3BwSLYOgcBBJsd
         CzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842881; x=1751447681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaodSZscksOv8tm14xnsYu3NQ9jnag2C5XRSXbuw1WQ=;
        b=Ob3jqjq4hwT0OSh/jNJg+dxdAJAU1rroZFSPlCBZV3VBIr7n6ePord6G3ya4Tq9UPs
         VRDhzonW5za3zYTnJb1r5Dk/8yHGSty/P4r7XX560cIJ6iqLPdXLY9LRNoBM6qzCjF17
         3YsyEr81o+ausmtzk9eLWxCJxTVsu+O5zlD5VOyDxlbNtR13GOYENwCv04MPJPkq2VZz
         PH9MzgZOoKbpzhYEXtXLZelp0UKak9U5s56hiCj1KQQqwhfFn3Hl38l4Uii2jzLczzCt
         yMYMSmOWSzYrR2BO9wEqWsiZcI/IYAdJswAamMeYSYqCVRxlbII7vhTkAFJI9YFozs5E
         cWdw==
X-Forwarded-Encrypted: i=1; AJvYcCXFJJoDCO9k2o/DZ9w10kphz6lNMYMUT17oyyeazlTTG88AbPyP7vWk2uj5dEjM5rmD9N3iVHd9vzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTkCBCR9/Lkp1OBS2Qn5lOHfmpvBYhFZy35MCREfIrflpjF6Cx
	qQATMF5/JCWaunH1ejscgKE0EkuDH94ve/GbrXDVFQesqiWjZG990yFgnt2Qsk/PG1c=
X-Gm-Gg: ASbGnctRuH3FCKlBTUyAPzDgAIGnx9tAkIQOHjQMoNgpnJrV8t/6Pfk+bWBA0griFIb
	9UHiS4FGutbaiO1RJGl7xGtKkILDa6+C4IKEp4cWqg5QdeXYddMqhY52u6WCVVWEDuid9ax9GOE
	JxunxMT/yB8+Zb3JqnaAuD71fe+zgIamiXcyp2ZdHl6FjPrbzDdzCgia0LrsH7L2X9jYIebUUWd
	57DhAYsIAwWboV42XK1u2aa9EPijM1Vp+fLOWHVM7rwNGKz6I/iDecvZBAoblx3Vsn6KoLgJTEX
	yOriWZPx4ESWkcQKdA+6mzMMb3dCkZbKEDPW+e/87ZjhYGweOlML8q2LXgwyMPn5cxrsMuEg9no
	igP00o24+K6wUlqTvUtx5lDvm7gc7YtOr
X-Google-Smtp-Source: AGHT+IFunGF+TjIwhPwj7Rlya0zRP0lHBHlNUL1mjavzGDv/ErrwypExO8gGDjyrAhjbat4NdQqScg==
X-Received: by 2002:a17:907:94cf:b0:ad8:9257:5735 with SMTP id a640c23a62f3a-ae0befdd107mr232454866b.3.1750842880971;
        Wed, 25 Jun 2025 02:14:40 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083c95sm1021480166b.91.2025.06.25.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:14:40 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:30 +0200
Subject: [PATCH 2/4] dt-bindings: phy: qcom,snps-eusb2: document the SM7635
 Synopsys eUSB2 PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-phy-v1-2-94d76e0667c1@fairphone.com>
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842877; l=978;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=HKY7AzgHHOMUKSqDSyXSmqFr6rS8cg0ALPFDJvvYf80=;
 b=pP28XPa6bi+AGmir1JGO84WkB42ZjM3elJtM0fuLH4V4x+sBvSLyjs+iDvGCt1Ejj0fMGiu/F
 6MUAWaZpQkqAycz3ZyI0H9Xi+Fgd3En7swav7XUkjWFIENM9Kb6pWsQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Synopsys eUSB2 PHY on the SM7635 Platform by using the
SM8550 as fallback.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 142b3c8839d62d91377061ade3a7c400eb970609..478d6e315a4f19d624af28710eed676bbaa144e7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
+              - qcom,sm7635-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
               - qcom,x1e80100-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy

-- 
2.50.0


