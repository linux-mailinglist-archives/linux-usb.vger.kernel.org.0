Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30A32F194B
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 16:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbhAKPOi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 10:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727917AbhAKPOi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 10:14:38 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4195FC0617A3
        for <linux-usb@vger.kernel.org>; Mon, 11 Jan 2021 07:13:57 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1kyyt1-0006K3-Sw; Mon, 11 Jan 2021 16:13:39 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1kyyt1-0007RE-25; Mon, 11 Jan 2021 16:13:39 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/2] dt-bindings: usb: dwc2: Add support for additional clock
Date:   Mon, 11 Jan 2021 16:13:36 +0100
Message-Id: <20210111151337.5643-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210111151337.5643-1-s.hauer@pengutronix.de>
References: <20210111151337.5643-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds support for an additional clock for the dwc2 core in case
there is another clock to the phy which must be enabled.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index e5ee51b7b470..20d0847c7b01 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -57,11 +57,12 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    maxItems: 2
 
   clock-names:
     items:
       - const: otg
+      - const: phy
 
   resets:
     items:
-- 
2.20.1

