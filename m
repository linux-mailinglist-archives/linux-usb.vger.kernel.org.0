Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6A51E6979
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 20:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405895AbgE1Sf5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 14:35:57 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:47602 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405871AbgE1Sf4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 May 2020 14:35:56 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 49XxGd6lrsz8L;
        Thu, 28 May 2020 20:35:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1590690954; bh=QmkFZ9eFWaDioQbY5TlOYF/cOWllJop5t2LIsaqe1rM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=DSYwmJKqLQR1j43Pw1ma9FilGqrQlukUQnwtIS1e0acU6URtVDx7cnu0TB7h34fC0
         VFfv9E5BcBBkMUVaxUkOXMM7z5O82aEOYO1N0oQDQh2g6TdvRTZczZdLI7ZwBOlW6D
         PbduX7w/RvIf4xGNcKqsfd82lS91QpvUK894dCrFTiTHgccTAjlf7INvudkR/qcy46
         xRYrREQrmvARzTMeta1K5WovgTndiuHiznQY20heVNga5kvR8xJypVcf9xsyzxpGQu
         D/rkv++3qBVApjnSudeXLpv0NxeWE1ZNCJsSudNcVRU6md9JeBAXth8Fs/RfUkZz7h
         yrGzVXgwPdBIA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Thu, 28 May 2020 20:35:53 +0200
Message-Id: <9a5ad692ad2d615d28901c6393716b79005c1c25.1590690650.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1590690650.git.mirq-linux@rere.qmqm.pl>
References: <cover.1590690650.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 1/3] usb: gadget: udc: atmel: remove outdated comment in
 usba_ep_disable()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Songjun Wu <songjun.wu@atmel.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixed commit removed the offending behaviour from the driver, but missed
the comment and associated test. Remove them now.

Fixes: 38e58986e6fc ("usb: gadget: udc: atmel: don't disable enpdoints we don't own")
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/usb/gadget/udc/atmel_usba_udc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index d69f61ff0181..9153e220848d 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -676,13 +676,7 @@ static int usba_ep_disable(struct usb_ep *_ep)
 
 	if (!ep->ep.desc) {
 		spin_unlock_irqrestore(&udc->lock, flags);
-		/* REVISIT because this driver disables endpoints in
-		 * reset_all_endpoints() before calling disconnect(),
-		 * most gadget drivers would trigger this non-error ...
-		 */
-		if (udc->gadget.speed != USB_SPEED_UNKNOWN)
-			DBG(DBG_ERR, "ep_disable: %s not enabled\n",
-					ep->ep.name);
+		DBG(DBG_ERR, "ep_disable: %s not enabled\n", ep->ep.name);
 		return -EINVAL;
 	}
 	ep->ep.desc = NULL;
-- 
2.20.1

