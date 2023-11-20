Return-Path: <linux-usb+bounces-3028-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C53FF7F194E
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 18:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71065281ECE
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 17:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62420200D6;
	Mon, 20 Nov 2023 17:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cqDuf8RN"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01D5CD;
	Mon, 20 Nov 2023 09:06:09 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C04F9E0004;
	Mon, 20 Nov 2023 17:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700499968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4e4jB34Kjsk2UhhZjV+mvo2m7UoKK5NW1KZZ6R6IxOQ=;
	b=cqDuf8RNFW1EIuNkivfh/7YHzcXWzE3RlLaDdCkEnyQgoOrbKlktlJzBPBcsgnzQZPwHTF
	qz4DTkmFhScyDDAHK9IMH8OKsOpHbWoKWa6zXy+jgSfFx/KlqsZ/ZuOsQZrtH+VOVbz6Yj
	lIo3gidp5cPwrxrR2Ng5s2CO4lWcoayR00h9GDgZTSrlHGwsZPeQdzXuVVDhCJ6Xrc2AQa
	zGclxzuN3hL7ZzQ61Y4rBO6C7SNfR9C1pDm/8KG+A5JPARYyP3+gwUiC4SZpW9n5H0MZw4
	sYRMW8mXzFYCQRAtifg6QcCYIaokeK5diiZbtPqVXQtKhqySHRPaLjsRit7OWw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 20 Nov 2023 18:06:01 +0100
Subject: [PATCH v2 1/7] dt-bindings: usb: ti,j721e-usb: add ti,j7200-usb
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231120-j7200-usb-suspend-v2-1-038c7e4a3df4@bootlin.com>
References: <20231120-j7200-usb-suspend-v2-0-038c7e4a3df4@bootlin.com>
In-Reply-To: <20231120-j7200-usb-suspend-v2-0-038c7e4a3df4@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Thomas Petazzoni thomas.petazzoni"@bootlin.com, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-GND-Sasl: theo.lebrun@bootlin.com

On this platform, the controller & its wrapper are reset on resume. This
makes it have a different behavior from other platforms.

We allow using the new compatible with a fallback onto the original
ti,j721e-usb compatible. We therefore allow using an older kernel with
a more recent devicetree.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
index 95ff9791baea..69a222dfd9ff 100644
--- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
@@ -12,11 +12,15 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - const: ti,j7200-usb
       - const: ti,j721e-usb
       - const: ti,am64-usb
       - items:
           - const: ti,j721e-usb
           - const: ti,am64-usb
+      - items:
+          - const: ti,j721e-usb
+          - const: ti,j7200-usb
 
   reg:
     maxItems: 1

-- 
2.42.0


