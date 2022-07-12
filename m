Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5BE0571916
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 13:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiGLLyc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 07:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232753AbiGLLyP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 07:54:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7311FB62B1
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 04:53:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F28F26156D
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 11:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38302C341CB;
        Tue, 12 Jul 2022 11:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657626799;
        bh=SMWs9lHYCGSSpuMZB3WjxczPj7PPubzF2MJZNYCfYmw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BGed5AsgyBZNmBHLqAlKpqpjAsWrdTV+9SaqJ1dW1IvBFIX9XDkLmbg+DjsmenjOC
         PUbw5fEq9N/rlQkfVgRffhI/aI45eFhVqycL0jDTfLZ3B7OMr/S+7fINY40suC5tbd
         qq2uBNveOtcOXhE8PaOZLeNAi0JNM8H3+FS0x4xb39bne0BSaJHmEH147Znu1ITm53
         0PvjDYbBRvcA8vdrkZopAOMMJVUYi1t99JKrRbgOgTqlUeBlq7p+n7LfRJpAREoc8X
         3p5PlCoOR02AH2ICD73RcEYvDzOavSNrSSbfWLZykohBMWNZiUIzolBbQulBL2hSzT
         dDll4cXLDbvQw==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 5/7] USB: serial: ftdi_sio: Fix baud rate rounding for ASYNC_SPD_CUST
Date:   Tue, 12 Jul 2022 13:53:04 +0200
Message-Id: <20220712115306.26471-6-kabel@kernel.org>
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

To compute more accurate baud rate when user uses ASYNC_SPD_CUST API,
use DIV_ROUND_CLOSEST() instead of just rounding down.

Rationale:
  Application uses old API, so it computes divisor D for baud rate B.

  The driver then tries to compute back the requested baud rate B, but
  rounds down in the division.

  Using rounding to closest value instead should increate accuracy here.

Signed-off-by: Pali Rohár <pali@kernel.org>
Tested-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index cdbba1a9edd9..5db1293bb7a2 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1317,7 +1317,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 	if (baud == 38400 &&
 	    ((priv->flags & ASYNC_SPD_MASK) == ASYNC_SPD_CUST) &&
 	     (priv->custom_divisor)) {
-		baud = priv->baud_base / priv->custom_divisor;
+		baud = DIV_ROUND_CLOSEST(priv->baud_base, priv->custom_divisor);
 		dev_dbg(dev, "%s - custom divisor %d sets baud rate to %d\n",
 			__func__, priv->custom_divisor, baud);
 	}
-- 
2.35.1

