Return-Path: <linux-usb+bounces-33408-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Et6GKOBlGniFAIAu9opvQ
	(envelope-from <linux-usb+bounces-33408-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 15:56:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A8D14D573
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 15:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FE383038D27
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 14:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1475B36C5BD;
	Tue, 17 Feb 2026 14:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIQ8PaMb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265E736C0CE
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771340166; cv=none; b=AmpT3y8dHfMhUT1VSxwf9DispEeXxAdbbiysklR6wVDJ240EaJ9oy9to7Alo8yKFM2FA/V+Y4eXK3f9rPtoizBbXqPREBuVy96IRxjCgKVXsuj0S89IN5CENvw62szzCalH4SaTZBkhxKv0jT3/HOadN3CSzG0FTuhUZPZ3AIrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771340166; c=relaxed/simple;
	bh=hUZh+n+XnnF6ntxPSJM7kCuV0hDzZDwHB6X9TN+Y2Xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ASd4IwqNg2EBxOVbYe9WfQ2Nh1BvdgEqT/JQmY/9FJpnbC5h/wbzzU9SKCZBr/7mvo93JtBq10FGuUXxGpps6rFNEq8/BfUW9onbE8tFQLK/GNQ689EmOLtWj3PE6ZSmgNTr6iTggX48mtGfmVomgOnmgXBLi0WQSuGpFAsp5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIQ8PaMb; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c6e77ace76aso718388a12.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 06:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771340163; x=1771944963; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RaI9jRYZtnFQkCNP4Y37RURFdGhsHdu9rq/sifofeD0=;
        b=VIQ8PaMbzHLX6R7+PN628XmhgLidnNe3zzLaOSAL7SHZ6Nzk4YXL4N+cBk9OXgtcMT
         uTrJ5RJuw6RkOjPic9qjZq09gTcPXrIIJi1iKEbK9JOF+jqHTecRJlRJV5GS86xrc49a
         Zbi3lzI6X+lGEERD/kFZjXl4OBOBMg8HX1tpuU4dDeyXZ08xasblRWBD4Oe7ZSq7d+8+
         nu+CWU5t1+Kt0WksvziMDNPibn9ZtakBR2PbFNHv4wDyCseES9v6LQOwhO3cMuys/BM9
         alGDQHbMsk5VewuxMO4anE+kOkP+WN0QjroqQYS1B2kG+6yx5cx54lPyYLAAbKEGa3Bm
         0CyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771340163; x=1771944963;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaI9jRYZtnFQkCNP4Y37RURFdGhsHdu9rq/sifofeD0=;
        b=BaINoCFHR0bERJuT1ugRPJ/S3nqhdCbogRd1M8bXbFFVBH5OmoRzrHeYGrDF4yNqkn
         k7TYr5sO9tWkvijUanLFOH4/HsEdIcZptn8GyKCjlH0Pbet6R9exY0QscdXIKz8K96Kv
         za5kaStT+K54lv9pPLJa8JFmbb5hkCczaRam6SGA9rl4NxXIQ/g4c4fKbkLSTYCr5MWn
         Cck3fpQrv36yhlU5y4nI+PxyL8rx/5Pp3M+cDavOyQIa9ctt4/Ut8gQUI07TZfRr6Awg
         R/lfG1TP+u0dkUuQe/iXTVYEzqIlQCvbcVNhpBR+YbKu+3ye5q13OhFHh7DB+WKlGLqk
         FyJQ==
X-Gm-Message-State: AOJu0Yx+IChw+0yjaYmgdDbv5bUiQ72ngzMcpjAsOglXR8/xpj4z98eX
	JN2C7Ac12HHQ0s13msA6351Q+WdOcUYlT1Vi3PHPsGDXRIej+4eoiZpy
X-Gm-Gg: AZuq6aLgcWLTbNs4u7kyfamA+RjyvR35EptSIj1lLAm5a7MnuDeey2SVVm11Qv8Str3
	R4EgncVb4tX6VXCo944wI8tYmt+V5FTgGexTDxcvrfVbP1pvTpuvqIidthdlua1kQxkrN2A6yUt
	A6ndZWP+jE3WCnly12VqctzhwkpJ5KWO9kFZH3SKFFEoiS9T3S1CS9wVfbAPW9N1extKEj8Hbsy
	91aD3n5kWPrDglscU8r2+oQ5Apz2Y3OBG3Ro+S9bxNuAUBWLlFQBbFkUEMfBS+INVEXG9qJaaGS
	XfvY9HG3POkxyL/H50gq+C16CCVrb8ILL81Wogii49B0WAxDKqw9q3bUYMG7d+QJhGEXosAMi6l
	WIMa+LOLLp8HetHMUsc7Hk3K6vmXGRvSWz3Bv3UFhiKKEnwGqAzzJHoM5P4KYo/APfDHCPmrhMO
	KEieQnhHvO7qcTKT3/gq3bzU30gZdrzya2Coyj9KepNUBAV0wn7mY0
X-Received: by 2002:a17:902:e881:b0:2a9:327f:aa2f with SMTP id d9443c01a7336-2ab5056e2cemr182475565ad.26.1771340163425;
        Tue, 17 Feb 2026 06:56:03 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.171.51])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ad1a9d5bc8sm103034535ad.60.2026.02.17.06.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 06:56:02 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Tue, 17 Feb 2026 14:55:34 +0000
