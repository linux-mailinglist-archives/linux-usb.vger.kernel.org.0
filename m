Return-Path: <linux-usb+bounces-30179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC349C3DF78
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 01:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66AF13AD5A9
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 00:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D3E26F2A8;
	Fri,  7 Nov 2025 00:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIl/BCmt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9703B2673AA
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 00:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762474824; cv=none; b=nwgnOTWiuFhgLHKwEp80HjFeLrmBJFDqPMW391aVYWp3giE969GYgBcue+F75n6FFSgoykD3VdVnruDiVWrweVj3SNUxtNEteSUxVquaNX5iAZXeOnsz/IxEYbL2XopZrTiIwLcMMze/ICOqXKI2/39kTbFx9JKW8u134ExMHYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762474824; c=relaxed/simple;
	bh=Oi4/QdrGjIUzL+doDtA2MEODAayPQRT18bHsBVMEGcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NZ59FooHF0YwwFRPO7YmzpQJcQTVTYgGTTxqUp9KA1hZBtRXYmnpN0A4LBZd5q0whyV/138T0eKsRRKB0oBjvAV8E0beGyNhFEmiTgaDr4bE++5Opa07iIVx5CgpeqADHASGNprj6ZFMbOMmcK3xRszjO7cx8zwdTyrPD1PlREU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIl/BCmt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-295ceaf8dacso2000735ad.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 16:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762474821; x=1763079621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjWAOI4Myk8E4LnUAJ8odzQrrjel6+dwFmS5BcOTxxA=;
        b=HIl/BCmteaf6A+kZ+IcsSn9ZV5Fp+003U4X8A/Ql5Vob47ELyyFjB/Ryuk/9HZXYaO
         Fp2BQkrUFtpCVKASM5H6fpN4Dj4WKFk+s1MLHrSSZnWtl4RXPWsIMVjxDF+S+EC2d3Um
         9K+XjQ36lNLP8UFum+aaNs68bUWaj04RLoolkdbi2lWw4FSmAkHK0S1+j5xLUfwSxf9O
         y8cOT4Oblyq/2FGy5Y+YqeGC1PbRmjFUyyJ0I8ye30oWFH8Tv/a4PtfkBRKqxzCNHlVD
         VxRiIUbz9I6StmlNwow/uuvRlgMbk7Idw9DMfBc/tSHtBdKw6QliW1w2Mt7aJHq+0zo+
         lFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762474821; x=1763079621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjWAOI4Myk8E4LnUAJ8odzQrrjel6+dwFmS5BcOTxxA=;
        b=THRxu6qxaNWaBNKNbTqr3mCmklbddbcR8iZijF6FKsc59XjZJVNECxIV5jWBWL2OEX
         8NW0EFfHYuhb/7e/ltZV7eSII1bFzCZnUxHkjpVucYkMY8H+9R6hCcxb7I58slWyQrhO
         ttk3QQZAKmvv0ZGH4iJTQaAvLjyf1szNhWe55Kg5JLIbqtKqfdPDjTSVbniwdZcOsd6l
         7c5dF16kyLT59rWW4/Rhy5pQx9VR+BjKo0tc94Q4FAbySWLnCkjklfJ/xhF11F3fN3Jb
         BbHvbMnIa057qi8ioN93qxkuJ8GTghKPTIMJV7upUi8R8tKfWKR/cz/U6HFmiUudfqjt
         NWsA==
X-Forwarded-Encrypted: i=1; AJvYcCW9DBlTfOBN4ZYR/kAolmHpKcUhaD6yBV3T257DbjUOOH8ksWMO1lV3HQKbYo5h1/3MiaN42fZ1qas=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxB4YZFPLGmogaxiBRtlHbxGJuR40MKpZu+HBUvEzB0byZNKRd
	YYGOfpsJZjfcYKF4t1R1pre3DBr2wcPE3dMqZRbm5LRlCjyIZWDXqgun
X-Gm-Gg: ASbGncvSYOzw5J+enOx3q7aSAtbrNV/Oo5JttRdUPuuS9JWYa5L2js+QkcdBrE7vb1D
	Z6mrmn2HtPvDaoepPDyh1bSxhE6ghDK8S2jkKB/WMJw87hBbE5QI3dJQ3ce/HroEWC9EKQykhIQ
	ohmgMWWaHBSQB01Yib5TUyTOunbIOVWVKPtjOe5fgrKkeubhZ9HSwqF8HnRrXgLYcrqgkRA41aS
	6ntoHXQTl0m+vaomqaIE7MtXRJJM2Pf0zQky7hGxKAA9C8qJJx26RsY0rI4MR676mRdoK+ZGF4R
	NUmJGdtYzESrJ2Xbse3N1Tj/o/3qQN60sGvSDScVLr4GYnzWHvjFNhnR37SVhxCo1A794blNS0A
	LL93SUCxh94MGVAbXhybHxRUm1OB3552/GyngsMY2wtK8VEHufKIR0svOTHqQ2pTNyznbM847ha
	+cMutTWJ6kNTk945lvimYV53CvyicZ
