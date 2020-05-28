Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7271E696E
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 20:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405907AbgE1Sf7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 14:35:59 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:64911 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405890AbgE1Sf4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 May 2020 14:35:56 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 49XxGf1qBrz8k;
        Thu, 28 May 2020 20:35:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1590690954; bh=r3FexnWOGPLoKtGxgqbQb3w5FegJpG2pFaJligFub9Q=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=MJEkVhek6HxCEop0X9gCrt1t2efUnqPy6REWgs6m2AhFwhDcAweOn/8IicZwCrpuR
         UV4OSOcUHuc8GXUrS/OHRTcH3ZLbDnTFOZ7OUwIvQkBsxqakPXcSKSFDUGkWMfOY0V
         Jyhf7WDcuVSiC8xlMLYNU3Zfi4k9ZN8ZDJS6Ho+/9Y+DJwRtARe3bdvuDBpjaLyZeZ
         CXki0epj+9QuX+3QyH+CKgogSTccWI8KjpMbsptp1jbNK0UYJrPS+JPQvLukslqnu5
         lDq7gvlmrwjCU8NKXp3cqiYg6hgqusHfHcjfDgOCY5Qq6blFd7RSDIR+jxodifDwOM
         rwSLmqsY9An+g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Thu, 28 May 2020 20:35:54 +0200
Message-Id: <87eea7ba7c0bc3902db18f57a8711fa53004e9b5.1590690650.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1590690650.git.mirq-linux@rere.qmqm.pl>
References: <cover.1590690650.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 2/3] usb: gadget: udc: atmel: fix uninitialized read in debug
 printk
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

