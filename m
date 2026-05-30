Return-Path: <linux-usb+bounces-38172-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAEvLOhLGmpH2wgAu9opvQ
	(envelope-from <linux-usb+bounces-38172-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 04:31:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1041760AF4E
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 04:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66E763068844
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 02:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DDA3375CB;
	Sat, 30 May 2026 02:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4GPjY96"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44953332ED0
	for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 02:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780108240; cv=none; b=TE3KChjy0lmLSIXMtzsNV9XLxiqdE72qZyflViFWoi1NQnI24hU/EIptcs9ehehEnq6nh6PgVoyezAIvjBhVlrY6DHgsAm4RQd5xAlUnR+mcE8SYJpvpWXwOrdKojNn70XWAxBcN6qPNb7EsdgK/wbxxZ35Rs/ZHI/XpEC4MzKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780108240; c=relaxed/simple;
	bh=dOo2TbnH1D1B28HE6DUJh2Xh4SEXuam/lKxk6r3ylno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5oaGb3waLZgAVXrqo3pbok1EehwwUffIrvlzexMe+2IyVVgjYrbqh9rzaIB6sb9ZCvUwkEUafpUVoLWWXUO5lTuRfoT8BTYB1QEnD1eEZeDlxeRgV7c6dJ3qVnWQYD9hngUp5JEwMh25OPgeIl3AUVviu6jIWXO6IMPX32inL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4GPjY96; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304e58292d3so3416054eec.0
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 19:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780108238; x=1780713038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TsYb+3sNL5FDjAy76HDFa2ZViKun8LLgEbVEq1nltc=;
        b=b4GPjY96mBMoDTKhKq8eM1LFz56ii5F6EYvwZRLuxJmfMRfXQH0fIZmYfMgUA9aKUS
         i0PuSzpAiSCc/WrvEAyd+UwDHd0KWUztC+XOfIbTKQzNvV/d+fKMSTNIjwvF5VEMN7cC
         nKrIt7IzNAfHNAU60r5R3mD4lSDpJHdPBnPLrRsaiE1+J8NyWJiCOBX/rPkD0A+TmPrI
         RzH3yvpQj4LdfuhbbMWr/gwLgXrlXdrL5lo/v6o8WwRAz5Li1UrCbnpKsvwC/Etys4u9
         +uXHoiftBLb/2/XAFOSbvP4ErosX4i9wOjxLrVFUOyAxLzhI2hM/0SNjTzXIB8WQDeL7
         OLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780108238; x=1780713038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5TsYb+3sNL5FDjAy76HDFa2ZViKun8LLgEbVEq1nltc=;
        b=K5vV08IFujmLLJ5j2iXjDPqp5jRloTlZ0FApYm6QQAbcpVVrlxEK3JduWB72Kl7Qjn
         xggCpFZmqGROepWUU2r7VmI6H6rURqwQCpgXokhxQcuh6sTJK31qid2hTApOtFjsW1m7
         RAc+Pl5ZOaoeT15WCbohXQU2VjKJnaulJmc+yttf/flURm3XtfGD6rdPTeGVXmOQBTKy
         3i1/9VTWujJP9KQrcKGXMnStSNBy2yDIVDnBiwKejOqi+OlY9B7qeYoYrWLC+SuvcLxA
         P8V7zUbjgv8d6T38JuzEMy0NhK4DmgJP+7OUMKafykTjhzZit4yNwaokVBsUDxFAJv1i
         Gvzw==
X-Forwarded-Encrypted: i=1; AFNElJ/w9eqGfArvoGtirc3QQ8uQVPfbdQl1j6reQteEPQ4R30PDq96P940iQmf24TM5Wt2Q8sNVSvKQuks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7T1XbXACOlpHgDvVfI7LjA9mVhPahbqrk97K8wSOUIxO043lo
	N0l90KXvxA3Qp6cp0HgA4cSSpZfa1a4v3bN339wi+hYEHPucBksG8h8E
X-Gm-Gg: Acq92OESWeOt/fcZTsiZXITvLG5s6fDc8ZJA9lv6vEk6ewjDdHj0A6gYv/HVLwps3oY
	gqQ1kXLJMM07m5ttZ/eV42HbcfO2TMwXOIShN64yfH/ThS5IKPu6sQJGZlneFgRGB0fAkgPXtGr
	uade+5aOoNky5sulpjcoaDGCRalPZFjdUsk8UUyCeUve99+rSq+50GSYqLq1AElyA7Rr01l2nBl
	k4asYPAeWurBohtIeFo+znuu3onLM8WqEChbUBt5SxCf47Fex4w7rah0bxL+5+mY641kNI0FLBJ
	D+Q48ZUkQdjdIhGZRAThw3qT7wIyKdXz+lrOlRhzsq3ZwKReFqwz6sPzEi+AaICGvN8dHwHDdvQ
	GA6ieakxoA7s5Zl2FfqsIMxBnW6eg3AwSx4yyHapRA+Dzbk4dCyRf6gehRVaJltX/6t9VNz0nMC
	OAbYKU/UjowtiMjVuqxP7aCJOr1cnsSMEfekbP1Il3vqeaAvGeWKr6xb+hxg==
X-Received: by 2002:a05:7300:2201:b0:304:d8cb:8424 with SMTP id 5a478bee46e88-304fa546886mr1124489eec.9.1780108238255;
        Fri, 29 May 2026 19:30:38 -0700 (PDT)
Received: from localhost.localdomain ([76.173.186.92])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2efb4esm2976829eec.8.2026.05.29.19.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 19:30:37 -0700 (PDT)
From: Jeremiah Bishop <jbishop.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeremiah Bishop <jbishop.dev@gmail.com>
Subject: [PATCH v2] dt-bindings: usb: convert PXA USB bindings to YAML
Date: Fri, 29 May 2026 16:29:55 -1000
Message-ID: <20260530022955.32728-1-jbishop.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529213506.37462-1-jbishop.dev@gmail.com>
References: <20260529213506.37462-1-jbishop.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38172-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,rowland.harvard.edu,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbishopdev@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,2.107.129.192:email,harvard.edu:email]
X-Rspamd-Queue-Id: 1041760AF4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the legacy pxa-usb.txt binding documentation to YAML schemas.

