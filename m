Return-Path: <linux-usb+bounces-32837-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKm8CUj5eGlFuQEAu9opvQ
	(envelope-from <linux-usb+bounces-32837-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 18:43:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 796DC98991
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 18:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E2E530740C9
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 17:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C60320A0D;
	Tue, 27 Jan 2026 17:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvkPFdie"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6503242CF
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535751; cv=none; b=pSLMWLHIm0qXQfmLIA0ZJJPuOMPVPf3gdzHP3FbF7useMBH58+RFv45gPya5AHYEFlZYkJcUHjk2dby5fuFZgR2ixhI/BrxiPA15/S52fAFP4CdXtEcRRuH/abxBAqwCu7FvLZ0YH0qjh0FThRBZRrleoGPaVuJ0OPiLeIDThGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535751; c=relaxed/simple;
	bh=4V4W9RP5kRoxw48NKQ2W22yEt3obXwvxUNoMxf9i/xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QdLOFQCBuepxo2mv2B5zUnXUlhiy/YKABJv1ruob220Ee2NTKu1YwaJf+ezVJpVTT7fatLpM030bRzWm1g7gzt3fZArY/lOr/sAtfvNm6u4TeDnf/r9cxzJ9CpPBKweEsksapYdodTuFomLLxn/jV+ihUE2o1p60x6Kk0lJFii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvkPFdie; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82318b640beso2477930b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 09:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769535744; x=1770140544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ilP7qxMWQg+G58bC8nFVdbjHonl73Ir3/PIz7djdzo=;
        b=OvkPFdiev0eOPYoBdw1R+IMZ6ZckImPa1zK7gcqE1e5+Bv7BtzB8AnfLhJHj0nii2z
         lFRQVZe3gNJNVkLocTFYtxvlsSbDIgq7I5e3Yy6kFfyoxKam18k6PIUMZrrU1tqLhaTj
         qyquZaNB71ZN5M40TIQYdQEgBZSnZDud/Rk9DV2bpHIxqSQ7XW4gELriEGboiWk31HKk
         X0mLHBwU0rkvr10dmqDkWBDDgaLTV7r3ZqeKwR49NGH7CXtepgzutgI1NDBqEh36Pueh
         QBxlYLV8jNn7RgnWsrZe0NP24oxpQ2b6rdrFunSqhv05aePMIkdX+gyBEsLxmbgsBP/M
         unYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769535744; x=1770140544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4ilP7qxMWQg+G58bC8nFVdbjHonl73Ir3/PIz7djdzo=;
        b=LvuThOYXFRJvQuzx1REMOQTlewBhvJv4zrxXfkGjgkPKl9CfwpLBLICXOgk0ECx0q0
         mLPHbjV9o5evGfVgnAhE6ebKiCpArpg18itdHbxHoLPOABa2vlzWq2mRbNvgRu/KANwk
         u7QUjn9wbUtxq9NYRIdN7VakN+zdMvMsCCKu79PEXE+SSICZmDPR/aZHM9bRdze1VG3f
         sJVk++PdjfkByLnSqx6s0FSdVzNN4idzhdmtR3aPi3ih39sGuzsEp2BRBa3k3OWHjlw8
         FdQ4ook0w9KpSgyrdxwFaA9a3MWLXLnbhMoXar9sQcrisARDRI/3qTHA0GGyg5stXLlE
         ondA==
X-Gm-Message-State: AOJu0YwSjSZvKfcVyYeYs4uCnCeV27vzBoKS5rqraIHtkJ3UsDxLGtqU
	gIia5767sa6jS6XyU7sJKe5R25no/U9Kd8Nfqzu1LAW/2B0pPHNQ3Ys/
X-Gm-Gg: AZuq6aJFERdLLQ8ns1yjtk4ZUC6lGqSRC/PYo1pAwJ23KLZk0F3b1CTuiJ8dou49gB/
	BRr0bsGz+Pv2uAL8YYafpoi2j5a0NEVPlJbViYas2thclBeRWoIEcKdIDQLO8+k+nLrBm2uvuAq
	L1BqgDmFbBSiSd4S3yPINiQkwD14OGXmEj+/8lM9etukX9OVasU/WC53kRWpAPmHFhyA2neUN+d
	Qk0bO9mTKmwXmhx3hsRGXQyuJ1fO8ZdpxmESezyVm0nqWFJIlHgqpCGZtJgb0Ern8CUvebd+m1r
	Y9ArMu7JFaHGuixmHfMv+/4YNeJbniMNYdMfW8ltgysEOnLcjZ7FwiO/b0g5CO3ueVF9Vps9Q5y
	3ZR5LDkKECZqVFNYvG45eS6svA8o4RQHvsyeB/iV4cXo53YRWBGqUBJsvJbpMzsE1sRpDZe/4cr
	XkyOcbe1RaJzLp+CeJoWM15huE+xn6nLgB+g==
X-Received: by 2002:a17:90b:2c86:b0:34c:2f3f:d27e with SMTP id 98e67ed59e1d1-353feccaa0emr2272522a91.3.1769535744145;
        Tue, 27 Jan 2026 09:42:24 -0800 (PST)
Received: from Black-Pearl.localdomain ([115.99.251.203])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3540f2cae91sm89251a91.4.2026.01.27.09.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:42:23 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Tue, 27 Jan 2026 17:42:14 +0000
Subject: [PATCH v2 2/2] dt-bindings: usb: ti,dwc3: convert to DT schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-ti-usb-v2-2-9dd6a65b43df@gmail.com>
References: <20260127-ti-usb-v2-0-9dd6a65b43df@gmail.com>
In-Reply-To: <20260127-ti-usb-v2-0-9dd6a65b43df@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@ti.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32837-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,devicetree.org:url,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4a0ab000:email,0.0.39.16:email]
X-Rspamd-Queue-Id: 796DC98991
X-Rspamd-Action: no action

