Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 706FE171168
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 08:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728435AbgB0HZw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 02:25:52 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46041 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbgB0HZv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 02:25:51 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7DYL-0008KQ-W4; Thu, 27 Feb 2020 08:25:49 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7DYK-0004g1-Lc; Thu, 27 Feb 2020 08:25:48 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     richard.leitner@skidata.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] usb: usb251xb: check if hub is already attached
Date:   Thu, 27 Feb 2020 08:25:45 +0100
Message-Id: <20200227072545.16856-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
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

It is possible that the hub was configured earlier by the bootloader and
we lack of the reset-gpio. In such a case the usb251xb_connect() fails
because the registers are write-protected. Add a check to test if the
hub is already connected and don't try to reconfigure the hub if we
can't toggle the reset pin. Don't change the usb251xb_connect() logic
if we can't read the status.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/misc/usb251xb.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 29fe5771c21b..9f9a64bab059 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -266,6 +266,30 @@ static int usb251x_check_gpio_chip(struct usb251xb *hub)
 }
 #endif
 
+static bool usb251xb_hub_attached(struct usb251xb *hub)
+{
+	char i2c_rb;
+	int err;
+
+	err = i2c_smbus_read_block_data(hub->i2c, USB251XB_ADDR_STATUS_COMMAND,
+					&i2c_rb);
+	if (err < 0) {
+		/*
+		 * The device disables the i2c-interface immediately after it
+		 * received the USB_ATTACH signal.
+		 */
+		if (err == -ENXIO)
+			return true;
+
+		dev_warn(hub->dev,
+			 "Checking hub Status/Command register failed: %d\n",
+			 err);
+		return false;
+	}
+
+	return !!(i2c_rb & USB251XB_STATUS_COMMAND_ATTACH);
+}
+
 static void usb251xb_reset(struct usb251xb *hub)
 {
 	if (!hub->gpio_reset)
@@ -288,6 +312,15 @@ static int usb251xb_connect(struct usb251xb *hub)
 	struct device *dev = hub->dev;
 	int err, i;
 	char i2c_wb[USB251XB_I2C_REG_SZ];
+	bool is_attached;
+
+	/*
+	 * Check if configuration was done earlier by the bootloader. Trust them
+	 * if it is the case and we are not capable to reset the hub.
+	 */
+	is_attached = usb251xb_hub_attached(hub);
+	if (!hub->gpio_reset && is_attached)
+		return 0;
 
 	memset(i2c_wb, 0, USB251XB_I2C_REG_SZ);
 
-- 
2.20.1

