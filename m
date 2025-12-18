Return-Path: <linux-usb+bounces-31586-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC23ACCC7A4
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 16:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0978F3057CB2
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 15:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D1C34E74E;
	Thu, 18 Dec 2025 15:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="G6duahr2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87913352F91
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071317; cv=pass; b=pFLcuLhIYyudy8R8Dj3b4t+UHSUU12/Jz1N5oWHftlxBjs4In/2mTcQVGFvZGRAb4X+dOWkHJbZ7OFmfsa82D/vMGf4nfT2EKchZQ+qruGaXo7AXrJlf/p6/t1DsHOsO0e1r8tJNuhJ3KqykGLZIsXT1TnCS/+7pwkB01Q8w7ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071317; c=relaxed/simple;
	bh=HFFh/0R1q/dM407ncnP63bQTvfvE8hZuOCGo9ES6MnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRLFVsKGsdoF5kPIK8SqPsPKco7qygAJiDKXEF2nkc/fCGZCVhLtC8YVE57ipWGAHdYBi82Cmm66+J90YwLkZZzfgMVgCm7kvp5v2ePvZOuORdpwbPfOgfEFCkMtRH55UB7OVXUUOkvYPfPtL6OCNoHWARsTokFF4LQR3ySHbQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=G6duahr2; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=k3AM7QmqkPS84tQuQ7++sP3E2X2hsG+zkS1II3xFrLY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071290;
 b=jYs6wKwwaYIpQ/VXp1ispTlR+wdwmRrLMIgYwAxztruV1nehE4bRbgYR/oKY2HrQbnsiL18U
 ZTkDn3ZbCDUJgebXKp45IF5musngObFMpEcAEaLahlDj0dcUIMym3MOnnPTwG4f5hofQ9z+4hvW
 Mcnh2XlOy+jBFcIhRb8ofPuUC5kTjBZlAIJCT060tVJa5WAvTG4EDls7JPNso+XIy1k8RqVGk2b
 8XWdeXOi+a3Apf8/JpbyNH0icmnXgtPpurmiL1yrkq/y7cUReUit0ze4LENVhx+whVPlF2CihpB
 oIxyrML7UX7NzXtSCi3VdoZls8t4egW0anlxVapRjqQoA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071290;
 b=U+/sphDYe4SKvhmUOFAuwqOij/zyoq0111kbF282ij2iJTZog9jZ9zcf6D6OQPxPw9yaygJa
 aPK/ykVftY+D2CgfEfEOXjfJJP8RNi1xQjJWPRuk6FkXSErEhmtot3ZgdkShmNK0IBrWuk8UF0W
 waSIzxi0oKY6lVxY7vhDQ8QQBrXpm9njAjWAQY4CakoBY51IBxycgY6jH8bvvmYymZt+AED2oj9
 eTVaLTBHgwTT/qSNxbSlWzkf90dXEB+diFka926YDcvP00c9XL4wI8IVPVsizGsQ/iw/9QJvQXC
 8bo4doCcqGzdoPjSzorBWuZDIxhjXcff6+h6KPNGFGkiw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 18 Dec 2025 16:21:30 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C1E2ECC0CC7;
	Thu, 18 Dec 2025 16:21:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
Date: Thu, 18 Dec 2025 16:20:48 +0100
Message-ID: <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-usb@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dXDry6fRMz3yXl8
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:79e50b13dc320d875aa9306a79dc5026
X-cloud-security:scantime:2.032
DKIM-Signature: a=rsa-sha256;
 bh=k3AM7QmqkPS84tQuQ7++sP3E2X2hsG+zkS1II3xFrLY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071289; v=1;
 b=G6duahr2CiEf9DOT3QqzSM091AheWjrVAN1rZVOmpxxfnYO07oEUBuvfWgdd2oiLYQZ7qrOu
 zCFKSZWk2Ye9Bm54O+wD7578KbBwKzkGIdiBzzAoRVIyGb4wPQsEtzYXUmT/G6trp7DenhMIwfi
 KOZqtrTF4yuy7XdY/4IgPCnkIIh/g/K9HqawSh8xlFMADc6433/0s2B3PMJ9C1J5r7udTjNCVoe
 oiLjBNQcszIc4NJ6a/W9Xq0LgwptrQF1EXHfe80SE4NF4+j3X1TzqeEZZUUqZn5/nIeIkx3Jvil
 vrfMveSdWXLBKKP+IP4E94GctlhQN/4OEIKjglqSQayMA==

Add "clock-output-names" which is a standard property for clock
providers.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../bindings/clock/renesas,9series.yaml       | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
index af6319697b1c0..5590f04147612 100644
--- a/Documentation/devicetree/bindings/clock/renesas,9series.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
@@ -52,6 +52,10 @@ properties:
     items:
       - description: XTal input clock
 
+  clock-output-names:
+    minItems: 1
+    maxItems: 8
+
   renesas,out-amplitude-microvolt:
     enum: [ 600000, 700000, 800000, 900000 ]
     description: Output clock signal amplitude
@@ -83,6 +87,38 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0241
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0441
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 4
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0841
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 8
+
 examples:
   - |
     /* 25MHz reference crystal */
@@ -101,6 +137,7 @@ examples:
             compatible = "renesas,9fgv0241";
             reg = <0x6a>;
             #clock-cells = <1>;
+            clock-output-names = "DIF0";
 
             clocks = <&ref25m>;
 
-- 
2.43.0


