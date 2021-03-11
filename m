Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A14C733738B
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 14:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbhCKNOz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 08:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233139AbhCKNOm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Mar 2021 08:14:42 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0DCC061574
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 05:14:42 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id a24so10168399plm.11
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 05:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kream.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bKIYZOuu3fugLMp+J2CXlNmr0lC76gK5vodVt8WP6I=;
        b=WYw0ovB8iMsHniu2lHXcphSW1QBovlGBM4jC4zpQGf5Qja+VReIYxCjMg40j4z7vPR
         VUxNYZJGo7qbsfj+7Vq+AIqDJsNl7naJz/YHNJCy7H5cMrJ4eFAtsd8d6+WQdmaVCt8W
         /r7d8z0C59+I7uqxHxi+arzIyrR0dSVp0c8ssm/6xtr+TQ1Gfm82pHGGfahN0gwy8pz+
         dq5QQJPY1YfmPUbdl22kmG6k98n3NlEMZ5ZgwcYeK7bHZUoeK43ECaSB9AVIPFqq7/AJ
         3otKIG1UrbAOjplprM5wSjXzaFTUsDPGIgNToqyludr9cnp4Afi32SCZkkKEgsijlYWI
         Vxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bKIYZOuu3fugLMp+J2CXlNmr0lC76gK5vodVt8WP6I=;
        b=cKjQ3YPJnaFHlACg6GQkizvgrHQIg4lCfKBpzyhKcOY2Nn+F9dun1rgCyg7BHK4hFt
         FD4FxL85jCtLu3skdvm699lL48ABWZe0dvo7tam3uJIrK7Aijgl/RTI2mLhwh+yOE6J7
         YVNhsD5KmQAv/rtgn1vYjrreKnAMRd/r2CsMxNHXOIHC/yHdZpw8Nchywb3rXAB2AU14
         GvJXwDZLXk4HJ1IMYuDrIFpMP50JtE13j8GRXFNuZxfeSjRtyZgvuH3L8coTEkbLyoJ2
         K0KrS84BW7npxoTZ+h/7CBSxgRawGJl3Fwiu1JzCvfN4OjxFbYYfyzvENM6bxee/Ge0e
         fkEQ==
X-Gm-Message-State: AOAM531AG9PGecXx5vRhXI3GaNXorIgS6ojZ1s+ahMOWm+7UsOmshKot
        Swn3Hi4vHpdYi5wxtf1mwhrQTDW5Bcpq9eP/
X-Google-Smtp-Source: ABdhPJwmGYwV5917jnplLafmcCxhCH9afGDvwg3ICleEmlIN3O0yGp2ZE0pyvTuSo7NI994Brx8I2Q==
X-Received: by 2002:a17:90a:fb47:: with SMTP id iq7mr9197919pjb.159.1615468481520;
        Thu, 11 Mar 2021 05:14:41 -0800 (PST)
Received: from nNa-Laptop.lan (122x213x216x82.ap122.ftth.ucom.ne.jp. [122.213.216.82])
        by smtp.gmail.com with ESMTPSA id c24sm2353251pfi.193.2021.03.11.05.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 05:14:41 -0800 (PST)
From:   =?UTF-8?q?Klemen=20Ko=C5=A1ir?= <klemen.kosir@kream.io>
To:     johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        =?UTF-8?q?Klemen=20Ko=C5=A1ir?= <klemen.kosir@kream.io>
Subject: [PATCH] USB: serial: cp210x: Improve wording in some comments
Date:   Thu, 11 Mar 2021 22:14:35 +0900
Message-Id: <20210311131435.293910-1-klemen.kosir@kream.io>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch fixes some spelling mistakes and improves wording in some
comments. It also renames one variable to unify naming with others.

