Return-Path: <linux-usb+bounces-1750-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 136E97CC885
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 18:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0683281B45
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 16:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C17245F73;
	Tue, 17 Oct 2023 16:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qx23junq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11A847340;
	Tue, 17 Oct 2023 16:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D25C433CA;
	Tue, 17 Oct 2023 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697559254;
	bh=Ye90HBHDZzB2aDp/S5UGI++JNCzZ7q1PX2LEgBDO3FA=;
	h=From:To:Cc:Subject:Date:From;
	b=qx23junqDkaU3YjKyYdbbhUyl6RLIT071nSnCTOJMkBDZHvV4szsntrGDj3OEDqEj
	 S897OKmOGZfSvjmRBVYtCU5LPOFJtMX6OJ82xXXEgA9Go4HgUsrSH/WNRLxFm58O8f
	 ZUGjc4jgUhf1hAAv7P4kejGqwOn95zb7UDdwHe5jGFc/VkkSJxel6Mw98eYqq+Rcc4
	 tBK+OWo+yQhKO7JIk3NlSwDXApMJ1XBfqcDzzy/hOuQFWXCMLlVaVtnCNqYoT9Pa/g
	 YzIH4zPCVPoff2t6r9ayWW3UQfdZm/HSJfCmPpvxm89cLOBoVT8Iku16qe2NZVa9L9
	 7FyQzoGAsPMNA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anand Moon <linux.amoon@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: vialab,vl817: remove reset-gpios from required list
Date: Wed, 18 Oct 2023 00:01:58 +0800
Message-Id: <20231017160158.1065-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "reset-gpios" is optional in real case, for example reset pin is
is hard wired to "high". And this fact is also reflected by the
devm_gpio_get_optional() calling in driver code.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/usb/thead,th1520-usb.yaml        | 42 ++++++++++---------
 .../devicetree/bindings/usb/vialab,vl817.yaml |  1 -
 2 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
index afb618eb5013..ce1cab75f0ff 100644
--- a/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
@@ -28,6 +28,10 @@ properties:
 
   ranges: true
 
+  thead,misc-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: a phandle to the misc system register controller syscon node.
+
   '#address-cells':
     enum: [ 1, 2 ]
 
@@ -51,23 +55,23 @@ additionalProperties: false
 
 examples:
   - |
-
-    usb {
-          compatible = "thead,th1520-usb";
-          reg = <0xec03f000 0x1000>;
-          clocks = <&clk 1>,
-                   <&clk 2>,
-                   <&clk 3>,
-                   <&clk 4>;
-          clock-names = "ref", "bus_early", "phy", "suspend";
-          ranges;
-          #address-cells = <1>;
-          #size-cells = <1>;
-
-          usb@e7040000 {
-                compatible = "snps,dwc3";
-                reg = <0xe7040000 0x10000>;
-                interrupts = <68>;
-                dr_mode = "host";
-          };
+    usb@ec03f000 {
+        compatible = "thead,th1520-usb";
+        reg = <0xec03f000 0x1000>;
+        thead,misc-syscon = <&misc_syscon>;
+        clocks = <&clk 1>,
+                 <&clk 2>,
+                 <&clk 3>,
+                 <&clk 4>;
+        clock-names = "ref", "bus_early", "phy", "suspend";
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        usb@e7040000 {
+            compatible = "snps,dwc3";
+            reg = <0xe7040000 0x10000>;
+            interrupts = <68>;
+            dr_mode = "host";
+        };
     };
diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
index 76db9071b352..c815010ba9c2 100644
--- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
+++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
@@ -37,7 +37,6 @@ properties:
 required:
   - compatible
   - reg
-  - reset-gpios
   - vdd-supply
   - peer-hub
 
-- 
2.40.1


