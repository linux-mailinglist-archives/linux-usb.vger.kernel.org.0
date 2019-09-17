Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6E0DB50A4
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 16:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbfIQOoy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 10:44:54 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57397 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728109AbfIQOoy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 10:44:54 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAEip-0005y6-7H; Tue, 17 Sep 2019 16:44:51 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAEio-0000WQ-IS; Tue, 17 Sep 2019 16:44:50 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     richard.leitner@skidata.com, robh+dt@kernel.org,
        fancer.lancer@gmail.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 4/4] usb: usb251xb: add pm_ops
Date:   Tue, 17 Sep 2019 16:44:49 +0200
Message-Id: <20190917144449.32739-5-m.felsch@pengutronix.de>
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

Currently the driver don't support pm_ops. These ops are not necessary
if the supply isn't switchable (always on). This assumptions seems to be
wrong because no one needs a powered hub during suspend-to-ram/disk.

So adding simple_dev_pm_ops to be able to switch off the hub during
suspend and to restore the config after a resume operation.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/misc/usb251xb.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index bc031d33f433..5bba19937da1 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -701,6 +701,29 @@ static int usb251xb_i2c_probe(struct i2c_client *i2c,
 	return usb251xb_probe(hub);
 }
 
+static int __maybe_unused usb251xb_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct usb251xb *hub = i2c_get_clientdata(client);
+
+	return regulator_disable(hub->vdd);
+}
+
+static int __maybe_unused usb251xb_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct usb251xb *hub = i2c_get_clientdata(client);
+	int err;
+
+	err = regulator_enable(hub->vdd);
+	if (err)
+		return err;
+
+	return usb251xb_connect(hub);
+}
+
+static SIMPLE_DEV_PM_OPS(usb251xb_pm_ops, usb251xb_suspend, usb251xb_resume);
+
 static const struct i2c_device_id usb251xb_id[] = {
 	{ "usb2512b", 0 },
 	{ "usb2512bi", 0 },
@@ -718,6 +741,7 @@ static struct i2c_driver usb251xb_i2c_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = of_match_ptr(usb251xb_of_match),
+		.pm = &usb251xb_pm_ops,
 	},
 	.probe    = usb251xb_i2c_probe,
 	.id_table = usb251xb_id,
-- 
2.20.1

