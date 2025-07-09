Return-Path: <linux-usb+bounces-25615-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ECCAFE3F3
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 11:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34E1C1C4367B
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 09:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808CE286415;
	Wed,  9 Jul 2025 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WkMktpap"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394A7284B27
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052728; cv=none; b=iSuWhYcFrgCQ+69z1+3CZr7AsSQKuoTCULQvQPd4I/SWtbFuusXZnEuYkKiOHHuYfkSuKTgU6KOd4N+HLKtlMJC5xFqjc10jue6dVxteDBY31XYHYPTMkHk13j5eYNxbhLNo2lm1PDa/l3BEqdIwJDhfF3kz/+4ZLC0VmnSWSVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052728; c=relaxed/simple;
	bh=7JJoxQwx+4/wfRhr6BUnD92Rt+QxpRRv67tdCjuoJ3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UV7eiUinF9FOVrCogHww3srAPdp6cgc2Yxgo0GzG2qMQ8yYbzPPaWu0z90cNiUcBiAHOrAbLK+q9IqZQGFr7zIm5HNZuNxDpbgQbM5jSY5HESvG7GTVc4AsP9Mhv1QE4sMRH9hPNXqsv/a+c8OEecHhwWNteYt/Nepv/ZTlFye0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WkMktpap; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so168232166b.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752052723; x=1752657523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtyDxcaqf+W6rW1o4o1i13PWl3ydZ1ok9YquBu8um3Q=;
        b=WkMktpaptbkQiclgmBkddw6afxQXm1IZuxPDIGHC+Mkykq1l8d1si5novmawXmXP1a
         VpDihgpCJyC2Cl1R5subZPqGplDLDE1zxmByQOOpbFZk3H/aRqbRqzDluCYywL2ibOIM
         2Y9KdWPZ7Ts0jqrTda5NzdhMUdq1rTRDoTCqPlRQJjCLgASCA18XbQtlVJVDir3KEdMd
         uTwwcPPTOoCY6yT2E8+8iougRjx4bn/TzA+wqMXSB9gs1UwcMvzWPL0CarFyyLudnhyb
         4f7WMHxQNqwu8toWwbdPx6+O9S6KVu4Prl+X5YpnT+DAtbYVwYLFgh+GSqoiOPKbZxOh
         aAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052723; x=1752657523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtyDxcaqf+W6rW1o4o1i13PWl3ydZ1ok9YquBu8um3Q=;
        b=KbmTF1Y9S7rg6soTa15C7wSk1HdjugLazeg6IvOcpQAryCJ81WfHB8ZlQwnusCbdkN
         OZC02z11ksLce6flbThhPtN9fQ29S8KzXN4QmQwl/nNGX/OVkH8MjL/btDpniFjF6XuD
         Hmr4F3NlMwDzN4w9Dd+XQBbQWzOL6ojc+P1JjDoQSmRTa41juIdMHs+ZAnPCMO5nM7zA
         WXsdD651rrj6znQd5z6f7sE2q9H9eb0iAk0RIYqogsEWf9tICKWwV0rB3NSnPMteyGJK
         BEdSyaju4V8t3BOB7k3uFHuscroUokGZCLZngl9n1E64ABm0zZLBsxULF53GhB4Qacbw
         gFYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUojOiE0b14zzHt5fHP/ONmJ9vznY/Y8g/CwbkD1TbVYHGkwdWZv3ZjsDtPzt1xPizN+Ggthw9wPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmTur6j5pVcrr0j10dM1cMBS3Jo8ERXp0hyBlpFH66ZUpa1kVm
	lpTRlnEqxhMJLxcQw4OeYUrj687Afe6gitTebaLb8zTC0+dRD3C5tn1mhRdcEgX0xzM=
X-Gm-Gg: ASbGnct1W511CZRfmPxP2H8fuSD+jtswuyEvj8mMkNG32cRFaqQrzGRBER8TTryUvrt
	QM07+Z3L5NK2nxL00WBeteRaiQpQ4FVfp5TvfPkBvhNB1oPuUwPWZ3Y5zKb5G455sK7ekBbpm0Y
	qdSkog/knioduDH9lz8ccpgpyoeWK/DjGnGC4/Xf87KHO763Bcnt6L1IaFOt8XlSsl3XTNTEE5O
	vB9yX41v1StZMMSz0j52Zwn4MUVqG3GvY4OH3SNLCOWKDyEKqyl6wCq+12onskN/rTeL18SFs6s
	apw8eheiR0U+7PUvqudMz1beOAWg8Vi+93qQ9e2Bk7159AbmKe0CWTQ/sL+yABMgUos/1ztOwhj
	nQ5Ssu5VKGkn4ozk8PHFLTelCAh3cCVSe
X-Google-Smtp-Source: AGHT+IFjTub1n0rD6n3C//VfI0DUfJzgzG0dPyTmQDEg3WymTFqbXYGq9le/+InO8pAn1caBoGUS2g==
X-Received: by 2002:a17:907:6029:b0:ae0:a7a1:593c with SMTP id a640c23a62f3a-ae6b2721112mr451588566b.25.1752052723357;
        Wed, 09 Jul 2025 02:18:43 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e737sm1060116866b.142.2025.07.09.02.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:18:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 11:18:16 +0200
Subject: [PATCH v2 2/4] dt-bindings: phy: qcom,snps-eusb2: document the
 Milos Synopsys eUSB2 PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-phy-v2-2-4790eeee7ae0@fairphone.com>
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
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752052719; l=906;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=7JJoxQwx+4/wfRhr6BUnD92Rt+QxpRRv67tdCjuoJ3o=;
 b=oqiJgUa+pEZRn08K3xP+dwnnlVdD43KZEv90EWs1Nrv4/EhFmjFjk3Ol3Z2ZY5J0FzMl9SErh
 Br1G8yHy40UB4v66KWr2gkRj2YnN84GLBloqxJIe/DNzop3jd8tCHDK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Synopsys eUSB2 PHY on the Milos SoC by using the SM8550 as
fallback.

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
2.50.0