Subject: [PATCH] dt-bindings: usb: st,st-ohci-300x: convert to DT schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-st-usb-v1-1-ba347f30d0e0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGWBlGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwND3eIS3dLiJN00Q2MTC1Mzo8QUM1MloOKCotS0zAqwQdGxtbUAWBl
 Zc1gAAAA=
X-Change-ID: 20260201-st-usb-f1348562ad65
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33408-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fe1ffc00:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,linaro.org:email]
X-Rspamd-Queue-Id: C5A8D14D573
X-Rspamd-Action: no action

Convert STMicroelectronics USB OHCI Controller binding to DT schema.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 Documentation/devicetree/bindings/usb/ohci-st.txt  | 36 ---------
 .../devicetree/bindings/usb/st,st-ohci-300x.yaml   | 87 ++++++++++++++++++++++
 2 files changed, 87 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ohci-st.txt b/Documentation/devicetree/bindings/usb/ohci-st.txt
deleted file mode 100644
index 1c735573abc0..000000000000
--- a/Documentation/devicetree/bindings/usb/ohci-st.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-ST USB OHCI controller
-
-Required properties:
-
- - compatible		: must be "st,st-ohci-300x"
- - reg			: physical base addresses of the controller and length of memory mapped
-			  region
- - interrupts		: one OHCI controller interrupt should be described here
- - clocks		: phandle list of usb clocks
- - clock-names		: should be "ic" for interconnect clock and "clk48"
-See: Documentation/devicetree/bindings/clock/clock-bindings.txt
-
- - phys			: phandle for the PHY device
- - phy-names		: should be "usb"
-
- - resets		: phandle to the powerdown and reset controller for the USB IP
- - reset-names		: should be "power" and "softreset".
-See: Documentation/devicetree/bindings/reset/st,stih407-powerdown.yaml
-See: Documentation/devicetree/bindings/reset/reset.txt
-
-Example:
-
-	ohci0: usb@fe1ffc00 {
-		compatible = "st,st-ohci-300x";
-		reg = <0xfe1ffc00 0x100>;
-		interrupts = <GIC_SPI 149 IRQ_TYPE_NONE>;
-		clocks = <&clk_s_a1_ls 0>,
-			 <&clockgen_b0 0>;
-		clock-names = "ic", "clk48";
-		phys = <&usb2_phy>;
-		phy-names = "usb";
-
-		resets = <&powerdown STIH416_USB0_POWERDOWN>,
-			 <&softreset STIH416_USB0_SOFTRESET>;
-		reset-names = "power", "softreset";
-	};
diff --git a/Documentation/devicetree/bindings/usb/st,st-ohci-300x.yaml b/Documentation/devicetree/bindings/usb/st,st-ohci-300x.yaml
new file mode 100644
index 000000000000..35544fd288ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/st,st-ohci-300x.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/st,st-ohci-300x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics USB OHCI Controller
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+description:
+  The STMicroelectronics USB Open Host Controller Interface (OHCI)
+  compliant USB host controller found in ST platforms. The controller
+  provides full- and low-speed USB host functionality and interfaces
+  with an external USB PHY. It requires dedicated clock, reset, and
+  interrupt resources for proper operation.
+
+allOf:
+  - $ref: /schemas/usb/usb.yaml#
+
+properties:
+  compatible:
+    const: st,st-ohci-300x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ic
+      - const: clk48
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: usb
+
+  resets:
+    minItems: 2
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: power
+      - const: softreset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/stih407-resets.h>
+    usb@fe1ffc00 {
+        compatible = "st,st-ohci-300x";
+        reg = <0xfe1ffc00 0x100>;
+        interrupts = <GIC_SPI 149 IRQ_TYPE_NONE>;
+        clocks = <&clk_s_a1_ls 0>,
+                 <&clockgen_b0 0>;
+        clock-names = "ic", "clk48";
+        phys = <&usb2_phy>;
+        phy-names = "usb";
+        resets = <&powerdown STIH407_USB2_PORT0_POWERDOWN>,
+                 <&softreset STIH407_USB2_PORT0_SOFTRESET>;
+        reset-names = "power", "softreset";
+    };
+...

---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20260201-st-usb-f1348562ad65

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


