Return-Path: <linux-usb+bounces-34178-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IiyI0jtq2lziAEAu9opvQ
	(envelope-from <linux-usb+bounces-34178-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 10:18:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C17F22ADDE
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 10:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B2F9305D486
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 09:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E9B38947F;
	Sat,  7 Mar 2026 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3k6UtwX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3967038A712
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772875006; cv=none; b=PXAN2eNHbPOXSlDqf0pc4BiprrCJVS67sPRGIz10TEar62J70nPVJCAYiorCOaXcOr17eQISsOprkJeYq4pJFVlgBrnLwEYnWLz4Jz15zgyvny9uiLVNkjjdFH08ujKhWsJkoXki6urdTDqNQTlirv1ViHzUV+xOWHV7Xm8pkPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772875006; c=relaxed/simple;
	bh=cHGOkmEi7kEv574uRE3wxo7Vs0FFYhaJov3npYQ2EA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A9MV8JAZ29pjmPpAYwYbEAcGYh8vC5IxpAw1ICC/5n7uQncidURcxfHkPBZTMsR7mvUQpIPWVBfGUx1faeOwbcUANrHeF6JNHNz6QO/URvaJ5WxQwP7gskbhrELgcGlhEGgS8+WFqBkERjz76HtgTz0uHCtdAtQe2ObuCStXEkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3k6UtwX; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae3a2f6007so53566665ad.2
        for <linux-usb@vger.kernel.org>; Sat, 07 Mar 2026 01:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772875004; x=1773479804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFLYMx/eMQ8fDIUE754jWtNcFJvcsDGeyQ8yrn2Ek8U=;
        b=f3k6UtwXL0htF/MiMQ5fmtgDhHq5YafvgyhQ/KtbIch0nK7VBPAaPEvk+mRZH42TkQ
         5qd6NK/CvBMYfcblSvZtwbT/M1PUmRIGUn6mCJK/ssM6iqZLCZgcH/mq4emqKg6LUH52
         JeM518FBJmSn/vcW1DRbah9C5Q3W+WB8DgB7eUixIqM1HbXkNlqI65FvPAOB+aE3T0NT
         QSCUHZ/mlS5wFcJRU6giAXnphCQEwx0nBifNupQ2Kquj0CT/naqIQQIo/JSbZBIbcsAx
         tZnWE6RuH7yupinFZdt1UJKzOJLhVD0+xx5dDEO7GaHsEaB+WO5zehJhFK0xKloVx5mL
         ob6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772875004; x=1773479804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hFLYMx/eMQ8fDIUE754jWtNcFJvcsDGeyQ8yrn2Ek8U=;
        b=hOQ9WB2W+jtUi+GHofG8LoJSDtV56FbgMHzIk6FJr+xa/Fif43U+IwYgoih1jvbgo3
         0DR2kxm937fnMjt0cx0CpcP0YosEWTHcEx5oH4kKRNFtLLY+2AMwe4i9wJPFL35sKgaC
         FvO7ZmV1LwOritG73C8Ea12bH+agEw78+VamNhrziUnasi7AYDV+Spwz7Lo0gVcAcH+Z
         iA9ZLSx9CA1gjSe33xlOeUNorQCN/P3vupkAPdF5+z0AD5vQWsXfoxp31X3aFQ79NACz
         TyPRYr1BEs2w+bGcoVO2aTR1idqKy8yyNFRKlW6k0+vKXEdWkT3+VWyxhZYyehNz2AXO
         ffIw==
X-Gm-Message-State: AOJu0Yy/ZXZNIE7fP7UTKE1drNnzMMM2BuGSBjFZCg3LodhrH5CuXBDR
	uxAtmbA8BVt4XvC+rFVSDlNujqpW7S7lqCjGtvXx7V5aaCMj9MISzpbl
X-Gm-Gg: ATEYQzyXC04wgwLecMULc0FidjVzbXP2Y+4tYBxsr+MGrCaHZsrT9O+YCRqKYNf503T
	oCx5W6EsX3unB7Lo74Hy/fyfCZxwz4i6fE6vHUsW7BYayhpfspAZLsve+BrQE7Q7o5S+fx7HE2V
	CXQMZG2sU6CtJQYIl16ha+VXroTGKOANL9qUeMboOjyp3qFj4SoF6H1c1fOQskwJ50fpXZNc5I1
	YEKWnrp96e+DqGWf6QEEp7+RKYevX8cY+Dj1PVQ/YVfruoqEO7ZEiB9YWQAQz+dbzpfpCgr+p8Y
	NSaR/ZRmIi6sUleMU9FQHg81OYJs9pWjNBR3bEio5VSY4yid5BHyK1LyXuiVyzn12O9MmL4+Ltw
	P+AfXD8i6/owPvm2K+CYbgF9lMA7g+Q3UtREZWuJrWxm86AJRcnppIf5W2MfpeF1Al1VkOQNCUx
	uBoEgPX7ohqZpbv9iySeirFlkdH6xVz0LtwKBc8yMVRRg=
X-Received: by 2002:a17:902:ce82:b0:2aa:ea8e:f118 with SMTP id d9443c01a7336-2ae8241ddf9mr59199385ad.3.1772875004376;
        Sat, 07 Mar 2026 01:16:44 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.215.222])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ae83f74e4fsm45569385ad.58.2026.03.07.01.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 01:16:43 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 07 Mar 2026 09:16:21 +0000
Subject: [PATCH v3 4/5] dt-bindings: usb: atmel,at91rm9200-udc: convert to
 DT schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-atmel-usb-v3-4-3dc48fe772be@gmail.com>
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
In-Reply-To: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
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
X-Rspamd-Queue-Id: 0C17F22ADDE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34178-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,microchip.com:email,fffa4000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:email]
X-Rspamd-Action: no action

Convert Atmel AT91 USB Device Controller (UDC) binding to DT schema.
Changes during conversion:
- Include "atmel,pullup-gpio" and "atmel,matrix" in the properties since
  they are required by existing in-tree DTS definitions.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91rm9200-udc.yaml         | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
new file mode 100644
index 000000000000..6961cd5d5d89
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
@@ -0,0 +1,77 @@
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
+    minItems: 2
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
+unevaluatedProperties: false
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

-- 
2.53.0


