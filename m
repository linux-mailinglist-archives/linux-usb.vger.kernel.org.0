Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D79A571915
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 13:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232947AbiGLLyc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 07:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232759AbiGLLyP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 07:54:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741FFB62B3
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 04:53:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 14F99B817D2
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 11:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9E5C341CD;
        Tue, 12 Jul 2022 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657626797;
        bh=dOjeyEjyp7Idfbj83YUAKFYnn1f9HOeImcRded7YFIM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mXk6gTQJs5khRVQhvA1FVall+TpCFKkGJ78fYolb9ZDOqcIxBokoAuAcz9gOgfiRF
         0UN7QxXU7ptTWCk44wrgNOzLfk1f2ozGYryhfx9SGv9hwWX1XMwhhn4wIG9gKRzVrw
         ZalbT6noXdVnQLsi/eBTpOukf2Jb3gWdxTeDNfpIK2GvCNKaH3E3ihgvG9coFGkhKO
         KsHhG5nDkEGfE6+asfMh3UbVeA59BGxmfiaEMfwG5ABZv4OJ71lkxahnCPyMNk+hK7
         Re1y3HjLBRBwx/oSwv7E6T7BSOD+ztktgujyBygRlykdcJXKAUp2Un8b4NeWAPdZro
         CnNJZ7V9tWITw==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 4/7] USB: serial: ftdi_sio: Do not reset baud rate to 9600 Baud on error
Date:   Tue, 12 Jul 2022 13:53:03 +0200
Message-Id: <20220712115306.26471-5-kabel@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220712115306.26471-1-kabel@kernel.org>
References: <20220712115306.26471-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Pali Rohár <pali@kernel.org>

If setting new baud rate fails, all other drivers leave the device at
previous baud rate, only ftdi_sio resets to 9600 Baud.

Change this behavior to that of other drivers so that /dev/ttyUSB*
devices behave in the same way.

Signed-off-by: Pali Rohár <pali@kernel.org>
Tested-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Marek Behún <kabel@kernel.org>
---
Greg pointed out that this make break some people's workflow, that they
may depend on this behavior.

This is of course possible, although IMO improbable: it would be weird
to depend on the fall back to 9600 Baud on error, instead of expecting
that the baud rate didn't change at all (like in other /dev/ttyUSB*
drivers).

Nonetheless if someone complains that they workflow got broken, we will
need to revert this.
---
 drivers/usb/serial/ftdi_sio.c | 38 ++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 5b109714612f..cdbba1a9edd9 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1299,7 +1299,7 @@ static int update_mctrl(struct usb_serial_port *port, unsigned int set,
 
 
 static u32 get_ftdi_divisor(struct tty_struct *tty,
-						struct usb_serial_port *port)
+			    struct usb_serial_port *port, speed_t old_baud)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
 	struct device *dev = &port->dev;
@@ -1322,6 +1322,8 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			__func__, priv->custom_divisor, baud);
 	}
 
+	if (!baud)
+		baud = old_baud;
 	if (!baud)
 		baud = 9600;
 	switch (priv->chip_type) {
@@ -1330,8 +1332,12 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 		if (div_value == -1) {
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
@@ -1340,8 +1346,8 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			div_value = ftdi_232am_baud_to_divisor(baud);
 		} else {
 			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
-			baud = 9600;
-			div_value = ftdi_232am_baud_to_divisor(9600);
+			baud = (old_baud >= 183 && old_baud <= 3000000) ? old_baud : 9600;
+			div_value = ftdi_232am_baud_to_divisor(baud);
 			div_okay = 0;
 		}
 		break;
@@ -1363,9 +1369,9 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			div_value = ftdi_232bm_baud_to_divisor(baud);
 		} else {
 			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
-			div_value = ftdi_232bm_baud_to_divisor(9600);
+			baud = (old_baud >= 183 && old_baud <= 3000000) ? old_baud : 9600;
+			div_value = ftdi_232bm_baud_to_divisor(baud);
 			div_okay = 0;
-			baud = 9600;
 		}
 		break;
 	case FT2232H: /* FT2232H chip */
@@ -1377,9 +1383,14 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			div_value = ftdi_232bm_baud_to_divisor(baud);
 		} else {
 			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
-			div_value = ftdi_232bm_baud_to_divisor(9600);
+			if (old_baud >= 183 && old_baud < 1200) {
+				baud = old_baud;
+				div_value = ftdi_232bm_baud_to_divisor(baud);
+			} else {
+				baud = (old_baud >= 1200 && old_baud <= 12000000) ? old_baud : 9600;
+				div_value = ftdi_2232h_baud_to_divisor(baud);
+			}
 			div_okay = 0;
-			baud = 9600;
 		}
 		break;
 	} /* priv->chip_type */
@@ -1394,7 +1405,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 	return div_value;
 }
 
-static int change_speed(struct tty_struct *tty, struct usb_serial_port *port)
+static int change_speed(struct tty_struct *tty, struct usb_serial_port *port, speed_t old_baud)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
 	u16 value;
@@ -1402,7 +1413,7 @@ static int change_speed(struct tty_struct *tty, struct usb_serial_port *port)
 	u32 index_value;
 	int rv;
 
-	index_value = get_ftdi_divisor(tty, port);
+	index_value = get_ftdi_divisor(tty, port, old_baud);
 	value = (u16)index_value;
 	index = (u16)(index_value >> 16);
 	if (priv->chip_type == FT2232C || priv->chip_type == FT2232H ||
@@ -1525,7 +1536,7 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
 		if (priv->flags & ASYNC_SPD_MASK)
 			dev_warn_ratelimited(&port->dev, "use of SPD flags is deprecated\n");
 
-		change_speed(tty, port);
+		change_speed(tty, port, 0);
 	}
 	mutex_unlock(&priv->cfg_lock);
 	return 0;
@@ -2774,9 +2785,12 @@ static void ftdi_set_termios(struct tty_struct *tty,
 		/* Drop RTS and DTR */
 		clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
 	} else {
+		speed_t old_baud =
+			old_termios ? tty_termios_baud_rate(old_termios) : 0;
+
 		/* set the baudrate determined before */
 		mutex_lock(&priv->cfg_lock);
-		if (change_speed(tty, port))
+		if (change_speed(tty, port, old_baud))
 			dev_err(ddev, "%s urb failed to set baudrate\n", __func__);
 		mutex_unlock(&priv->cfg_lock);
 		/* Ensure RTS and DTR are raised when baudrate changed from 0 */
-- 
2.35.1

