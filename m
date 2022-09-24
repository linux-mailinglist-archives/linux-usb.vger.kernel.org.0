Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22B025E8B79
	for <lists+linux-usb@lfdr.de>; Sat, 24 Sep 2022 12:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbiIXK32 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Sep 2022 06:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbiIXK3Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Sep 2022 06:29:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012AE11ED6C
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 03:29:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 91E86611D1
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 10:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73B4C433D7;
        Sat, 24 Sep 2022 10:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664015363;
        bh=2rW2Oa7PRK4CltmuQxwR4SI0g9BACdYXqf0KRtYdv20=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lJo2B0nRm3REhtD7sxVmjuwnlGA5HxYqzOc1mt4vLxhxaM1QMrR/DfjenTIp2HYpJ
         oK6P4ZlNpfZo60epAv4gZLwSLgmfzJT00onsdpmUKzo1Mcu7nKqCmagIObb/s431rf
         TLeEF+feSlWEQmiR57fetRIqvOcB4QAnwAQPQ8l0qXBWdQftEihp6ho/izvAFXsbhb
         M0I/lvTeABAUHXMWe9h+UhTD7U2MSqjMqmbVQYmXFuZX91RiOLI3QvdxFHCQQF6wVm
         ansrZOfTbKCed0nuhneGk1Hjbla0l7KWLRcaFjenvjOuovWRxD8P6iphXHRLGAj7v6
         +W0KGbNBHXu8w==
Received: by pali.im (Postfix)
        id 604A18A2; Sat, 24 Sep 2022 12:29:22 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v3 7/7] USB: serial: ftdi_sio: Fill c_*speed fields with real baud rate
Date:   Sat, 24 Sep 2022 12:27:18 +0200
Message-Id: <20220924102718.2984-8-pali@kernel.org>
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

Calculate baud rate value in c_*speed fields to the real values which were
set on hardware. For this operation, add a new set of methods
*_divisor_to_baud() for each chip and use them for calculating the real
baud rate values.

Each *_divisor_to_baud() method is constructed as an inverse function of
its corresponding *_baud_to_divisor() method.

Signed-off-by: Pali Rohár <pali@kernel.org>
Tested-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 93 +++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 79b00912c81c..350ed14b014c 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1183,6 +1183,34 @@ static u32 ftdi_sio_baud_to_divisor(int baud)
 	}
 }
 
+static int ftdi_sdio_divisor_to_baud(u32 divisor)
+{
+	switch (divisor) {
+	case ftdi_sio_b300:
+		return 300;
+	case ftdi_sio_b600:
+		return 600;
+	case ftdi_sio_b1200:
+		return 1200;
+	case ftdi_sio_b2400:
+		return 2400;
+	case ftdi_sio_b4800:
+		return 4800;
+	case ftdi_sio_b9600:
+		return 9600;
+	case ftdi_sio_b19200:
+		return 19200;
+	case ftdi_sio_b38400:
+		return 38400;
+	case ftdi_sio_b57600:
+		return 57600;
+	case ftdi_sio_b115200:
+		return 115200;
+	default:
+		return 9600;
+	}
+}
+
 static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
 {
 	unsigned short int divisor;
@@ -1205,11 +1233,28 @@ static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
 	return divisor;
 }
 
+static int ftdi_232am_divisor_base_to_baud(unsigned short int divisor, int base)
+{
+	static const unsigned char divfrac_inv[4] = { 0, 4, 2, 1 };
+	unsigned int divisor3;
+
+	if (divisor == 0)
+		divisor = 1;
+	divisor3 = (GENMASK(13, 0) & divisor) << 3;
+	divisor3 |= divfrac_inv[(divisor >> 14) & 0x3];
+	return DIV_ROUND_CLOSEST(base, 2 * divisor3);
+}
+
 static unsigned short int ftdi_232am_baud_to_divisor(int baud)
 {
 	 return ftdi_232am_baud_base_to_divisor(baud, 48000000);
 }
 
+static int ftdi_232am_divisor_to_baud(unsigned short int divisor)
+{
+	return ftdi_232am_divisor_base_to_baud(divisor, 48000000);
+}
+
 static u32 ftdi_232bm_baud_base_to_divisor(int baud, int base)
 {
 	static const unsigned char divfrac[8] = { 0, 3, 2, 4, 1, 5, 6, 7 };
@@ -1228,11 +1273,31 @@ static u32 ftdi_232bm_baud_base_to_divisor(int baud, int base)
 	return divisor;
 }
 
