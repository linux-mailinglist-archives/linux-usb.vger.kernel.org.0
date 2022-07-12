Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0635C571917
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 13:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbiGLLyd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 07:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232760AbiGLLyP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 07:54:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB6D1B38D6
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 04:53:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 889CD614D2
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 11:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E99C341CA;
        Tue, 12 Jul 2022 11:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657626800;
        bh=R1PUUU3HotDygkPBJux3mO3BxfC2b5NYP/yyWUr7vs8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LdNHfUhULpt3w/p5wPmhy7N/mATybEKjyFMgIJjo1WjU4wvkzNaECbiRyeWhPAHsD
         +/bQOhJX1505GkUjwGfEHr2QwrL597NJMFmTjYcVbv3pxFRY2I5we3SmYpbGWIcyq1
         uRQMvB/5nArdvaKOlcacWyt8xNQcBsMVPxxXAtCkniYIiqrU25LQcacbREou9AGdUP
         iRtKqJ9XP5g7vEYaplmFYAJVNMYG5rbQa1i3kt/vVx/sJG92XFi5ThS0nXSUl+vIfN
         w4oZKx2JKzfLzfILFD5om7ca6TD1Q8v6J/vB575VU0optz3HoYHzrCj0zM7T+Iv2Qr
         aVCLyLnqXHjPg==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 6/7] USB: serial: ftdi_sio: Fix custom_divisor and c_*speed for ASYNC_SPD_CUST
Date:   Tue, 12 Jul 2022 13:53:05 +0200
Message-Id: <20220712115306.26471-7-kabel@kernel.org>
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

When ASYNC_SPD_CUST is used, update custom_divisor and c_*speed fields
so that they correspond to the newly set baud rate value, so that
userspace GET ioctls will see the true baud rate that is being used.

Signed-off-by: Pali Rohár <pali@kernel.org>
Tested-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 5db1293bb7a2..39e8c5d06157 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1303,6 +1303,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
 	struct device *dev = &port->dev;
+	int fix_custom_divisor = 0;
 	int div_value = 0;
 	int div_okay = 1;
 	int baud;
@@ -1317,6 +1318,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 	if (baud == 38400 &&
 	    ((priv->flags & ASYNC_SPD_MASK) == ASYNC_SPD_CUST) &&
 	     (priv->custom_divisor)) {
+		fix_custom_divisor = 1;
 		baud = DIV_ROUND_CLOSEST(priv->baud_base, priv->custom_divisor);
 		dev_dbg(dev, "%s - custom divisor %d sets baud rate to %d\n",
 			__func__, priv->custom_divisor, baud);
@@ -1401,7 +1403,19 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
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
 
@@ -2674,6 +2688,8 @@ static void ftdi_set_termios(struct tty_struct *tty,
 		dev_dbg(ddev, "%s: forcing baud rate for this device\n", __func__);
 		tty_encode_baud_rate(tty, priv->force_baud,
 					priv->force_baud);
+		termios->c_ispeed = termios->c_ospeed =
+			DIV_ROUND_CLOSEST(priv->baud_base, priv->custom_divisor);
 	}
 
 	/* Force RTS-CTS if this device requires it. */
-- 
2.35.1

