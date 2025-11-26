Return-Path: <linux-usb+bounces-30944-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 615E5C88A04
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 09:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A6DDE34CD36
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 08:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4193191BC;
	Wed, 26 Nov 2025 08:26:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E635D315D5D;
	Wed, 26 Nov 2025 08:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764145605; cv=none; b=n61TMuYS7ysz+/wCoSb13JbVr6rGlLQF9kRRn63cWtAHq4kuvYGP6CULbHe9HP6ROenXmLVWB4oeAoBGfVDArIjlAIHXEuW5q86bMzd1oHrSdjg65ya84AWJaPePKGVyeGUbPcahmm3eRKjAdZt7A5VnaXGpv12VhSADNlphooM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764145605; c=relaxed/simple;
	bh=HEzWWYIHW1xKDw5/cUq64msPdNcRWYQ7CNoSj8s7Tc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LFWWPcStrL5NIqLNpqn9/l2NlscUWDK/sdd8Ofh+XuY6S1BwmJzb8ptuBStPuSvzVBm6Ai2x6er9mmK7Wv6yOuGMY6O6FJnl25CkOdjdI9pvsHIIhsDI5pSELqn/HaGf7U6IN85v7p22uvVXg0vgpaQkJrM34ur5VKghSQjcLuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 26 Nov
 2025 16:26:30 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 26 Nov 2025 16:26:30 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 26 Nov 2025 16:26:30 +0800
Subject: [PATCH 1/2] dt-bindings: usb: aspeed,usb-vhub: Add ast2700 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251126-upstream_vhub-v1-1-910709937ee0@aspeedtech.com>
References: <20251126-upstream_vhub-v1-0-910709937ee0@aspeedtech.com>
In-Reply-To: <20251126-upstream_vhub-v1-0-910709937ee0@aspeedtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764145590; l=1317;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=HEzWWYIHW1xKDw5/cUq64msPdNcRWYQ7CNoSj8s7Tc0=;
 b=/akVg1W5dYhU+EFX3V4YbmlsHawqShE/aW/7otTU9xNBzwfv2BAVdGtZjeZCZLSeEanHdxVzb
 hGiaFh5PeyOAdlM0Qi8k8o2S393xmdPTdzTBUGRyQozqnU+4MNQoe0D
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

Add the "aspeed,ast2700-usb-vhub" compatible. The ast2700 vhub
controller requires an reset, so make the "resets" property
mandatory for this compatible to reflect the hardware requirement.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
index 7f22f9c031b2..c9ebb6e004d1 100644
--- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
+++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
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
 
@@ -107,6 +111,16 @@ required:
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
 additionalProperties: false
 
 examples:

-- 
2.34.1


