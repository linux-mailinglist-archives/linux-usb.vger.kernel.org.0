Return-Path: <linux-usb+bounces-32973-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNVEBKI6f2kfmAIAu9opvQ
	(envelope-from <linux-usb+bounces-32973-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 12:36:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97904C5C5B
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 12:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1E1930432EB
	for <lists+linux-usb@lfdr.de>; Sun,  1 Feb 2026 11:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4CA32939D;
	Sun,  1 Feb 2026 11:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbGCCQDV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394942EF64D
	for <linux-usb@vger.kernel.org>; Sun,  1 Feb 2026 11:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769945701; cv=none; b=ojE1r36EG7TkuqJ+1f612HWAecVdGSFWTT50F7etaFOMkm3Udkc4n07kTx3jLe9ENsmCeKVdrfHqahTHTVN5/vFPcfB4E4tL1NIhxm0y6sdp8ps32f+SMti44lyPO0sc6aVNEfZKTYbGe3EWNQzMH9MlXpvihZ5yWsEjNSxF/N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769945701; c=relaxed/simple;
	bh=Y377DvLnUIjlGLu/RqWsQKaky9tPtLIOV3/v25fUJJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mALHDqTsH34yzD9WDf29CVXlrAR3ZqnMGFLEJzg9+Q375OcIdwyZn78mvY+ra7IB339r41lMaV/AqzOBopeme+ayLluCO1l7N93d4eIRaiHGq/MsUXiBGWeS8sCyC00eIMxPnGNukZQ2nTjqSI5Txbb6sGVBE9Aeqkq8RD4zEBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbGCCQDV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso1913669b3a.0
        for <linux-usb@vger.kernel.org>; Sun, 01 Feb 2026 03:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769945700; x=1770550500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zq91DbVOttbOokKYAPkn2YF5dlqfbHUG1A6X83/uDqk=;
        b=fbGCCQDVplSDZtrzQe6xgy4xxMFUzokqcrXO1esHpB+tVuXIovCKw4huywhnjknROX
         sJHA/4xjBKR4En3phXLln9C1vGDVfj9icClLKCI+ugQTrfl3xLL3ZBqttOXtMddQAqlu
         VBArO1mTpqKgHGdIZkfWIpFcxYpQWB/HBfp5f/6jiqWsbQ0p4o0ZfjmXwKqymj0tet8w
         7CpquPazlKQyNktzLnCV6XUh5BOqoXQ5oWELP6qeulZDSYJspH/QFq+fFVkSpINY/ERr
         lAYqGwvm779G8GIQVKcBO4Bkk15IN2xGoG1klK5RdC7bgpsZ7DDBv0LYBjhETUkNQZAx
         3UhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769945700; x=1770550500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zq91DbVOttbOokKYAPkn2YF5dlqfbHUG1A6X83/uDqk=;
        b=UiG1R6vIhxtqkvTNLrTPJ40iE4rFet5Qk7zLSGcpgXznsawGCLS9cH8Jd2lPznJ3C/
         cPWazwtY2uFuyIs+O/XAPI2ZxocctwlVrquGCogBG6jcG8XjoeetJ68kZlfKSPhgKyYI
         yuUEnHA+bWDulyNErmoUqbhmHya6iwF3+ApQ1gCyAwlCp3i2UsiXiBVIcQ5H0wMej1GC
         bIU61LyiBThciZ8eoXstp/p+6J+hEwQmI/Qa4iGzW1tYbSbZNfG4iNOuM3mkbrjliTju
         d8ei95NRMvg0LURlyAdZ5q6+TJ6/0zrb8t/cMle/MJ1qUxBKcs8FpEiuGkV+72EsH6Ab
         uSlg==
X-Gm-Message-State: AOJu0Yw3cldOkffxnbCi16MWZDg9sAEtV2zgBycgNGwVhBstfE7gHGYa
	A1YPD8I3dF4x8ztZ7z/jfx4S5FRLTogQqc8bagNuurirkT1/0aGdeclu
X-Gm-Gg: AZuq6aI35zHZkzrsmk3NZjk5CTqnDJGoksO4A77wOVyn793AGHmDOc9GOlh3oYlTBMd
	LWugJeg5MuAnzUtm8hCBYVZqsboLDQc+N7AF6tHq/oPm+8vdfYydIvIbECzQTKLRYg3+7DClCqb
	xPBFOIfthuwHLXTO6BrlDaYWP/Fjqu02ZgRVnTpnmgCM+Jg9KhrC8YQNHM5SC15GwfIP/7j6/0A
	oJGTX+o6g6EnK47fuEJx1vYuA2gFHrEJHy0bS53A6+MKE+Q9csmDXQoZ60XM2JKalG+xQ1eHwCB
	ALjO1sCBX/p8VM4aKA3h8lhfRYMxtnVF+dHdekQLJlGikI9Cq0uGjbs8gIeQTPsxWWYb9QgTAb6
	17OlM2nCqWnMVCic/zJmaXfGEYFidygjAtVgQwXeL0lb/6aN1CdMCpq1mgCqPAJxb+wF/tqxY1W
	GjHl2jDNV/EgX0Q0C020HFQw0crKvFdtyB8w==
X-Received: by 2002:a05:6a00:4b46:b0:821:70e7:b10a with SMTP id d2e1a72fcca58-823aa40d7e9mr9801911b3a.8.1769945699636;
        Sun, 01 Feb 2026 03:34:59 -0800 (PST)
Received: from Black-Pearl.localdomain ([115.99.252.105])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82379c24083sm12994728b3a.55.2026.02.01.03.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:34:59 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sun, 01 Feb 2026 11:34:20 +0000
Subject: [PATCH 1/4] dt-bindings: usb: atmel,at91rm9200-ohci: convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-atmel-usb-v1-1-d1a3e93003f1@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-32973-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,bootlin.com:email,microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 97904C5C5B
X-Rspamd-Action: no action

Convert Atmel AT91RM9200 / AT91SAM9 style OHCI USB Host
Controller binding to DT schema.
Changes during conversion:
- Include "usb-ohci" as a fallback compatible to allow at91 OHCI
  driver matching.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91rm9200-ohci.yaml        | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91rm9200-ohci.yaml b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-ohci.yaml
new file mode 100644
index 000000000000..f04de6d553d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-ohci.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/atmel,at91rm9200-ohci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AT91RM9200 / AT91SAM9 style OHCI USB Host Controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The Atmel AT91RM9200 / AT91SAM9 OHCI USB Host Controller implements a
+  USB 1.1 Open Host Controller Interface (OHCI) compliant host interface.
+  It provides low-speed and full-speed USB host functionality and is
+  integrated into Atmel AT91RM9200 and AT91SAM9 family SoCs.
+
+allOf:
+  - $ref: /schemas/usb/usb.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: atmel,at91rm9200-ohci
+          - const: usb-ohci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ohci_clk
+      - const: hclk
+      - const: uhpck
+
+  num-ports:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of downstream ports supported by this OHCI controller
+    minimum: 1
+    maximum: 15
+
+  atmel,vbus-gpio:
+    description: GPIO used to control or sense the USB VBUS power.
+    minItems: 1
+    maxItems: 3
+
+  atmel,oc-gpio:
+    description: GPIO used to signal USB overcurrent condition.
+    minItems: 1
+    maxItems: 3
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
+    #include <dt-bindings/gpio/gpio.h>
+    usb@500000 {
+        compatible = "atmel,at91rm9200-ohci", "usb-ohci";
+        reg = <0x500000 0x100000>;
+        interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&uhphs_clk>, <&uhphs_clk>, <&uhpck>;
+        clock-names = "ohci_clk", "hclk", "uhpck";
+        atmel,vbus-gpio = <&pioA 18 GPIO_ACTIVE_HIGH>;
+        atmel,oc-gpio   = <&pioB 10 GPIO_ACTIVE_LOW>;
+        num-ports = <2>;
+    };
+...

-- 
2.52.0


