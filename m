Return-Path: <linux-usb+bounces-2830-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD327E9F6B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 15:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AE71B20B2F
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 14:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EACD21114;
	Mon, 13 Nov 2023 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F9A2111A
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 14:59:35 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A6E10FB
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 06:59:34 -0800 (PST)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B0C57207BF;
	Mon, 13 Nov 2023 15:59:26 +0100 (CET)
From: Francesco Dolcini <francesco@dolcini.it>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 1/2] dt-bindings: usb: microchip,usb5744: Add second supply
Date: Mon, 13 Nov 2023 15:59:20 +0100
Message-Id: <20231113145921.30104-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231113145921.30104-1-francesco@dolcini.it>
References: <20231113145921.30104-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

The USB5744 has two power supplies one for 3V3 and one for 1V2. Add the
second supply to the USB5744 DT binding.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../devicetree/bindings/usb/microchip,usb5744.yaml         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
index ff3a1707ef57..6d4cfd943f58 100644
--- a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
@@ -36,7 +36,11 @@ properties:
 
   vdd-supply:
     description:
-      VDD power supply to the hub
+      3V3 power supply to the hub
+
+  vdd2-supply:
+    description:
+      1V2 power supply to the hub
 
   peer-hub:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -62,6 +66,7 @@ allOf:
       properties:
         reset-gpios: false
         vdd-supply: false
+        vdd2-supply: false
         peer-hub: false
         i2c-bus: false
     else:
-- 
2.25.1


