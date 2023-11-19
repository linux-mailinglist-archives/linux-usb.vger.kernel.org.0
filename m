Return-Path: <linux-usb+bounces-2991-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7835E7F0412
	for <lists+linux-usb@lfdr.de>; Sun, 19 Nov 2023 03:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A92BE1C20967
	for <lists+linux-usb@lfdr.de>; Sun, 19 Nov 2023 02:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B9D15B9;
	Sun, 19 Nov 2023 02:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLCe8yfQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954DBF2;
	Sat, 18 Nov 2023 18:35:14 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6d648679605so1833426a34.1;
        Sat, 18 Nov 2023 18:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700361313; x=1700966113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQqBHD1pNFJN4NsX+ra9VnsIZ1CONUZRLDig94ie5kI=;
        b=JLCe8yfQ+MGAABssCMs/ZsUP3MR51moL78HHM4CWH4LE5pjLN169G4TING3+Ho70Dt
         brJ4G4e6/l9YE705B0RFF2IXKHBTQYv57tWAwcHlI4yXaTeMHELTMgYfkPjSb5IQxBfv
         cpkjxIyzL3iByb0B7nLZQ4bmkt3yjqU2IWSHvjvToCT+3iKDdy76LroJWuuf8P6Ax2JG
         +6Z7SbtteXEzsTsZUHmnfnEqRX3aIxLceKxTXfjwUYJnnY8hLgG16yH0jKCDcVuUdhvB
         0qjlRva3CMQ1Cq3mzkCvtoeVrgt0nJ5OLmNeCFcK5guNs1VHM4w+xZqnuf8jHKYm99WE
         vyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700361313; x=1700966113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQqBHD1pNFJN4NsX+ra9VnsIZ1CONUZRLDig94ie5kI=;
        b=qQpUMoxEQpgoxk8FdLk3pfsIYsD71dpocVdojkzYg7zmv91rXhfaBnPoVPrgi07SMg
         lHgrhA+ZnFkeawhWY1+s/ZV0vZoqrMlGFX4zrITZgRKg64TPdwJrYw0La76UWAxrrPcl
         DnYqM0dYkxaqDsk+jA5jETU0oQ7guDVbeDJEKcspCQao8sjrtzZI4fiuGZ1SkJarBXNv
         WvKV+iuIGhtcTHDVmTJdZ1c2J2LONkbua/Gz8cGT43cZSxlnDyD+2xxYn0TEgwh4zbFq
         sFNKPC5N9Box5piGuoItU1xr7xW+1ByXx08CD4alpNLebQjJY7aCqUUgDkqrnEbmqpDC
         v3PA==
X-Gm-Message-State: AOJu0YyIzP0MPwxnBwH9oNLjGWGlpSc4uRPV7bksnI9OeGjypcIzWCMR
	uH/tZqUCNTc3d/TgGMU05NkuhlY8x8c=
X-Google-Smtp-Source: AGHT+IEJ8i+JOsFqn63UFwoWRFq1zD4Nzx/0ylSNAUcM6FtEn829Qx4O/xnvXnH1zA6ouyGrwlh3kw==
X-Received: by 2002:a9d:6410:0:b0:6c4:a349:4b10 with SMTP id h16-20020a9d6410000000b006c4a3494b10mr4285820otl.28.1700361313033;
        Sat, 18 Nov 2023 18:35:13 -0800 (PST)
Received: from localhost.localdomain ([49.205.245.83])
        by smtp.gmail.com with ESMTPSA id j8-20020a170902da8800b001cf53cd1508sm1526207plx.67.2023.11.18.18.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 18:35:12 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: Anand Moon <linux.amoon@gmail.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: usb: Add the binding example for the Genesys Logic GL3523 hub
Date: Sun, 19 Nov 2023 08:04:50 +0530
Message-ID: <20231119023454.1591-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231119023454.1591-1-linux.amoon@gmail.com>
References: <20231119023454.1591-1-linux.amoon@gmail.com>
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

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V3: fix the dt_binding_check error, added new example for Genesys GL3523
v2: added Genesys GL3523 binding
v1: none
---
 .../bindings/usb/genesys,gl850g.yaml          | 63 +++++++++++++++++--
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index ee08b9c3721f..f8e88477fa11 100644
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
@@ -27,12 +24,44 @@ properties:
 
   vdd-supply:
     description:
-      the regulator that provides 3.3V core power to the hub.
+      phandle to the regulator that provides power to the hub.
+
+  peer-hub:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the peer hub on the controller.
 
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
@@ -49,3 +78,29 @@ examples:
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


