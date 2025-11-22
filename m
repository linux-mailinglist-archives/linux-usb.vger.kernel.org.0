Return-Path: <linux-usb+bounces-30813-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 478CEC7CB9A
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 10:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6B08A35C026
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 09:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354BF2F690E;
	Sat, 22 Nov 2025 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="njrPEri7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF0A2F068E
	for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 09:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763803942; cv=none; b=MH5Mq3D8P0GvCba7joAfJ5Xd/vXmlAa/0VBFgYjjLod++BJXEe0bsCj0Wmbi2EjX6Acfcw6DFRgeEvS2BhAlQLUcO0YLIiINwFdxoUQDQMgZejRGN8YPp/rw7S9t/9pYPE+RBuIbe7WEda0eIqkBzI46QP+Qr47XVnr0NY9Ww94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763803942; c=relaxed/simple;
	bh=BAGJDnv8pWgpuauJ6B3xVihHBjwuUxW9KRVJ9Fls4cg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iy1g16hbznRJ5Xu4ph8MyPM7Cr7D1Bb3CM0/sO18vR9zLxNOYhTYUFOLhQkZvltJKWyBw0LM9ibeGVNh/ROMvw/TgLDVbA4LB2Dy4R7PxuF5HPFtT1c8e+rjCZbU95IIOvN57k09gSPKSOrm/qlQtnZWreNP6z6SelF6nCuykyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=njrPEri7; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso2865918a12.1
        for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 01:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763803940; x=1764408740; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6uA4BsZvYHkelguC3jPSh0Ymd2guMG3cKedszSiFxIU=;
        b=njrPEri7JLSuJveiyOpLws+aZwL1GeGVTuzVY283hoU7dUeVrn9rn8AjyM43N+Qfw0
         mi293ArgPBMFoiVJy1USFnm1nITttqj44kjlJ+EyL6uYBsMN+oNcJeaNu8XgT29gK8rl
         KCBpipCHE61tY5dTIXVXCnEyXQhOfa+8OPCPA+7RHHS8EFnocV99mSALIhdtZ7+FCSh8
         5o+3vJ1w7rUMFJtXkammc91tYl8YzP48MdTy6GPkezqmV1p1pFHBZd1TpzebIM0OK30b
         f1cykwTpe0agzYxsokjioy50hk8X6qAllDGF/ytF2x2WMEr2mbk5u2ax1G3la4IDCz+0
         CoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763803940; x=1764408740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uA4BsZvYHkelguC3jPSh0Ymd2guMG3cKedszSiFxIU=;
        b=KB9DVzajZoHFuhtwAKnFelG0latpOtYv0z8Ok7ADZ38+wfuX9zSleHbh1R7Hp5qzvg
         AlqUbz8csrdW1bJml8IZYsLt0iDaehw1rpTmGQ9BlgtfvhUv/Jrqch05bjDL0gn13nwX
         Q1nBDlcFfw5tYr6u8HeESpWw6LedxHR5jd13kWTgOKrN+t7yS37K1A8dijEBFb7SLV76
         mZvUOWVaphE2zthktHYvAEwWur+AbvpJ2lOZiXM3o6dlL5ABTAEiOoFh+9iKl9YOQk6I
         qR6gIodeNZilBhmJuLWtFION0sF5a1N2q0I+hiOPOiLHTQZQGhd/DauHs3YqzyPE6gkt
         4kTg==
X-Forwarded-Encrypted: i=1; AJvYcCXQVopqR8mHhc8lyO88K1PUm4rIO9EsGmfjqJCLXXcFdBDlafkitlYRvAUKQIQJT0RU2U4y/kXSNWk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5tC6tAsa98bOYCTOQxmzz7ti0cDVR4ORIC3KNQeYoPm5Scj5w
	6GEA67whKHsnA8XlPTaVMa6e+zVHgfiIF6a4pYs1H6OhBbVWYuqV38HPafsdyWw9yrKdmAFZe53
	Ib6Wwkw==
X-Google-Smtp-Source: AGHT+IHl5gQjkCpePgnH5NPZtBouFAbOcCvUQ5vBMlaEHVfr4gxBZdKBqng2/CINzcFgZ55QNGdO339e5lw=
X-Received: from dlbbo41.prod.google.com ([2002:a05:7022:43a9:b0:11b:484:b6b7])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:92b:b0:119:e56b:91e9
 with SMTP id a92af1059eb24-11c9d85fd3amr2188921c88.26.1763803939943; Sat, 22
 Nov 2025 01:32:19 -0800 (PST)