X-Google-Smtp-Source: AGHT+IFVSMamIdPN/iz5MtxlTNX3uy/J+X4jaEmnDwVwubdmf09y4tB0ReLsumcvjpDrlLvYEdU0MQ==
X-Received: by 2002:a17:903:178b:b0:295:7453:b580 with SMTP id d9443c01a7336-297c04a122dmr18208705ad.58.1762474820692;
        Thu, 06 Nov 2025 16:20:20 -0800 (PST)
Received: from localhost.localdomain ([189.6.209.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b8d1sm40357555ad.19.2025.11.06.16.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 16:20:20 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	davidm@egauge.net
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: usb: maxim,max3421: convert to DT schema
Date: Thu,  6 Nov 2025 21:06:22 -0300
Message-ID: <20251107001812.10180-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert legacy maxim,max3421.txt to proper format.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Hi, all

At this v2, I`m reverting my previous idea about documenting new properties
because this is just a conversion from txt file. At v1, a question
was raised about that:

On 10/9/25 22:34, Krzysztof Kozlowski wrote:
> maxim,vbus-en-pin, maxim,gpx-pin, reset pin and supplies. Also add a
> Why new properties? You must explain not only the difference but WHY you
> are doing this.
In this case, I`ve kept the maxim,vbus-en-pin prop because it was already
described in the legacy file and the driver expects that property according
to [1] and [2].

[1] https://github.com/torvalds/linux/blob/a1388fcb52fcad3e0b06e2cdd0ed757a82a5be30/drivers/usb/host/max3421-hcd.c#L1807
[2] https://github.com/torvalds/linux/blob/a1388fcb52fcad3e0b06e2cdd0ed757a82a5be30/drivers/usb/host/max3421-hcd.c#L1845-L1847

Tks and regards to all!

Changelog:
v2: - fix subject/commit msg;
    - remove $ref/desc from spi-max-frequency;
    - add spi-peripheral-props/unevaluatedProperties;
    - remove the "new properties";
    - remove fallback compatible with the 'e' pattern;
    - fix file name, didn`t notice at previous version;
v1: https://lore.kernel.org/all/20251009182046.185520-1-rodrigo.gobbi.7@gmail.com/
---
 .../devicetree/bindings/usb/maxim,max3421.txt | 23 -------
 .../bindings/usb/maxim,max3421.yaml           | 67 +++++++++++++++++++
 2 files changed, 67 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/maxim,max3421.txt
 create mode 100644 Documentation/devicetree/bindings/usb/maxim,max3421.yaml

diff --git a/Documentation/devicetree/bindings/usb/maxim,max3421.txt b/Documentation/devicetree/bindings/usb/maxim,max3421.txt
deleted file mode 100644
index 90495b1aeec2..000000000000
--- a/Documentation/devicetree/bindings/usb/maxim,max3421.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Maxim Integrated SPI-based USB 2.0 host controller MAX3421E
-
-Required properties:
- - compatible: Should be "maxim,max3421"
- - spi-max-frequency: maximum frequency for this device must not exceed 26 MHz.
- - reg: chip select number to which this device is connected.
- - maxim,vbus-en-pin: <GPOUTx ACTIVE_LEVEL>
-   GPOUTx is the number (1-8) of the GPOUT pin of MAX3421E to drive Vbus.
-   ACTIVE_LEVEL is 0 or 1.
- - interrupts: the interrupt line description for the interrupt controller.
-   The driver configures MAX3421E for active low level triggered interrupts,
-   configure your interrupt line accordingly.
-
-Example:
-
-	usb@0 {
-		compatible = "maxim,max3421";
-		reg = <0>;
-		maxim,vbus-en-pin = <3 1>;
-		spi-max-frequency = <26000000>;
-		interrupt-parent = <&PIC>;
-		interrupts = <42>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/maxim,max3421.yaml b/Documentation/devicetree/bindings/usb/maxim,max3421.yaml
new file mode 100644
index 000000000000..4639be7ab059
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/maxim,max3421.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/maxim,max3421.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MAXIM MAX3421e USB Peripheral/Host Controller
+
+maintainers:
+  - David Mosberger <davidm@egauge.net>
+
+description: |
+  The controller provides USB2.0 compliant with Full Speed or Low Speed when in
+  the host mode. At peripheral, it operates at Full Speed. At both cases, it
+  uses a SPI interface.
+  Datasheet at:
+    https://www.analog.com/media/en/technical-documentation/data-sheets/max3421e.pdf
+
+properties:
+  compatible:
+    const: maxim,max3421
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 26000000
+
+  maxim,vbus-en-pin:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      One of eight GPOUT pins to control external VBUS power and the polarity
+      of the active level. It's an array of GPIO number and the active level of it.
+    minItems: 2
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - maxim,vbus-en-pin
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usb@0 {
+          compatible = "maxim,max3421";
+          reg = <0>;
+          maxim,vbus-en-pin = <3 1>;
+          spi-max-frequency = <26000000>;
+          interrupt-parent = <&gpio>;
+          interrupts = <42>;
+        };
+    };
-- 
2.48.1


