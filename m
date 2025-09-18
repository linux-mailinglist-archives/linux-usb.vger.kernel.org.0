Return-Path: <linux-usb+bounces-28177-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70733B7F90D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C474F326F70
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 02:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F40B2F6583;
	Wed, 17 Sep 2025 02:19:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9218C2F616A;
	Wed, 17 Sep 2025 02:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758075575; cv=none; b=Gvkabeta3pQTbdtPFkPHR1A9CQA4UzGJuSSAuElqY79ZB3e3oWJx66X/ultS0c6bAIpkBL8vLrcEUEVrPUA5qWN6itVayWB1uaDRxehF5QIxyZ5Z+iWUqqQvNKgekPnooO3gb7bVLUuZdyqQU/9dSZUCGZ/+81RmF62ezWwYqgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758075575; c=relaxed/simple;
	bh=IsN9NQ61Mz3/c4Zv09I5HmViZS8gvcwQSsJi/5GLKZU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HDcEcBJCAWf1982g5WWu7rh92T3mQacAyARysLlybMvhaaUFTOeAUkiJC1VAFNVuMt0344LamppjYzKHjmlT6Le57ySk53J/zui0ljaEaurOSnEhz0u7mXEdXdabF0XK+VNjBezSYnsdRdmGGAON3QeD0LLTuQFtolHeb82PN90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 17 Sep
 2025 10:19:26 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 17 Sep 2025 10:19:26 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Alan
 Stern" <stern@rowland.harvard.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] dt-bindings: usb: uhci: Add Aspeed AST2700 compatible
Date: Wed, 17 Sep 2025 10:19:25 +0800
Message-ID: <20250917021926.3692137-4-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917021926.3692137-1-ryan_chen@aspeedtech.com>
References: <20250917021926.3692137-1-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the compatible string for Aspeed AST2700 SoC.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 Documentation/devicetree/bindings/usb/usb-uhci.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-uhci.yaml b/Documentation/devicetree/bindings/usb/usb-uhci.yaml
index b1f2b9bd7921..7b774d0b2742 100644
--- a/Documentation/devicetree/bindings/usb/usb-uhci.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-uhci.yaml
@@ -20,6 +20,7 @@ properties:
               - aspeed,ast2400-uhci
               - aspeed,ast2500-uhci
               - aspeed,ast2600-uhci
+              - aspeed,ast2700-uhci
           - const: generic-uhci
 
   reg:
@@ -53,6 +54,15 @@ allOf:
       required:
         - clocks
 
+ - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2700-uhci
+    then:
+      required:
+        - resets
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


