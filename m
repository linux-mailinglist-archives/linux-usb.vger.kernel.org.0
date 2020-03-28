Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A422196918
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2020 21:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbgC1USN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Mar 2020 16:18:13 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52459 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726604AbgC1USN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Mar 2020 16:18:13 -0400
Received: (qmail 15036 invoked by uid 500); 28 Mar 2020 16:18:11 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 28 Mar 2020 16:18:11 -0400
Date:   Sat, 28 Mar 2020 16:18:11 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Kyungtae Kim <kt0755@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Fix free-while-in-use bug in the USB S-Glibrary
In-Reply-To: <CAEAjamuCnVEyRKDsTa-MiU_4eTnaD0d38dmSBPbbkmjd+MZxpQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2003281615140.14837-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

FuzzUSB (a variant of syzkaller) found a free-while-still-in-use bug
in the USB scatter-gather library:

BUG: KASAN: use-after-free in atomic_read
include/asm-generic/atomic-instrumented.h:26 [inline]
BUG: KASAN: use-after-free in usb_hcd_unlink_urb+0x5f/0x170
drivers/usb/core/hcd.c:1607
Read of size 4 at addr ffff888065379610 by task kworker/u4:1/27

CPU: 1 PID: 27 Comm: kworker/u4:1 Not tainted 5.5.11 #2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.10.2-1ubuntu1 04/01/2014
Workqueue: scsi_tmf_2 scmd_eh_abort_handler
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xce/0x128 lib/dump_stack.c:118
 print_address_description.constprop.4+0x21/0x3c0 mm/kasan/report.c:374
 __kasan_report+0x153/0x1cb mm/kasan/report.c:506
 kasan_report+0x12/0x20 mm/kasan/common.c:639
 check_memory_region_inline mm/kasan/generic.c:185 [inline]
 check_memory_region+0x152/0x1b0 mm/kasan/generic.c:192
 __kasan_check_read+0x11/0x20 mm/kasan/common.c:95
 atomic_read include/asm-generic/atomic-instrumented.h:26 [inline]
 usb_hcd_unlink_urb+0x5f/0x170 drivers/usb/core/hcd.c:1607
 usb_unlink_urb+0x72/0xb0 drivers/usb/core/urb.c:657
 usb_sg_cancel+0x14e/0x290 drivers/usb/core/message.c:602
 usb_stor_stop_transport+0x5e/0xa0 drivers/usb/storage/transport.c:937

This bug occurs when cancellation of the S-G transfer races with
transfer completion.  When that happens, usb_sg_cancel() may continue
to access the transfer's URBs after usb_sg_wait() has freed them.

The bug is caused by the fact that usb_sg_cancel() does not take any
sort of reference to the transfer, and so there is nothing to prevent
the URBs from being deallocated while the routine is trying to use
them.  The fix is to take such a reference by incrementing the
transfer's io->count field while the cancellation is in progres and
decrementing it afterward.  The transfer's URBs are not deallocated
until io->complete is triggered, which happens when io->count reaches
zero.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: Kyungtae Kim <kt0755@gmail.com>
CC: <stable@vger.kernel.org>

---


[as1931]


 drivers/usb/core/message.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

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
 