Signed-off-by: Klemen Košir <klemen.kosir@kream.io>
---
 drivers/usb/serial/cp210x.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index a373cd63b3a4..7bcc253143a5 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -430,8 +430,8 @@ struct cp210x_comm_status {
 /*
  * CP210X_PURGE - 16 bits passed in wValue of USB request.
  * SiLabs app note AN571 gives a strange description of the 4 bits:
- * bit 0 or bit 2 clears the transmit queue and 1 or 3 receive.
- * writing 1 to all, however, purges cp2108 well enough to avoid the hang.
+ * bit 0 or bit 2 clears the transmit queue and 1 or 3 clears the receive queue.
+ * Writing 1 to all, however, purges CP2108 well enough to avoid the hang.
  */
 #define PURGE_ALL		0x000f

@@ -443,7 +443,6 @@ struct cp210x_comm_status {
 #define CP210X_LSR_FRAME	BIT(3)
 #define CP210X_LSR_BREAK	BIT(4)

-
 /* CP210X_GET_FLOW/CP210X_SET_FLOW read/write these 0x10 bytes */
 struct cp210x_flow_ctl {
 	__le32	ulControlHandshake;
@@ -764,7 +763,7 @@ static void cp210x_close(struct usb_serial_port *port)

 	usb_serial_generic_close(port);

-	/* Clear both queues; cp2108 needs this to avoid an occasional hang */
+	/* Clear both queues; CP2108 needs this to avoid an occasional hang. */
 	cp210x_write_u16_reg(port, CP210X_PURGE, PURGE_ALL);

 	cp210x_write_u16_reg(port, CP210X_IFC_ENABLE, UART_DISABLE);
@@ -1009,9 +1008,9 @@ static speed_t cp210x_get_actual_rate(speed_t baud)
  *	div = round(freq / (2 x prescale x request))
  *	actual = freq / (2 x prescale x div)
  *
- * For CP2104 and CP2105 freq is 48Mhz and prescale is 4 for request <= 365bps
+ * For CP2104 and CP2105 freq is 48MHz and prescale is 4 for request <= 365bps
  * or 1 otherwise.
- * For CP2110 freq is 24Mhz and prescale is 4 for request <= 300bps or 1
+ * For CP2110 freq is 24MHz and prescale is 4 for request <= 300bps or 1
  * otherwise.
  */
 static void cp210x_change_speed(struct tty_struct *tty,
@@ -1023,7 +1022,7 @@ static void cp210x_change_speed(struct tty_struct *tty,

 	/*
 	 * This maps the requested rate to the actual rate, a valid rate on
-	 * cp2102 or cp2103, or to an arbitrary rate in [1M, max_speed].
+	 * CP2102 or CP2103, or to an arbitrary rate in [1M, max_speed].
 	 *
 	 * NOTE: B0 is not implemented.
 	 */
@@ -1286,6 +1285,7 @@ static int cp210x_tiocmset(struct tty_struct *tty,
 		unsigned int set, unsigned int clear)
 {
 	struct usb_serial_port *port = tty->driver_data;
+
 	return cp210x_tiocmset_port(port, set, clear);
 }

@@ -1552,7 +1552,7 @@ static int cp210x_gpio_set_config(struct gpio_chip *gc, unsigned int gpio,
 /*
  * This function is for configuring GPIO using shared pins, where other signals
  * are made unavailable by configuring the use of GPIO. This is believed to be
- * only applicable to the cp2105 at this point, the other devices supported by
+ * only applicable to the CP2105 at this point, the other devices supported by
  * this driver that provide GPIO do so in a way that does not impact other
  * signals and are thus expected to have very different initialisation.
  */
@@ -1561,7 +1561,7 @@ static int cp2105_gpioconf_init(struct usb_serial *serial)
 	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
 	struct cp210x_pin_mode mode;
 	struct cp210x_dual_port_config config;
-	u8 intf_num = cp210x_interface_num(serial);
+	u8 iface_num = cp210x_interface_num(serial);
 	u8 iface_config;
 	int result;

@@ -1577,8 +1577,8 @@ static int cp2105_gpioconf_init(struct usb_serial *serial)
 	if (result < 0)
 		return result;

-	/*  2 banks of GPIO - One for the pins taken from each serial port */
-	if (intf_num == 0) {
+	/* 2 banks of GPIO - One for the pins taken from each serial port */
+	if (iface_num == 0) {
 		if (mode.eci == CP210X_PIN_MODE_MODEM) {
 			/* mark all GPIOs of this interface as reserved */
 			priv->gpio_altfunc = 0xff;
@@ -1590,7 +1590,7 @@ static int cp2105_gpioconf_init(struct usb_serial *serial)
 						CP210X_ECI_GPIO_MODE_MASK) >>
 						CP210X_ECI_GPIO_MODE_OFFSET);
 		priv->gc.ngpio = 2;
-	} else if (intf_num == 1) {
+	} else if (iface_num == 1) {
 		if (mode.sci == CP210X_PIN_MODE_MODEM) {
 			/* mark all GPIOs of this interface as reserved */
 			priv->gpio_altfunc = 0xff;
@@ -1659,7 +1659,7 @@ static int cp2104_gpioconf_init(struct usb_serial *serial)
 	 */
 	for (i = 0; i < priv->gc.ngpio; ++i) {
 		/*
-		 * Set direction to "input" iff pin is open-drain and reset
+		 * Set direction to "input" if pin is open-drain and reset
 		 * value is 1.
 		 */
 		if (!(priv->gpio_pushpull & BIT(i)) && (gpio_latch & BIT(i)))
@@ -1733,7 +1733,7 @@ static int cp2102n_gpioconf_init(struct usb_serial *serial)
 		 * For the QFN28 package, GPIO4-6 are controlled by
 		 * the low three bits of the mode/latch fields.
 		 * Contrary to the document linked above, the bits for
-		 * the SUSPEND pins are elsewhere.  No alternate
+		 * the SUSPEND pins are elsewhere. No alternate
 		 * function is available for these pins.
 		 */
 		priv->gc.ngpio = 7;
@@ -1742,16 +1742,16 @@ static int cp2102n_gpioconf_init(struct usb_serial *serial)
 	}

 	/*
-	 * The CP2102N does not strictly has input and output pin modes,
+	 * The CP2102N does not strictly have input and output pin modes,
 	 * it only knows open-drain and push-pull modes which is set at
-	 * factory. An open-drain pin can function both as an
+	 * the factory. An open-drain pin can function both as an
 	 * input or an output. We emulate input mode for open-drain pins
 	 * by making sure they are not driven low, and we do not allow
 	 * push-pull pins to be set as an input.
 	 */
 	for (i = 0; i < priv->gc.ngpio; ++i) {
 		/*
-		 * Set direction to "input" iff pin is open-drain and reset
+		 * Set direction to "input" if pin is open-drain and reset
 		 * value is 1.
 		 */
 		if (!(priv->gpio_pushpull & BIT(i)) && (gpio_latch & BIT(i)))
--
2.29.2

