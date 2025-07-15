Return-Path: <linux-usb+bounces-25824-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01EB05367
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 09:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 708E87B92AC
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 07:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A702D0C72;
	Tue, 15 Jul 2025 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GJA/WXOl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0B5275875
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 07:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564594; cv=none; b=r/LIGa5HQ1zPu3w+yVfVEVHQdvPSUpTOfkQUi2Ye2N8MXcDvq/8AHEv2uKPlm9en6HvtBTVPLcqvpZHHsgSLLjxyrAz/n2PH1TrBjimsD4u542AsiHhQh8Lr5E2dx4oLc0xrvUofuiqdC2LGp83EGl/Kk9bIRvQNaKkrYcb9MiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564594; c=relaxed/simple;
	bh=jzFcFIoWblJGC7al1pj4N6nIT0ZnqO6zL1kXGKeDmAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lOaBZw7RU/l+Q3pGjb34+2UVkW2QaBZO4sMYsV/xRoLqETHhpFYKlFK1zR1oXWEcYks6zSyatM+l32XmpRNKAM/pMwUQwG+ZeUaukBMaV8OQe2JMCjTC0Awd1NyaWYFQjEpN5A0efcLqi9M3BMFC4pf/E5uw4ftfOZeqUyBvFMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GJA/WXOl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4561ca74829so15742295e9.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 00:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752564590; x=1753169390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlXDOuB2NWs3tsHwTAfl9oYldXG75qTwJcRqgkwKc94=;
        b=GJA/WXOlp0ku9HyC6zUD/SGvwWAtiAPl9srLq41hmf1ZTaNkQVFX/80unoubU/AOOX
         E6Wulew3XvRYH/QBPK6aGW0/EqOrwvGOzHThtQA56kSx7crji6e/6tIhD7Vt0zMHQUNY
         wNj1aOlPM/3uBfwsaI72W+vxpzGc5mdplAYBHb3Z+WT4QElyUyu7scgG6SYavltK/HgK
         hO7KG912JOPM88NsIJeZwVY4SaFvhZd/94Rf2USSDrwbeMYfpj6S46zErZUJJj43LVkt
         8Ulq1J81c7h/xd+H+nywSGupWgOXqxJ/YaBvVTMIw9w/pDwTIva5iY8vNHNQST0j/OiA
         OnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564590; x=1753169390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlXDOuB2NWs3tsHwTAfl9oYldXG75qTwJcRqgkwKc94=;
        b=lIajKXKBXLTrTMiR4kzo6u5GpWuDilDK/R27e7jwy6OMkXEoAol0ykBeBmvJzHz8cK
         6LQPQ6W39MC/v+8oMb2NuvtumM4r1NLDy2NhBd0h+2//lg3SM/I/EBBqoYq2Fj7ZLRlK
         tASEGNgY4l4lNO9dBiyKw/bUGtbtEJIcxkq+zQzWkk8WCU+dT7lPzpnyDRaqMPMMZ7CL
         K1txl7GOwxqJyuKr21oRNgT+Z+YcAjZzfGCFchU6xfwNNw7rRxHIOSYpCV+k2+/fnOgc
         6+Op2056WDt/nGx2jpEYykEaTGDdvTGZ2elziWXRRVbU/9cv+3bNmD1PCQLEL66fmDJ9
         WN6w==
X-Forwarded-Encrypted: i=1; AJvYcCWDM6ZSi9i4CnQn82g5SySNGZySdDaNRyUt5DRuEe20fATEhIkZoNreIz7FwEdnRps/7bYYre6y5VA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFZFkpNBsmVoPx37yMIoyQ3jVS2XG/JMn73t9XeT9f6xn68+BQ
	y97OJZ6lxNQbuxocv0C72cO1lFvBVdJTzVUqBBVXTmGpY3BUFXWUnOp/gsTBqHmSYso=
X-Gm-Gg: ASbGncuO2Bf2TYZXCukdSErneKLwqzN+5n8shGN+54+BlN2ZfweLLG5T/fU1z+GLG3q
	pHFkvQTbzyNysSYQN4BXGZxnYMUqXjwMP8aq32nzv8sFgmb1SrJtJLawaiwazhAtbNwmiX1tIrg
	6q23NQgj1rUJvftkJ9TUV9NkGLlWeyUhdVgdMV+5HlocljsXm3aGhJFFxmph5U0VEqVF348V4hW
	TO0120iHR2ZVulh2Jda4i6BzL/1vBtWXN84hRPoWiNbUqstduQDBp9YeCvkUN4GIKncd9T1IJt4
	C+0lfkv5taNcRyg8OyjlIRLS+wEOBUdTpND5OODzVTqLEqjyvOgTkQN2f1l6cq9Mpcy2I27beud
	vjxNYo/GxGaLkoSaiuGPjsePkqyYDe8pEmBYijpZpApolTx0fDc3qm069
X-Google-Smtp-Source: AGHT+IFNBRgqSjk2HFJaRqvUEeFclqwrA9aBptgjfGQRiH2n8mqaepG8GqzAyox93VmumoOhYOZ6TQ==
X-Received: by 2002:a05:600c:a4c:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-454e3399cd8mr155077575e9.0.1752564590536;
        Tue, 15 Jul 2025 00:29:50 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455f8fc5a01sm106703395e9.32.2025.07.15.00.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:29:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:29:35 +0200
Subject: [PATCH v3 2/4] dt-bindings: phy: qcom,snps-eusb2: document the
 Milos Synopsys eUSB2 PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-eusb-phy-v3-2-6c3224085eb6@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752564584; l=970;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=jzFcFIoWblJGC7al1pj4N6nIT0ZnqO6zL1kXGKeDmAg=;
 b=9yt+l6cGjdO9axu+nOBS510EXP8FcGFhy41mnRfZ/ANKPK8zyygFXbG0EduAhrC0C0EZZUyzl
 6ZVPM7LcNG1Csu0bgS6EDkRl0LvHYvoIMB/YI+mqmcaU8GyRyWltYmx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Synopsys eUSB2 PHY on the Milos SoC by using the SM8550 as
fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 142b3c8839d62d91377061ade3a7c400eb970609..854f70af0a6c1ff93615fa8dc1031b4c1ecc2e71 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,milos-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy

-- 
2.50.1


