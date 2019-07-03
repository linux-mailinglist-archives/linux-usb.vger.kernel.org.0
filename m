Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB175E93B
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 18:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbfGCQfd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 12:35:33 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:50426 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbfGCQfd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jul 2019 12:35:33 -0400
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23992643AbfGCQfbs3lTC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jul 2019 18:35:31 +0200
Date:   Wed, 3 Jul 2019 18:35:30 +0200
From:   Ladislav Michl <ladis@linux-mips.org>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3/3] usb: gadget: u_serial: Use bool for req_busy
Message-ID: <20190703163530.GD28579@lenoch>
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

Let's make code more consistent by using bool for req_busy
as it is done for similar variables in struct gs_port.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 drivers/usb/gadget/function/u_serial.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 04b4338b4ae1..130613751723 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -88,7 +88,7 @@ struct gscons_info {
 	struct kfifo		con_buf;
 	/* protect the buf and busy flag */
 	spinlock_t		con_lock;
-	int			req_busy;
+	bool			req_busy;
 	struct usb_request	*console_req;
 };
 
@@ -904,7 +904,7 @@ static void gs_complete_out(struct usb_ep *ep, struct usb_request *req)
 	case 0:
 		/* normal completion */
 		spin_lock(&info->con_lock);
-		info->req_busy = 0;
+		info->req_busy = false;
 		spin_unlock(&info->con_lock);
 
 		wake_up_process(info->console_thread);
@@ -939,7 +939,6 @@ static int gs_console_connect(int port_num)
 	info->console_req->complete = gs_complete_out;
 
 	info->port = port;
-	info->req_busy = 0;
 	spin_unlock(&info->con_lock);
 	pr_vdebug("port[%d] console connect!\n", port_num);
 	return 0;
@@ -982,13 +981,13 @@ static int gs_console_thread(void *data)
 				size = len;
 
 			req->length = kfifo_out(&info->con_buf, req->buf, size);
-			info->req_busy = 1;
+			info->req_busy = true;
 
 			spin_unlock_irq(&info->con_lock);
 			status = usb_ep_queue(ep, req, GFP_ATOMIC);
 			spin_lock_irq(&info->con_lock);
 			if (status < 0)
-				info->req_busy = 0;
+				info->req_busy = false;
 		} else {
 sched:
 			spin_unlock_irq(&info->con_lock);
@@ -1011,7 +1010,7 @@ static int gs_console_setup(struct console *co, char *options)
 
 	info->port = NULL;
 	info->console_req = NULL;
-	info->req_busy = 0;
+	info->req_busy = false;
 	spin_lock_init(&info->con_lock);
 
 	status = kfifo_alloc(&info->con_buf, GS_CONSOLE_BUF_SIZE, GFP_KERNEL);
-- 
2.20.1

