Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3916400BF1
	for <lists+linux-usb@lfdr.de>; Sat,  4 Sep 2021 17:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbhIDPmN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Sep 2021 11:42:13 -0400
Received: from informare.org ([217.11.52.70]:40644 "EHLO informare.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230312AbhIDPmN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 Sep 2021 11:42:13 -0400
Received: (qmail 13932 invoked from network); 4 Sep 2021 15:34:29 -0000
Received: from unknown (HELO ?192.168.2.105?) (faber@faberman.de@87.133.154.214)
  by 0 with ESMTPA; 4 Sep 2021 15:34:29 -0000
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
From:   Florian Faber <faber@faberman.de>
Subject: [PATCH] usb: core: Fix possible memleak in usb_add_gadget
Message-ID: <311d64c6-f0e2-da42-5619-1efe46df0007@faberman.de>
Date:   Sat, 4 Sep 2021 17:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The memory for the udc structure allocated via kzalloc in line 1295 is 
not freed in the error handling code, leading to a memory leak in case 
of an error.

Singed-off-by: Florian Faber <faber@faberman.de>

---
  drivers/usb/gadget/udc/core.c | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 14fdf918ecfe..a1270a44855a 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1346,6 +1346,8 @@ int usb_add_gadget(struct usb_gadget *gadget)

   err_put_udc:
  	put_device(&udc->dev);
+	kfree(udc);
+	gadget->udc = NULL;

   error:
  	return ret;
-- 
2.33.0

Flo
-- 
Machines can do the work, so people have time to think.
