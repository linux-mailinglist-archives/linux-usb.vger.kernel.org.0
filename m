Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A142F9DE1
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 12:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390110AbhARLSS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 06:18:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:57296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390060AbhARLRB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:17:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44A9D22ADC;
        Mon, 18 Jan 2021 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968475;
        bh=ecfX8u3dIYs0RJOGkOhbjN1cqufD66uGoAOLyzMXpx4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fxoobO9CQE2IYelllGDXfyKJMqdRQxsdaSD6cKjSjFdeKOr/g/WhCEZq2voLoflfc
         XIZSJSuJsM8vyu6g4Fhf54m6swN+OmTccWy9b55NHkSrKEHsDPrXwobpHxi5lyNhFz
         2Kt5lfd2ZJFwRyLGBmA+t40PTA7CkKo03aJkKgbFoSwhK9F71YihvOKYnwnNub/Erl
         kunJfAbqUaOQUNl6tRCyoYt+AO1v/DxoAopNMTBDJrj6XXThj8FxQVCyR2xS4L0jlm
         /D1E37aR1yYVZ49vjRRTqHk13yxPxGf1jxLqgTCmP3tkq7cOA8gIl6ZU4HN4LuGZCr
         P9y9+dWBYf6wQ==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1SUc-0001M0-0N; Mon, 18 Jan 2021 12:14:42 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/6] USB: serial: io_ti: drop short control-transfer check
Date:   Mon, 18 Jan 2021 12:14:23 +0100
Message-Id: <20210118111426.5147-4-johan@kernel.org>
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
 drivers/usb/serial/io_ti.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index c327d4cf7928..0c4062698603 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -283,11 +283,7 @@ static int ti_vsend_sync(struct usb_device *dev, u8 request, u16 value,
 			value, index, data, size, timeout);
 	if (status < 0)
 		return status;
-	if (status != size) {
-		dev_dbg(&dev->dev, "%s - wanted to write %d, but only wrote %d\n",
-			__func__, size, status);
-		return -ECOMM;
-	}
+
 	return 0;
 }
 
-- 
2.26.2

