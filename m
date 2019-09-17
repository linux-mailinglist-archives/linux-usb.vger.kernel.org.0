Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C900B50A1
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 16:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbfIQOoy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 10:44:54 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48817 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfIQOoy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 10:44:54 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAEip-0005y4-7T; Tue, 17 Sep 2019 16:44:51 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAEio-0000WK-Ha; Tue, 17 Sep 2019 16:44:50 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     richard.leitner@skidata.com, robh+dt@kernel.org,
        fancer.lancer@gmail.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 2/4] usb: usb251xb: add vdd supply support
Date:   Tue, 17 Sep 2019 16:44:47 +0200
Message-Id: <20190917144449.32739-3-m.felsch@pengutronix.de>
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

Currently we don't handle the supply. We need to add the supply support
to be able to switch the supply off e.g. during a suspend-to-ram
operation. So we can guarantee a correct (re-)initialization.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/misc/usb251xb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 6ca9111d150a..05819167604d 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/nls.h>
 #include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
 /* Internal Register Set Addresses & Default Values acc. to DS00001692C */
@@ -116,6 +117,7 @@
 struct usb251xb {
 	struct device *dev;
 	struct i2c_client *i2c;
+	struct regulator *vdd;
 	u8 skip_config;
 	struct gpio_desc *gpio_reset;
 	u16 vendor_id;
@@ -420,6 +422,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 		return err;
 	}
 
+	hub->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(hub->vdd))
+		return PTR_ERR(hub->vdd);
+
 	if (of_property_read_u16_array(np, "vendor-id", &hub->vendor_id, 1))
 		hub->vendor_id = USB251XB_DEF_VENDOR_ID;
 
@@ -665,6 +671,10 @@ static int usb251xb_probe(struct usb251xb *hub)
 	if (err)
 		return err;
 
+	err = regulator_enable(hub->vdd);
+	if (err)
+		return err;
+
 	err = usb251xb_connect(hub);
 	if (err) {
 		dev_err(dev, "Failed to connect hub (%d)\n", err);
-- 
2.20.1

