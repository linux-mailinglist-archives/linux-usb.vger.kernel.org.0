Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F76410D34
	for <lists+linux-usb@lfdr.de>; Sun, 19 Sep 2021 21:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbhIST64 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Sep 2021 15:58:56 -0400
Received: from informare.org ([217.11.52.70]:40664 "EHLO informare.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231913AbhIST64 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Sep 2021 15:58:56 -0400
Received: (qmail 9735 invoked from network); 19 Sep 2021 19:57:29 -0000
Received: from unknown (HELO ?192.168.2.105?) (faber@faberman.de@87.133.230.47)
  by 0 with ESMTPA; 19 Sep 2021 19:57:29 -0000
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
From:   Florian Faber <faber@faberman.de>
Subject: [PATCH] usb: gadget: u_serial: Fix possible null pointer dereference
Message-ID: <863b03b7-d00a-0af1-c21e-e2f7930bb0b3@faberman.de>
Date:   Sun, 19 Sep 2021 21:57:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In gs_rx_push, tty can be null. tty_throttled accesses tty->flags without further testing, which would lead to a null pointer dereference.

Signed-off-by: Florian Faber <faber@faberman.de>
---
  drivers/usb/gadget/function/u_serial.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 6f68cbeeee7c..00512e7c7261 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -436,7 +436,7 @@ static void gs_rx_push(struct work_struct *work)
  	 * We may leave non-empty queue only when there is a tty, and
  	 * either it is throttled or there is no more room in flip buffer.
  	 */
-	if (!list_empty(queue) && !tty_throttled(tty))
+	if (tty && !list_empty(queue) && !tty_throttled(tty))
  		schedule_delayed_work(&port->push, 1);
  
  	/* If we're still connected, refill the USB RX queue. */
-- 
