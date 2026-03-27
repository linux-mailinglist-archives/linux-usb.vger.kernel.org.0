Return-Path: <linux-usb+bounces-35571-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO9pMF61xmmgNwUAu9opvQ
	(envelope-from <linux-usb+bounces-35571-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 17:50:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6386A347CFF
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 17:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A30C3076CDC
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 16:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217F43644C6;
	Fri, 27 Mar 2026 16:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoM7aZyU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382C03644D4
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 16:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630088; cv=none; b=rygLGeYs0nVD/lvhoqPWdglBn4XbCyWrBj4odei8ykIR3gdBDRNDWrbzT2+3R9P4+V5OaYeFyXChcAY3rRjsF4CsCaPTOXK9RM1Ki9qC1VEy8VyL1XWIKVBcKtkHrAPM7Vf7WSLUsBkjQVlqVMJOmJx0NviBwsGZJj5EjzvA/AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630088; c=relaxed/simple;
	bh=fXXG1Cyzjh18AbX4b2uGKLKZm6cZcX80hBT/uwuFitM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UE89NE2u+IXllG5DzsFiAsik5q0rSpb2OT9lXdjX2GfYM2DANSlR2IrunLAR44zGmwLRk0/lNyArEo4aqiApLKH8qmwVmrz0S+354sByGXLGCw8fzqjfjk+7jaSA9N4HzqtFwz+QPx3eWVapiYwRqGIC1JLTnLfMacr0hpnyTaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoM7aZyU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b0c8362d93so11774345ad.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630086; x=1775234886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcW5pwvFh1W3aCrl8ykkfzRz1WOtzWb7PvDwxuJWqOk=;
        b=PoM7aZyUVq4XiZRXsnQ/n65GYYTf1jf5YoRnMBisi+2SJ14WUtFex+cgCEiJG3F0Vt
         nXkCBRUpJYEznP8UpeMDiE1dfq/TwT342wPMSEKLyKFYcUJASf+IadHoGSzCla0Cg90v
         9AY/DYmuF5YrkcjWkcSYa+P4RmXL1uIL1djT+/lOegT4B4pOegQdQmf9oztq6YDqgehN
         yzRZKfduYX1jMpF9Zl75zxflIQuuhcM9ZifGIxMwWzexmXeKXN9AIAAGbpxEfXMWm3sl
         vXFtVy1ocb2Q/Vyfdik8hsAfMEvJF3lLECywfpwWlj89XgMkHvRPV/7LQGZWL9MBhETW
         19Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630086; x=1775234886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CcW5pwvFh1W3aCrl8ykkfzRz1WOtzWb7PvDwxuJWqOk=;
        b=Faleab4ZBLkYIEeTRlCiGhpBa6IbnJpjkp5SsJEovh7rM/tLDk6aALgl/JvBlH/1d1
         j8U0KvmUy384SSUZPz6IP4HXRStlP8IQiP4qtJp17Ah6Sn8k4/Zm1s9obgHbWf9aLP0X
         TD2uEkjWK3TTEimJJIKRzjClkSBF5oNjqpmE7Q3/ABWW/vuwEbMlKR6xZl+dDES02viR
         wUg1m2PEKGJMFWNclgaZHe+u0FOUCK/N/rRRxnEfMBAMEq0K7hh0uKtbuA73SCe7V2Mv
         ZYPIesRPRLpfZdwFqppSC+5/PcNlWjBquca4qeu2VGI56hKvJycJ95xd8Tv0+/6qrMBS
         IIvw==
X-Gm-Message-State: AOJu0Yy/oqCYQIRKfPOhJFvG4lDOr8Jn+bUbY+jSNr4sIP7iwlXk61N9
	9C37rHbgRT6IGc5Ma/Ho3ARSmUex8SX2TRwQ2RzMQ4yOEky8epLWHeFf
X-Gm-Gg: ATEYQzx4hJW5qp3SF5KXY2fUusPPNHm/4ZXzA5BeUH38dV1VCuWOp8KlLXAQ/23o6h9
	rmOpeTR+Pc1K3u8MMuCmxkj6TWHcth2e9L3NBVkyoHqkbJ4RWiiy/J3BRmYwuSeyw8d+HS7ueHi
	NGzh4Vaza0QvFOmiPn6Z/m1+V73soyUXJBliBseokdk1xdENygjiBDa4/VTM1FE/eXGCV04zeQo
	kjaLlgAwHMr55/esMB3DdFWDa2m5eTG7iqF/fLKq5tMZy1Pu51+AQBZgXm64ZuMlaFeGYCplkQn
	fLKYdAV35o2UQ0cOHBPORnOcgCM57VPh1EOUIWY9i7Mfn9iFmWpu+vghP/tZOhNWxx+d9iXhlPk
	6h/bux3aahy1h1Hc+LGh3nIwaXL+CtqGcvsEfzogLgEcHI7ipglm2nJuqZzGuBIObT+ZUSSHxxU
	wH8P3qI5YFbB/qjgQ0J9WyOX8PnES+DCjlUl0QzqOYPpToYpUGXuhDgUo=
X-Received: by 2002:a17:903:a86:b0:2b0:603e:e13c with SMTP id d9443c01a7336-2b0cdc9eacfmr33580145ad.33.1774630086351;
        Fri, 27 Mar 2026 09:48:06 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:48:06 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 27 Mar 2026 16:47:44 +0000
Subject: [PATCH v4 3/5] dt-bindings: usb: generic-ehci: fix schema
 structure and add at91sam9g45 constraints
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-atmel-usb-v4-3-eb8b6e49b29d@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35571-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.12.53.0:email]
X-Rspamd-Queue-Id: 6386A347CFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add clock and phy constraints for atmel,at91sam9g45-ehci and reorganize
the allOf section to fix dtbs_check warnings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/usb/atmel-usb.txt          | 24 -----------
 .../devicetree/bindings/usb/generic-ehci.yaml      | 46 ++++++++++++++++------
 2 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index c09685283109..bf2149e5f0b3 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -1,29 +1,5 @@
 Atmel SOC USB controllers
 
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
 AT91 USB device controller
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 601f097c09a6..55a5aa7d7a54 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -9,19 +9,6 @@ title: USB EHCI Controller
 maintainers:
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 
-allOf:
-  - $ref: usb-hcd.yaml
-  - if:
-      properties:
-        compatible:
-          not:
-            contains:
-              const: ibm,usb-ehci-440epx
-    then:
-      properties:
-        reg:
-          maxItems: 1
-
 properties:
   compatible:
     oneOf:
@@ -167,6 +154,39 @@ required:
   - reg
   - interrupts
 
+allOf:
+  - $ref: usb-hcd.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: ibm,usb-ehci-440epx
+    then:
+      properties:
+        reg:
+          maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: atmel,at91sam9g45-ehci
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: usb_clk
+            - const: ehci_clk
+
+        phy_type:
+          enum:
+            - utmi
+            - hsic
+
+      required:
+        - clocks
+        - clock-names
+
 unevaluatedProperties: false
 
 examples:

-- 
2.53.0