The original text binding documented two distinct devices: the PXA OHCI
USB host controller and the PXA270 USB device controller. Split the
documentation into separate schemas, marvell,pxa-ohci.yaml and
marvell,pxa270-udc.yaml, and remove the obsolete text binding.

The schemas preserve the existing compatible strings and properties used
by current in-tree users while adding machine-readable validation and
examples.

Signed-off-by: Jeremiah Bishop <jbishop.dev@gmail.com>
---
Changes in v2:
- Add vbus1-supply, vbus2-supply, and vbus3-supply properties to the
  PXA OHCI schema.

 .../bindings/usb/marvell,pxa-ohci.yaml        | 100 ++++++++++++++++++
 .../bindings/usb/marvell,pxa270-udc.yaml      |  50 +++++++++
 .../devicetree/bindings/usb/pxa-usb.txt       |  53 ----------
 3 files changed, 150 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/marvell,pxa270-udc.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/pxa-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
new file mode 100644
index 000000000000..5d660b92d3cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/marvell,pxa-ohci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell PXA OHCI USB Host Controller
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+  - Alan Stern <stern@rowland.harvard.edu>
+
+allOf:
+  - $ref: usb-hcd.yaml#
+
+properties:
+  compatible:
+    const: marvell,pxa-ohci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  marvell,enable-port1:
+    type: boolean
+    description: Enable USB port 1 if present.
+
+  marvell,enable-port2:
+    type: boolean
+    description: Enable USB port 2 if present.
+
+  marvell,enable-port3:
+    type: boolean
+    description: Enable USB port 3 if present.
+
+  marvell,port-sense-low:
+    type: boolean
+    description: Port sense pin in low-active.
+
+  marvell,power-control-low:
+    type: boolean
+    description: Power control pin is low-active.
+
+  marvell,no-oc-protection:
+    type: boolean
+    description: Disable over-current protection.
+
+  marvell,oc-mode-perport:
+    type: boolean
+    description: Enable per-port over-current protection.
+
+  marvell,power-on-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Power On to Power Good time in milliseconds.
+
+  marvell,port-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3]
+    description: |
+      Selects the mode of the ports.
+        1 = PMM_NPS_MODE
+        2 = PMM_GLOBAL_MODE
+        3 = PMM_PERPORT_MODE
+
+  marvell,power-budget:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: USB power budget.
+
+  vbus1-supply:
+    description: Regulator supplying VBUS for port 1.
+
+  vbus2-supply:
+    description: Regulator supplying VBUS for port 2.
+
+  vbus3-supply:
+    description: Regulator supplying VBUS for port 3.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@4c000000 {
+        compatible = "marvell,pxa-ohci";
+        reg = <0x4c000000 0x100000>;
+        interrupts = <3>;
+        clocks = <&clks 11>;
+        marvell,enable-port1;
+        marvell,port-mode = <2>; /* PMM_GLOBAL_MODE */
+    };
diff --git a/Documentation/devicetree/bindings/usb/marvell,pxa270-udc.yaml b/Documentation/devicetree/bindings/usb/marvell,pxa270-udc.yaml
new file mode 100644
index 000000000000..0be51e0db80b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/marvell,pxa270-udc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/marvell,pxa270-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell PXA27x USB Device Controller (UDC)
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+properties:
+  compatible:
+    const: marvell,pxa270-udc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  gpios:
+    maxItems: 1
+    description: GPIO to control the USB D+ pullup.
+
+  phys:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    udc@40600000 {
+        compatible = "marvell,pxa270-udc";
+        reg = <0x40600000 0x10000>;
+        interrupts = <11>;
+        clocks = <&clks 11>;
+        gpios = <&gpio 22 GPIO_ACTIVE_LOW>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/pxa-usb.txt b/Documentation/devicetree/bindings/usb/pxa-usb.txt
deleted file mode 100644
index 53fdae4fa6f6..000000000000
--- a/Documentation/devicetree/bindings/usb/pxa-usb.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-PXA USB controllers
-
-OHCI
-
-Required properties:
- - compatible: Should be "marvell,pxa-ohci" for USB controllers
-   used in host mode.
-
-Optional properties:
- - "marvell,enable-port1", "marvell,enable-port2", "marvell,enable-port3"
-   If present, enables the appropriate USB port of the controller.
- - "marvell,port-mode" selects the mode of the ports:
-	1 = PMM_NPS_MODE
-	2 = PMM_GLOBAL_MODE
-	3 = PMM_PERPORT_MODE
- - "marvell,power-sense-low" - power sense pin is low-active.
- - "marvell,power-control-low" - power control pin is low-active.
- - "marvell,no-oc-protection" - disable over-current protection.
- - "marvell,oc-mode-perport" - enable per-port over-current protection.
- - "marvell,power_on_delay" Power On to Power Good time - in ms.
-
-Example:
-
-	usb0: ohci@4c000000 {
-		compatible = "marvell,pxa-ohci";
-		reg = <0x4c000000 0x100000>;
-		interrupts = <18>;
-		marvell,enable-port1;
-		marvell,port-mode = <2>; /* PMM_GLOBAL_MODE */
-	};
-
-UDC
-
-Required properties:
- - compatible: Should be "marvell,pxa270-udc" for USB controllers
-   used in device mode.
- - reg: usb device MMIO address space
- - interrupts: single interrupt generated by the UDC IP
- - clocks: input clock of the UDC IP (see clock-bindings.txt)
-
-Optional properties:
- - gpios:
-   - gpio activated to control the USB D+ pullup (see gpio.txt)
-
-Example:
-
-		pxa27x_udc: udc@40600000 {
-			compatible = "marvell,pxa270-udc";
-			reg = <0x40600000 0x10000>;
-			interrupts = <11>;
-			clocks = <&pxa2xx_clks 11>;
-			gpios = <&gpio 22 GPIO_ACTIVE_LOW>;
-		};
-- 
2.43.0


