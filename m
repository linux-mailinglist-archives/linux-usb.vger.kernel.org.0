Return-Path: <linux-usb+bounces-13199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDA894AA78
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 16:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF64BB28DB1
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 14:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295867F476;
	Wed,  7 Aug 2024 14:37:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B7084A3E
	for <linux-usb@vger.kernel.org>; Wed,  7 Aug 2024 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723041432; cv=none; b=XgD+F7tfpEXwX5kfUwbYQraWBmyLhuMKjFS/fh2hO9AnsvNQYpYEpUoGFdgB6jh3OCuRPPoMe7W7vPJRXNez3hCx1LA53c4MuQIHJljvMsPMZdg2/dAQUOYbq8CiMm8LbKvJaS3vrV9nFNBry4Iqp9StMJiE/otXEgixIr29W0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723041432; c=relaxed/simple;
	bh=CWu6UEBdQE6dgCfX+/gjSRxyG/gDmW37Og5SPgZMvRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jVHL0VFGaPNl9wusqw3mVZQVMrx0ngHMN+/Ss6XQzs7m7llt0xREzch95Dwk2IFO5WZWgQCDLt+/Qt85Rxlfy4GD6ONiK6LhtL4nPcqCgzL1zlTksAjv4y055WEB3H9bwErOGxxvvpds31NLDKiz0h1eg3REW0Euj7pKjE5/m2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sbhme-0004Iv-LG; Wed, 07 Aug 2024 16:37:00 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 07 Aug 2024 16:36:52 +0200
Subject: [PATCH 2/3] dt-bindings: usb: microchip,usb2514: add support for
 port vbus-supply
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-b4-v6-10-topic-usb-onboard-dev-v1-2-f33ce21353c9@pengutronix.de>
References: <20240807-b4-v6-10-topic-usb-onboard-dev-v1-0-f33ce21353c9@pengutronix.de>
In-Reply-To: <20240807-b4-v6-10-topic-usb-onboard-dev-v1-0-f33ce21353c9@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Some PCB designs don't connect the USB hub port power control GPIO and
instead make use of an host controllable regulator. Add support for this
use-case by introducing an portX-vbus-supply property.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/devicetree/bindings/usb/microchip,usb2514.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
index 783c27591e56..51d02c4b8f2d 100644
--- a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
@@ -35,6 +35,13 @@ required:
   - compatible
   - reg
 
+patternProperties:
+  "^port[1-7]-vbus-supply$"
+    type: object
+    description:
+      Regulator controlling the USB VBUS on portX. Only required if the host
+      controls the portX VBUS.
+
 unevaluatedProperties: false
 
 examples:

-- 
2.39.2


