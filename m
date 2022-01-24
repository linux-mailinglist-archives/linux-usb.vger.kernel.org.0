Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D15499354
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jan 2022 21:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357421AbiAXUdF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 15:33:05 -0500
Received: from netrider.rowland.org ([192.131.102.5]:53619 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1348739AbiAXUXq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jan 2022 15:23:46 -0500
Received: (qmail 85496 invoked by uid 1000); 24 Jan 2022 15:23:45 -0500
Date:   Mon, 24 Jan 2022 15:23:45 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     syzkaller-bugs@googlegroups.com,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Fix hang in usb_kill_urb by adding memory barriers
Message-ID: <Ye8K0QYee0Q0Nna2@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000e3395b05d607330c@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The syzbot fuzzer has identified a bug in which processes hang waiting
for usb_kill_urb() to return.  It turns out the issue is not unlinking
the URB; that works just fine.  Rather, the problem arises when the
wakeup notification that the URB has completed is not received.

The reason is memory-access ordering on SMP systems.  In outline form,
usb_kill_urb() and __usb_hcd_giveback_urb() operating concurrently on
different CPUs perform the following actions:

CPU 0					CPU 1
----------------------------		---------------------------------
usb_kill_urb():				__usb_hcd_giveback_urb():
  ...					  ...
  atomic_inc(&urb->reject);		  atomic_dec(&urb->use_count);
  ...					  ...
  wait_event(usb_kill_urb_queue,
	atomic_read(&urb->use_count) == 0);
					  if (atomic_read(&urb->reject))
						wake_up(&usb_kill_urb_queue);

Confining your attention to urb->reject and urb->use_count, you can
see that the overall pattern of accesses on CPU 0 is:

	write urb->reject, then read urb->use_count;

whereas the overall pattern of accesses on CPU 1 is:

	write urb->use_count, then read urb->reject.

This pattern is referred to in memory-model circles as SB (for "Store
Buffering"), and it is well known that without suitable enforcement of
the desired order of accesses -- in the form of memory barriers -- it
is entirely possible for one or both CPUs to execute their reads ahead
of their writes.  The end result will be that sometimes CPU 0 sees the
old un-decremented value of urb->use_count while CPU 1 sees the old
un-incremented value of urb->reject.  Consequently CPU 0 ends up on
the wait queue and never gets woken up, leading to the observed hang
in usb_kill_urb().

The same pattern of accesses occurs in usb_poison_urb() and the
failure pathway of usb_hcd_submit_urb().

The problem is fixed by adding suitable memory barriers.  To provide
proper memory-access ordering in the SB pattern, a full barrier is
required on both CPUs.  The atomic_inc() and atomic_dec() accesses
themselves don't provide any memory ordering, but since they are
present, we can use the optimized smp_mb__after_atomic() memory
barrier in the various routines to obtain the desired effect.

This patch adds the necessary memory barriers.

Reported-and-tested-by: syzbot+76629376e06e2c2ad626@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---


[as1969]


 drivers/usb/core/hcd.c |   14 ++++++++++++++
 drivers/usb/core/urb.c |   12 ++++++++++++
 2 files changed, 26 insertions(+)

Index: usb-devel/drivers/usb/core/hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hcd.c
+++ usb-devel/drivers/usb/core/hcd.c
@@ -1563,6 +1563,13 @@ int usb_hcd_submit_urb (struct urb *urb,
 		urb->hcpriv = NULL;
 		INIT_LIST_HEAD(&urb->urb_list);
 		atomic_dec(&urb->use_count);
+		/*
+		 * Order the write of urb->use_count above before the read
+		 * of urb->reject below.  Pairs with the memory barriers in
+		 * usb_kill_urb() and usb_poison_urb().
+		 */
+		smp_mb__after_atomic();
+
 		atomic_dec(&urb->dev->urbnum);
 		if (atomic_read(&urb->reject))
 			wake_up(&usb_kill_urb_queue);
@@ -1665,6 +1672,13 @@ static void __usb_hcd_giveback_urb(struc
 
 	usb_anchor_resume_wakeups(anchor);
 	atomic_dec(&urb->use_count);
+	/*
+	 * Order the write of urb->use_count above before the read
+	 * of urb->reject below.  Pairs with the memory barriers in
+	 * usb_kill_urb() and usb_poison_urb().
+	 */
+	smp_mb__after_atomic();
+
 	if (unlikely(atomic_read(&urb->reject)))
 		wake_up(&usb_kill_urb_queue);
 	usb_put_urb(urb);
Index: usb-devel/drivers/usb/core/urb.c
===================================================================
--- usb-devel.orig/drivers/usb/core/urb.c
+++ usb-devel/drivers/usb/core/urb.c
@@ -715,6 +715,12 @@ void usb_kill_urb(struct urb *urb)
 	if (!(urb && urb->dev && urb->ep))
 		return;
 	atomic_inc(&urb->reject);
+	/*
+	 * Order the write of urb->reject above before the read
+	 * of urb->use_count below.  Pairs with the barriers in
+	 * __usb_hcd_giveback_urb() and usb_hcd_submit_urb().
+	 */
+	smp_mb__after_atomic();
 
 	usb_hcd_unlink_urb(urb, -ENOENT);
 	wait_event(usb_kill_urb_queue, atomic_read(&urb->use_count) == 0);
@@ -756,6 +762,12 @@ void usb_poison_urb(struct urb *urb)
 	if (!urb)
 		return;
 	atomic_inc(&urb->reject);
+	/*
+	 * Order the write of urb->reject above before the read
+	 * of urb->use_count below.  Pairs with the barriers in
+	 * __usb_hcd_giveback_urb() and usb_hcd_submit_urb().
+	 */
+	smp_mb__after_atomic();
 
 	if (!urb->dev || !urb->ep)
 		return;