+static int ftdi_232bm_divisor_base_to_baud(u32 divisor, int base)
+{
+	static const unsigned char divfrac_inv[8] = { 0, 4, 2, 1, 3, 5, 6, 7 };
+	u32 divisor3;
+
+	/* Deal with special cases for highest baud rates. */
+	if (divisor == 0)
+		divisor = 1;		/* 1.0 */
+	else if (divisor == 1)
+		divisor = 0x4001;	/* 1.5 */
+	divisor3 = (GENMASK(13, 0) & divisor) << 3;
+	divisor3 |= divfrac_inv[(divisor >> 14) & 0x7];
+	return DIV_ROUND_CLOSEST(base, 2 * divisor3);
+}
+
 static u32 ftdi_232bm_baud_to_divisor(int baud)
 {
 	 return ftdi_232bm_baud_base_to_divisor(baud, 48000000);
 }
 
+static int ftdi_232bm_divisor_to_baud(u32 divisor)
+{
+	return ftdi_232bm_divisor_base_to_baud(divisor, 48000000);
+}
+
 static u32 ftdi_2232h_baud_base_to_divisor(int baud, int base)
 {
 	static const unsigned char divfrac[8] = { 0, 3, 2, 4, 1, 5, 6, 7 };
@@ -1260,11 +1325,32 @@ static u32 ftdi_2232h_baud_base_to_divisor(int baud, int base)
 	return divisor;
 }
 
+static int ftdi_2232h_divisor_base_to_baud(u32 divisor, int base)
+{
+	static const unsigned char divfrac_inv[8] = { 0, 4, 2, 1, 3, 5, 6, 7 };
+	u32 divisor3;
+
+	divisor &= GENMASK(16, 0);
+	/* Deal with special cases for highest baud rates. */
+	if (divisor == 0)
+		divisor = 1;		/* 1.0 */
+	else if (divisor == 1)
+		divisor = 0x4001;	/* 1.5 */
+	divisor3 = (GENMASK(13, 0) & divisor) << 3;
+	divisor3 |= divfrac_inv[(divisor >> 14) & 0x7];
+	return DIV_ROUND_CLOSEST(8 * base, 10 * divisor3);
+}
+
 static u32 ftdi_2232h_baud_to_divisor(int baud)
 {
 	 return ftdi_2232h_baud_base_to_divisor(baud, 120000000);
 }
 
+static int ftdi_2232h_divisor_to_baud(u32 divisor)
+{
+	return ftdi_2232h_divisor_base_to_baud(divisor, 120000000);
+}
+
 #define set_mctrl(port, set)		update_mctrl((port), (set), 0)
 #define clear_mctrl(port, clear)	update_mctrl((port), 0, (clear))
 
@@ -1358,6 +1444,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			}
 			div_okay = 0;
 		}
+		baud = ftdi_sdio_divisor_to_baud(div_value);
 		break;
 	case FT8U232AM: /* 8U232AM chip */
 		if (baud >= 183 && baud <= 3000000) {
@@ -1371,6 +1458,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			div_value = ftdi_232am_baud_to_divisor(baud);
 			div_okay = 0;
 		}
+		baud = ftdi_232am_divisor_to_baud(div_value);
 		break;
 	case FT232BM: /* FT232BM chip */
 	case FT2232C: /* FT2232C chip */
@@ -1397,25 +1485,30 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			div_value = ftdi_232bm_baud_to_divisor(baud);
 			div_okay = 0;
 		}
+		baud = ftdi_232bm_divisor_to_baud(div_value);
 		break;
 	case FT2232H: /* FT2232H chip */
 	case FT4232H: /* FT4232H chip */
 	case FT232H:  /* FT232H chip */
 		if ((baud <= 12000000) && (baud >= 1200)) {
 			div_value = ftdi_2232h_baud_to_divisor(baud);
+			baud = ftdi_2232h_divisor_to_baud(div_value);
 		} else if (baud >= 183 && baud < 1200) {
 			div_value = ftdi_232bm_baud_to_divisor(baud);
+			baud = ftdi_232bm_divisor_to_baud(div_value);
 		} else {
 			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
 			if (old_baud >= 183 && old_baud < 1200) {
 				baud = old_baud;
 				div_value = ftdi_232bm_baud_to_divisor(baud);
+				baud = ftdi_232bm_divisor_to_baud(div_value);
 			} else {
 				if (old_baud >= 1200 && old_baud <= 12000000)
 					baud = old_baud;
 				else
 					baud = 9600;
 				div_value = ftdi_2232h_baud_to_divisor(baud);
+				baud = ftdi_2232h_divisor_to_baud(div_value);
 			}
 			div_okay = 0;
 		}
-- 
2.20.1

