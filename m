Return-Path: <linux-usb+bounces-34171-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B8XOmrUq2nNhAEAu9opvQ
	(envelope-from <linux-usb+bounces-34171-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 08:31:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E4122A9DC
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 08:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A3ED300C32D
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 07:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C55B36CE0E;
	Sat,  7 Mar 2026 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jw/7uWH+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0554B2DCF45
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772868711; cv=none; b=d569XCFA9FQaDkpnT+2mFP07NVSWK6NiM90BzKQ6UtCEOKCFGbhS59WbANJeiFwSiWl0hyKeGQ2Bdf7utEPQZfcCzYVm6pcSWG30rp0whzTPvc8A4AfaHPYYJhabw2sM4ZkpU5qvrMZitjnzXwXYDbPeVP44/qDNqjm5mU5e2yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772868711; c=relaxed/simple;
	bh=JShnRDjclixw1g0VjuV2WjAJQt7VuKhpaNYoY8SghlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O7VlGk+Qtqo3+S3+BZZlIGlf1C/WeojeCDXLYM4GXeRFZoXW4whRpIpX0UtC4X2SwpIQwHhAMC8scIKBEnFNu6iQOZsPJUjOps639OeNq6r+toj0BBkfYVPCAyUuwA7tKeod19mVKlmKnxOhe51Sfuf0OAF+wH3K70aigZ2ns+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jw/7uWH+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8296dabef74so3911866b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Mar 2026 23:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772868709; x=1773473509; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6uzK97YQPoZzgnXGjDcOG7qHsNjCvIsHY4T2t2FsRy8=;
        b=Jw/7uWH+BJ+wmK/FR5ubflNg5erKqTTQZbSAAXnvdhMyOXWZLU7wfOX/c2mWpzwRlx
         UDDZ2mDBa7fADNLHUKrfE8LpSqAc3fHne9UDQA541j32i9leSx3hDHCPC/CabLYJk5ZL
         dE6MUx/1XOtUImiFS3x67xTtB8Aqx+to8IpP6+wMJMIjgh3lehau6D5na+vlLgtZMWOK
         m7aCdRVcOU8usFD/tjPNR4HzbJTD9h2uyGncEGuEtz3qdeGOWGen7aGBPh7hVDyJXt2B
         oLN3fYHw+nw+UNP6hb/H6PPFaOGOJWmYPMgSUMvIW8aPcrlLemYqxPkcotNvmlc6m2p6
         1SMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772868709; x=1773473509;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uzK97YQPoZzgnXGjDcOG7qHsNjCvIsHY4T2t2FsRy8=;
        b=gk2j02Gl6tDt0D9uKC6u0IeG1DDH+shcAhnStnmrCnOviMlX66Kyy/g1WwT1LFouW1
         JeyaDAsvoWkfZdBQxuJSCztCflPUujBegfswq169bGr4aoYFbKERyE/Cok+hxDgOc5kL
         4eF/0ctXpbHgJqxzHDp8mJmBiXAGEfNh/MK3tV7Yy9tJlCdQSQaTYz10v823O/jJb4l9
         +x2OvkTpoNZ2X0+rUDszcw0KrEfxlOWEDubvdd3TqmMEMIB+iD6KhP99BMhbyRbVdN55
         yyY0ghB0Xc3Q0FrZyA9W0aV7ptvRsUGd6EtiiaZY0rW6CEcVflTA45oeoneyw5AoRP7B
         HJQw==
X-Gm-Message-State: AOJu0Yz72T7FYNCrAp47yEmWfy6QpPIOhYgr0qlsRVz5YKiX3G3B2UfU
	YnOBAM54s6yAut/arjLQogRyYY+Ne5uXoiK1Uj8aP1H9mM5cyD4etkqp
X-Gm-Gg: ATEYQzxD4maVvoAAihgK8tjXDbOHpKaSFFyH99dJvuC8kXqmXyoXjEe+Dk08kKLexlU
	l8FKTeT7FycWd0nsO+vf7pY4/Ryx+HDlbEYY2y+y6m2fLZINV7Wcz82uRCTk06pOMsICIasJls8
	APFzC3lwwsa2z2GLazJEAqp/NLZNhfc7T3WLVwg6XmC9euHwAZKqPWgQRlCVHK15kMkDdgME0J3
	TFiLiZfrWyOglJTyJ2KUaoZt3MZQP+zluOmPmNz/+e5dWxaYo9nAxbdtsgHmSUZLp26oOcb7T/3
	tJQhOKMuclNLCtuKSptXT44KxEu8q/5nibExgt0oJhtZLEf+7gDEd4NAaxZBF4dgXn3FdqwEZiW
	vmtjC8e5SYKLP2T22/kF9KT5ZvJ4eTCrl0X8EI/94SHKu48Tv/qwfsHnNYUAfHQD/R0kyhYA+4p
	p8GfpTdfkCyUijR4gMm+ebJ12IV7ujPXbvhPOiM11TocA=
X-Received: by 2002:a05:6a00:418d:b0:829:809e:8981 with SMTP id d2e1a72fcca58-829a2ea9fe4mr3541346b3a.31.1772868709366;
        Fri, 06 Mar 2026 23:31:49 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.215.222])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-829a4866a72sm3632106b3a.36.2026.03.06.23.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 23:31:48 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 07 Mar 2026 07:31:42 +0000
