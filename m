Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35580571918
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 13:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232849AbiGLLye (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 07:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbiGLLyP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 07:54:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837C1B41BC
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 04:53:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 205276155D
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 11:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF8CC341CB;
        Tue, 12 Jul 2022 11:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657626802;
        bh=sgBd6DpgHKOIOyXCNr0kA310QdC6HP+HzFCBE4KBfto=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MP0dfnNclseiLozY64zOve2elTrK/7FtXU1eNhVm+4fktx5Wv8xwCXtOkZVm+Irwb
         3XqG27FPkhVX60w9k2M+4O2zT1/yddnEr24/hxZFIVvsiGg2+MpdXobUiqCfTgSpVX
         dHfyDiZ0Yy93YCoCdRW13CuU1QmMh0Gk8+Iv8slg8Hpv7mYGI4ZtBFIXfAIb1H8E9Z
         VoyydVIYrQxzxxnCOktmmiDLGQ/M9d+G+GGNAaR6qIxHmpA1x+BoQB6dWGwTTbcP+D
         5bF9oIEpHW9x4F86OC3/wxigvgFdXmGTpmOKq2oF0XAvpcOy7yo32ydeX4RdSqJY2N
         B4g5B6S7hwdVA==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 7/7] USB: serial: ftdi_sio: Fill c_*speed fields with real baud rate
Date:   Tue, 12 Jul 2022 13:53:06 +0200
Message-Id: <20220712115306.26471-8-kabel@kernel.org>
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
 drivers/usb/serial/ftdi_sio.c | 83 +++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 39e8c5d06157..838acce53e69 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1167,6 +1167,23 @@ static int ftdi_sio_baud_to_divisor(int baud)
 	}
 }
 
+static int ftdi_sdio_divisor_to_baud(u32 divisor)
+{
+	switch (divisor) {
+	case ftdi_sio_b300: return 300;
+	case ftdi_sio_b600: return 600;
+	case ftdi_sio_b1200: return 1200;
+	case ftdi_sio_b2400: return 2400;
+	case ftdi_sio_b4800: return 4800;
+	case ftdi_sio_b9600: return 9600;
+	case ftdi_sio_b19200: return 19200;
+	case ftdi_sio_b38400: return 38400;
+	case ftdi_sio_b57600: return 57600;
+	case ftdi_sio_b115200: return 115200;
+	default: return 9600;
+	}
+}
+
 static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
 {
 	unsigned short int divisor;
@@ -1189,15 +1206,33 @@ static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
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
 	u32 divisor;
+
 	/* divisor shifted 3 bits to the left */
 	int divisor3 = DIV_ROUND_CLOSEST(base, 2 * baud);
 	if (divisor3 > GENMASK(16, 0))
@@ -1212,11 +1247,31 @@ static u32 ftdi_232bm_baud_base_to_divisor(int baud, int base)
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
@@ -1244,11 +1299,32 @@ static u32 ftdi_2232h_baud_base_to_divisor(int baud, int base)
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
 
@@ -1342,6 +1418,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			}
 			div_okay = 0;
 		}
+		baud = ftdi_sdio_divisor_to_baud(div_value);
 		break;
 	case FT8U232AM: /* 8U232AM chip */
 		if (baud >= 183 && baud <= 3000000) {
@@ -1352,6 +1429,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			div_value = ftdi_232am_baud_to_divisor(baud);
 			div_okay = 0;
 		}
+		baud = ftdi_232am_divisor_to_baud(div_value);
 		break;
 	case FT232BM: /* FT232BM chip */
 	case FT2232C: /* FT2232C chip */
@@ -1375,22 +1453,27 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
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
 				baud = (old_baud >= 1200 && old_baud <= 12000000) ? old_baud : 9600;
 				div_value = ftdi_2232h_baud_to_divisor(baud);
+				baud = ftdi_2232h_divisor_to_baud(div_value);
 			}
 			div_okay = 0;
 		}
-- 
2.35.1

