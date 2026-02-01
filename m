Return-Path: <linux-usb+bounces-32974-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFoEMsU6f2kfmAIAu9opvQ
	(envelope-from <linux-usb+bounces-32974-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 12:36:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D39C5C77
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 12:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F4226304CCC8
	for <lists+linux-usb@lfdr.de>; Sun,  1 Feb 2026 11:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F5E32A3F1;
	Sun,  1 Feb 2026 11:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8IeNUEO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320DD324B24
	for <linux-usb@vger.kernel.org>; Sun,  1 Feb 2026 11:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769945706; cv=none; b=vB9gNFgco+gi4f/ezrcRWtZE27kjARq43Rug1ffahKUkm9AolxrwNbZ9dNoCeN3o1LzHpein+/VLFn2ApZq+hrovk7p+iQjkjSoGftTd6M72rUWUfu73dZsKl/xM9YSAGCQ04A6zbHNFq7x/ntTCSPmsqj2AhTJk79soakr+F6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769945706; c=relaxed/simple;
	bh=tiWnkS0c1E2yLOTA6pvv/0fAMnTGnan12wecxsGtKYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rSCCrjSgztO022F+oiK48Te/CjFi3RHlBSJ5xYyxgrWnA2F17ms8YtJQ0Iok+e5fsONBdy+mNRb3Ki5tTvJPB9vypE7kVCxe/yV0ox6G+VEU7sPnPS3fqzLvwySngWUC33Ml725Np5rG5yRpSp0Emz0oVUSoe4SdB16YjxUYXSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8IeNUEO; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so1775369b3a.3
        for <linux-usb@vger.kernel.org>; Sun, 01 Feb 2026 03:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769945704; x=1770550504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uo8u5FaJGPF86RZ/ycn10HpgRIqDDK6kBOV/6qMYc8c=;
        b=c8IeNUEOHMyTC550aUQN35ieJFdXn80CxFQXHt5zm+W2J6RHBbeJBFZBQ+E2AOmuic
         SFnSU36BcFgbIL0QID3W5DuD7an2FrJKHkW/6HXuXOvp+GiOHUNXKD52/zpW0fBD/dn/
         dm7Ur5BBLWMBa08+c0GTj4Cw1Kq0m54q4GzHbe3TQauf91iEEDYik5KNSwG17lsrdvNi
         4ILeWSOnJKhj1ifexfNqkm/0aMD+a6yQ8wTHEkWhW1Vr3W+v9q/mjgnh7hyXtO2MFnuU
         6zztG2Z6kfpszxprQ7fieVNcwtKmQKrd+5j53RagaRvZXu8J7GsTa5xKZF44/9lkQJFG
         dyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769945704; x=1770550504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uo8u5FaJGPF86RZ/ycn10HpgRIqDDK6kBOV/6qMYc8c=;
        b=HyNXPJm7lzi9TdnnNxZc7zB0bDFH5dLdKEyUa+CsbLdmNKKH9kyy79wwDfZntuOTbN
         v6h59BCmoVDp0U0Y1qJ3x98ehvq9uqGY3t4LGmGIDgSjYuFaSd4MToggu5ZtT6scTRPr
         20nV6C4o21HaSiMWoTRXikyJKqpcXVvWOTXVkj8uVdXfyewoVSLcNXF/Mozxh7invyo5
         QbE6pEiy1YuqXwtMh0YSFuMGRzvlF5wppjtkKBu1UgppO9s+had+0wQuysqpx0g4ubfz
         2lJtwFTkuNf1/Gvu6vBMNUNgjV5CbZKs5Yz42ogwqY6VQKJv0qJyYWpYf9n8R2618Jh+
         oXpg==
X-Gm-Message-State: AOJu0Yz4LRKMxcU62+3060tlW4ebcTGx8cU7V4n71KvRqcBHJG/OvzFV
	dU2hRnwp/IP4myCAO/1oRYTVV6QlJYY6/+9zc1TG2K5pcNonq4F/4ziH
X-Gm-Gg: AZuq6aIrZUMX8pyNrTRF/i+vKpi00iFP0qn+ZqAsvXN5I4d5uaUiCihO24PYXfdO4R+
	kqNS7m90OmTDOaFZHlWwZrNZCdw3AAxgDeAiXao0NCjdUmv3gzESKTt3MgdFYwvR2k1FwBSIuIt
	owIJZgkpv59Ixc5SyJbAesmQWL61hWWOhv2YJYjBTxgCE7GiApRwPpfmBujPb4X0gurgnvYagOZ
	JZ2/gnw2PrtmMopC4kll/rsa2GOYSmjE9thFoVcKUUjbLNk1P2MfBbLOKU64a7GnLXAxSoWpFvb
	EuuZ/vC+atSyJ7RcWbB1q8jXzIkDqLMeRsOge7woQU5PUHApAil2yjS/t/oFgeu6JxDe/aeL/g0
	WLRVAmP6vSmKefa8MfWGEfEgGfySUWPOaXOy4Gh2mW+Sf11/AX8E3LJAWa+QIMFDR4tYhW0aayG
	ezqmIfi8mCtwtShrFZA5Oen0lnId4ldws1eA==
X-Received: by 2002:a05:6a00:ac03:b0:7ff:f0c2:816e with SMTP id d2e1a72fcca58-823aa6ea4e5mr8829654b3a.28.1769945704450;
        Sun, 01 Feb 2026 03:35:04 -0800 (PST)
Received: from Black-Pearl.localdomain ([115.99.252.105])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82379c24083sm12994728b3a.55.2026.02.01.03.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:35:03 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sun, 01 Feb 2026 11:34:21 +0000
Subject: [PATCH 2/4] dt-bindings: usb: atmel,at91sam9g45-ehci: convert to
 DT schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-32974-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 67D39C5C77
X-Rspamd-Action: no action

Convert Atmel AT91SAM9G45 EHCI USB Host Controller
binding to DT schema.
Changes during conversion:
- Include "usb-ehci" as a fallback compatible to allow atmel EHCI
  driver matching.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91sam9g45-ehci.yaml       | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91sam9g45-ehci.yaml b/Documentation/devicetree/bindings/usb/atmel,at91sam9g45-ehci.yaml
new file mode 100644
index 000000000000..d7b8d110656c
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91sam9g45-ehci.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AT91SAM9G45 EHCI USB Host Controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The Atmel AT91SAM9G45 EHCI controller is a high-speed USB 2.0 host
+  controller compliant with the EHCI specification. It provides USB host
+  functionality when operating in host mode and requires a peripheral clock
+  and a UTMI clock for operation. The controller may support multiple USB
+  ports, with the PHY interface type selectable via the phy_type property.
+
+allOf:
+  - $ref: /schemas/usb/usb.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: atmel,at91sam9g45-ehci
+          - const: usb-ehci
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
+      - const: ehci_clk
+      - const: usb_clk
+
+  phy_type:
+    enum:
+      - utmi
+      - hsic
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
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    usb@500000 {
+        compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
+        reg = <0x00500000 0x100000>;
+        interrupts = <41 IRQ_TYPE_LEVEL_HIGH 2>;
+        clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 41>;
+        clock-names = "usb_clk", "ehci_clk";
+        phy_type = "hsic";
+    };
+...

-- 
2.52.0


