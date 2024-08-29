Return-Path: <linux-usb+bounces-14291-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF6B964E1C
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 20:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3E2B1C24487
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 18:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F571BE851;
	Thu, 29 Aug 2024 18:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M+6AxtEH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097501BE852
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 18:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724957084; cv=none; b=vDJ68DAXEFog9pKIeQdLBlw+85q3P6gotIAlT6zm1EtAvbCZdzpVgHU3NraaBNRstYPwf+3rZN0KPJ/vx22gl8rovylfnAvdKFEsT23WAwnDOhr4wEJN6bcA6OMZiNmDkYedHLCPRwb2fVz5r5GBvSYzH6j7gs4532AuzUW/3J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724957084; c=relaxed/simple;
	bh=n7pO6TZg1rTpjAvcXvCGlTe9QdrHRreecXTs9IhTq0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FF5VNamlYr287Padd8tv9t/Az07X4ky9ZbTq/jvHLBgWyvhAlGU7cB3ojXpII2IXGc1/CwAwx+hNHm7Q0iIRbVZjfZSXKqMuGQBKuLEggCJHuZoT4/rs1aFZSOuAmOCJwLMOfZDjBszmE/fGnNDBb82v5B5RCpQAGtpCTQNHDIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M+6AxtEH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso11140985e9.3
        for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 11:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724957081; x=1725561881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT1EjR3j+8IbSHHKlroP6FAikrPQK8beawIYUDdJwY8=;
        b=M+6AxtEH4HruUoZoTAkhRkeY7mytYvAIpEfx50/Y/+v37QYR1IaEndf6gJrSdNdRpP
         JCegm7ZN4eOO8qNzR1cLklybZqTZk9KM4ZF87Z/t6sDQBEolY+92joRDbCyQWQt6G1ju
         n6NCzvbf7tsYt0qH+GJEv2JKUrmLIAC2YtfufXIAWrbfq3KSK3VJ6W1yiSQ4GyzaByG3
         rzvUwtwm3SkgtNREgZ5LqJw/4siT9+rKzgbDW4yRifCsfhd2rZ/tKcJlkkLzwGCMdSt1
         V9NQoLUwG6gM9IEaWWlbeXuM7BZBj34OO6WViag6k6QkBT+Nf9qoEU2FWGJVDg1Xk0Rd
         9K2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724957081; x=1725561881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wT1EjR3j+8IbSHHKlroP6FAikrPQK8beawIYUDdJwY8=;
        b=phaTexkfG9InWZjlFEC/zeGZZoj8D2ckvMW1VnIJKzjB0tn4hvlcrYQHSiYDzL5r7r
         Eit2WjK4/F3fA85xQbqUiIGM4Ro9ekBRSE5L4wAqhaIeLyRWZDUwK8XhZgg212a1UuEs
         VC2sIC0EOb0dt5qIE07nXF//z696Z0+RAx9Ofj/Lt9WNPUYCvtjiqNsRTWKtisdpwtsx
         GCOW+TXth9zmbfU3PZ6vgTTISZj/xUEtp+6yotGXTgJaFWXrOFUVPkM1hJP4yDncTgD5
         tuwZ7nrXRX5HCNcgpcDakfA7ZflCAlAiAXouEUKJWdLsyY/olESjbWhc00E8R0GMyvnW
         OlCA==
X-Forwarded-Encrypted: i=1; AJvYcCW9jcavRfZZHPgf08b5UyiCRZxyscr6ugy9tO5T/MfiFYwmMtDPRGRftQpd2+aC6QZinXa8Gzyplsk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5fxna+9voTEaUf1XmBSgjPDEWK7aN1w5X13mR+4IloJp/rM4L
	B9OxiVXhvTKYHRqH1V1acms2u/ZXxEPs4u/JuOqIfBf/VHHXx3pf586z4ZXgF0Q=
X-Google-Smtp-Source: AGHT+IFmSrsoaUN6yjM8DWZkPRtpnP/v8qYVWyvRNTIZEKkN+n5FYIRhD98oUb8LmkIrxAHAZkfxrQ==
X-Received: by 2002:a05:600c:3b10:b0:426:6ed5:fcb with SMTP id 5b1f17b1804b1-42bb01ae1fbmr38511115e9.4.1724957081144;
        Thu, 29 Aug 2024 11:44:41 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e33b41sm24540885e9.40.2024.08.29.11.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 11:44:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 29 Aug 2024 21:44:25 +0300
