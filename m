Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C539EB50A2
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 16:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbfIQOoz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 10:44:55 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39267 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728483AbfIQOoy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 10:44:54 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAEip-0005y3-7H; Tue, 17 Sep 2019 16:44:51 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAEio-0000WH-H5; Tue, 17 Sep 2019 16:44:50 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     richard.leitner@skidata.com, robh+dt@kernel.org,
        fancer.lancer@gmail.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 1/4] dt-bindings: usb: usb251xb: add documentation for voltage supply
Date:   Tue, 17 Sep 2019 16:44:46 +0200
Message-Id: <20190917144449.32739-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917144449.32739-1-m.felsch@pengutronix.de>
References: <20190917144449.32739-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the optional voltage supply documentation. If not specified the
dummy-regulator is used.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index 17915f64b8ee..4d5808b1cee0 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -12,6 +12,7 @@ Required properties :
 
 Optional properties :
  - reset-gpios : Should specify the gpio for hub reset
+ - vdd-supply : Should specify the phandle to the regulator supplying vdd
  - skip-config : Skip Hub configuration, but only send the USB-Attach command
  - vendor-id : Set USB Vendor ID of the hub (16 bit, default is 0x0424)
  - product-id : Set USB Product ID of the hub (16 bit, default depends on type)
-- 
2.20.1

