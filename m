Return-Path: <linux-usb+bounces-6041-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B8C84DEE2
	for <lists+linux-usb@lfdr.de>; Thu,  8 Feb 2024 11:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A626D1F2C3E4
	for <lists+linux-usb@lfdr.de>; Thu,  8 Feb 2024 10:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACD774E31;
	Thu,  8 Feb 2024 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LdzTlN1h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1E76A347
	for <linux-usb@vger.kernel.org>; Thu,  8 Feb 2024 10:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389614; cv=none; b=ZJW9Jqhscsn5Moyk7HVqrHhlwfq3ZWbpA38UeAwXS5deaJ/xlZfbXnUJo9sVxHupbBuaaI9eBdUxRNYL2XhnIFHJGELZxnXBRjNnL536qjRnKDLLkgk4ghnHUbejYkpamd3lM0XIqPbJDtSQiKaYPNQ4MTcOy7HPh/Lvq60io4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389614; c=relaxed/simple;
	bh=Yak4cFjMHPZmLSpzj5mNffL7x3y3cDltdS0WVHZOEzk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jm6CXRDZdffGyqWwDClg/Rro8S5ZTmregf9BIR4oUg6PmT3dZXQfdk+ytT6PpKis95ZVMov7o0wTmAaZkB/f5zXGgz37SufXoYM+bDRrt6y6w3Wc8uJ+LDRlbAPxBzoHLw70RQzb68DOGHLzeBZSM7fu7tLDifhegoM+ytbRI4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LdzTlN1h; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-511616b73ddso2860447e87.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Feb 2024 02:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707389610; x=1707994410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jPbaHNpdgRM2voFhkmhteYkFLuMSfGggj9pZ2tYQahA=;
        b=LdzTlN1hUIqHqT5L5/jBEJc1wkIZL5hW0kTD/69px5dENE823nf4WSe6vThq0Fk40d
         AHtsR0TLyUmrs2ISVd+4wUExhz687XALkZZWi+a1y9JmbaeE4hfrU2CvzqYPTlrv+wKo
         i2GsYyTDlOZPc5ZHHC37lWuwoklOfyFKRyH+9qW3hjOaK2Z9mLxT7nI1ZnNpTSF9J2Mb
         +VttzGA8v3aYYNeUAxk8nuNjVWkOwe+Qu2xQywGwEnPGQnxY55C7/wG6/Jq1yIf8rTjR
         lLugGaZ/j+dlV7tEDJVRobhJbcjSKzYXNfDWRezL0txK3xWY6fr+xruJ28FarU5eA9CM
         M92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389610; x=1707994410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPbaHNpdgRM2voFhkmhteYkFLuMSfGggj9pZ2tYQahA=;
        b=uCxumsBgCxo9YnJDNwk0cosszkIzttQCx/z3CDiIwnLGM89BdXV/gJk0cZWmk31EE5
         d2ylQ0xa6dOWZ2/Kpd6w23VOlpCXrTs2oVx1I9cFTH1guGE+jlvzmd7vKia4OT3VDgsB
         ZFSYvX4GhwiOlZ80soGnCJ3WN03N74JgrHBM1Vsa6ZU+Wygq8WsI6QjoPlM7MKoJ9lkS
         UGRLDUtLMb7ldBRnQ7Y6eV3MKI/5MhCS+vB8k0nn3vJWW0r4jrr6HkFT/XcKqnHRB4MH
         7J0tdQIaTeAT3dcHU0Hi+NTuJxFyzRh6ANyZW0SYq2qJGiISoCaZF9yh9eIIbb76R07r
         ynmg==
X-Gm-Message-State: AOJu0Yz4vO0FwBUqwWvS8ybs8CMgIov4kTHcz/jnvEDNFhPJco9GJ16r
	P3vt1S/ZyyJEX7EPjSRUieTllOkQZpbvUR0m1Nda/k5t96EJ1eW2OG2v9bt0/ic=
X-Google-Smtp-Source: AGHT+IE6hoYZwYD0dWVmAGmKkSd9PFPDghU6N/6PiAFFxP0tnFnQHDz4xtisHPCpPSjEHYZbbvqINw==
X-Received: by 2002:ac2:5de5:0:b0:511:5036:8e9f with SMTP id z5-20020ac25de5000000b0051150368e9fmr5870212lfq.12.1707389610461;
        Thu, 08 Feb 2024 02:53:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMWuVQrY8stnoRFivkfykW9gfoU0KgAA0ARDUMH41jJObwrwK24UxqnmtnhIh7HuLi36zZF47bUqwTj5/iDe3BgX1D+neH/suGK98ikRsEayZc3frc75Ba8Fxkvlxze2U+vEhHXd0WNHXHobVIL9WGPZ32vWOGgb74yaRruhPZaMWSy0grEws+eImfbxq9E/IMa3BchtzPwYKvf8l3jQV01BoqDCezhbd+Er+vqIHG24dehg7PE3abjSYP8VaJmFPYTI8/Z5BrQzpNQ3Y82uFMdOsTBTIGbKjvn1FwpEiyVWOg1nCTaNswIbhAmOluIBlJQQWrlV0Dq1ssIxvVDMVrqaumY4iiDn2qfZ66Mg0Z05CkG5TRxnQIV09wt/fnmEX2tsDu+/oLfQj66YG6B53ePfamdT9eQ2ykHOnWBFlsxhRcoL4HblQcp5YM7e28N9NoAwISAhmmb3C/TVIvLfKIkTnEAabzfUsgyU5j3t0MPH3NbpJM4MshCNBQsY9uKkBuLUkZV9wV6n3BL5Itk1ZWJpSJH+sqWohItBFunGc=
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id s10-20020a05600c044a00b004100b3c41absm1212129wmb.30.2024.02.08.02.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:53:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: use capital "OR" for multiple licenses in SPDX
Date: Thu,  8 Feb 2024 11:53:27 +0100
Message-Id: <20240208105327.129159-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/process/license-rules.rst and checkpatch expect the SPDX
identifier syntax for multiple licenses to use capital "OR".  Correct it
to keep consistent format and avoid copy-paste issues.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/visionox,r66451.yaml      | 2 +-
 Documentation/devicetree/bindings/usb/cypress,hx3.yaml          | 2 +-
 include/dt-bindings/power/amlogic,c3-pwrc.h                     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
index 6ba323683921..187840bb76c7 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/display/panel/visionox,r66451.yaml#
diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
index 47add0d85fb8..28096619a882 100644
--- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
diff --git a/include/dt-bindings/power/amlogic,c3-pwrc.h b/include/dt-bindings/power/amlogic,c3-pwrc.h
index 1d98a25b08a4..61759df4b2e7 100644
--- a/include/dt-bindings/power/amlogic,c3-pwrc.h
+++ b/include/dt-bindings/power/amlogic,c3-pwrc.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
 /*
  * Copyright (c) 2023 Amlogic, Inc.
  * Author: hongyu chen1 <hongyu.chen1@amlogic.com>
-- 
2.34.1


