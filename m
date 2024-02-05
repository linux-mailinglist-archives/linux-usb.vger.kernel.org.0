Return-Path: <linux-usb+bounces-5888-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE46849FAD
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 17:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62326B216D7
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 16:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2403E44C66;
	Mon,  5 Feb 2024 16:43:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0453D4120F
	for <linux-usb@vger.kernel.org>; Mon,  5 Feb 2024 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707151418; cv=none; b=hsuLM2dWkq3o4i5aBU8D8OBEA/ZBNjJzt1NqrPf3rsxY59UYIJk7h4RXvOZCWF8tn3RQFFOtA4Fhaky7Mc9ZpttlFY/MjVlAgZWLQlAKxSEagotwh6S3iYBxpuHESt+hKUoz0KepJH6EiVKfxWLCrHqo6pPTGLW+yxHw9DMldoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707151418; c=relaxed/simple;
	bh=xLjwZJOeXZFadK4nYdC3krKeoAWYMaGJ7UQfwJG985E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZgR5kVtUDQ7uNqEbQLsaj9Iq5tnRvKrumG4wRlGmaV0ijg91fHjVIm0KmSAyoMgwcZclGnwn+Ft82y6j/3K8YEmvqd5N7tJpuJg5FbDmxL2tuvHGhrGjFuCeIqeZPv2cl+ILk7dEqjQSsQ3AuJ2Q+yywMQ9qwnFsaZW1ggeymWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1rX240-0004Lp-9O; Mon, 05 Feb 2024 17:43:20 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 1/4] dt-bindings: usb: typec-tcpci: add tcpci compatible binding
Date: Mon,  5 Feb 2024 17:43:13 +0100
Message-Id: <20240205164316.805408-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240205164316.805408-1-m.felsch@pengutronix.de>
References: <20240205164316.805408-1-m.felsch@pengutronix.de>
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

This binding descripes the generic TCPCI specification [1]. So add the
generic binding support since which can be used if an different TCPC is
used compatible which is compatible to [1].

[1] https://www.usb.org/sites/default/files/documents/usb-port_controller_specification_rev2.0_v1.0_0.pdf

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
index eaedb4cc6b6c..7bd7bbbac9e0 100644
--- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: nxp,ptn5110
+    enum:
+      - nxp,ptn5110
+      - tcpci
 
   reg:
     maxItems: 1
-- 
2.39.2


