Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 783515E8B7A
	for <lists+linux-usb@lfdr.de>; Sat, 24 Sep 2022 12:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbiIXK30 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Sep 2022 06:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbiIXK3W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Sep 2022 06:29:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBF611ED73
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 03:29:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7A0756124D
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 10:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEAFDC433D6;
        Sat, 24 Sep 2022 10:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664015360;
        bh=yx+JktSN6PeLt2CX0HE+os/dGWubiRJ91H/3H1rKS68=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BeaOXROCxdVFR6q9hElkT1aCu0xwpx89vQcyPJQETNoqmzOSjaNrg9s2Yqd7X7ouK
         i5HcINUYwGIj2xnytVOQWKwocspUvIBRLJxZur6P4p8E7f+ClbuTlGfD1hovkh8TwJ
         RG/fGmX8vl5QdD7AmR/DdyOZ1GRbFZ99Ys5yZgvpXMtSi1fruXuj+UyBlqos6zorZH
         xVZf6JxKz4UPAgwmjjzXg0WdRFGR6Mhr9rpHCZaxhAS6SweLI9f213QJKJnfQD4jXu
         Xmguz0u5bykzaXhXJ27PshriohfJPVRE102ySDdyofsx0LXQrKPxhaZN1K3zr+ayq8
         zgoQBX7jFheNw==
Received: by pali.im (Postfix)
        id 78EFC8A2; Sat, 24 Sep 2022 12:29:20 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v3 5/7] USB: serial: ftdi_sio: Fix baud rate rounding for ASYNC_SPD_CUST
Date:   Sat, 24 Sep 2022 12:27:16 +0200
Message-Id: <20220924102718.2984-6-pali@kernel.org>
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
index 1ab6bf48516f..718c86db2900 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1333,7 +1333,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 	if (baud == 38400 &&
 	    ((priv->flags & ASYNC_SPD_MASK) == ASYNC_SPD_CUST) &&
 	     (priv->custom_divisor)) {
-		baud = priv->baud_base / priv->custom_divisor;
+		baud = DIV_ROUND_CLOSEST(priv->baud_base, priv->custom_divisor);
 		dev_dbg(dev, "%s - custom divisor %d sets baud rate to %d\n",
 			__func__, priv->custom_divisor, baud);
 	}
-- 
2.20.1

