Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFC55E937
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 18:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfGCQe7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 12:34:59 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:50426 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfGCQe7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jul 2019 12:34:59 -0400
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23992643AbfGCQe6HNz-C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jul 2019 18:34:58 +0200
Date:   Wed, 3 Jul 2019 18:34:57 +0200
From:   Ladislav Michl <ladis@linux-mips.org>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/3] usb: gadget: u_serial: Remove console specific
 alloc/free req functions
Message-ID: <20190703163457.GC28579@lenoch>
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

Driver already contains request allocation and deallocation
functions, so use them also for console_req.
While console_req is always null when calling gs_console_connect
remove check and put access under con_lock as we are racing with
gs_console_thread.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 drivers/usb/gadget/function/u_serial.c | 43 +++++++-------------------
 1 file changed, 11 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index f8abb9c68e62..04b4338b4ae1 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -892,30 +892,6 @@ static struct tty_driver *gs_tty_driver;
 static struct gscons_info gscons_info;
 static struct console gserial_cons;
 
-static struct usb_request *gs_request_new(struct usb_ep *ep)
-{
-	struct usb_request *req = usb_ep_alloc_request(ep, GFP_ATOMIC);
-	if (!req)
-		return NULL;
-
-	req->buf = kmalloc(ep->maxpacket, GFP_ATOMIC);
-	if (!req->buf) {
-		usb_ep_free_request(ep, req);
-		return NULL;
-	}
-
-	return req;
-}
-
-static void gs_request_free(struct usb_request *req, struct usb_ep *ep)
-{
-	if (!req)
-		return;
-
-	kfree(req->buf);
-	usb_ep_free_request(ep, req);
-}
-
 static void gs_complete_out(struct usb_ep *ep, struct usb_request *req)
 {
 	struct gscons_info *info = &gscons_info;
@@ -954,15 +930,15 @@ static int gs_console_connect(int port_num)
 
 	port = ports[port_num].port;
 	ep = port->port_usb->in;
+	spin_lock(&info->con_lock);
+	info->console_req = gs_alloc_req(ep, ep->maxpacket, GFP_ATOMIC);
 	if (!info->console_req) {
-		info->console_req = gs_request_new(ep);
-		if (!info->console_req)
-			return -ENOMEM;
-		info->console_req->complete = gs_complete_out;
+		spin_unlock(&info->con_lock);
+		return -ENOMEM;
 	}
+	info->console_req->complete = gs_complete_out;
 
 	info->port = port;
-	spin_lock(&info->con_lock);
 	info->req_busy = 0;
 	spin_unlock(&info->con_lock);
 	pr_vdebug("port[%d] console connect!\n", port_num);
@@ -972,10 +948,13 @@ static int gs_console_connect(int port_num)
 static void gs_console_disconnect(struct usb_ep *ep)
 {
 	struct gscons_info *info = &gscons_info;
-	struct usb_request *req = info->console_req;
 
-	gs_request_free(req, ep);
-	info->console_req = NULL;
+	spin_lock(&info->con_lock);
+	if (info->console_req) {
+		gs_free_req(ep, info->console_req);
+		info->console_req = NULL;
+	}
+	spin_unlock(&info->con_lock);
 }
 
 static int gs_console_thread(void *data)
-- 
2.20.1

