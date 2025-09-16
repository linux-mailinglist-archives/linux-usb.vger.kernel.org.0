Return-Path: <linux-usb+bounces-28161-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E365B59B7E
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 17:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E50CD1C05977
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 15:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722E634F492;
	Tue, 16 Sep 2025 15:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWK8ZVFQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A69534A32F
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034987; cv=none; b=qiX7veg/CYx9P68H7wa418HncCapHIq91jHqO71s3coaWVfPkwMf/UgM//2SQuIEC1hI4cLgfMi6cTgJQZKrLuVNrrFnr44yh4uxR7vLZmVtGT3gTEqdbS5I96phBWNj1k1Q0s1c5d7ZvKRJJM9n9eyuDMLQkJulKQ9552Ib0vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034987; c=relaxed/simple;
	bh=lYB0TYN8kpkCpqAGnSDRyFdheF0+LmevMv6a1v7O3cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mlpncTBmRhtMd6HwuUfYo2IMIz8X7dIsuGovyexxZGCmioFWkXPP5D+9CP2jSGgDIpitLDLyrFZSZQdn+X/Gm8fSsakIA+gk46kAXldFFwR2WdH6X4r7BdK8tzxKWTcb2kgaLW9SLQGLGZtJ1NdCZDroJWpdD5GF7Gs9PeA0zGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWK8ZVFQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3e7636aa65fso5049280f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 08:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034982; x=1758639782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsSrpDlSfySoJlfJZ9NvzOLQUx+V+xTXpRXIVKiJyrU=;
        b=SWK8ZVFQw0GdemNc+LbFmqVo1dnon3oVsXodiMWNYzM26tgGQvXYv4W9aKp/3a3bs/
         Hq5VT8Ddt7PvzQRrjVMfbjaxkrv9hqAmUg/3jJ/G/MJv0NaAClleDhsGqrc7/5xpHPgS
         JbVsbuz0M9iPtYmIQTyr2cBcMm12iVRjZS3v9SjGEVxbBnAUZjXT3eMrvmWbnNpx2MHS
         lNR1DkVUXfjgtQDpBgqyuwd1CBnY18k4UhwyviGoDUyVW+lZaTYG8/9/5cQlmCxs+TkF
         AO3wZCbqxf+rQSJipT4ZD4AWc2vqfyuE8fMJvZwZiPKkCGmtlYqDBnMV8q0izUpuurMm
         D3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034982; x=1758639782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsSrpDlSfySoJlfJZ9NvzOLQUx+V+xTXpRXIVKiJyrU=;
        b=RvbSM0AQM47fr/IqtX27SwiyZoYEgTBgIxrKOT/zYhgdFxJx9zuX5P2nM444+dHwsc
         u3SiRjpukxUHdG74iaXk9WEUaDkXzGrsgaWNEqqhUaued0oCHJ59bSNdgh9BAjHSJSpP
         ZHaS1AZhZxw+fILysm2nO5M5k9y0eBSjCiyjKu91tTeUWT2gPn4q+gr9lGZmFd7jUcHX
         l/jyg3RdvIyJzdAgxSgmxlBvLiNrfqmfaT3JDCF/1Ge8Dby2G8HYiihus/4bssS7gDLd
         Z3FGSyGeXzxwkHYXG6F9niX8YowMHCzBZ9/KzXowfUQakf5YjHx4YxjEmhEKWHPeVtH2
         /nXg==
X-Forwarded-Encrypted: i=1; AJvYcCU24UEZZoXjGxMTuvmwyyX8/H0idazKEQ1I0Tsu3z15YZACO2jVwwE+x/cIxFu5OLLLEW1U34k1zmY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6vm5v8O/306FGrobmGFDvmLHy/eXN+Yy5WvgbJD4X+otoEIS/
	tgLBraep+mCcrCi3mZVuVHIDUh/mQF/xBB7T5fwtOFct7JaxhCxDLeGO
X-Gm-Gg: ASbGnctKoKvR+nMTcgBS6DZUYoiaTe2MLXY8g9mnw4YL0FhOmFrC4FlWd1RUZdZ0rCp
	dlizUM7Zv/eQS1aqcEs9+Rm4sbyg1CaAJj2/FjhdEzdEkPlwuJXBaMtSgdWjCxZWysvOQY6KY/E
	wO9MMDral4eMWu3dH3tPLzB0ipUWPwfhovHQBgtc4A2VjC9LpL4M0FXBgVpXkzhHOc5UpEUqIck
	wo+DJ5BfHMBqzaSnHkqI44ANsQfxPwTzPefYGmyIF9L6T68ha5kqEDU5B1eUU+bsLIKbDRYYsu5
	+L43RkaV6usH93GOaDs7eytvzUvtogl3xg3hM1FDXijxLoLdlIpQyE3T5npp9adLSsIvL0oKiph
	/Yc6IYi5fDNVQMOrnlQvVyhhcWIhGmJYM58pW6XKragL0AjjaWItzW9gTZhpiMTzOKLYvPd+bBt
	4xvg==
X-Google-Smtp-Source: AGHT+IH8CC3m0QujEfTkXRyK1fMwzLjT9oL79ncRq4gQROOR1pxLz0P+hxFh+EeulUv7ALgxD1UB8Q==
X-Received: by 2002:a05:6000:2409:b0:3cb:a937:a35f with SMTP id ffacd0b85a97d-3e7659c78a6mr16726226f8f.23.1758034980802;
        Tue, 16 Sep 2025 08:03:00 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc2deb20sm932154f8f.47.2025.09.16.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:03:00 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 3/9] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Date: Tue, 16 Sep 2025 16:02:39 +0100
Message-ID: <20250916150255.4231-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the Renesas RZ/G3E USB3.2 Gen2 Host Controller (a.k.a USB3HOST).
The USB3HOST is compliant with the Universal Serial Bus 3.2 Specification
Revision 1.0.
 - Supports 1 downstream USB receptacles
     - Number of SSP Gen2 or SS ports: 1
     - Number of HS or FS or LS ports: 1
 - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
   High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps).
 - Supports all transfer-types: Control, Bulk, Interrupt, Isochronous, and
   these split-transactions.
 - Supports Power Control and Over Current Detection.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added Rb tag from Rob.
v1->v2:
 * Added ref to usb-xhci.yaml
 * Dropped Rb tag
---
 .../bindings/usb/renesas,rzg3e-xhci.yaml      | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml

diff --git a/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
new file mode 100644
index 000000000000..98260f9fb442
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,rzg3e-xhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3E USB 3.2 Gen2 Host controller
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+properties:
+  compatible:
+    const: renesas,r9a09g047-xhci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Logical OR of all interrupt signals.
+      - description: System management interrupt
+      - description: Host system error interrupt
+      - description: Power management event interrupt
+      - description: xHC interrupt
+
+  interrupt-names:
+    items:
+      - const: all
+      - const: smi
+      - const: hse
+      - const: pme
+      - const: xhc
+
+  clocks:
+    maxItems: 1
+
+  phys:
+    maxItems: 2
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - power-domains
+  - resets
+  - phys
+  - phy-names
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@15850000 {
+      compatible = "renesas,r9a09g047-xhci";
+      reg = <0x15850000 0x10000>;
+      interrupts = <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 757 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 756 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 755 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "all", "smi", "hse", "pme", "xhc";
+      clocks = <&cpg CPG_MOD 0xaf>;
+      power-domains = <&cpg>;
+      resets = <&cpg 0xaa>;
+      phys = <&usb3_phy>, <&usb3_phy>;
+      phy-names = "usb2-phy", "usb3-phy";
+    };
-- 
2.43.0