Date: Sat, 22 Nov 2025 09:32:05 +0000
In-Reply-To: <20251122-controller-v8-0-e7562e0df658@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763803936; l=5662;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=BAGJDnv8pWgpuauJ6B3xVihHBjwuUxW9KRVJ9Fls4cg=; b=c5RqE8tk5lSyrGFbsnGQiX+s2zyz8jfFFMR2XGA9DDeckrqRy1SM173yO8GgLEvG6FDdMZLYE
 2yjqeH2Js0hD4RBVoZJI8gVr/hBm4jh1nEcvY30bntKgTmcqlu5Xk1r
X-Mailer: b4 0.14.2
Message-ID: <20251122-controller-v8-1-e7562e0df658@google.com>
Subject: [PATCH v8 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
From: Roy Luo <royluo@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="utf-8"

Document the device tree bindings for the DWC3 USB controller found in
Google Tensor SoCs, starting with the G5 generation (codename: laguna).

The Tensor G5 silicon represents a complete architectural departure from
previous generations (like gs101), including entirely new clock/reset
schemes, top-level wrapper and register interface. Consequently,
existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitating
this new device tree binding.

The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
Dual-Role Device single port with hibernation support.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Roy Luo <royluo@google.com>
---
 .../devicetree/bindings/usb/google,lga-dwc3.yaml   | 140 +++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..95be84c843f5da0e80ef5ef1ac9193019b5eb2a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/google,lga-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor Series G5 (Laguna) DWC3 USB SoC Controller
+
+maintainers:
+  - Roy Luo <royluo@google.com>
+
+description:
+  Describes the DWC3 USB controller block implemented on Google Tensor SoCs,
+  starting with the G5 generation (laguna). Based on Synopsys DWC3 IP, the
+  controller features Dual-Role Device single port with hibernation add-on.
+
+properties:
+  compatible:
+    const: google,lga-dwc3
+
+  reg:
+    items:
+      - description: Core DWC3 IP registers.
+
+  interrupts:
+    items:
+      - description: Core DWC3 interrupt.
+      - description: High speed power management event for remote wakeup.
+      - description: Super speed power management event for remote wakeup.
+
+  interrupt-names:
+    items:
+      - const: core
+      - const: hs_pme
+      - const: ss_pme
+
+  clocks:
+    items:
+      - description: Non-sticky module clock.
+      - description: Sticky module clock.
+
+  clock-names:
+    items:
+      - const: non_sticky
+      - const: sticky
+
+  resets:
+    items:
+      - description: Non-sticky module reset.
+      - description: Sticky module reset.
+      - description: DRD bus reset.
+      - description: Top-level reset.
+
+  reset-names:
+    items:
+      - const: non_sticky
+      - const: sticky
+      - const: drd_bus
+      - const: top
+
+  power-domains:
+    items:
+      - description: Power switchable domain, the child of top domain.
+          Turning it on puts the controller into full power state,
+          turning it off puts the controller into power gated state.
+      - description: Top domain, the parent of power switchable domain.
+          Turning it on puts the controller into power gated state,
+          turning it off completely shuts off the controller.
+
+  power-domain-names:
+    items:
+      - const: psw
+      - const: top
+
+  iommus:
+    maxItems: 1
+
+  google,usb-cfg-csr:
+    description:
+      A phandle to a syscon node used to access the USB configuration
+      registers. These registers are the top-level wrapper of the USB
+      subsystem and provide control and status for the integrated USB
+      controller and USB PHY.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the syscon node.
+          - description: USB host controller configuration register offset.
+          - description: USB custom interrrupts control register offset.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - power-domain-names
+  - google,usb-cfg-csr
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@c400000 {
+            compatible = "google,lga-dwc3";
+            reg = <0 0x0c400000  0 0xd060>;
+            interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH 0>;
+            interrupt-names = "core", "hs_pme", "ss_pme";
+            clocks = <&hsion_usbc_non_sticky_clk>,  <&hsion_usbc_sticky_clk>;
+            clock-names = "non_sticky", "sticky";
+            resets = <&hsion_resets_usbc_non_sticky>, <&hsion_resets_usbc_sticky>,
+                     <&hsion_resets_usb_drd_bus>, <&hsion_resets_usb_top>;
+            reset-names = "non_sticky", "sticky", "drd_bus", "top";
+            power-domains = <&hsio_n_usb_psw>, <&hsio_n_usb>;
+            power-domain-names = "psw", "top";
+            phys = <&usb_phy 0>;
+            phy-names = "usb2-phy";
+            snps,quirk-frame-length-adjustment = <0x20>;
+            snps,gfladj-refclk-lpm-sel-quirk;
+            snps,incr-burst-type-adjustment = <4>;
+            google,usb-cfg-csr = <&usb_cfg_csr 0x0 0x20>;
+        };
+    };
+...

-- 
2.52.0.rc2.455.g230fcf2819-goog


