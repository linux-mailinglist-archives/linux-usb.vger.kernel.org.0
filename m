Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC49410D26
	for <lists+linux-usb@lfdr.de>; Sun, 19 Sep 2021 21:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbhISTm5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Sep 2021 15:42:57 -0400
Received: from informare.org ([217.11.52.70]:40662 "EHLO informare.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231854AbhISTmz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Sep 2021 15:42:55 -0400
Received: (qmail 4170 invoked from network); 19 Sep 2021 19:41:27 -0000
Received: from unknown (HELO ?192.168.2.105?) (faber@faberman.de@87.133.230.47)
  by 0 with ESMTPA; 19 Sep 2021 19:41:27 -0000
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
From:   Florian Faber <faber@faberman.de>
Subject: [PATCH] usb: gadget: composite: req->complete not set, using wrong
 callback for complete
Message-ID: <bded07a9-0549-569f-dcea-12e8bc7bf091@faberman.de>
Date:   Sun, 19 Sep 2021 21:41:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In usb_composite_setup_continue, req->complete is not set, leaving the 
previous value untouched. After completion of the ep0 transaction, the 
UDC would then call whatever complete callback is set with the composite 
cdev as context, leading to all sorts of havoc.

Signed-off-by: Florian Faber <faber@faberman.de>

---
  drivers/usb/gadget/composite.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 504c1cbc255d..8d497be4be32 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2518,6 +2518,7 @@ void usb_composite_setup_continue(struct 
usb_composite_dev *cdev)
  		DBG(cdev, "%s: Completing delayed status\n", __func__);
  		req->length = 0;
  		req->context = cdev;
+		req->complete = composite_setup_complete;
  		value = composite_ep0_queue(cdev, req, GFP_ATOMIC);
  		if (value < 0) {
  			DBG(cdev, "ep_queue --> %d\n", value);
-- 
