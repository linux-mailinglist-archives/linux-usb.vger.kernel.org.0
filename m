Return-Path: <linux-usb+bounces-32976-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CUBO/k6f2kfmAIAu9opvQ
	(envelope-from <linux-usb+bounces-32976-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 12:37:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43573C5C8F
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 12:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 270CD305D846
	for <lists+linux-usb@lfdr.de>; Sun,  1 Feb 2026 11:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A560B329E43;
	Sun,  1 Feb 2026 11:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ybim5pxW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA29324B24
	for <linux-usb@vger.kernel.org>; Sun,  1 Feb 2026 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769945716; cv=none; b=Lbhd4zf1Bit/yxPh2i6NeK3tyw45eVXXi245l4d15fubf0MedFr3pdVE3osdXMaqGVb+3peNK6UWRnqpo86Wt1GGH/NPlLiD5skFoPlk1HDM9hOQ7Xt3JN+8O9/suaqtBRQCmM0cva41Fddenmve4KnJaGWgg0vPGO1div44pc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769945716; c=relaxed/simple;
	bh=2xjOo4rQYT1KaQC3tvCqFCwXg2yc/61LBfO4QH6BKsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TddF7RoD0WLz1fotnhvcYoVZHdR5deP2vrcAg1j25edqu3nrQ45CefkrQAPTqTu2K5T0OmVXTCtTv9+cxwHa98vUcmgXMmSCxZWdeXr03Htl3b2U9L0CZ4RKmr1eIBn0yfr7yG2YEvZFnAiJNxrYCYzfO3wj2sqNcQIBj18jgJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ybim5pxW; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso1813940b3a.0
        for <linux-usb@vger.kernel.org>; Sun, 01 Feb 2026 03:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769945714; x=1770550514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwiMlqn8zSWND/MaEGxRB1MrDjr/sEbwA0uoenl3eoE=;
        b=Ybim5pxWMfq03fGVIv3I691ZgVK1ld+kyr/NWAtj2ej/mi+H6g2OZOlQ5LDbKG+7mk
         wpUElM66DvA8ju4x8Qvi2CZvJ4kHmktgxQujs7uIfW1NqNylAsWjlm6uV9a6wsIYwCCx
         /Ps+5LJiBqb6YWgUoeWAKwI0gdj17TrBFOSMtqiiir3mUNaEcCq6tmjdttX2gUq/2YbG
         oCr5vaPjp6SFNek1JQvhJaW02N+viDHLV+koAS6msh6V7G91RZDxSsxquGVtfcaxMqkC
         Y8b85tBaCk0K9LHyo3iWowzetEdIfsTp0VLBblTg7m9KM/tH8ABLPMhPk0OvRXeKbNFo
         Qgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769945714; x=1770550514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CwiMlqn8zSWND/MaEGxRB1MrDjr/sEbwA0uoenl3eoE=;
        b=izBGAZCRc26IqatzqL1JoHg5LGuT6vCUhKzVnOWj+cQWk6GmKGYgU+Ng1r+7s8ZEUz
         avCdt6kz/LuAb5rL3OT0Xgvv4Fzeue2RpZIskdPm8HEo2UgQrpFHyJqhINPRGKjxz7Nu
         PA/u1T1mJpeXFBFswHxt83tzxYljadZd/L858xte2OZ9eM7XO+843eSCJQ033+RwXvnX
         HV5Pg1nsfkq7HblZRaUJysgHb9n7ygd8/1/BEbYU4gFJloRTLLXiIYWJR/EVIiAZINlY
         dSOIqqVczLBXT5CDIgPeWGfNYfUVRlNANI6G7Ow0GI6pdzW+sB9n0B+BJPNdppXOopib
         z4iw==
X-Gm-Message-State: AOJu0YypIeiISESfi6ynb/qT3z3n4xaMsdMTWHuot1zKpQ60DMfeZrY8
	GOiuUa36kwbAvrYwoMghbAYp5w1iroeiOV8RNB/RPPz8nN/+rldjNQSq
X-Gm-Gg: AZuq6aKp9ksUUXshvJE0wGdetlIAR8JgIhj1yGonWMcWSKohIpBDAN/3/6HglZsgICr
	pcHqnm+SjMvja7xkAn+EPl14/V1fu1UD4S+7rFZZV78qhpH9uAAGzsGuYsM7IO7fMHLGhhgB/qh
	rCWMsF76tEc6hJE72+GrJC+ujLlevVmSi+oe6BVGEEpegjn04j+VEFPfHwyD3ThSVLx4r1pPZtH
	f4x3+/H1GtbXYwlreWqFNSVG8KT9+fYr0AeOom2+CqDDQmIaX+u6dZuOaO2nG2Uvx5OTRTe/Vrt
	zOfwPGo4IZIkPsQKBIZoVlP0n37R5/HBX0eWv8XCXpacdPQEnd9kMRIa14In5JeoqaMvhaJtOR5
	CRhyjY/0B9NICfP8htz1Q9RUZqV3rkgD8ShCU96o6tFMjYhFrRhXmd1/hMH4DY1m1Cpg9UNQOJ4
	zhmlWj7ZjwzDTeeISrYV0gcFc0nLuHdmtWlg==
X-Received: by 2002:a05:6a00:430c:b0:81f:4769:6fde with SMTP id d2e1a72fcca58-823ab670cbbmr8524983b3a.17.1769945713898;
        Sun, 01 Feb 2026 03:35:13 -0800 (PST)
Received: from Black-Pearl.localdomain ([115.99.252.105])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82379c24083sm12994728b3a.55.2026.02.01.03.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:35:13 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sun, 01 Feb 2026 11:34:23 +0000
Subject: [PATCH 4/4] dt-bindings: usb: atmel,at91sam9rl-udc: convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-atmel-usb-v1-4-d1a3e93003f1@gmail.com>
References: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
In-Reply-To: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-32976-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.7.161.32:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fffa4000:email,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,devicetree.org:url,0.12.53.0:email]
X-Rspamd-Queue-Id: 43573C5C8F
X-Rspamd-Action: no action

