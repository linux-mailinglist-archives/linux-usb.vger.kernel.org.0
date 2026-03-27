Return-Path: <linux-usb+bounces-35572-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHhxGmK2xmnoNwUAu9opvQ
	(envelope-from <linux-usb+bounces-35572-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 17:54:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D91BE347E53
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 17:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37ADC316A0C6
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 16:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A1736607E;
	Fri, 27 Mar 2026 16:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pR1Jy6QL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998833644D4
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630092; cv=none; b=ewisQrwcX0fgQCOYqo7qmOAX7kTeDYWcgwEkM9Km1PNX1b6x/GqEtKWk0Y5Kz+VdgxspfrFA4jWgmsNcAEFdqhkoyHI/SwC5wfUwhiLot8z8fNW59OhNJktf5v1J5E/yyUgyp5UIPR2TSCwNZBfGGmb5yMfUIzkuNr0/5ubWqb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630092; c=relaxed/simple;
	bh=pTS8uG5VmLH/V/Tc99jd7kQoII4k336sCKYir7dR+yY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bH9oAgZcGVUBapIiBElAk+1e7y/BMthBAUCeLjtncILpkoRm6qjI3hnnHb1YKh00jMt+WPXuR7+K6BbBKobGRh6VM7lHjDWcYHFHSZT3wxTgwInM3B9w9g0vhWoR7IixequEEer2971+JWZwkckJWgCHgje3imLU97V9/mV1IdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pR1Jy6QL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b0c8362d93so11775785ad.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630091; x=1775234891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBHc0eO3/NbG1nFm7mct65bznXsLp+shsTmz7+UdJu8=;
        b=pR1Jy6QL1oeYKhQkFNeqUh0fywmXfwJ4VE6KJrmjAmtFXgr4EdB4wdQOPR22V1PXgL
         RDzJwB2IoFXPPBkPimjXilmElhryDT6OihhBTtEYk0TkHfVer5B35fwhdf6MIBFwfRYs
         pkT89oi4jA9ChKoYI0u0qytTloWN7r8nq0bUmwELiLk6Ol+No1/SRyA9YzeV3W5esIA3
         MfqrNAfxdUVEIwVga09fKdm2Ma3BVSvqdNArEjCo57NjbI4YNFoRQpy8Z1bqy5YbhDTY
         b3iKhf7Emm80m+upX8ztEeZAel8+5ncdFYxLxq8iCnyDxzS4imRwrWKwSIzucTceni5u
         t77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630091; x=1775234891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBHc0eO3/NbG1nFm7mct65bznXsLp+shsTmz7+UdJu8=;
        b=J62zk7IuiqspUYTEA5Y4uLiCYktV8XhRqIHzCk6PPyj5mfWCzYC86/W8C+wDv4leEx
         Ej6aTdngz6uKkUQtLRRXfujVUgZ10Ktb2fVZ9OsDHJCUKMBzfQH5TPFiPdfceqUWS7fu
         xuZfnINN0tSVLVPVj3prN2nzG4xGwZ40dhsFN6Ey6MLF//1TeRUVx2hRO57piepnAQwf
         zdxqWgnKrpq2hmw2m0VmTXnx9de9clqmUAUm5FB+Q1WUVt9wnn8xQ0gBC6ZHcYCl/Hz2
         LzB3IqiVOQI2V2AvAQqO4fqjmcp5SyiYF6XXOa1uJLPBWfwL5WJe8HrlIJvN2EkwPIwv
         iqUQ==
X-Gm-Message-State: AOJu0YzoP2EMZpn9C+5FeIZYQD4Dl5lN++ZbJ9usTYwxNZD8Y9+k7HSl
	MPfKGZYSagHoFYLz6KYX5UAC7XY6BB0VNRh41DFzOt0zr3vX5ZzD8kjA
X-Gm-Gg: ATEYQzzGkwl9OGr4yeaG70GqBuda6omVb74Toap5Q6m/eL74IcS8Xf+/eWMciZ3HCHL
	rS/2D6B6y1zpZofdlzWOh5WQqKxBYZfvH66pFJRcSw7PDuCRb66FHYA0a9AK+/CvrEHvizbAALS
	iFvRw2SOBdpkUZuU4rRw2Llsf3kGRH9XmLGq7VGf4G8WEoQA5s8dstEJFKFFVHnlycOP31jL0k+
	fzcpcwtG0/DVaox1k+WVkNm155gbnZEaZI6Ep73KwIbbwuDiM7xxlSgcXMSk9lIjy8kCPwLbbX4
	2AtxATM6K8t5v4AdV6ZdB7AZamjaeO8/kPcI1sZKupISpoBftKV/fV2ZQ93FAzTDSzoUP++qQT6
	cjS2Xu7LQe54jLK0RjKXsM5WC9POAyHbYpIb0+v27WJLyvQ6doOTuBCYtciDc1W4TkokX8N6clo
	t08qfbk7wZ2/4WxQ01vsL8HW07B6GrB2L8mBSRICsUiOIo
X-Received: by 2002:a17:903:228e:b0:2ae:5163:c2aa with SMTP id d9443c01a7336-2b0cdc28166mr35337035ad.20.1774630090965;
        Fri, 27 Mar 2026 09:48:10 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:48:10 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 27 Mar 2026 16:47:45 +0000
Subject: [PATCH v4 4/5] dt-bindings: usb: atmel,at91rm9200-udc: convert to
 DT schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-atmel-usb-v4-4-eb8b6e49b29d@gmail.com>
References: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
In-Reply-To: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35572-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: D91BE347E53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert Atmel AT91 USB Device Controller (UDC) binding to DT schema.
Changes during conversion:
- Include "atmel,pullup-gpio" and "atmel,matrix" in the properties since
  they are required by existing in-tree DTS definitions.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91rm9200-udc.yaml         | 76 ++++++++++++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 28 --------
 2 files changed, 76 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
new file mode 100644
index 000000000000..a4eabb935e6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/atmel,at91rm9200-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AT91 USB Device Controller (UDC)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The Atmel AT91 USB Device Controller provides USB gadget (device-mode)
+  functionality on AT91 SoCs. It requires a peripheral clock and an AHB
+  clock for operation and may optionally control VBUS power through a GPIO.
+
+properties:
+  compatible:
+    enum:
+      - atmel,at91rm9200-udc
+      - atmel,at91sam9260-udc
+      - atmel,at91sam9261-udc
+      - atmel,at91sam9263-udc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: hclk
+
+  atmel,vbus-gpio:
+    description: GPIO used to enable or control VBUS power for the USB bus.
+    maxItems: 1
+
+  atmel,matrix:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Atmel bus matrix controller.
+
+  atmel,pullup-gpio:
+    description:
+      GPIO controlling the USB D+ pull-up resistor used to signal device
+      connection to the host.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/gpio/gpio.h>
+    gadget@fffa4000 {
+        compatible = "atmel,at91rm9200-udc";
+        reg = <0xfffa4000 0x4000>;
+        interrupts = <11 IRQ_TYPE_LEVEL_HIGH 2>;
+        clocks = <&udc_clk>, <&udpck>;
+        clock-names = "pclk", "hclk";
+        atmel,vbus-gpio = <&pioC 5 GPIO_ACTIVE_HIGH>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index bf2149e5f0b3..ab353576d1de 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -1,33 +1,5 @@
 Atmel SOC USB controllers
 
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
 Atmel High-Speed USB device controller
 
 Required properties:

-- 
2.53.0


