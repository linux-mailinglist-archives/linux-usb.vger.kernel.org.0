Return-Path: <linux-usb+bounces-31016-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE40C906DB
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 01:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9EE6A4E05DB
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 00:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2BD224B0E;
	Fri, 28 Nov 2025 00:27:46 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83526212562;
	Fri, 28 Nov 2025 00:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764289666; cv=none; b=fDH9W2oekIdahsPo2FSKLIldEoTr+HRewBgXoVd01LFPQ9tHAHLISTTS5HOgKavvRCpyP9ex6fKMMOnwH7F2hDpYd2Arh9wIZARM/WSaf89JUatyMH9HLTs1CrvsjcyzYW1kvR2opvIikbk82651KNpWrdIhW3cgOhNMdUg82aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764289666; c=relaxed/simple;
	bh=rHhaKj8gv7+Qbhqwp9C1BhoCdFoga26doEIHEcEHt24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=m3yKS++qRAn/Rm0FqP/dgGHB9kf1JV20ri77ybqXlin0zVN01mreRPrk8E+0Qfb52AsHUnij2sXuw3w4p0n2D7oUIxvGQcC8ut5RqP483id277tfeOBzP/b3gqdQO63d5cTB4VrFni4nPkt9tZAwR32+A3+KJES4klxs2YWhT/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 28 Nov
 2025 08:27:34 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 28 Nov 2025 08:27:34 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Fri, 28 Nov 2025 08:27:30 +0800
Subject: [PATCH v2 1/2] dt-bindings: usb: aspeed,usb-vhub: Add ast2700
 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251128-upstream_vhub-v2-1-1fa66a5833c2@aspeedtech.com>
References: <20251128-upstream_vhub-v2-0-1fa66a5833c2@aspeedtech.com>
In-Reply-To: <20251128-upstream_vhub-v2-0-1fa66a5833c2@aspeedtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764289654; l=1845;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=rHhaKj8gv7+Qbhqwp9C1BhoCdFoga26doEIHEcEHt24=;
 b=jH+dOWj6JNSZPqM2w11PcC1CvWoBV1OvZI8jZk8o66+YsIEjsINZM5OEsEv+x97WocFe8fItI
 ewxRui6nq2LD8hbA8zd6aZRwaQQk7odUEh/8YNQhZyTzd/+Z+7dNiCh
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

Add the "aspeed,ast2700-usb-vhub" compatible. The ast2700 vhub
controller requires an reset, so make the "resets" property
mandatory for this compatible to reflect the hardware requirement.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/usb/aspeed,usb-vhub.yaml   | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
index 7f22f9c031b2..b8bac2cce949 100644
--- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
+++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
@@ -17,8 +17,8 @@ description: |+
 
   Supported number of devices and endpoints vary depending on hardware
   revisions. AST2400 and AST2500 Virtual Hub supports 5 downstream devices
-  and 15 generic endpoints, while AST2600 Virtual Hub supports 7 downstream
-  devices and 21 generic endpoints.
+  and 15 generic endpoints, while AST2600 and AST2700 Virtual Hub supports
+  7 downstream devices and 21 generic endpoints.
 
 properties:
   compatible:
@@ -26,6 +26,7 @@ properties:
       - aspeed,ast2400-usb-vhub
       - aspeed,ast2500-usb-vhub
       - aspeed,ast2600-usb-vhub
+      - aspeed,ast2700-usb-vhub
 
   reg:
     maxItems: 1
@@ -33,6 +34,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   interrupts:
     maxItems: 1
 
@@ -107,6 +111,20 @@ required:
   - aspeed,vhub-downstream-ports
   - aspeed,vhub-generic-endpoints
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: aspeed,ast2700-usb-vhub
+
+then:
+  required:
+    - resets
+
+else:
+  properties:
+    resets: false
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


