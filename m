Return-Path: <linux-usb+bounces-31588-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B48CCCFC9
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 18:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89CD630155F6
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 17:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8780F355057;
	Thu, 18 Dec 2025 15:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jZ8fhSaX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-relay31-hz1.antispameurope.com (mx-relay31-hz1.antispameurope.com [94.100.133.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC1D355022
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.207
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071326; cv=pass; b=qLoUL8heBNgMa08HqYlBIJG9TbV0XDHf7ccdh3gL6QYX1r2aVIs3kmWc02nxBYOAyy9YqBAxo1n208sG1uVossBm0VLsMQy8c0FqRliSlGVfy1L9BuhaRj9PAQUp99cCJMIkXI4Dk1kOsfs8N+AkX8dwf+3NmbHJiC/6KywVs70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071326; c=relaxed/simple;
	bh=xU+o4EwdFkRdWDIg0E/QjC9yBED5TOlSry1ayU8ef1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmYMSstftJ5M1h+sgd/SYG6DzqU8g3DVUX58ymV6cRexv518oyWFfVZ8NyhvY5P3mZ7/XhNWMko09YUpIP+D4wmW/3+9T/wc1y21HDo4NuJHTDqG1Xkn0fDF8w937xGNsBySVfsRNMTENu/zFFiN1YA5/MPqH6yzOjJxBkJ31EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jZ8fhSaX; arc=pass smtp.client-ip=94.100.133.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate31-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=FI7PYyPGdjJp1gXUMedmlj7NmwLyvXozNGGHThu/Auc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071290;
 b=N+uOIw9+U2cgNe1NwmrqnLnWtXBNkAqIt/3G+tKaSn71CuXVuUXoeWoc6Col9D20e4QzkpWn
 WQVm44z3zNAhSBYEoD/MDZXglmIq8kkBCdh1jvYbX/JuXICBFKaFgopYD2URp/tB9xNTw21q/2r
 wIlWKo8WHpHw9OybDj3XLnQU1uy3HV9Ejtf6eDd9sblmiDl6kkTexVubmlTXB7GDeTUHiW2ubUV
 atA2zE4MMcHEivfsTcU9wbpv5u3AgNtvWVX5cxfhC8L82ZuGRD7IVOJGwTlUzpIQnIdoseozCq+
 y6mbikn5QZESRtAR1UGAQx78QnUpodoICnosJJTRYD30g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071290;
 b=PgrOOcfRy+7kIFIB2mOgHzkiU7yEJxymkSX1BEdQlO+nkSOLhbTBib1NadssFQ10L5KLjjef
 64yTZGMdNuqx/idgRUY2z17N7j89Bp1BQ88YDnLZeHCxrpETgyt0erW9Zu/yFNZFmXvvPdB2MV9
 QX9uYeQnvl0Ml/PIQF4Ni6MVbvuYbioQTtUMN+jyAg9DsD/2eKGi+/YfztZzP1Q6PYgcKpVYClP
 11rUxzyAUo7BU5mmMzBnCjD6uIIHXUQEYdM70i7cQDHRQK4Y73VTTSKep+Un7FoizLkHSrm/+Pl
 QD9YWOObt3dntzldLEF6eoq9efgFOYrhYjnRHEVT9kA6g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay31-hz1.antispameurope.com;
 Thu, 18 Dec 2025 16:21:30 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 54C12CC0D30;
	Thu, 18 Dec 2025 16:21:07 +0100 (CET)
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
Subject: [PATCH 2/6] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Thu, 18 Dec 2025 16:20:49 +0100
Message-ID: <20251218152058.1521806-3-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay31-hz1.antispameurope.com with 4dXDs03JbGz4HPhR
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:4d69e4e769c0d457f96290f5ace7a8c2
X-cloud-security:scantime:1.856
DKIM-Signature: a=rsa-sha256;
 bh=FI7PYyPGdjJp1gXUMedmlj7NmwLyvXozNGGHThu/Auc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071289; v=1;
 b=jZ8fhSaXzLPwcfRWmO+ZuAzH14QO5EbbIPxyrWSMcP8pcpp9rhGaHrDNCiFFB1YaJLuHzrlW
 OdaxmWxNrd+Q/p8vS/ws+Ev8KWmGRJbXkH+OvkvcBbFenHqucGjyUcBGTF4WXuk95kV9aRG+is/
 DU6FCDkWBbnz3fVSzQS1Vjjucm5HN4urMZJ3xdQ/u1/at96LtmaAR1FybXDT8xyvNmPPe3LiRy/
 /fr3D8msRBQqe8XCVEm4P706hro76mZUPD1/m8WTm3t4nFdv/r1cjDH7yrBOqPEayXJTD3J8a11
 mfHDxDyAE32YtQRctlBQ4HAR2XnNtNZI8c/0bifEqLHfA==

Reference usb-hxci.yaml in host mode in order to support on-board USB
hubs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa6..1f7f0adc3b1ed 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -85,6 +85,17 @@ required:
 
 allOf:
   - $ref: usb-drd.yaml#
+  - if:
+      properties:
+        dr_mode:
+          const: peripheral
+
+      required:
+        - dr_mode
+    then:
+      $ref: usb.yaml#
+    else:
+      $ref: usb-xhci.yaml#
 
 unevaluatedProperties: false
 
-- 
2.43.0


