Return-Path: <linux-usb+bounces-27977-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE353B53D07
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 22:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA7C448813E
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 20:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5619275872;
	Thu, 11 Sep 2025 20:22:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE62F2737E3
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 20:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757622178; cv=none; b=ls/P4PvwU26VrCVVLUDZB08UaZXm/l56TXiRc+Y/vNx0dc9nvYE8N6v+De0ywzmK9SbLWyex+ZqAnYNtZ799hrIVy9ku2/90KjdgNw30qwvnRXHBaxVjjxVL8LHZV6hkStyzBzwHIbJxxNRVtUMJFG75DGpK8Suj7+Z0fnfzMBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757622178; c=relaxed/simple;
	bh=Zw3PY4gOi1NzQluz4bDnOsYHFqh5V0V48Y140HuOBmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLW9c6wfz2P+yLWF3wXdQGsJg25ohNNhkp4jEkZtBxr7EFNRChwpaI55xRpwjHvu2U0ax3SHpvdGZZSQUJfIX0GrJi5ZkK86KtYBcvOE/C5Fu6MoWoFFBc1yChCIDDDNR6Mhh90N4VFTfDXm6aBRgHH7E+yJmM1wfvXqj2cG55k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uwnog-0005yg-Oh; Thu, 11 Sep 2025 22:22:50 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Thu, 11 Sep 2025 22:22:45 +0200
Subject: [PATCH v4 4/5] dt-bindings: usb: microchip,usb2514: add
 vbus-supply example
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-v6-16-topic-usb-onboard-dev-v4-4-1af288125d74@pengutronix.de>
References: <20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de>
In-Reply-To: <20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Matthias Kaehlcke <mka@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Add an usb hub vbus-supply example to make it easier for users to
understand the binding, after the usb-device.yaml gained the support for
it.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/devicetree/bindings/usb/microchip,usb2514.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
index 4e3901efed3fcd4fbbd8cb777f9df4fcadf2ca00..9874bbd03e31fd7ff1c439eb860a15617f147406 100644
--- a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
@@ -86,5 +86,12 @@ examples:
                 compatible = "usbb95,772b";
                 reg = <1>;
             };
+
+            /* VBUS on the 2nd port is managed by the host */
+            ethernet@2 {
+                compatible = "usbb95,772b";
+                reg = <2>;
+                vbus-supply = <&reg_5v0_vbus>;
+            };
         };
     };

-- 
2.47.3


