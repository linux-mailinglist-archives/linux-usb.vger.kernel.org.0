Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D81D2F9DE4
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 12:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390120AbhARLSZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 06:18:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:57290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390066AbhARLRB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:17:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EC0220E65;
        Mon, 18 Jan 2021 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968475;
        bh=NjUQ79cLJwXWs5mX+phDrSbtcH57D8CjxBUMCpDkGTQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hZCy9xZ+bAbCNZMK+H1sSqsaZDTD00bs0Kw8++DRbgfn3oSeUCDXIosLaKXugb1Ey
         czMa08/KrY6e7HIUngzNY6RSYtvejGVlba+LaIhcXzpi1HxDadM92q0SIPtiQjs71t
         ffwfDnE9QDxnhpss1HgGhrPJZEugKrk7iEI/W+ENPniuOXUs20VnE758ncULfrXmzL
         8hwQzO2CiYZNnW/pBHKlen7d7HByG2ngeXa0F8Bh+/t+maMzasQazjZNuCrALWJaU8
         0HAyyj9YEojyKo4ZsodOdO37sf4NgIxsMPgDVIGZNOkZE4aFWtECf2y7/NODekIgcj
         SlgeK1gbmme5w==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1SUb-0001Lu-QR; Mon, 18 Jan 2021 12:14:41 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/6] USB: serial: mxuport: drop short control-transfer check
Date:   Mon, 18 Jan 2021 12:14:21 +0100
Message-Id: <20210118111426.5147-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118111426.5147-1-johan@kernel.org>
References: <20210118111426.5147-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There's no need to check for short control transfers when sending data
so remove the redundant sanity check.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mxuport.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 5d38c2a0f590..eb45a9b0005c 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -261,13 +261,6 @@ static int mxuport_send_ctrl_data_urb(struct usb_serial *serial,
 		return status;
 	}
 
-	if (status != size) {
-		dev_err(&serial->interface->dev,
-			"%s - short write (%d / %zd)\n",
-			__func__, status, size);
-		return -EIO;
-	}
-
 	return 0;
 }
 
-- 
2.26.2

