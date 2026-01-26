Return-Path: <linux-usb+bounces-32725-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI1HOzBrd2nCfQEAu9opvQ
	(envelope-from <linux-usb+bounces-32725-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 14:25:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9328588CA1
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 14:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 508E930747A2
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 13:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C427C338594;
	Mon, 26 Jan 2026 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUpOoAR+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E863019D9
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 13:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769433739; cv=none; b=c1CqAw7xWVv9vHFKXSiTrVnIEQ1KxwfyjMJgd6Mj3V7czbBHk88AjyPw89M+mqN1wL8lS0vbie2iC9yH2mJHRN7wJqmWju2ITXXK3t4uHiZ4kHeEvWJw/xW9NVStbDAkWdxOy6uF/ZkT+w4Qv5wbdoYzOQ/E99xi/TgUySQAecM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769433739; c=relaxed/simple;
	bh=hV0HFkDk7Y0DrpEXXZZld7ePFqj1GfpzDnGLxSrxS/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bVoD4uTTA3tSZCeu5X8zt6W19xqBgK29rsCcLkY/hpXgQ69Rw6eZx5rVAAG/Tx6rz9spKICL9nv8FCUdEmfp5XuaQZXAT5RZnvZZAvmWw83HEJ8eijTflaUFi+vWaYERlWLFJAcPZxS0wIEntF7Dh6OCAuKMIReDEK2JxjtP0og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUpOoAR+; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so1644059a12.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 05:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769433737; x=1770038537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcbMiQsJB40EYOu8uLFm79D1kLu7v22jBDTwBj1l4qQ=;
        b=eUpOoAR+lRrFF0Sdjz012B37lC9FTBFXrf8ZsQrF/Zka/IJaY30UuNzuc6nn1mmQyU
         ojlcpeiplTLvT0fbSfYztCgWb/eg7l0YukHqtctgZypWsoGFox0KX4bTT33tyZReQb7w
         v9ZGPrRNSeZ6FwkAO1t6wDM+3olb5xwl9QOfeX4aGCNTER5xtsggAywKSbB21ZKjjdqr
         rRAc/qzcoNBmY6ovlT3aX5C5nuZ1AEnRKI2TUXWiyoQnf5p+D232lv/9AsVwuXQOZ8r9
         5Qjun1ghoWmLXmaB92l40i6msO/9gOAWi98/dbmC9q207FDxPtnwxcQGXn7L+WF3AHJd
         ylxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769433737; x=1770038537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pcbMiQsJB40EYOu8uLFm79D1kLu7v22jBDTwBj1l4qQ=;
        b=EgohpyXZWvIRp03cbYwLOt3SdGnP3YQxkkkli9ch0kGqck6yZGoY+odgEwkwnzfHR8
         gJ8IPpoDjF88tQxSqjRV4I0ZjeZTTD8HLegBtZv659HYd/rtywLJT5ZmpMsO8qnSzL5i
         yGTQyQg/OBBv91t23dWhNDk/UOMhdr6qwTqgH4IKC17SamXlZOR7NRFV8V1ceoKnLlkj
         7NbDIto/F8yNYvFNYfkEjuzCN/U8SHyCTYbKKs4KOPvwTtgy7ubbUzIvuAEAOKJb5W8r
         x7EHCS1D3wnFuhnIT+/5Y1/TY7R7Wo6AWPlJm5ILOoc9H4R0uwrS/D5EACHufhrdQP0k
         IYtA==
X-Gm-Message-State: AOJu0YwH/hKjCTK1OUXOhJcsYpJd63SPp5rbiVBzdB3C8lYEknkSQRtQ
	2ZvesS4/omG39cHaGDfZQAls/DPtiP/dST1Y8pzYzDL34NdOGZj39qGQlNftpg==
X-Gm-Gg: AZuq6aIi8ewgtxbXI/4n8Ra/KYQp21eBVQeE6TD8MYimq7AFG95x23W2kPsiTd9IHaX
	cE3iXyQdlcsEtlF1pSsJcGoBygomonMQLMf8Z4m8rvO067fXWtSopMwQG6eVyakYmUFx+4eb6WG
	/Rmy+jRvpl3bF7/fyXM+R3bqQaKZ1jfNYYoErwpxXsFGoK7zjzg/QYMzuDOaLIUlbPffYlPzV3s
	516zqrd8XxptGQNLm+ANJyNPWx7KHqkHa8AVT6xFMnxM6U4LnrFIaIvqlR9kPL+MoF2JGYCfNnB
	s2zoXY1u0m/LR+2zdygKVC9mmlSZrrJCwN2oXO0V51NvSwyOUPGWsgAg8bwO9iiEMz/GZiZPf2Q
	v+pwR/LJ4qopNiPTIXeDNMt3bTCTXcsQ/rPZ62USutU6HCZMF6UXjqNckkzEx6As24snmNeYiPb
	g6GfVgqJ4U6Xz94NN1tlFTSXPdYKStc80xEw==
X-Received: by 2002:a17:903:2343:b0:294:def6:5961 with SMTP id d9443c01a7336-2a84530eab4mr44260565ad.45.1769433736653;
        Mon, 26 Jan 2026 05:22:16 -0800 (PST)
Received: from Black-Pearl.localdomain ([115.99.251.203])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a802daa65fsm90602575ad.12.2026.01.26.05.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:22:16 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Mon, 26 Jan 2026 13:22:05 +0000
Subject: [PATCH 2/2] dt-bindings: usb: ti,dwc3: convert to DT schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-ti-usb-v1-2-2855c129eb6d@gmail.com>
References: <20260126-ti-usb-v1-0-2855c129eb6d@gmail.com>
In-Reply-To: <20260126-ti-usb-v1-0-2855c129eb6d@gmail.com>
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
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:query timed out];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32725-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,0.0.39.16:email,devicetree.org:url,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4a0ab000:email]
X-Rspamd-Queue-Id: 9328588CA1
X-Rspamd-Action: no action

Convert OMAP DWC3 USB Glue Layer binding to DT schema.
Changes during conversion:
- Introduce a new compatible string pattern "omap_dwc3" to match nodes
  already present in existing device tree sources.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 Documentation/devicetree/bindings/usb/omap-usb.txt |  80 ---------------
 Documentation/devicetree/bindings/usb/ti,dwc3.yaml | 112 +++++++++++++++++++++
 2 files changed, 112 insertions(+), 80 deletions(-)

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
index 000000000000..859da4b1f207
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,dwc3.yaml
@@ -0,0 +1,112 @@
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
+  $nodename:
+    pattern: "^omap_dwc3(_[0-9]+)?@.*$"
+
+  compatible:
+    enum:
+      - ti,dwc3
+      - ti,am437x-dwc3
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      TI PRCM hardware module name that must be enabled (powered and
+      clocked) for this node. "usb_otg_ss" refers to the SuperSpeed
+      (USB3 + USB2 OTG) controller wrapper/glue layer found in OMAP5,
+      DRA7, AM57x, and similar TI SoCs using DWC3.
+    const: usb_otg_ss
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


