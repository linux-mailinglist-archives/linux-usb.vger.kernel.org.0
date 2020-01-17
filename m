Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C326140E38
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 16:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbgAQPrP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 10:47:15 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:58572 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728816AbgAQPrO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jan 2020 10:47:14 -0500
Received: (qmail 3711 invoked by uid 2102); 17 Jan 2020 10:47:13 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 17 Jan 2020 10:47:13 -0500
Date:   Fri, 17 Jan 2020 10:47:13 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Chris Dickens <christopher.a.dickens@gmail.com>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: usbfs: Always unlink URBs in reverse order
In-Reply-To: <Pine.LNX.4.44L0.2001161656270.1301-100000@iolanthe.rowland.org>
Message-ID: <Pine.LNX.4.44L0.2001171045380.1571-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the kernel unlinks a bunch of URBs for a single endpoint, it
should always unlink them in reverse order.  This eliminates any
possibility that some URB x will be unlinked before it can execute but
the following URB x+1 will execute before it can be unlinked.  Such an
event would be bad, for obvious reasons.

Chris Dickens pointed out that usbfs doesn't behave this way when it
is unbound from an interface.  All pending URBs are cancelled, but in
the order of submission.  This patch changes the behavior to make the
unlinks occur in reverse order.  It similarly changes the behavior
when usbfs cancels the continuation URBs for a BULK endpoint.

Suggested-by: Chris Dickens <christopher.a.dickens@gmail.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

This doesn't fix any reported bugs, so I don't think it needs to go 
into the -stable kernels.


[as1929]


 drivers/usb/core/devio.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/usb/core/devio.c
===================================================================
--- usb-devel.orig/drivers/usb/core/devio.c
+++ usb-devel/drivers/usb/core/devio.c
@@ -574,7 +574,7 @@ __acquires(ps->lock)
 
 	/* Now carefully unlink all the marked pending URBs */
  rescan:
-	list_for_each_entry(as, &ps->async_pending, asynclist) {
+	list_for_each_entry_reverse(as, &ps->async_pending, asynclist) {
 		if (as->bulk_status == AS_UNLINK) {
 			as->bulk_status = 0;		/* Only once */
 			urb = as->urb;
@@ -636,7 +636,7 @@ static void destroy_async(struct usb_dev
 
 	spin_lock_irqsave(&ps->lock, flags);
 	while (!list_empty(list)) {
-		as = list_entry(list->next, struct async, asynclist);
+		as = list_last_entry(list, struct async, asynclist);
 		list_del_init(&as->asynclist);
 		urb = as->urb;
 		usb_get_urb(urb);

