Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 559795E8B7C
	for <lists+linux-usb@lfdr.de>; Sat, 24 Sep 2022 12:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbiIXK3X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Sep 2022 06:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiIXK3W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Sep 2022 06:29:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5215311ED6A
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 03:29:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D301F6124B
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 10:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC00C433B5;
        Sat, 24 Sep 2022 10:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664015360;
        bh=jS8PAUWdG58J8HZV3voE3Kk+kDMzClw8lsUzIiP6HVM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QRmpWXDqfBPOzumZ5uUbPV2sCWNC2Bdi4SaW2WVMon6GhMqQbhfF/eKuF7wjZKoqt
         j8BIJYBs2RRbR3v/Gavsl3WjxRNRC9biwlqzkwXnGnnbx5aeOvrQSJ39oigVDRU2Ao
         xkqf2cX996W+gcxVGCX3loJpjEcT4MOsxJC32zD2/lmfxeXv+K3A0lw7nMsb+wSyyV
         PwIgUje0U9EgFfj9To7lvDV0+TYIHO7XKv+492QHAfWeMFuaffwQdfbIvba1dhcrSf
         6sOyNW42Qal9Gc2mJ6W0T22aJNDDnzYklR6KgkuJ97bbiELT55SBqx49fHqrXd/IXn
         Bh3EOY4nHq7kg==
Received: by pali.im (Postfix)
        id 885941231; Sat, 24 Sep 2022 12:29:17 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v3 2/7] USB: serial: ftdi_sio: Add missing baud rate validation
Date:   Sat, 24 Sep 2022 12:27:13 +0200
Message-Id: <20220924102718.2984-3-pali@kernel.org>
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

Add lower checks for requested baud rate for FT8U232AM, FT232BM, FT2232C,
FT232RL, FTX, FT2232H, FT4232H and FT232H. For all of these the minimum
baud rate they can generate is 183 Baud.

Signed-off-by: Pali Rohár <pali@kernel.org>
Tested-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index b2febe8d573a..bfa601fc14fe 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1335,7 +1335,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 		}
 		break;
 	case FT8U232AM: /* 8U232AM chip */
-		if (baud <= 3000000) {
+		if (baud >= 183 && baud <= 3000000) {
 			div_value = ftdi_232am_baud_to_divisor(baud);
 		} else {
 			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
@@ -1348,7 +1348,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 	case FT2232C: /* FT2232C chip */
 	case FT232RL: /* FT232RL chip */
 	case FTX:     /* FT-X series */
-		if (baud <= 3000000) {
+		if (baud >= 183 && baud <= 3000000) {
 			u16 product_id = le16_to_cpu(
 				port->serial->dev->descriptor.idProduct);
 			if (((product_id == FTDI_NDI_HUC_PID)		||
@@ -1372,7 +1372,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 	case FT232H:  /* FT232H chip */
 		if ((baud <= 12000000) && (baud >= 1200)) {
 			div_value = ftdi_2232h_baud_to_divisor(baud);
-		} else if (baud < 1200) {
+		} else if (baud >= 183 && baud < 1200) {
 			div_value = ftdi_232bm_baud_to_divisor(baud);
 		} else {
 			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
-- 
2.20.1

