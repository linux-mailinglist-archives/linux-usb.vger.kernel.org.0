Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A458D191296
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 15:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgCXOOk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 10:14:40 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38555 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727206AbgCXOOk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 10:14:40 -0400
Received: (qmail 11539 invoked by uid 500); 24 Mar 2020 10:14:39 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 24 Mar 2020 10:14:39 -0400
Date:   Tue, 24 Mar 2020 10:14:39 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Kyungtae Kim <kt0755@gmail.com>
cc:     Oliver Neukum <oneukum@suse.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Fwd: BUG: KASAN: use-after-free in usb_hcd_unlink_urb+0x5f/0x170
 drivers/usb/core/hcd.c
In-Reply-To: <CAEAjamtTnn+BZAshQ7=DQ7QdRHO83AbHeZP3xY1CpSzmbaHPDQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2003241011510.4640-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 23 Mar 2020, Kyungtae Kim wrote:

> We report a bug (in linux-5.5.11) found by FuzzUSB (a modified version
> of syzkaller)
> 
> In function usb_hcd_unlink_urb (driver/usb/core/hcd.c:1607), it tries to
> read "urb->use_count". But it seems the instance "urb" was
> already freed (right after urb->dev at line 1597) by the function "urb_destroy"
> in a different thread, which caused memory access violation.
> To solve, it may need to check if urb is valid before urb->use_count,
> to avoid such freed memory access.

No, the problem is "free while still in use", caused by the fact that 
usb_sg_cancel() fails to indicate it is using the data structures.

> kernel config: https://kt0755.github.io/etc/config_v5.5.11
> 
> ==================================================================
> BUG: KASAN: use-after-free in atomic_read
> include/asm-generic/atomic-instrumented.h:26 [inline]
> BUG: KASAN: use-after-free in usb_hcd_unlink_urb+0x5f/0x170
> drivers/usb/core/hcd.c:1607
> Read of size 4 at addr ffff888065379610 by task kworker/u4:1/27

Here is a patch which ought to fix the problem.  Can you test it?

Alan Stern


Index: usb-devel/drivers/usb/core/message.c
===================================================================
--- usb-devel.orig/drivers/usb/core/message.c
+++ usb-devel/drivers/usb/core/message.c
@@ -588,12 +588,13 @@ void usb_sg_cancel(struct usb_sg_request
 	int i, retval;
 
 	spin_lock_irqsave(&io->lock, flags);
-	if (io->status) {
+	if (io->status || io->count == 0) {
 		spin_unlock_irqrestore(&io->lock, flags);
 		return;
 	}
 	/* shut everything down */
 	io->status = -ECONNRESET;
+	io->count++;		/* Keep the request alive until we're done */
 	spin_unlock_irqrestore(&io->lock, flags);
 
 	for (i = io->entries - 1; i >= 0; --i) {
@@ -607,6 +608,12 @@ void usb_sg_cancel(struct usb_sg_request
 			dev_warn(&io->dev->dev, "%s, unlink --> %d\n",
 				 __func__, retval);
 	}
+
+	spin_lock_irqsave(&io->lock, flags);
+	io->count--;
+	if (!io->count)
+		complete(&io->complete);
+	spin_unlock_irqrestore(&io->lock, flags);
 }
 EXPORT_SYMBOL_GPL(usb_sg_cancel);
 

