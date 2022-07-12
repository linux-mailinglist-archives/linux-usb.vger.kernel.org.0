Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35D0A571914
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 13:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbiGLLy3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 07:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232756AbiGLLyP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 07:54:15 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C984B5D37
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 04:53:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 7C31CCE1A9B
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 11:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7844CC341CB;
        Tue, 12 Jul 2022 11:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657626794;
        bh=lSNgtyL8u/58a3asNaRqnCpMiCYfkWiKLPR4264utCo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uk1WQ3MjF51mLZ/E7rijqppVD7ZjqaYEP373WTNxaaKvOkbgvLhp5SyZvhX5Oue7b
         TaLia35D7IXW+NI2oGCjJLQ8pKOK2OC/i9Z+u+U7E5JPE/p+5IZuBWfiqYjqo+90td
         1uzHdK1jRJ7N6K9VJ9CBoWXfIKVjxR4lweuqsBQes12NlMZJ5HJRtiQ8Mt3NnJfm8V
         6hpbwkm1W0/ro0d285+gw2r7VPZUuPbt0lBgLt8brdtln/T0/KByxL4ytI+y4IIIXo
         MqQ0HAALMuiT0/wz7CCUUFvM/KU3D+32TH2NKPcuRIukG6tt+C+ZY96Oj+sDqyASL2
         F0e1CmvF3WUmg==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 2/7] USB: serial: ftdi_sio: Add missing baud rate validation
Date:   Tue, 12 Jul 2022 13:53:01 +0200
Message-Id: <20220712115306.26471-3-kabel@kernel.org>
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
index ea40f367e70c..717b97f4e094 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1330,7 +1330,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 		}
 		break;
 	case FT8U232AM: /* 8U232AM chip */
-		if (baud <= 3000000) {
+		if (baud >= 183 && baud <= 3000000) {
 			div_value = ftdi_232am_baud_to_divisor(baud);
 		} else {
 			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
@@ -1343,7 +1343,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 	case FT2232C: /* FT2232C chip */
 	case FT232RL: /* FT232RL chip */
 	case FTX:     /* FT-X series */
-		if (baud <= 3000000) {
+		if (baud >= 183 && baud <= 3000000) {
 			u16 product_id = le16_to_cpu(
 				port->serial->dev->descriptor.idProduct);
 			if (((product_id == FTDI_NDI_HUC_PID)		||
@@ -1367,7 +1367,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 	case FT232H:  /* FT232H chip */
 		if ((baud <= 12000000) && (baud >= 1200)) {
 			div_value = ftdi_2232h_baud_to_divisor(baud);
-		} else if (baud < 1200) {
+		} else if (baud >= 183 && baud < 1200) {
 			div_value = ftdi_232bm_baud_to_divisor(baud);
 		} else {
 			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
-- 
2.35.1