Subject: [PATCH RFC 1/2] dt-bindings: usb: Add Parade PS8830 Type-C retimer
 bindings
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-x1e80100-ps8830-v1-1-bcc4790b1d45@linaro.org>
References: <20240829-x1e80100-ps8830-v1-0-bcc4790b1d45@linaro.org>
In-Reply-To: <20240829-x1e80100-ps8830-v1-0-bcc4790b1d45@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3619; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=n7pO6TZg1rTpjAvcXvCGlTe9QdrHRreecXTs9IhTq0g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBm0MGSABNytBc7jJFT3MyedHlLG/FnajAQWrhZN
 HHqoX46UVWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZtDBkgAKCRAbX0TJAJUV
 VsD4D/9mD4aGxjcmydEHeuoT1ew9KG/lleYxaNlJ91umCtMU/VfUM/dN08TAKdS7I66HKZaL6Nj
 G/63qymMKHjT4zJS80hXbvjL4R56tRkmAbgHl5LobnytujaEcgGTwoiZNqYBm3vUuCK7/lTGtlJ
 XKCxTKakweu+diX3vCaubsgP3xqAUuNqS8P0smOCYHCUu5FHqe/GpqpcMu/oYiAwY4kjO/nSthk
 aa4bi3I+h5Hd8tOU0edUnNv31mkJsCcYTVzFsCQuExuw0Nk6dlFGO2qmOG/NY81pev6SIgC5EO7
 VHQYcCq6SSAHLIIHTFP7MfRgIOFKdlKP7ymCqJDyoTykQJEKP8lL32Sq3hjtyBnzataiFM7pblS
 mqvYDjy+l7xAAt9wvDJRVyWVaZj8Jnug8H3e+qeDZzkGCA3KstoZwAaUKiaSIQGCg2vS8Ry66/b
 4ai0DjtE5/cWI9iTlsFP82TE/Min0bO6VzW++BpEBCtHbBnEkzt4U9/FYrOT+TajaHpQFtIDg+X
 S/2v+qruPjDzm6BRf3gCopJDzuhN05eVB/YDCI+5XwLCa2iHUQ7Uy1ULuZymKVe27S4T7LBRkHP
 6jF5+9H7mZM+5H1LFQ5IZ9cmgTZZMn6VBr1og85JN4v/O10oCamAbZNHBjdFbvvtvOOBwDOLXAB
 BUerWQGZfZ/qp0Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document bindings for the Parade PS8830 Type-C retimer. This retimer is
currently found on all boards featuring Qualcomm Snapdragon X Elite SoCs
and it is needed to provide altmode muxing between DP and USB.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/usb/parade,ps8830.yaml     | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
new file mode 100644
index 000000000000..1223abf5c2f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Parade PS8830 USB and DisplayPort Retimer
+
+maintainers:
+  - Abel Vesa <abel.vesa@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - parade,ps8830
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO Clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd15-supply:
+    description: power supply (1.5V)
+
+  vdd18-supply:
+    description: power supply (1.8V)
+
+  vdd33-supply:
+    description: power supply (3.3V)
+
+  orientation-switch: true
+  retimer-switch: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) Output endpoint to the Type-C connector
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: Super Speed (SS) Input endpoint from the Super-Speed PHY
+        unevaluatedProperties: false
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Sideband Use (SBU) AUX lines endpoint to the Type-C connector for the purpose of
+          handling altmode muxing and orientation switching.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: usb-switch.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec-mux@8 {
+            compatible = "parade,ps8830";
+            reg = <0x8>;
+
+            vdd15-supply = <&vreg_rtmr_1p15>;
+            vdd18-supply = <&vreg_rtmr_1p8>;
+            vdd33-supply = <&vreg_rtmr_3p3>;
+
+            reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_HIGH>;
+
+            retimer-switch;
+            orientation-switch;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    usb_con_ss: endpoint {
+                        remote-endpoint = <&typec_con_ss>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    phy_con_ss: endpoint {
+                        remote-endpoint = <&usb_phy_ss>;
+                        data-lanes = <3 2 1 0>;
+                    };
+                };
+                port@2 {
+                    reg = <2>;
+                    usb_con_sbu: endpoint {
+                        remote-endpoint = <&typec_dp_aux>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


