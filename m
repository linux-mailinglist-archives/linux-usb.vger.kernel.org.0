Return-Path: <linux-usb+bounces-3204-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 056EE7F4F66
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 19:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF310B20DF4
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 18:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47EA5D49E;
	Wed, 22 Nov 2023 18:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpvGcMfo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E111B9;
	Wed, 22 Nov 2023 10:24:24 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cf669b711fso290935ad.2;
        Wed, 22 Nov 2023 10:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700677464; x=1701282264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjfB/97B7loi+XRCLgCE3Hiw3P88msCGByWuf340tpY=;
        b=fpvGcMfoZIyygbykG/s/Qxs9laKclVNSV+bWVIlm7ckMLFZQrufq5OrWUVpy9hjN1V
         rZ5nqpISJVqzx0kdTMK+aSMdpA1Mks2tGNu5FyzwiJKGJe5c54nzwm73f4dAChu9RYHe
         qFSKL5glsVSaEfcdae0WPaDPAbJdO5P0o2jfM4DC4VeUQ0yntHB6K/sxfWldLQTiJLCy
         JA2xN1qyM2e0H/vnJ1TIMe/zYIf6EZZhVV96CB2hGEkTeX7XKPSAja3bBAzAwaT/F8/w
         vIYCtpaVBQuScbpANz3cps630EHoYnV9mw9kJSP7+YyhDs0WQbIeIxOyXC7spXrBKFZT
         mGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677464; x=1701282264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjfB/97B7loi+XRCLgCE3Hiw3P88msCGByWuf340tpY=;
        b=UqsIzgQSnQKt3IsCOuK1H9XTar79jj6tNcafDB0e423tLmMOei5eYl5K2hsSL1HzGm
         lOGtP079HSznLKZpAv5AJrSpWlntcoFDN40y5Pw5VryGbfXV3DCloToVWfQZW91VjBgp
         R4i540R7TnCH2CxNcKexdOuDRczQYssZQd4GWPqxCYTKEzpkmmA0yUyji5+tIj/6TMNF
         6jCZxBSiTau2JId+SI6MrtYfsuNK/elOWAP2U7CfHqZ3pwAhA+oaUxvF9iREj7jmF5ek
         kVKusMZ1WLsl1NpGx0Q3cy2BJ+Y8X04XmqOByqk5fnuWTkTwzlqFY4thlCD5dy75RfFv
         /6Dg==
X-Gm-Message-State: AOJu0Yw7RfV3Ax0saylAa3lPS/JuUWapejcig9WuflRSD4sDGD7UAkfb
	wV7HfRXqzQGvgPNZ0MCrOcE=
X-Google-Smtp-Source: AGHT+IFWPL9SNXvN7oL7uCtmjwzzoqIpcfpqt68R31BoH4G9gvRk0tppsfmf6uoVZf4Z3TPbbG2pDQ==
X-Received: by 2002:a17:902:e741:b0:1cf:59df:241 with SMTP id p1-20020a170902e74100b001cf59df0241mr3486737plf.52.1700677463793;
        Wed, 22 Nov 2023 10:24:23 -0800 (PST)
Received: from localhost.localdomain ([49.205.245.83])
        by smtp.gmail.com with ESMTPSA id x17-20020a170902ea9100b001cf6783fd41sm4897980plb.17.2023.11.22.10.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 10:24:23 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: usb: Add the binding example for the Genesys Logic GL3523 hub
Date: Wed, 22 Nov 2023 23:53:46 +0530
Message-ID: <20231122182351.63214-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122182351.63214-1-linux.amoon@gmail.com>
References: <20231122182351.63214-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the binding example for the USB3.1 Genesys Logic GL3523
integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
hub.

Onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
which has a common reset pin and power supply.
peer-hub phandle each peer controller with proper gpio reset
and help each peer power on during initialization
and power off during suspend.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: Fix the description of peer-hub and update the commit message.
Schematics of the Odroid N2+
https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
V3: fix the dt_binding_check error, added new example for Genesys GL3523
v2: added Genesys GL3523 binding
v1: none
---
 .../bindings/usb/genesys,gl850g.yaml          | 67 +++++++++++++++++--
 1 file changed, 63 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index ee08b9c3721f..bc3b3f4c8473 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
 maintainers:
   - Icenowy Zheng <uwu@icenowy.me>
 
-allOf:
-  - $ref: usb-device.yaml#
-
 properties:
   compatible:
     enum:
@@ -27,12 +24,48 @@ properties:
 
   vdd-supply:
     description:
-      the regulator that provides 3.3V core power to the hub.
+      phandle to the regulator that provides power to the hub.
+
+  peer-hub:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
+      which has a common reset pin and power supply.
+      peer-hub phandle each peer controller with proper gpio reset
+      and help each peer power on during initialization
+      and power off during suspend.
 
 required:
   - compatible
   - reg
 
+allOf:
+  - $ref: usb-device.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,608
+    then:
+      properties:
+        peer-hub: false
+        vdd-supply: false
+        reset-gpios: true
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,610
+              - usb5e3,620
+    then:
+      properties:
+        peer-hub: true
+        vdd-supply: true
+        reset-gpios: true
+
 additionalProperties: false
 
 examples:
@@ -49,3 +82,29 @@ examples:
             reset-gpios = <&pio 7 2 GPIO_ACTIVE_LOW>;
         };
     };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    usb {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+            compatible = "usb5e3,610";
+            reg = <1>;
+            peer-hub = <&hub_3_0>;
+            reset-gpios = <&gpio 20 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_5v>;
+        };
+
+        /* 3.1 hub on port 4 */
+        hub_3_0: hub@2 {
+            compatible = "usb5e3,620";
+            reg = <2>;
+            peer-hub = <&hub_2_0>;
+            reset-gpios = <&gpio 20 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_5v>;
+        };
+    };
-- 
2.42.0


