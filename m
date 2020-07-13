Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1F7218F6D
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 20:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgGHSEN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 14:04:13 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:60814 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbgGHSEM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jul 2020 14:04:12 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4B26d60W3NzMK;
        Wed,  8 Jul 2020 20:04:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1594231450; bh=r3FexnWOGPLoKtGxgqbQb3w5FegJpG2pFaJligFub9Q=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Dy2H4kyZY48Pt9ZFLiCLIJdFhup5pYVlRW+XQV6z2hbmGRqKUKENRqLzyE0FQ/KAs
         eI02tfwbOv8vq7EbqdHy7+NiMiUhwW65EhHNSOZ3f0MxfYnMe+OvfAEH3dSKzPn8ts
         GrnMw4+l7qGZZSvkHO9tyOC+hw4syiE4j/qxVWZnkojFHew1fCjYowsXsppzHGVr9E
         0aDaRLZJR9PBbohHnMD68VGmir/B/XHJDKFwv1MfTFYx0heNVvNG25JaxjPtaHjEyv
         Qwh366QO+esPNguUjtvLAM5S8oO294/OxUfSSBYa9foSPtg2ZtrI5ybFrAeYMIhjiB
         ZLx+PPDvyx8yQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.3 at mail
Date:   Wed, 08 Jul 2020 20:04:09 +0200
Message-Id: <248e7089f7fbb3727e83a1dfb43820d96a69e8c2.1594231056.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1594231056.git.mirq-linux@rere.qmqm.pl>
References: <cover.1594231056.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH RESEND 2/3] usb: gadget: udc: atmel: fix uninitialized read in
 debug printk
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Songjun Wu <songjun.wu@atmel.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixed commit moved the assignment of 'req', but did not update a
reference in the DBG() call. Use the argument as it was renamed.

Fixes: 5fb694f96e7c ("usb: gadget: udc: atmel: fix possible oops when unloading module")
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/usb/gadget/udc/atmel_usba_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index 9153e220848d..9342a3d24963 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -865,7 +865,7 @@ static int usba_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	u32 status;
 
 	DBG(DBG_GADGET | DBG_QUEUE, "ep_dequeue: %s, req %p\n",
-			ep->ep.name, req);
+			ep->ep.name, _req);
 
 	spin_lock_irqsave(&udc->lock, flags);
 
-- 
2.20.1