Convert OMAP DWC3 USB Glue Layer binding to DT schema.
Changes made during the conversion:
- Drop the ti,hwmods property, as it is not used by any in-tree DTS files.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 Documentation/devicetree/bindings/usb/omap-usb.txt |  80 -----------------
 Documentation/devicetree/bindings/usb/ti,dwc3.yaml | 100 +++++++++++++++++++++
 2 files changed, 100 insertions(+), 80 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/omap-usb.txt b/Documentation/devicetree/bindings/usb/omap-usb.txt
deleted file mode 100644
index f0dbc5ae45ae..000000000000
--- a/Documentation/devicetree/bindings/usb/omap-usb.txt
+++ /dev/null
@@ -1,80 +0,0 @@
-OMAP GLUE AND OTHER OMAP SPECIFIC COMPONENTS
-
-OMAP MUSB GLUE
- - compatible : Should be "ti,omap4-musb" or "ti,omap3-musb"
- - ti,hwmods : must be "usb_otg_hs"
- - multipoint : Should be "1" indicating the musb controller supports
-   multipoint. This is a MUSB configuration-specific setting.
- - num-eps : Specifies the number of endpoints. This is also a
-   MUSB configuration-specific setting. Should be set to "16"
- - ram-bits : Specifies the ram address size. Should be set to "12"
- - interface-type : This is a board specific setting to describe the type of
-   interface between the controller and the phy. It should be "0" or "1"
-   specifying ULPI and UTMI respectively.
- - mode : Should be "3" to represent OTG. "1" signifies HOST and "2"
-   represents PERIPHERAL.
- - power : Should be "50". This signifies the controller can supply up to
-   100mA when operating in host mode.
- - usb-phy : the phandle for the PHY device
- - phys : the phandle for the PHY device (used by generic PHY framework)
- - phy-names : the names of the PHY corresponding to the PHYs present in the
-   *phy* phandle.
-
-Optional properties:
- - ctrl-module : phandle of the control module this glue uses to write to
-   mailbox
-
-SOC specific device node entry
-usb_otg_hs: usb_otg_hs@4a0ab000 {
-	compatible = "ti,omap4-musb";
-	ti,hwmods = "usb_otg_hs";
-	multipoint = <1>;
-	num-eps = <16>;
-	ram-bits = <12>;
-	ctrl-module = <&omap_control_usb>;
-	phys = <&usb2_phy>;
-	phy-names = "usb2-phy";
-};
-
-Board specific device node entry
-&usb_otg_hs {
-	interface-type = <1>;
-	mode = <3>;
-	power = <50>;
-};
-
-OMAP DWC3 GLUE
- - compatible : Should be
-	* "ti,dwc3" for OMAP5 and DRA7
-	* "ti,am437x-dwc3" for AM437x
- - ti,hwmods : Should be "usb_otg_ss"
- - reg : Address and length of the register set for the device.
- - interrupts : The irq number of this device that is used to interrupt the
-   MPU
- - #address-cells, #size-cells : Must be present if the device has sub-nodes
- - utmi-mode : controls the source of UTMI/PIPE status for VBUS and OTG ID.
-   It should be set to "1" for HW mode and "2" for SW mode.
- - ranges: the child address space are mapped 1:1 onto the parent address space
-
-Optional Properties:
- - extcon : phandle for the extcon device omap dwc3 uses to detect
-   connect/disconnect events.
- - vbus-supply : phandle to the regulator device tree node if needed.
-
-Sub-nodes:
-The dwc3 core should be added as subnode to omap dwc3 glue.
-- dwc3 :
-   The binding details of dwc3 can be found in:
-   Documentation/devicetree/bindings/usb/snps,dwc3.yaml
-
-omap_dwc3 {
-	compatible = "ti,dwc3";
-	ti,hwmods = "usb_otg_ss";
-	reg = <0x4a020000 0x1ff>;
-	interrupts = <0 93 4>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-	utmi-mode = <2>;
-	ranges;
-};
-
diff --git a/Documentation/devicetree/bindings/usb/ti,dwc3.yaml b/Documentation/devicetree/bindings/usb/ti,dwc3.yaml
new file mode 100644
index 000000000000..77ac11c3b2db
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,dwc3.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments OMAP DWC3 USB Glue Layer
+
+maintainers:
+  - Felipe Balbi <balbi@ti.com>
+
+description:
+  Texas Instruments glue layer for Synopsys DesignWare USB3 (DWC3)
+  controller on OMAP and AM43xx SoCs. Manages SoC-specific integration
+  including register mapping, interrupt routing, UTMI/PIPE interface mode
+  selection (HW/SW), and child DWC3 core instantiation via address space
+  translation. Supports both legacy single-instance and multi-instance
+  (numbered) configurations.
+
+properties:
+  compatible:
+    enum:
+      - ti,dwc3
+      - ti,am437x-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  utmi-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Controls the source of UTMI/PIPE status for VBUS and OTG ID.
+      1 for HW mode, 2 for SW mode.
+    enum: [1, 2]
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+  extcon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle for the extcon device used to detect connect/
+      disconnect events.
+
+  vbus-supply:
+    description: Phandle to the regulator device tree node if needed.
+
+patternProperties:
+  "^usb@[0-9a-f]+$":
+    type: object
+    $ref: snps,dwc3.yaml#
+    unevaluatedProperties: false
+
+required:
+  - reg
+  - compatible
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+  - utmi-mode
+  - ranges
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    omap_dwc3_1@0 {
+        compatible = "ti,dwc3";
+        reg = <0x0 0x10000>;
+        interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        utmi-mode = <2>;
+        ranges = <0 0 0x20000>;
+
+        usb@10000 {
+            compatible = "snps,dwc3";
+            reg = <0x10000 0x17000>;
+            interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "peripheral", "host", "otg";
+            phys = <&usb2_phy1>, <&usb3_phy1>;
+            phy-names = "usb2-phy", "usb3-phy";
+            maximum-speed = "super-speed";
+            dr_mode = "otg";
+            snps,dis_u3_susphy_quirk;
+            snps,dis_u2_susphy_quirk;
+        };
+    };
+...

-- 
2.52.0


