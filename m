Return-Path: <linux-usb+bounces-2816-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFB37E9E93
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 15:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36712280DBF
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 14:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5848B21114;
	Mon, 13 Nov 2023 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dNWCpFGY"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014DB210E7;
	Mon, 13 Nov 2023 14:27:04 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC9FD5F;
	Mon, 13 Nov 2023 06:27:01 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D83E21C000F;
	Mon, 13 Nov 2023 14:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699885620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEIgs122T7Asjcu3DAVwNs7eylVPunuGePaZEbl2tp8=;
	b=dNWCpFGY1qQrSRHjE5jAiv2SOMoC/Vkt74glt8+kW453OpsdimOQ6aw9eXp0Wr1Towbw5M
	Dn/7aBoG7qGp+huZcQjDhFZSDQBBatEWcfpoAP8PNAg5wW/CwA5iltmJyrI8+XpkdEwxTT
	kbj+dZIBiPnY+l3/TLvEV/Fkz1K/f3VenxYi3abxz0g8t+5qbTs9p5RCK+l0lmr/59QTxk
	M20tysL0nYfbuOdYylYb3UOX6T7ryx+nG65Rs9n3hNCx308YyEvh3tA9pfTUUWy8v1+pjw
	P9RsYCFAcjnNUVLxbN/I4qCdHxIHacs2i21h5n0UkZCsEbAZvCXoVdM9evsWpw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 13 Nov 2023 15:26:56 +0100
Subject: [PATCH 1/6] dt-bindings: usb: ti,j721e-usb: add ti,j7200-usb
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231113-j7200-usb-suspend-v1-1-ad1ee714835c@bootlin.com>
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
In-Reply-To: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.12.3
X-GND-Sasl: theo.lebrun@bootlin.com

On this platform, the controller is reset on resume. This makes it have
a different behavior from other platforms.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
index 95ff9791baea..77e0c0499936 100644
--- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - const: ti,j7200-usb
       - const: ti,j721e-usb
       - const: ti,am64-usb
       - items:

-- 
2.41.0


