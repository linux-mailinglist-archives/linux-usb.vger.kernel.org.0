Return-Path: <linux-usb+bounces-28969-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 277AFBC1FEF
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 17:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A129534FC6C
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 15:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DA72E62D0;
	Tue,  7 Oct 2025 15:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CWm2hSDM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34782D94A0
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759852510; cv=none; b=SrSYGY4PJN1lPnhxF2xdoWXYLeUXH/T2kiAm6zwrqFu7wa+Um1IqCb8KeMQj60gr/fpE+PsjGDRLviBzCmwvib21xG3yYbrBdmkAeQtdatSpJpPUZWO58d2aIRJ2pA2samSaJm0OyBM7dMSpsMJrc7Lr2r/PhSzk+l7XxU9FcxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759852510; c=relaxed/simple;
	bh=SrQ0izSJThSrT/IpzfFEkCObODKK/0BzDV6aFd4HJRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nN76wOa3LDVXB8XHn9F8GdSysgboymu1ysgyl6iWHW4ElfEMar1yN1AmbgSqo36gt68L+GMn/MCUviTE6nsASTBfKJNY8bbUQxu4gH3+zj9XZbl0wMGICcF1TmBFou+MWhQW5XgpigMIVDWsFvaCZUobWbiZRq1N1lvJVS4yDVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CWm2hSDM; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b4539dddd99so963098866b.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 08:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759852507; x=1760457307; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwn4iJ0kBXeAlbYIX5lfnaPGY5x3TCgAKgWBsfGbbTA=;
        b=CWm2hSDM3JRTPGemHdI8shDXDd03ugwh1jEHL2MqtQEWXEQzV5KuGBvyEazeT9DFul
         OxwK/FgIryZajV16jRWeQrn7/InnYkrb1qsEqeYZUwnMnXijm4caVnitDE0gQHhVMv7f
         d8njaVOelVhtxlhjTKsjk+9zI+CLDjZRxuuS8oeEnwY2+BQVE8F3Oy8Z2Kw/xxkyzRG0
         Tcz61JumUMFVM+14yoL8Scg6aLM7aqIZPyPl3cbD+44wlga3eaTVST1uU/FFNIGAWCQ1
         hCnaM3sD0vEZMVeIb0Kuvhk94rYS9knOnvbFXm5oTaOKZZfxEe6xqERWhm13IwEm55BF
         sxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852507; x=1760457307;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwn4iJ0kBXeAlbYIX5lfnaPGY5x3TCgAKgWBsfGbbTA=;
        b=UETT9KZFgb+NJ8h9B0Qw4iAINepbJT0nKz8Xjz45gcFogw0hUNgHnTa9vNAuVcnwp8
         q6NvNouiXZmCIedBur1ypSiRhRJyA6wvG+DZmJCdOc0FeMZDDTKd/HrnNbYdU6yObcPI
         mRWO5h31Iknt1JWG0yAAn5EO1p6Mqrrb3eB6GiGTcFjydsZppmN20BzCPZxC8Qg8bNKK
         uh5oMR/PScp6+/hVMjQ4Tz3Fd5GDNo4qLCuXeIt2wHJx6KjHELxKe5eCGkj0sBS8g6ik
         G2bTE3yBCiHJyxsgnHLgvZYedrg6vg9aVQ17kHW6c+IxRFWJTD5gUAB0gjFpgLozfF1/
         3nyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQIhKsdbhpoAiylMjrJuYc9tyRAmEhSRit6iU5TTh94n4lx3yHxAQZfL6WVnaIF+KKpA/UJhH9SuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9BdamOJxxDAFUIB7Jv8sBCIQrHb6Yg8nhvqWbiHuRoI0JmHmc
	2ETfO6pVaIlHL0ZS/dSpuaPgAD8VqxoJiHnqOXKSdNfc7igHB+TLQYOJEPGTMxSLccs=
X-Gm-Gg: ASbGnctr2ihB5YsqicXGXmr6RD9jekgA5LGVhi0ERQciLHVwuhy4MBNgQk/ke0Motz9
	41wVC3XcIkcy6kUgvtiQyk4lGR6ZOYd1/pHCLEg/ZGKXDh1B3/t5gkdZ1BXZPFs7gGa5SAfroh7
	xZ9eFht1plmscUnfrYNljxejOF1zvzTSEw7DUO9wCGOeBOeHjxapmm1D0L9Eu8u5URbbaNk1qel
	+lf1JRpE7h1y4fGKeTons9cyBWuG7Qssa0jdnKKf59Agi+N/yVCv84GqrmJHgGl7CC7/ZmdcHUY
	zVDZ4u6d19yJkVI7dINvh09H8ZzSr/xkycOQ0cTo0DGlhU7PgQpPy0xs1KfrIjWryI5kuhDamSJ
	XV39WtxyMRQ3acAwfpHBkx98YtqqjQdTwZzh0sVoroXnG1le5lN7Hkt4CLCJ8YCbfoY7jsM3c/X
	FEXTmr8/nJzPS1WCZl5/QGw3VRqCqzyRg2pmL3bB946fML8kkKODc=
X-Google-Smtp-Source: AGHT+IFMkqhgkZjYTFJJlsb6ohBZEtxooSZT5I4ro08N0+thklTNSC1wFRUbLDiJOSsfJFdfZDi8ng==
X-Received: by 2002:a17:906:7312:b0:b48:44bc:44e7 with SMTP id a640c23a62f3a-b50abfd68b2mr14143566b.48.1759852506937;
        Tue, 07 Oct 2025 08:55:06 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4f7eacdfe6sm225312766b.27.2025.10.07.08.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 08:55:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 07 Oct 2025 16:55:04 +0100
Subject: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: add power-domains
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-v1-1-b63bacad2b42@linaro.org>
X-B4-Tracking: v=1; b=H4sIANg35WgC/x2NywqDMBAAf0X23IVoDSn9ldJDHtt0D24kW6tF/
 PcGj8PAzA5KlUnh3u1Q6cvKRRr0lw7i20sm5NQYBjPY3hiHc1mpYiqTZ1FMHwwsiSUrLhpQ/aS
 LZKTtJ6XpNV7RmjGYaJ13twCtO1d68XY+H8/j+APzX4i2gwAAAA==
X-Change-ID: 20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-504b0c57a78b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The DWC3 can be part of a power domain, so we need to allow the
relevant property 'power-domains'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 6d39e50669447917a2cd94dacee5822467eeb36e..3098845a90f342dc29f4343fc0ff5cec009d9629 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -36,6 +36,9 @@ properties:
     minItems: 1
     maxItems: 4
 
+  power-domains:
+    maxItems: 1
+
   ranges: true
 
   '#size-cells':

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-504b0c57a78b

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


