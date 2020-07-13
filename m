Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254E5218F71
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 20:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgGHSEW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 14:04:22 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:35635 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgGHSEL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jul 2020 14:04:11 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4B26d556fGzHb;
        Wed,  8 Jul 2020 20:04:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1594231449; bh=QmkFZ9eFWaDioQbY5TlOYF/cOWllJop5t2LIsaqe1rM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=JrkBxlZ5jKWUHDm0hXV++Dlk2XK/I2oBoMGhHmhzOgs3LeFkbiDUGKtMARXjl4mCa
         QJf6hPBpozoCeTK1oeycyVo2/UfeqYH+S7Y2+QxrEXmKROhG6XT1aA4L0isgZL3OED
         JfWJ8ckX5mlTI5pxvC597tXlBNNCSsaPmmh5EbFib4vyqa4UTqtlxyf/UbZxytxXTF
         UiYpbO+9qBlTfMdY3uFBJfs3cRU1weXgPxxE2TcjfCqtPF8JZ8kw0zZ6w8NzunWdHf
         OD9zCdlDQ0ehUtUd+LF66u5dQMh7O2q7529Q2bYPCc1uN5m+XWAMEudgqZJye5Ae0D
         7LEl+p9MObGlw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.3 at mail
Date:   Wed, 08 Jul 2020 20:04:09 +0200
Message-Id: <ab8ef3e2bf15fa75572f9ad51d6e7b10c67cb494.1594231056.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1594231056.git.mirq-linux@rere.qmqm.pl>
References: <cover.1594231056.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH RESEND 1/3] usb: gadget: udc: atmel: remove outdated comment
 in usba_ep_disable()
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

