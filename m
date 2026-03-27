Return-Path: <linux-usb+bounces-35570-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GOOOTG1xmnFNwUAu9opvQ
	(envelope-from <linux-usb+bounces-35570-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 17:49:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3AD347CC3
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 17:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FAA53071DE1
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 16:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919B3363C4D;
	Fri, 27 Mar 2026 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxplJA9i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893883624AA
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 16:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630084; cv=none; b=Vk1JAgTiNEsJYQNWIzSZhOytonQOfCKnXfOJuozI1Q2oPqBJ3fdpdPDuiXfWeeHZc0ggOkzfdDamYh9Fz05uZFGNpZSPqeKIbUc9eJJocQCNRlELrIgzLVU3DAbuPqCfKRF5Zz5e3o1AWMVdP703MbFEjPgmYFzPP0YaeD9fJ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630084; c=relaxed/simple;
	bh=Z8MJ5nSQHTa5NXYBn3gqCApWzdTH+o38SeU1BHLtWhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUC9OX3K/4NeJgUl86vrDk9JzbhLAt0GKkii9NeGwNmZUrgkdl5BCWmRZ6gr4r+tViSQV6fclYumiLo9MfRvK2nO2p8Erbr6zM76zeGsw4ud38oeeBVmIOdjWjlxNMoz06Dwcl2IsROZua2qMr8u8/F7ihSYrZSej535PFkcXN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxplJA9i; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ab077e3f32so10729465ad.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 09:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630082; x=1775234882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcCW/GTEnEUFiHAWHz6f8JvJTk6/azgZ2oCG+4+XfEY=;
        b=CxplJA9i9OJgO/RNhyXa9jsPuQxkj/UT71a0QoPpaPcIHf+16YOY0da0kFjGr2XxPI
         KVUIRvgNsWIzN6itRrE/4NWQ8Zu9G2tB71SHifSeyPUAUTfG3hgqtiqyL4nMQhjzVzyp
         vu1AxK865pjCLiK0aoQo//J3gSdf1bSOuLHSsF+B46Xg67wHexF/HvqaR/CHyqY5HugP
         KDRk1pgjJRXFJeG8KSAijndw+J+Plq8Zcy3tnOBWSd/W35q6mL9w0j7ucCK/Ob2s+V2E
         oC3gv7I6rcBnKqGRptoKp7vtC4VNUFNgKxEOoMCbrc+9Myjowman1NHEKkecSqzuPrSV
         pSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630082; x=1775234882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KcCW/GTEnEUFiHAWHz6f8JvJTk6/azgZ2oCG+4+XfEY=;
        b=k+58hMJvM9xT5PqN1H/C0T9dS3J+tHdVSbEQ1JihoY6fQC5x6QEScGlJ7cQ/6rdoZ8
         93SNAP77kfqYmTcMerr5BxVrfLU3wVCQ3sMD5+33REEQGi14150O2r9F3Be6NVaWWwX+
         AXhC+VH4NcDDVWLZFsHeb66NJ+nsDavOUTaMnF/HXPZbRfsU6vfpZM2fAoHkfMSEyiA/
         TEg45ywBEU4USbL6OAkja6Nz9yKCnKlrHknNlaabmLU2jE9osB/Dr0cbvw0qCFV3Vqz8
         6lmjv5uqF/ugxN+7X7FHmF4S6evAettl3lNJ0CZh7FloRpaq6bgBxPwYY8vRXv2V/Zo3
         rxew==
X-Gm-Message-State: AOJu0Yy6v35is20/8i4JAkSifbLxzRG0FZMiVMlLWCBcSZJ4FTtLpyah
	Vyneo9hRkC5DzjpLOcwJ/4f83cF/6hn2CWaknudw1vHPRB57n3hk/sVx
X-Gm-Gg: ATEYQzzJbIcvlRNU5Jon7cAEabbvMjKgIxBUbe+90SnGhY9hQX3XrLIflFIQYPtKl5W
	xJjTVkZnkLRu1zb5DOi33B2qcODAZ0h/5ljpylHhDIC/oVy/ZdmOMuVJ26HHHw4PizeU9lFwiv1
	IJ2UWk+bZB0PgtVQh8XuB+yciamunHW3reUEc0REkrQVPt2tOPSfiXg5jwacCL289z24l6aSrTG
	Hp7XX9LnBh/AT/lvz2u5wMkxjtGAVNUINWENeq1G8fTElxLy1vyJySFAT+GKzPhdxKosUXZPwLS
	pYP3mSuaRpFDWvVyi403Fafpv/lf6p9kcz7yeSeCI0VkZAJ13r1F4bPK0J/YjOO3ANFY/P+5Ane
	fnQnux44PR0asSYX+vxQHSLbefGku2X2XHyuHbGr1/nwRK7kWxKI7iQPbqoH1wIBimOUQ5p8RHQ
	/NwvRvF0N3vIlK9XS3eKwnw5dan8VHnw2sWTB/6HttpG4v
X-Received: by 2002:a17:902:cf03:b0:2b0:c451:aea8 with SMTP id d9443c01a7336-2b0cdc2a006mr32092775ad.14.1774630081879;
        Fri, 27 Mar 2026 09:48:01 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:48:01 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 27 Mar 2026 16:47:43 +0000
Subject: [PATCH v4 2/5] dt-bindings: usb: generic-ohci: add AT91RM9200 OHCI
 binding support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-atmel-usb-v4-2-eb8b6e49b29d@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-35570-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F3AD347CC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the Atmel AT91RM9200 OHCI USB host controller binding to DT schema
by defining it in the existing generic OHCI schema.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/usb/atmel-usb.txt          | 27 --------------
 .../devicetree/bindings/usb/generic-ohci.yaml      | 41 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index 12183ef47ee4..c09685283109 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -1,32 +1,5 @@
 Atmel SOC USB controllers
 
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
 EHCI
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 961cbf85eeb5..d42f448fa204 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -55,6 +55,7 @@ properties:
           - ti,ohci-omap3
       - items:
           - enum:
+              - atmel,at91rm9200-ohci
               - cavium,octeon-6335-ohci
               - nintendo,hollywood-usb-ohci
               - nxp,ohci-nxp
@@ -137,6 +138,24 @@ properties:
       The associated ISP1301 device. Necessary for the UDC controller for
       connecting to the USB physical layer.
 
+  atmel,vbus-gpio:
+    description:
+      GPIO used to control or sense the USB VBUS power. Each entry
+      represents a VBUS-related GPIO; count and order may vary by hardware.
+      Entries follow standard GPIO specifier format. A value of 0 indicates
+      an unused or unavailable VBUS signal.
+    minItems: 1
+    maxItems: 3
+
+  atmel,oc-gpio:
+    description:
+      GPIO used to signal USB overcurrent condition. Each entry represents
+      an OC detection GPIO; count and order may vary by hardware. Entries
+      follow standard GPIO specifier format. A value of 0 indicates an
+      unused or unavailable OC signal.
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
@@ -144,6 +163,28 @@ required:
 
 allOf:
   - $ref: usb-hcd.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: atmel,at91rm9200-ohci
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: ohci_clk
+            - const: hclk
+            - const: uhpck
+
+      required:
+        - clocks
+        - clock-names
+
+    else:
+      properties:
+        atmel,vbus-gpio: false
+        atmel,oc-gpio: false
+
   - if:
       not:
         properties:

-- 
2.53.0


