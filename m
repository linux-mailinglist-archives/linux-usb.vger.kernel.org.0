Return-Path: <linux-usb+bounces-23593-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B3BAA5B32
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 08:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCEDA1BC5A35
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 06:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E581262FEA;
	Thu,  1 May 2025 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CMW2KJMM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759F1230BED
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 06:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082158; cv=none; b=QYBmUaerNOIuKdOz/RMiDRYS6a03mFDaJ/gF1krgVyWu1hGG44DQzJMVEy4JBl2WuqFewlTtOIplmwMCPTyAZ4+6Fo7XZiEQvsiXT7hYu1gDQeGYCHI2bCgZ021s1FUwH7VBUBe/lVA7vkdeQQRVcJ7e5hT4EFgpCPM026YvwRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082158; c=relaxed/simple;
	bh=yM8BRFHXQ57lwyVkMBlhdAM+Q5zCu+0Nhquu24Prusg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5s1myvQuXxLA9YtF6LmONjh1RkIWsD4ZfccShRcvnKq1AmQZdYS1msAo5u98OmO5L81MDS9qgor/GJmjaaFyHHDfx96suXmuqSpWlbqBX/yS4CBH8NRAFiCXFXo9OwvzH+Q2pysag1LiHWBClrty+XrptQnjsjZJ9Ajb7LWTHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CMW2KJMM; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acb415dd8faso91803266b.2
        for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 23:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082155; x=1746686955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=CMW2KJMMrweV8lOLH01MdcylBZl567fZVfFgVZiZPgLCXdd3SX5U6KWazDHw4sTq5c
         H9QxLnBiw1qYhvlPJ1iZA1jOn3/U/dBn4vH9Q3OhFru/tT16ps8ZLFyinHvqdsH9TyXD
         0PZVxBp34LO3SDL3BPduAqNd3cDwZ827gdtU1eS8JdQV1vStBfqIsGX3W1hI88kmWSXF
         TPyKVD5DDmMuQ5YH2787LDmiZDmbPDSYEyyqkav5D80D1v+W8X5g8cNMqf6VJpVlhacO
         WEWrHbvuvK8IPfrEpHqK6OFcsH4Q4MOmm+qC/D6ND/jJRkLkVIWQCzE8aVNLTWfTQ5DR
         yGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082155; x=1746686955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=L7I22WUg2i6M0upJjG3c33ilIwEgoXeSED2QN2hFiEylYKY2UAZCQDMrSRt8CgUpj+
         4oUaUt+D6UaENBl6rCX7bbK/PM7+ycN/23Qxp7+CeNQmQ8WJ//rDNed6Fu1Vg1htlOrk
         OzcnVMXqO4C4FDMQsrHgvufbPlk1r41bncA7himp919xx0aWucjLh1FkB7iH6f/dtZtm
         zOl9T2CIgOn4RcCP/DHKML93jCe6tMJXTI+tdlW6sr3JetCyekfdrgC9U9/UC2bT+ngf
         THCHiF69vpWZhIli8PhK1igjH49By5ALhsO/Fuesy/bhW7peCoMbl3KIfu1J2aZW8s7Q
         vJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEalLwHeXWTUPfBhcdOm8YhyPQcpu+pk/vW1BDm2NikevA6vaiPfdwoEuWLCZuUSRcF9zoY032LWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRmCojmqA9j/BuSLlk5AajeOelDBFFMn8ggUJTjRENYSCNlJtF
	7hFo7gVH95BAi6BGMsFKkYz9uSEF8mFDqEVyLMNEZSyPAyGq6+59l8ELSNOAMfM=
X-Gm-Gg: ASbGnctLr+t1eAISlG7Pxr6RmrW+lJ5ROMisAElwf/j9k8f9++jsdhY01EyXyjwQZsZ
	8hIgn782njgKnoWw4eNM5wgHoe84NUDEcxWgobZwo+KDQ4/+tmyT7MTfnG8bRuYwftBBHdsKqCO
	OxHSfOVdodq+EWriVtUuTmp8+EazL9x2ryJKtgHMyzfnfd/Z0akBOf6Se0yAZFvsVOcyFJCmXWX
	sLKD3+WvnGDtahhLCgQcdgbbNbP7QAHG9iGr4qzn8qd2jAqK0M0N9hksU3b086VHi0O8V0A/aa7
	3OqL29s5JLcC3bf3gjqvShNGZr5g5nN4h3o9emc3xlPfbS743sJvs2ecrnTGmBuUkNc8XoNCStW
	KU5g=
X-Google-Smtp-Source: AGHT+IEzySfUrfmZ2ok73P0GUsMuvaw7yUrPtZVotDDbR6BQlXgasH9wezf9EguddjotsVyoCoHkOQ==
X-Received: by 2002:a17:907:96a0:b0:ac7:eece:17d6 with SMTP id a640c23a62f3a-acefbb1747amr137034566b.17.1746082154701;
        Wed, 30 Apr 2025 23:49:14 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 01 May 2025 08:48:47 +0200
Subject: [PATCH v2 1/5] ASoC: dt-bindings: qcom,q6afe: Document q6usb
 subnode
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-fp4-usb-audio-offload-v2-1-30f4596281cd@fairphone.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
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

Document the subnode for Q6USB, used for USB audio offloading.

Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,q6afe.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
index 297aa362aa54ab41a956b3ceda73d4c7027d72a7..268f7073d7972da2ef46d36264c0f7d8f648071b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
@@ -29,6 +29,12 @@ properties:
     unevaluatedProperties: false
     description: Qualcomm DSP audio ports
 
+  usbd:
+    type: object
+    $ref: /schemas/sound/qcom,q6usb.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP USB audio ports
+
 required:
   - compatible
   - dais
@@ -64,5 +70,12 @@ examples:
                     qcom,sd-lines = <0 1 2 3>;
                 };
             };
+
+            usbd {
+                compatible = "qcom,q6usb";
+                #sound-dai-cells = <1>;
+                iommus = <&apps_smmu 0x180f 0x0>;
+                qcom,usb-audio-intr-idx = /bits/ 16 <2>;
+            };
         };
     };

-- 
2.49.0