Convert Atmel High-Speed USB Device Controller (USBA) binding to DT schema.
Changes during conversion:
- Include "#address-cells" and "#size-cells" in the properties since they
  are required by existing in-tree DTS definitions.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91sam9rl-udc.yaml         |  81 +++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 125 ---------------------
 2 files changed, 81 insertions(+), 125 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
new file mode 100644
index 000000000000..6f5710cecaee
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/atmel,at91sam9rl-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel High-Speed USB Device Controller (USBA)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The Atmel High-Speed USB Device Controller (USBA) provides USB 2.0
+  high-speed gadget functionality on several Atmel and Microchip SoCs.
+  The controller requires a peripheral clock and a host clock for operation
+  and may optionally use a GPIO to detect VBUS presence.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - atmel,at91sam9rl-udc
+          - atmel,at91sam9g45-udc
+          - atmel,sama5d3-udc
+      - items:
+          - const: microchip,lan9662-udc
+          - const: atmel,sama5d3-udc
+      - const: microchip,sam9x60-udc
+
+  reg:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    minItems: 2
+    maxItems: 2
+    items:
+      enum: [pclk, hclk]
+
+  atmel,vbus-gpio:
+    description: GPIO used to detect the presence of VBUS, indicating that
+      the USB cable is connected.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/gpio/gpio.h>
+    gadget@fff78000 {
+        compatible = "atmel,at91sam9g45-udc";
+        reg = <0x00600000 0x80000
+               0xfff78000 0x400>;
+        interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+        clock-names = "pclk", "hclk";
+        atmel,vbus-gpio = <&pioC 15 GPIO_ACTIVE_HIGH>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
deleted file mode 100644
index 12183ef47ee4..000000000000
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ /dev/null
@@ -1,125 +0,0 @@
-Atmel SOC USB controllers
-
-OHCI
-
-Required properties:
- - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers
-   used in host mode.
- - reg: Address and length of the register set for the device
- - interrupts: Should contain ohci interrupt
- - clocks: Should reference the peripheral, host and system clocks
- - clock-names: Should contain three strings
-		"ohci_clk" for the peripheral clock
-		"hclk" for the host clock
-		"uhpck" for the system clock
- - num-ports: Number of ports.
- - atmel,vbus-gpio: If present, specifies a gpio that needs to be
-   activated for the bus to be powered.
- - atmel,oc-gpio: If present, specifies a gpio that needs to be
-   activated for the overcurrent detection.
-
-usb0: ohci@500000 {
-	compatible = "atmel,at91rm9200-ohci", "usb-ohci";
-	reg = <0x00500000 0x100000>;
-	clocks = <&uhphs_clk>, <&uhphs_clk>, <&uhpck>;
-	clock-names = "ohci_clk", "hclk", "uhpck";
-	interrupts = <20 4>;
-	num-ports = <2>;
-};
-
-EHCI
-
-Required properties:
- - compatible: Should be "atmel,at91sam9g45-ehci" for USB controllers
-   used in host mode.
- - reg: Address and length of the register set for the device
- - interrupts: Should contain ehci interrupt
- - clocks: Should reference the peripheral and the UTMI clocks
- - clock-names: Should contain two strings
-		"ehci_clk" for the peripheral clock
-		"usb_clk" for the UTMI clock
-
-Optional properties:
- - phy_type : For multi port host USB controllers, should be one of
-   "utmi", or "hsic".
-
-usb1: ehci@800000 {
-	compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
-	reg = <0x00800000 0x100000>;
-	interrupts = <22 4>;
-	clocks = <&utmi>, <&uhphs_clk>;
-	clock-names = "usb_clk", "ehci_clk";
-};
-
-AT91 USB device controller
-
-Required properties:
- - compatible: Should be one of the following
-	       "atmel,at91rm9200-udc"
-	       "atmel,at91sam9260-udc"
-	       "atmel,at91sam9261-udc"
-	       "atmel,at91sam9263-udc"
- - reg: Address and length of the register set for the device
- - interrupts: Should contain macb interrupt
- - clocks: Should reference the peripheral and the AHB clocks
- - clock-names: Should contain two strings
-		"pclk" for the peripheral clock
-		"hclk" for the AHB clock
-
-Optional properties:
- - atmel,vbus-gpio: If present, specifies a gpio that needs to be
-   activated for the bus to be powered.
-
-usb1: gadget@fffa4000 {
-	compatible = "atmel,at91rm9200-udc";
-	reg = <0xfffa4000 0x4000>;
-	interrupts = <10 4>;
-	clocks = <&udc_clk>, <&udpck>;
-	clock-names = "pclk", "hclk";
-	atmel,vbus-gpio = <&pioC 5 0>;
-};
-
-Atmel High-Speed USB device controller
-
-Required properties:
- - compatible: Should be one of the following
-	       "atmel,at91sam9rl-udc"
-	       "atmel,at91sam9g45-udc"
-	       "atmel,sama5d3-udc"
-	       "microchip,sam9x60-udc"
-	       "microchip,lan9662-udc"
-	       For "microchip,lan9662-udc" the fallback "atmel,sama5d3-udc"
-	       is required.
- - reg: Address and length of the register set for the device
- - interrupts: Should contain usba interrupt
- - clocks: Should reference the peripheral and host clocks
- - clock-names: Should contain two strings
-		"pclk" for the peripheral clock
-		"hclk" for the host clock
-
-Deprecated property:
- - ep childnode: To specify the number of endpoints and their properties.
-
-Optional properties:
- - atmel,vbus-gpio: If present, specifies a gpio that allows to detect whether
-   vbus is present (USB is connected).
-
-Deprecated child node properties:
- - name: Name of the endpoint.
- - reg: Num of the endpoint.
- - atmel,fifo-size: Size of the fifo.
- - atmel,nb-banks: Number of banks.
- - atmel,can-dma: Boolean to specify if the endpoint support DMA.
- - atmel,can-isoc: Boolean to specify if the endpoint support ISOC.
-
-usb2: gadget@fff78000 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "atmel,at91sam9rl-udc";
-	reg = <0x00600000 0x80000
-	       0xfff78000 0x400>;
-	interrupts = <27 4 0>;
-	clocks = <&utmi>, <&udphs_clk>;
-	clock-names = "hclk", "pclk";
-	atmel,vbus-gpio = <&pioB 19 0>;
-};

-- 
2.52.0


