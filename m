Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D235B50AA
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 16:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728526AbfIQOo6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 10:44:58 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50637 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbfIQOoy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 10:44:54 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAEip-0005y5-7M; Tue, 17 Sep 2019 16:44:51 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAEio-0000WN-Hy; Tue, 17 Sep 2019 16:44:50 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     richard.leitner@skidata.com, robh+dt@kernel.org,
        fancer.lancer@gmail.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 3/4] usb: usb251xb: simplify reset helper
Date:   Tue, 17 Sep 2019 16:44:48 +0200
Message-Id: <20190917144449.32739-4-m.felsch@pengutronix.de>
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

Currently the reset handler was always called to deassert the reset
line because assert the line was done during probe. Now if we want to
support pm by turn of the supply we need to call this routine twice and
the i2c_lock_bus is done twice too. To simplify that we can drop the
state and just do a reset in one go. So a future pm operation don't need
to lock the i2c bus twice.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/misc/usb251xb.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 05819167604d..bc031d33f433 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -263,20 +263,19 @@ static int usb251x_check_gpio_chip(struct usb251xb *hub)
 }
 #endif
 
-static void usb251xb_reset(struct usb251xb *hub, int state)
+static void usb251xb_reset(struct usb251xb *hub)
 {
 	if (!hub->gpio_reset)
 		return;
 
 	i2c_lock_bus(hub->i2c->adapter, I2C_LOCK_SEGMENT);
 
-	gpiod_set_value_cansleep(hub->gpio_reset, state);
+	gpiod_set_value_cansleep(hub->gpio_reset, 1);
+	usleep_range(1, 10);	/* >=1us RESET_N asserted */
+	gpiod_set_value_cansleep(hub->gpio_reset, 0);
 
 	/* wait for hub recovery/stabilization */
-	if (!state)
-		usleep_range(500, 750);	/* >=500us at power on */
-	else
-		usleep_range(1, 10);	/* >=1us at power down */
+	usleep_range(500, 750);	/* >=500us after RESET_N deasserted */
 
 	i2c_unlock_bus(hub->i2c->adapter, I2C_LOCK_SEGMENT);
 }
@@ -294,7 +293,7 @@ static int usb251xb_connect(struct usb251xb *hub)
 		i2c_wb[0] = 0x01;
 		i2c_wb[1] = USB251XB_STATUS_COMMAND_ATTACH;
 
-		usb251xb_reset(hub, 0);
+		usb251xb_reset(hub);
 
 		err = i2c_smbus_write_i2c_block_data(hub->i2c,
 				USB251XB_ADDR_STATUS_COMMAND, 2, i2c_wb);
@@ -344,7 +343,7 @@ static int usb251xb_connect(struct usb251xb *hub)
 	i2c_wb[USB251XB_ADDR_PORT_MAP_7]        = hub->port_map7;
 	i2c_wb[USB251XB_ADDR_STATUS_COMMAND] = USB251XB_STATUS_COMMAND_ATTACH;
 
-	usb251xb_reset(hub, 0);
+	usb251xb_reset(hub);
 
 	/* write registers */
 	for (i = 0; i < (USB251XB_I2C_REG_SZ / USB251XB_I2C_WRITE_SZ); i++) {
-- 
2.20.1

