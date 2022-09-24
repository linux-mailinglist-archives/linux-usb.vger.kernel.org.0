Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCF75E8B77
	for <lists+linux-usb@lfdr.de>; Sat, 24 Sep 2022 12:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbiIXK31 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Sep 2022 06:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbiIXK3X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Sep 2022 06:29:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7154C11ED78
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 03:29:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0D71B61257
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 10:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2061C433D6;
        Sat, 24 Sep 2022 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664015361;
        bh=XK45Cba0A/NiOAoBGRSJ+KfBFQBEjtp6JE9DIB4zrBU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P571yZbql/pvgOHEedQeWxdUkpLLGG5ZNm79//dloECAC4y1y3SAOv+redJXEL1lB
         Ra61ogz3K+zlsqCxMbhE32OsKk8+DPbGDsukGWZuAlFjrgQ/k7Hc8NcQqfoRvy61qe
         hycqLVL7LbwewKYrfw75hvdBQ4drcT7rVJDH7+gFmjuxQXZDNyYVsD6wKc+Y4ahAj/
         DW4n/FkPhfkl5du671a2c3AEF+H5gApNEHYzVPzEN9kqdyBzd6KkeXKlgvNcTbTS++
         oDN3DgeT7NCpvlbHQRtEBzXXKw/ENxqLxDg6Vi40FPVufaXBCPhsl+i72Uhrt3T8L4
         zH4m17nnD6EbA==
Received: by pali.im (Postfix)
        id 6C5448A2; Sat, 24 Sep 2022 12:29:21 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v3 6/7] USB: serial: ftdi_sio: Fix custom_divisor for TIOCGSERIAL and c_*speed for TCGETS2
Date:   Sat, 24 Sep 2022 12:27:17 +0200
Message-Id: <20220924102718.2984-7-pali@kernel.org>
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

When ASYNC_SPD_CUST is used, update custom_divisor field for TIOCGSERIAL
and c_*speed fields for TCGETS2 so that they correspond to the newly set
baud rate value.

So userspace TCGETS2 ioctls in new c_*speed fields will see the true baud
rate that is being used.

This is needed for switching userspace applications to use TCGETS2 API as
currently new c_*speed fields does not report correct values. Without this
change userspace applications still have to use old deprecated TIOCGSERIAL
to retrieve current baud rate.

Signed-off-by: Pali Rohár <pali@kernel.org>
Tested-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Marek Behún <kabel@kernel.org>
---
Please note that if c_*speed fields of TCGETS2 are not going to be fixed
then userspace application cannot be switched to use this new TCGETS2 API
due to this issue.
---
 drivers/usb/serial/ftdi_sio.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 718c86db2900..79b00912c81c 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1319,6 +1319,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
 	struct device *dev = &port->dev;
+	int fix_custom_divisor = 0;
 	u32 div_value = 0;
 	int div_okay = 1;
 	int baud;
@@ -1333,6 +1334,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 	if (baud == 38400 &&
 	    ((priv->flags & ASYNC_SPD_MASK) == ASYNC_SPD_CUST) &&
 	     (priv->custom_divisor)) {
+		fix_custom_divisor = 1;
 		baud = DIV_ROUND_CLOSEST(priv->baud_base, priv->custom_divisor);
 		dev_dbg(dev, "%s - custom divisor %d sets baud rate to %d\n",
 			__func__, priv->custom_divisor, baud);
@@ -1426,7 +1428,19 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			ftdi_chip_name[priv->chip_type]);
 	}
 
+	/* Fix deprecated async-compatible custom_divisor hack and update tty baud rate */
+	if (fix_custom_divisor) {
+		priv->custom_divisor = DIV_ROUND_CLOSEST(priv->baud_base, baud);
+		old_baud = baud;
+		baud = 38400;
+	}
+
 	tty_encode_baud_rate(tty, baud, baud);
+
+	/* For async-compatible custom_divisor store into TCGETS2 c_*speed fields real baud rate */
+	if (fix_custom_divisor)
+		tty->termios.c_ispeed = tty->termios.c_ospeed = old_baud;
+
 	return div_value;
 }
 
@@ -2699,6 +2713,8 @@ static void ftdi_set_termios(struct tty_struct *tty,
 		dev_dbg(ddev, "%s: forcing baud rate for this device\n", __func__);
 		tty_encode_baud_rate(tty, priv->force_baud,
 					priv->force_baud);
+		termios->c_ispeed = termios->c_ospeed =
+			DIV_ROUND_CLOSEST(priv->baud_base, priv->custom_divisor);
 	}
 
 	/* Force RTS-CTS if this device requires it. */
-- 
2.20.1