Subject: [PATCH] dt-bindings: usb: st,st-ehci-300x: convert to DT schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-st-ehci-v1-1-3801a99ae913@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF3Uq2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNT3eIS3dSM5EzdtERjE0MTS1NzS8skJaDqgqLUtMwKsEnRsbW1AB7
 rlG5ZAAAA
X-Change-ID: 20260305-st-ehci-fa341495799b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 87E4122A9DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34171-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.977];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Action: no action

Convert STMicroelectronics USB EHCI Controller binding to DT schema.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 Documentation/devicetree/bindings/usb/ehci-st.txt  | 38 ---------
 .../devicetree/bindings/usb/st,st-ehci-300x.yaml   | 95 ++++++++++++++++++++++
 2 files changed, 95 insertions(+), 38 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ehci-st.txt b/Documentation/devicetree/bindings/usb/ehci-st.txt
deleted file mode 100644
index d6f2bdee20fc..000000000000
--- a/Documentation/devicetree/bindings/usb/ehci-st.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-ST USB EHCI controller
-
-Required properties:
- - compatible		: must be "st,st-ehci-300x"
- - reg			: physical base addresses of the controller and length of memory mapped
-			  region
- - interrupts		: one EHCI interrupt should be described here
- - pinctrl-names	: a pinctrl state named "default" must be defined
- - pinctrl-0		: phandle referencing pin configuration of the USB controller
-See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
- - clocks		: phandle list of usb clocks
- - clock-names		: should be "ic" for interconnect clock and "clk48"
-See: Documentation/devicetree/bindings/clock/clock-bindings.txt
-
- - phys			: phandle for the PHY device
- - phy-names		: should be "usb"
- - resets		: phandle + reset specifier pairs to the powerdown and softreset lines
-			  of the USB IP
- - reset-names		: should be "power" and "softreset"
-See: Documentation/devicetree/bindings/reset/st,stih407-powerdown.yaml
-See: Documentation/devicetree/bindings/reset/reset.txt
-
-Example:
-
-	ehci1: usb@fe203e00 {
-		compatible = "st,st-ehci-300x";
-		reg = <0xfe203e00 0x100>;
-		interrupts = <GIC_SPI 148 IRQ_TYPE_NONE>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_usb1>;
-		clocks = <&clk_s_a1_ls 0>;
-		phys = <&usb2_phy>;
-		phy-names = "usb";
-
-		resets = <&powerdown STIH416_USB1_POWERDOWN>,
-			 <&softreset STIH416_USB1_SOFTRESET>;
-		reset-names = "power", "softreset";
-	};
diff --git a/Documentation/devicetree/bindings/usb/st,st-ehci-300x.yaml b/Documentation/devicetree/bindings/usb/st,st-ehci-300x.yaml
new file mode 100644
index 000000000000..0cd625cd003b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/st,st-ehci-300x.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/st,st-ehci-300x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics USB EHCI Controller (ST EHCI 300x)
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+description:
+  The STMicroelectronics EHCI 300x controller is a USB 2.0 Enhanced Host
+  Controller Interface used in several ST SoCs. It provides high-speed USB
+  host functionality and interfaces with an external USB PHY. The controller
+  requires clock, reset, interrupt, and pin control configuration along with
+  PHY connection information to operate correctly.
+
+allOf:
+  - $ref: usb-hcd.yaml#
+
+properties:
+  compatible:
+    const: st,st-ehci-300x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  pinctrl-names:
+    const: default
+
+  pinctrl-0:
+    maxItems: 1
+
+  clocks:
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
+    const: usb
+
+  resets:
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
+  - pinctrl-names
+  - pinctrl-0
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
+    #include <dt-bindings/clock/stih410-clks.h>
+    #include <dt-bindings/reset/stih407-resets.h>
+    usb@fe203e00 {
+        compatible = "st,st-ehci-300x";
+        reg = <0xfe203e00 0x100>;
+        interrupts = <GIC_SPI 148 IRQ_TYPE_NONE>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_usb1>;
+        clocks = <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>,
+                 <&clk_s_c0_flexgen CLK_RX_ICN_DISP_0>;
+        clock-names = "ic", "clk48";
+        phys = <&usb2_phy>;
+        phy-names = "usb";
+        resets = <&powerdown STIH407_USB2_PORT0_POWERDOWN>,
+                 <&softreset STIH407_USB2_PORT0_SOFTRESET>;
+        reset-names = "power", "softreset";
+    };
+...

---
base-commit: 3f9cd19e764b782706dbaacc69e502099cb014ba
change-id: 20260305-st-ehci-fa341495799b

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


