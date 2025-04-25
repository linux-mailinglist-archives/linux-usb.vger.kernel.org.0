Return-Path: <linux-usb+bounces-23442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBC4A9C622
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 12:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 796424C233D
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 10:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9095424A041;
	Fri, 25 Apr 2025 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hvkx03Bj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EB3222576
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577985; cv=none; b=EX8WZiT62vm0baLUHfzRxJpryabkfqdLhqdhk55TqrHDcbnW8mPVcSC9/x6GkCMAUxNW9t6UpaTcjC0/ep09kq4QZnww0itj3sZ6WUcXQqrbmZMWHXF6wtgcx2pg4mxSN/PNb0ulmP1xkqvTLjaWp66VaM2/o2eBaCz2BhPFPrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577985; c=relaxed/simple;
	bh=wg75PCTTfribT+dtDpE+CuchrgWtQI6Hhj4cdsebLPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvF3xcQmwa1Ok+RaZGYFyQ6oEip1YjxzprIyd8Crj1g2lxE+wuCyjVqjnsSG8J8CUu2VEzjVxtj5miDx+cNo/WBNB+Nqf3XrxYJHd7rY0jLtYw1cfDh4AOHufyyId1jmi7JQ/nFBfQ8Sq/eVMIKmFUaU3FkNqwhThgGSL2oOijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hvkx03Bj; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2aeada833so410810966b.0
        for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 03:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577981; x=1746182781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YQvkmgUeO17WhatmtmKq2DT076cJgIIPjxnS7/XI3Q=;
        b=hvkx03Bjcp+GR/1QVW5kChsSmAhyZ6ws6d+wXx9Uq3zStGmQrrd490lGWtJIEnjTqe
         4W7cDcwtOdIjufJe1eMvc5qF+fuWqrT7hbdA8NysDTgqi4kGxHHY3/aa4ZJZcApUpWU5
         zuV5se8o21ozDq1ThON3QpD2isMd2powPFlZ6N0dRnYZk/Cd6ps6naGcjrrkFIdrJWnk
         NoRgg8NpnsxOK0jljxgUELGwRO3RFErjDssEiJXKAj9/P86Z8Qe0bfx1XRBZPhOwQbfJ
         SuIFSlj1WqyyFV2PjGs+flnLaFdQcdZtdQswLHRtkTvovKx6R/ZhBlIHYlmUq6omAL7z
         MR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577981; x=1746182781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YQvkmgUeO17WhatmtmKq2DT076cJgIIPjxnS7/XI3Q=;
        b=wB4Z8lbpBM1vX/7tyPkPbQZq5M3yf78AAhf7UdPQVLCoBaTeTgZ0nHu3snLo111td+
         PuoqpPGwnRr9KS3d/89Ta0pEjWDMZFtTvm/M3ByDU75hpXIVqLtZzDseQwnE2pGMhnHh
         ot5AAHoceEhV8wuUcaDVRG8kgXmG/cqrWaxYOrt5tJ74LXsW6ojHzrqusTBPvd8x6kdx
         Fx8v9GtRrI9MP3F3bHrILEDGiaF6ttf9oay/lnpIRbzsZ0t/YlSkrzE43GVbEatrrmFx
         VwPwX9wVqIEv6aZ8QEQOZIMxgOlukc5fphymp8wmDPshFlSb3wI4YQfTzy1hsgpewlUz
         fVbw==
X-Forwarded-Encrypted: i=1; AJvYcCVJCfwV1UcP2cKzd5FkHuHFf0bcNhgmule+kJnTtCnRssFPywJ+DEPsTKA2wP/+Q8MKG+p7Y6JemsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkK2IWjDf/7LNxE+ntq37Bu0cmpbTVHwllIaFYCZbbSBHiqvNH
	7geceDAkjwtQaCvC8ttzOh0YNjHDOwi7s2q4lKJ23sQYLEsj+DVgFNh+bt++/Hg=
X-Gm-Gg: ASbGncuIYlU2LEQ6GAPMhRCjF3djm2UzRHmnfh8GeTDV5jK2HiA9V72rklv++BhodgN
	zBjrD8pWgc1vqJRK9LlhE/EmWgFZh9vMGuNJyXPeBaniKT4M40iK0yiVfFav3XpmymwZn6tfT0q
	8uAt/56wL8CbYoUII6wvPELGaPCmPWlHYf8eKx6uaEgkFcQyPDXCf/9/IHdr+Tgkb+9cIlqC0rk
	RGe54cxKYlZc4kxBWqAEyaC03acunA8h36FbIoP7gvL+6B96/tCBVoyWNt2QEB+h/V0qXH1PZGk
	U8AY2Sd5zXIdEpUOKq0SrQhl2sYIU/aOSRTwS4T1jy7l8iUKs/l0dmQZ2id6TJByHqQvTS9caEE
	kSzGmaBqcOgpLoCCKIdlywyW6ZSs327u9SNsOtiUOgj/fhi6gNdsSGTgM
X-Google-Smtp-Source: AGHT+IFhT/3lbhxw1N/ErfoHK46Ys1jGbT7IoE15GimhHr4ref5PyGOaNXV88P9mZw1kjxSvsvjkyw==
X-Received: by 2002:a17:907:94d2:b0:ac1:ecb0:ca98 with SMTP id a640c23a62f3a-ace5a48320dmr460145566b.26.1745577981539;
        Fri, 25 Apr 2025 03:46:21 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:51 +0200
Subject: [PATCH 1/6] dt-bindings: usb: dwc3: Document usb-soc-be property
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-1-f90f571636e4@fairphone.com>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

The property usb-soc-be is used by the new SoC USB layer which is used
for USB audio offloading on Qualcomm SoCs.

Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b6538246adf746fe7ccd6df936131c61444..07549dec0f74234465fa9b6ab21871762a2f5127 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -38,6 +38,10 @@ properties:
       - description: USB2/HS PHY
       - description: USB3/SS PHY
 
+  usb-soc-be:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Link to the USB SoC sound backend
+
   phys:
     minItems: 1
     maxItems: 19

-- 
2.49.0


