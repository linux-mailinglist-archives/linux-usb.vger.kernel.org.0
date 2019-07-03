Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D00E75E935
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 18:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbfGCQeg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 12:34:36 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:50426 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfGCQeg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jul 2019 12:34:36 -0400
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23992643AbfGCQeeS5ffC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jul 2019 18:34:34 +0200
Date:   Wed, 3 Jul 2019 18:34:33 +0200
From:   Ladislav Michl <ladis@linux-mips.org>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/3] usb: gadget: u_serial: Fix console_req complete event
 race
Message-ID: <20190703163433.GB28579@lenoch>
References: <20190703163355.GA28579@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703163355.GA28579@lenoch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

gs_complete_out might be called before con_lock following usb_ep_queue
is locked, which prevents any future output on the console. Fix that by
resetting req_busy only if usb_ep_queue fails. While there also put
variable access we are racing with connection/disconnection events
under con_lock as well.

Fixes: a5beaaf39455 ("usb: gadget: Add the console support for usb-to-serial port")
Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 drivers/usb/gadget/function/u_serial.c | 38 +++++++++++---------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 65f634ec7fc2..f8abb9c68e62 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -984,47 +984,41 @@ static int gs_console_thread(void *data)
 	struct gs_port *port;
 	struct usb_request *req;
 	struct usb_ep *ep;
-	int xfer, ret, count, size;
+	int len, size, status;
 
+	spin_lock_irq(&info->con_lock);
 	do {
 		port = info->port;
 		set_current_state(TASK_INTERRUPTIBLE);
-		if (!port || !port->port_usb
-		    || !port->port_usb->in || !info->console_req)
+		if (!port || !port->port_usb || !info->console_req)
 			goto sched;
 
 		req = info->console_req;
 		ep = port->port_usb->in;
-
-		spin_lock_irq(&info->con_lock);
-		count = kfifo_len(&info->con_buf);
-		size = ep->maxpacket;
-
-		if (count > 0 && !info->req_busy) {
+		len = kfifo_len(&info->con_buf);
+		if (len > 0 && !info->req_busy) {
 			set_current_state(TASK_RUNNING);
-			if (count < size)
-				size = count;
+			size = ep->maxpacket;
+			if (len < size)
+				size = len;
 
-			xfer = kfifo_out(&info->con_buf, req->buf, size);
-			req->length = xfer;
-
-			spin_unlock(&info->con_lock);
-			ret = usb_ep_queue(ep, req, GFP_ATOMIC);
-			spin_lock(&info->con_lock);
-			if (ret < 0)
-				info->req_busy = 0;
-			else
-				info->req_busy = 1;
+			req->length = kfifo_out(&info->con_buf, req->buf, size);
+			info->req_busy = 1;
 
 			spin_unlock_irq(&info->con_lock);
+			status = usb_ep_queue(ep, req, GFP_ATOMIC);
+			spin_lock_irq(&info->con_lock);
+			if (status < 0)
+				info->req_busy = 0;
 		} else {
-			spin_unlock_irq(&info->con_lock);
 sched:
+			spin_unlock_irq(&info->con_lock);
 			if (kthread_should_stop()) {
 				set_current_state(TASK_RUNNING);
 				break;
 			}
 			schedule();
+			spin_lock_irq(&info->con_lock);
 		}
 	} while (1);
 
-- 
2.20.1

