Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3A6C5E8B7B
	for <lists+linux-usb@lfdr.de>; Sat, 24 Sep 2022 12:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbiIXK31 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Sep 2022 06:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbiIXK3Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Sep 2022 06:29:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DD211ED6A
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 03:29:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 72163B81025
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 10:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC96C433C1;
        Sat, 24 Sep 2022 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664015361;
        bh=lwjnL2VFBJK0RItGN1P90Y2LCgSyc/zrZ+/ku7OexZE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r+KWNXESXiCHVXYQeE54+diwma3MuJNc5zWxofcfEQB2Nl27BH4ibHXF9l9xWTk0o
         /90aUtBIzlEqjXRHifTtf33CmXGzHB5fgQgVz3xjVBhXC3yjWMOWPau1QoVVLvfXXk
         A7gZSs8LtDTgZOXHlesrv33mubdHMmmT/Lp/0yp5P/kBa2S8qLJiI0/WyjWmNXhUkl
         ALRyVPyWlbS7AHm+akfuHvH08jOX6c8aKfKYWNDHHpa6Q+NDLOojBxP/DHuch9UEjF
         VB+ZKq5yAZRE22aW6pVZch7bCjiTT6nSw8QHa/P1IXr15ieJ9mpv/zVv+eBgL624Fh
         Qc59gi6oJPC8Q==
Received: by pali.im (Postfix)
        id 7C4C0127C; Sat, 24 Sep 2022 12:29:18 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v3 3/7] USB: serial: ftdi_sio: Extract SIO divisor code to function
Date:   Sat, 24 Sep 2022 12:27:14 +0200
Message-Id: <20220924102718.2984-4-pali@kernel.org>
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

In preparation for following changes, extract divisor code for SIO chip
into new function ftdi_sio_baud_to_divisor(), as is done for other
chips.

No functional change.

Signed-off-by: Pali Rohár <pali@kernel.org>
Tested-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 45 ++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index bfa601fc14fe..fe8a7c5fa0e9 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1155,6 +1155,34 @@ static struct usb_serial_driver * const serial_drivers[] = {
  * ***************************************************************************
  */
 
+static u32 ftdi_sio_baud_to_divisor(int baud)
+{
+	switch (baud) {
+	case 300:
+		return ftdi_sio_b300;
+	case 600:
+		return ftdi_sio_b600;
+	case 1200:
+		return ftdi_sio_b1200;
+	case 2400:
+		return ftdi_sio_b2400;
+	case 4800:
+		return ftdi_sio_b4800;
+	case 9600:
+		return ftdi_sio_b9600;
+	case 19200:
+		return ftdi_sio_b19200;
+	case 38400:
+		return ftdi_sio_b38400;
+	case 57600:
+		return ftdi_sio_b57600;
+	case 115200:
+		return ftdi_sio_b115200;
+	default:
+		return -1;
+	}
+}
+
 static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
 {
 	unsigned short int divisor;
@@ -1314,23 +1342,12 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 		baud = 9600;
 	switch (priv->chip_type) {
 	case SIO: /* SIO chip */
-		switch (baud) {
-		case 300: div_value = ftdi_sio_b300; break;
-		case 600: div_value = ftdi_sio_b600; break;
-		case 1200: div_value = ftdi_sio_b1200; break;
-		case 2400: div_value = ftdi_sio_b2400; break;
-		case 4800: div_value = ftdi_sio_b4800; break;
-		case 9600: div_value = ftdi_sio_b9600; break;
-		case 19200: div_value = ftdi_sio_b19200; break;
-		case 38400: div_value = ftdi_sio_b38400; break;
-		case 57600: div_value = ftdi_sio_b57600;  break;
-		case 115200: div_value = ftdi_sio_b115200; break;
-		} /* baud */
-		if (div_value == 0) {
+		div_value = ftdi_sio_baud_to_divisor(baud);
+		if (div_value == (u32)-1) {
 			dev_dbg(dev, "%s - Baudrate (%d) requested is not supported\n",
 				__func__,  baud);
-			div_value = ftdi_sio_b9600;
 			baud = 9600;
+			div_value = ftdi_sio_baud_to_divisor(baud);
 			div_okay = 0;
 		}
 		break;
-- 
2.20.1

