Return-Path: <linux-usb+bounces-31127-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F66C9EF8F
	for <lists+linux-usb@lfdr.de>; Wed, 03 Dec 2025 13:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 972F1342513
	for <lists+linux-usb@lfdr.de>; Wed,  3 Dec 2025 12:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA132E6CC7;
	Wed,  3 Dec 2025 12:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="ToU+Q5gM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C544B2989B4
	for <linux-usb@vger.kernel.org>; Wed,  3 Dec 2025 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764764609; cv=none; b=Bc4QfGN4Z7Ub10UA94SXMu+KLor71tobggDHm+/fnTyWpxXWPKBdMeluBQ6ajH3BzHERYIVDcEICoE/UOCHr6QurE/Yh+rCuco3+8WMypg1rWRaRBx/KVkdDQ7R3VMwm+sVe9Q70GhNiawR8cPWv5jsTkFKdzpf8/OfaybLR96g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764764609; c=relaxed/simple;
	bh=hGmcm9QAZ9qqYKdmz2DQfIFan3a5wOxRVnlr9Q0TxhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/JqkcHPAACS0Nu3jWWguiDsv4SF3vXCK0MbY011Mmrxn/dFo6foEUru+mDG8edlp22/diUxwu/TsruxsneXSMbUHmRYr2rzAFGhBdcakHtiD97bMkImbI65ROiaRzsxvpJjv8jSIjCwVEn5pKjtQx2qBmsGkzZxBy8JnOLhPbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=ToU+Q5gM; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ee1fca7a16so54275291cf.3
        for <linux-usb@vger.kernel.org>; Wed, 03 Dec 2025 04:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1764764607; x=1765369407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQw2QNK0m7aXsFhROk4LDansnAN+1Su3gSOuHq49ol0=;
        b=ToU+Q5gM60eA6jBWYcbEwtlwBaYr0VyzYtcshynS3eyd2i39Z6PTh9cnnJZrPpJbd8
         nQNLO+/7Gv+U2Yni9xS8JDWIBIlRsLBOaGyeXETM0omBweC6qTRfjB916csq7Ab5nVpQ
         FDCx7/194GMJSFFf/wX6+ZtN0M22I2AclVu/f/ckzM4nCKnc2MsZdoFFTPqvsiKd070j
         DmT2r9Iq7dWPaQYnUW4Feo9rntnmDzqeTeJm+azS+10ZmbItOmJiLtDd1dS5lrTTV6Ou
         HHT1AY0ku5QdnH2Z5MlTZ1qxofNJLEimcJ2F1E9ql/vTakk+toTAc/kS93XiodvP7vKf
         JKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764764607; x=1765369407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQw2QNK0m7aXsFhROk4LDansnAN+1Su3gSOuHq49ol0=;
        b=oydIy0yROexONsV71R/e5wrN5jVXKrtO6NjvPxsAIsJ1FNtl5Zb0Uv7UtqbiC+bcQz
         j0Dd+/EVsq96ZNbWCMxOp5gTVgb7IPUVlATJ9T5/6ZtRQN314eDYcm0jbvAaqF2EZToE
         /JoNvYMGSwUusF9uzGFcVYx1jmgvtFaNn3YSIhMbfzK16IjOdYb1Hw7LfCX29qv2AoE9
         tfX+4tWBPV1X4T00ykUCtXWOdXLFbVSMwtpJBDksTmI0hRZDKJDaXllOAGlAaMN9Lpe7
         LTBLF6QiOfWgGzOizuO0WbLbEZ1/fYnk3TCEmtPp23jATDD28e6reAkGRw3lqifVESgt
         iMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKX1oGT/hpWXec/SpaOzQ7Kjl3KJbyrNbAozTgxng7GkvRGtIBvFNMrgzgXOluDtmS3eAfypJ4C2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUfcf87GkRln3lcSDmkeT2+YtHmyC++fSehWCCMZy1VDNU+TNU
	JifkqNXvKoJtAhRZbDNuaNmn1ZnC06AonxLPUYX0enShr652bvJcQTFck/WYvhKfoXI=
X-Gm-Gg: ASbGncvS1vDOf7wBPb2Vbm7MlUppSlOq6a7+SkqNQvQ9C/xX1V/L5O8x+JyPkhzN+Cy
	Sk+Ldf2fsGzopPhwbx+o9v1fqHrFwVFaryjIs99BpsfxgQbUVPpKOKq+MLejKM4YB8C1Gklu8nu
	spCFS+CxxFpRLYiq6Fr/s/lGpvdrc/T0CXWtf2yoLHCsQAMShJAmIsZnyq2CON1kUkeD3jP0t8h
	XuAsL8C3CpCJJRGm89cghXG0Lldj4ChBGiiXlxgrgfc/33ch92Pl6rRaa9rIsdboJ28ABev0uIJ
	USb2TrHucmlElZJutB90XDlaodAoJrVIUzhc64Rds9lkDnS5lI7AmA22tGmqoMTicfJHz8gzvpF
	5it6AqlGbYk+y6VLxlN+rEDm0DQ2yrMHg749HOeUHj6F7jlP1ZNDLISxIeBLapGRasPgHQzEavm
	w6EJROwm2/ZMIuZAUVsPLTMT51fk1X7X05yN8xbPr2yyOl
X-Google-Smtp-Source: AGHT+IFBqItcO02HwRqZQ09Eftjhy8B/A1LUHr5yIyZjuhioLZT8jA3EARqXdnEATjeL7hbCsn7I/g==
X-Received: by 2002:a05:622a:d05:b0:4ed:423d:48ef with SMTP id d75a77b69052e-4f01f697666mr4823071cf.40.1764764606528;
        Wed, 03 Dec 2025 04:23:26 -0800 (PST)
Received: from fedora (cpezg-94-253-146-247-cbl.xnet.hr. [94.253.146.247])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-4efd2f9a755sm115214351cf.3.2025.12.03.04.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:23:25 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/4] dt-bindings: usb: Add Microchip LAN969x support
Date: Wed,  3 Dec 2025 13:21:29 +0100
Message-ID: <20251203122313.1287950-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microchip LAN969x has DWC3 compatible controller, though limited to 2.0(HS)
speed, so document it.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/usb/microchip,lan9691-dwc3.yaml  | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
new file mode 100644
index 000000000000..7ffcbbd1e0f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/microchip,lan9691-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x SuperSpeed DWC3 USB SoC controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - microchip,lan9691-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - microchip,lan9691-dwc3
+      - const: snps,dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Gated USB DRD clock
+      - description: Controller reference clock
+
+  clock-names:
+    items:
+      - const: bus_early
+      - const: ref
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: snps,dwc3.yaml#
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/microchip,lan969x.h>
+
+    usb@300000 {
+      compatible = "microchip,lan9691-dwc3", "snps,dwc3";
+      reg = <0x300000 0x80000>;
+      interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clks GCK_GATE_USB_DRD>,
+               <&clks GCK_ID_USB_REFCLK>;
+      clock-names = "bus_early", "ref";
+    };
-- 
2.52.0


