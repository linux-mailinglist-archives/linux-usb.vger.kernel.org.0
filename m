Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F16B7571913
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 13:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbiGLLy1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 07:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232740AbiGLLyP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 07:54:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A1BB5D2F
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 04:53:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7259DB817D7
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 11:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10951C341CA;
        Tue, 12 Jul 2022 11:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657626796;
        bh=xc0xDL10XjDO9onCBVCkGKLcFi1HmRGSB+L1iEWaQ8M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fCQ27WI7Tif2PeGeUxgV2+heq+UsFPgSTTLM3e3bq5ienOLX6Jc4QpFU6k8pS7gEu
         jIzuUPcMd4Y+WDfYBUeWbmvc/fzTQuNt2GGCDSaqItt0njExSDlt1Pe6KXu/BShPvb
         W7Ny+b0zpTX4HudGrzqGOK5DmxZ86/vnrPqDhXTu1IX7MCI3MpyZFPEGBI1GKFytsN
         dJ7/m3oHDEp6LFnbSn46FdW8wpNgqe3+B8YrokIGcb203FFVFIhBDhnhctFuxYycb/
         CGDCtFyQQLUdSDeMpHZFpQG9fc+RJeyUNUBZrSbRzLVZ60+gFbXz4f0lrl6PT0r7Ds
         iI2vO3bduqEcA==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 3/7] USB: serial: ftdi_sio: Extract SIO divisor code to function
Date:   Tue, 12 Jul 2022 13:53:02 +0200
Message-Id: <20220712115306.26471-4-kabel@kernel.org>
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

In preparation for following changes, extract divisor code for SIO chip
into new function ftdi_sio_baud_to_divisor(), as is done for other
chips.

No functional change.

Signed-off-by: Pali Rohár <pali@kernel.org>
Tested-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 36 ++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 717b97f4e094..5b109714612f 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1150,6 +1150,23 @@ static struct usb_serial_driver * const serial_drivers[] = {
  * ***************************************************************************
  */
 
+static int ftdi_sio_baud_to_divisor(int baud)
+{
+	switch (baud) {
+	case 300: return ftdi_sio_b300;
+	case 600: return ftdi_sio_b600;
+	case 1200: return ftdi_sio_b1200;
+	case 2400: return ftdi_sio_b2400;
+	case 4800: return ftdi_sio_b4800;
+	case 9600: return ftdi_sio_b9600;
+	case 19200: return ftdi_sio_b19200;
+	case 38400: return ftdi_sio_b38400;
+	case 57600: return ftdi_sio_b57600;
+	case 115200: return ftdi_sio_b115200;
+	default: return -1;
+	}
+}
+
 static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
 {
 	unsigned short int divisor;
@@ -1286,7 +1303,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
 	struct device *dev = &port->dev;
-	u32 div_value = 0;
+	int div_value = 0;
 	int div_okay = 1;
 	int baud;
 
@@ -1309,23 +1326,12 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
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
+		if (div_value == -1) {
 			dev_dbg(dev, "%s - Baudrate (%d) requested is not supported\n",
 				__func__,  baud);
-			div_value = ftdi_sio_b9600;
 			baud = 9600;
+			div_value = ftdi_sio_baud_to_divisor(baud);
 			div_okay = 0;
 		}
 		break;
-- 
2.35.1

