Return-Path: <linux-usb+bounces-22251-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC63A73A6A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 18:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9609A3BD002
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 17:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB1521A427;
	Thu, 27 Mar 2025 17:29:03 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1CB218E81
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 17:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743096543; cv=none; b=nb9q8UaAXHGoyq9BJvfR1ALZXiAQTVH1eqIwvPPcT6uDi/d3/H2bHi9k6HuZcd5QH+FN4UvCqd+EMA+1U25om5/kbe8lLXikx/0LnRljBCMPtINYDw54QbXv5ukVn5hv1pgkYVFlraWo2sgle1ogw1h6VaO5TJ8kre/cc/YLE2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743096543; c=relaxed/simple;
	bh=1ufy5l/4TNkqIz4H+ht3hW6OlvySs4fVijFL11ZzFRU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JTPThDg6r+pyzG2nzX0MzFjO8tchDnMNPatB77ikxn5JPIjIWLQuvIP+HXdUKw65d7PYPH1U4Qn82vSTZ3Gve4m7BXFoOIda3nbWZ5kLUi4pUFaH3BYY6Jh1ksr30eP7cpoesFtuVpCkdACmG1nxjb8Ut7tbxl/mKZuOhzKN9Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1txr2D-0002hN-Bc; Thu, 27 Mar 2025 18:28:53 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mka@chromium.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	festevam@denx.de,
	stern@rowland.harvard.edu,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: usb: microchip,usb2514: add support for port vbus-supply
Date: Thu, 27 Mar 2025 18:28:02 +0100
Message-Id: <20250327172803.3404615-4-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327172803.3404615-1-m.felsch@pengutronix.de>
References: <20250327172803.3404615-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Some PCB designs don't connect the USB hub port power control GPIO and
instead make use of a host controllable regulator. Add support for this
use-case by introducing portX-vbus-supply property.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../devicetree/bindings/usb/microchip,usb2514.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
index 4e3901efed3f..ae6a9fb4f3d0 100644
--- a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
@@ -49,6 +49,12 @@ patternProperties:
     $ref: /schemas/usb/usb-device.yaml
     additionalProperties: true
 
+  "^port[1-7]-vbus-supply$"
+    type: object
+    description:
+      Regulator controlling the USB VBUS on portX. Only required if the host
+      controls the portX VBUS.
+
 allOf:
   - $ref: usb-device.yaml#
   - if:
-- 
2.39.5


