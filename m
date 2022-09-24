Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3865E8B76
	for <lists+linux-usb@lfdr.de>; Sat, 24 Sep 2022 12:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbiIXK3Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Sep 2022 06:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiIXK3W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Sep 2022 06:29:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B1911ED67
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 03:29:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B2EE1611CC
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 10:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA01DC4347C;
        Sat, 24 Sep 2022 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664015360;
        bh=WeemlflOJmTQjkpMMZMOaJ74WI9we1Iyc69cTycNBls=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oOyWkXE7GYdJAxgGNoN+fGSjQqJgWbLmG41SSbLwb9d4VHRU0EwBOancnBaNjz62d
         e+CF6OzAFM4/3i5tbXDLrgccozMIbhX4RV6bBYplw+xJYwybM1+BiXgiejer8wtoHW
         SGTy+OjccAn+g472B22y1pA2jzbYI8GKB871uIcg25r97JA2bNJlCaXz6w3maUHrlp
         XtHzTD3tD6ycmOHYj8gaLlRmvBE9oq9vexXZDjyt1KypOoOTGIurHuSYx1T2IkNkIQ
         o5QlGuRPmxlnHv/M7kB28uqYw27BZ+rHpglWup9ggdVa5BGHn4XmcI0EPRZNsoDNju
         wohFwM62SnUMg==
Received: by pali.im (Postfix)
        id 6FD8E8A2; Sat, 24 Sep 2022 12:29:19 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v3 4/7] USB: serial: ftdi_sio: Do not reset baud rate to 9600 Baud on error
Date:   Sat, 24 Sep 2022 12:27:15 +0200
Message-Id: <20220924102718.2984-5-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220924102718.2984-1-pali@kernel.org>
References: <20220924102718.2984-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If setting new baud rate fails, some other drivers leave the device at
previous baud rate, and ftdi_sio resets to 9600 Baud.

Change this behavior to not reset baud rate to 9600.

Signed-off-by: Pali Rohár <pali@kernel.org>
Tested-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 47 ++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index fe8a7c5fa0e9..1ab6bf48516f 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1315,7 +1315,7 @@ static int update_mctrl(struct usb_serial_port *port, unsigned int set,
 
 
 static u32 get_ftdi_divisor(struct tty_struct *tty,
-						struct usb_serial_port *port)
+			    struct usb_serial_port *port, speed_t old_baud)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
 	struct device *dev = &port->dev;
@@ -1338,6 +1338,8 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			__func__, priv->custom_divisor, baud);
 	}
 
+	if (!baud)
+		baud = old_baud;
 	if (!baud)
 		baud = 9600;
 	switch (priv->chip_type) {
@@ -1346,8 +1348,12 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 		if (div_value == (u32)-1) {
 			dev_dbg(dev, "%s - Baudrate (%d) requested is not supported\n",
 				__func__,  baud);
-			baud = 9600;
+			baud = old_baud ? old_baud : 9600;
 			div_value = ftdi_sio_baud_to_divisor(baud);
+			if (div_value == -1) {
+				baud = 9600;
+				div_value = ftdi_sio_baud_to_divisor(baud);
+			}
 			div_okay = 0;
 		}
 		break;
@@ -1356,8 +1362,11 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			div_value = ftdi_232am_baud_to_divisor(baud);
 		} else {
 			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
-			baud = 9600;
-			div_value = ftdi_232am_baud_to_divisor(9600);
+			if (old_baud >= 183 && old_baud <= 3000000)
+				baud = old_baud;
+			else
+				baud = 9600;
+			div_value = ftdi_232am_baud_to_divisor(baud);
 			div_okay = 0;
 		}
 		break;
@@ -1379,9 +1388,12 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			div_value = ftdi_232bm_baud_to_divisor(baud);
 		} else {
 			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
-			div_value = ftdi_232bm_baud_to_divisor(9600);
+			if (old_baud >= 183 && old_baud <= 3000000)
+				baud = old_baud;
+			else
+				baud = 9600;
+			div_value = ftdi_232bm_baud_to_divisor(baud);
 			div_okay = 0;
-			baud = 9600;
 		}
 		break;
 	case FT2232H: /* FT2232H chip */
@@ -1393,9 +1405,17 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			div_value = ftdi_232bm_baud_to_divisor(baud);
 		} else {
 			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
-			div_value = ftdi_232bm_baud_to_divisor(9600);
+			if (old_baud >= 183 && old_baud < 1200) {
+				baud = old_baud;
+				div_value = ftdi_232bm_baud_to_divisor(baud);
+			} else {
+				if (old_baud >= 1200 && old_baud <= 12000000)
+					baud = old_baud;
+				else
+					baud = 9600;
+				div_value = ftdi_2232h_baud_to_divisor(baud);
+			}
 			div_okay = 0;
-			baud = 9600;
 		}
 		break;
 	} /* priv->chip_type */
@@ -1410,7 +1430,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 	return div_value;
 }
 
-static int change_speed(struct tty_struct *tty, struct usb_serial_port *port)
+static int change_speed(struct tty_struct *tty, struct usb_serial_port *port, speed_t old_baud)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
 	u16 value;
@@ -1418,7 +1438,7 @@ static int change_speed(struct tty_struct *tty, struct usb_serial_port *port)
 	u32 index_value;
 	int rv;
 
-	index_value = get_ftdi_divisor(tty, port);
+	index_value = get_ftdi_divisor(tty, port, old_baud);
 	value = (u16)index_value;
 	index = (u16)(index_value >> 16);
 	if (priv->chip_type == FT2232C || priv->chip_type == FT2232H ||
@@ -1541,7 +1561,7 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
 		if (priv->flags & ASYNC_SPD_MASK)
 			dev_warn_ratelimited(&port->dev, "use of SPD flags is deprecated\n");
 
-		change_speed(tty, port);
+		change_speed(tty, port, 9600);
 	}
 	mutex_unlock(&priv->cfg_lock);
 	return 0;
@@ -2790,9 +2810,12 @@ static void ftdi_set_termios(struct tty_struct *tty,
 		/* Drop RTS and DTR */
 		clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
 	} else {
+		speed_t old_baud =
+			old_termios ? tty_termios_baud_rate(old_termios) : 9600;
+
 		/* set the baudrate determined before */
 		mutex_lock(&priv->cfg_lock);
-		if (change_speed(tty, port))
+		if (change_speed(tty, port, old_baud))
 			dev_err(ddev, "%s urb failed to set baudrate\n", __func__);
 		mutex_unlock(&priv->cfg_lock);
 		/* Ensure RTS and DTR are raised when baudrate changed from 0 */
-- 
2.20.1

