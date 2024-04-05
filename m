Return-Path: <linux-usb+bounces-8978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A06B899C4E
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 14:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9C5C1C215C5
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 12:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9DF16C84F;
	Fri,  5 Apr 2024 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClGNyqNo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE4116C458;
	Fri,  5 Apr 2024 12:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712318528; cv=none; b=a9JlqQ9PtORgPbP4Jl+stBg5QQb27K7iDosnYxjfaZDdWrVu1FN/72fartq3aKfVn192MTpGnmS0YgqcYZ+0q4xPFRmCiBRJMhxhGNIMiYnoygzw5kLlwT7h3KOLgr0LpXH062NL0onvV3vYUE68sWw5aTssHkISP0BSuOg3AuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712318528; c=relaxed/simple;
	bh=k2sjphS1sg9PMGtbR6XxgcIH4Z/u9PjlxoA33x5fQfo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TjynMc+j2AZ5yZLF3idF6nTuem10NGy+anDqD4JwC8jfhMFxoHwnha9JrEV3uYL0PMwTXNjPfp9bn3nVK8c4heZLJ0xlywP/7BIZZARCXJZqdGzwq6KFqVv3hZsj0V0B8GpIrh2fhLqQOpiqYn4eFEuD+EpVws03r5X/Uerq0PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClGNyqNo; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ecfea4f01cso209548b3a.0;
        Fri, 05 Apr 2024 05:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712318524; x=1712923324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cLEOjYoCWpWzkvZHPFxFj4iv3Ppjw/xPVgx2HRcrbMk=;
        b=ClGNyqNobAi0xU7XxrBnKNfmg5D95IbZh25gInqvSbqktweM0A/D6Cot9dQUDqAL7t
         W+MYP3mlq/3CFxDStreHRMc7xmm+z8GyvtIIABSyGpk0jiQQxPsnbPLF4p6CtAxYRtB1
         Gu7uYlWjX/Ptp+xlBUHnRrDXBGARj5/74jr5GWmTmnmQ6y2z/7io5TsS9zTTBI7c6SOV
         Z3H6lgYRXizHpOyTqDHGRKZC6oT/V6nM3/ug5s9apwKXCgfyf7DWqYgHJwkJCrg92Pto
         8tzEKQvxB6EJMC5IPdNt0Bfj5hd3LYjw/audFeoN9NvKLlrHMI1PNRGq3SW8Xx+1SFwK
         hqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712318524; x=1712923324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLEOjYoCWpWzkvZHPFxFj4iv3Ppjw/xPVgx2HRcrbMk=;
        b=AiOVImEBWeaQJjdffEmT4HeCC4XPdZqY1m6hXZUwA2TkF/R+4JgpWd9l0eBpc/O5T+
         OYBTuvZLB07Urm7AqChufhHavCEXHLLTAAFKAXT3axUE5ykTTQnD6MPRtLXe/VpHZR80
         RmNiajZ8ix3SdAJIKLFxWC/0Lzm4Llkhp1wtkckOHKLiawB8/MbqH1OBU40QhWH2lhnH
         oENZjqgypKig3jYLjtn4y2gvPXA7ZjBdP4cHvwPKKppAmuZGwcoqTttOXNOPjvcm2Jlk
         VHjO2yIohQN7oINcgDp1Bad2tOAaX69Jg4ptWBDkfrVvJfEBYHfmcMAMfUWFCMyvY2ZB
         l86g==
X-Forwarded-Encrypted: i=1; AJvYcCVOyBCcJV0ML2knDI902sBiU4wcq5NtPtf3E9xLv/4IJvDJy3x8ylXUmCCZGhrmDoZ7q/2NC7z5guLm45fC8SfKO5Tvlge9RmLZCmmJzxGok9y/F7ug6d3Bu3/wzR+/EnJCQVcpmA==
X-Gm-Message-State: AOJu0YxAcWX+NQg/ZliLvSpk3k+AWleqOg1hfkdABfyksE4vx+pjYesc
	Bx+CO391/F0LMxVtgo8g/CMGX1elGG2ONCar8drEymg8i5wDKr+K
X-Google-Smtp-Source: AGHT+IFEmQOnklBH0BfQKBXBVSVTcPVAQ9ZETO25ZlwBqhpQe0SmGNufZCaSg62Ij8KSBQs6BqTA8A==
X-Received: by 2002:a17:90a:be08:b0:2a2:5458:24cd with SMTP id a8-20020a17090abe0800b002a2545824cdmr1067543pjs.3.1712318524074;
        Fri, 05 Apr 2024 05:02:04 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1a99:dd72:cf95:e04])
        by smtp.gmail.com with ESMTPSA id k61-20020a17090a3ec300b0029bcf62e296sm1443888pjc.42.2024.04.05.05.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:02:03 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] dt-bindings: usb: Document the Microchip USB2514 hub
Date: Fri,  5 Apr 2024 09:01:47 -0300
Message-Id: <20240405120147.880933-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Document the Microchip USB2412, USB2417, and USB2514 USB hubs.

The existing usb251xb.yaml describes Microchip USB251x hubs that are
connected under I2C bus. Here, the hub is under the USB bus and use
the on-board-hub interface instead.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Improve commit log to explain why usb251xb.yaml cannot be reused.
- Keep the compatible entries sorted.
- Pass maxItems to clocks.
- Use unevaluatedProperties: false after passing $ref: usb-hcd.yaml#.
- Drop dr_mode = "host".
- Fix example dts indentation.
- Improve the example by adding a USB Ethernet device connected
to the hub. Such example can be found at:
arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
arch/arm/boot/dts/broadcom/bcm283x-rpi-lan7515.dtsi

 .../bindings/usb/microchip,usb2514.yaml       | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,usb2514.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
new file mode 100644
index 000000000000..783c27591e56
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/microchip,usb2514.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip USB2514 Hub Controller
+
+maintainers:
+  - Fabio Estevam <festevam@gmail.com>
+
+allOf:
+  - $ref: usb-hcd.yaml#
+
+properties:
+  compatible:
+    enum:
+      - usb424,2412
+      - usb424,2417
+      - usb424,2514
+
+  reg: true
+
+  reset-gpios:
+    description: GPIO connected to the RESET_N pin.
+
+  vdd-supply:
+    description: 3.3V power supply.
+
+  clocks:
+    description: External 24MHz clock connected to the CLKIN pin.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usb-hub@1 {
+            compatible = "usb424,2514";
+            reg = <1>;
+            clocks = <&clks IMX6QDL_CLK_CKO>;
+            reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&reg_3v3_hub>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ethernet@1 {
+                compatible = "usbb95,772b";
+                reg = <1>;
+            };
+        };
+    };
-- 
2.34.1


