Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACAE241F5B
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 19:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbgHKRjP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 13:39:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:42014 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728862AbgHKRjO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Aug 2020 13:39:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 861EDB6B4;
        Tue, 11 Aug 2020 17:39:34 +0000 (UTC)
Message-ID: <1597167552.28022.4.camel@suse.com>
Subject: Re: [RFC]mooring API
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Eli Billauer <eli.billauer@gmail.com>, linux-usb@vger.kernel.org
Date:   Tue, 11 Aug 2020 19:39:12 +0200
In-Reply-To: <20200810151723.GE299045@rowland.harvard.edu>
References: <1596722827.2488.8.camel@suse.com>
         <20200806152039.GC197575@rowland.harvard.edu>
         <1597070118.2515.3.camel@suse.com>
         <20200810151723.GE299045@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 10.08.2020, 11:17 -0400 schrieb Alan Stern:
> On Mon, Aug 10, 2020 at 04:35:18PM +0200, Oliver Neukum wrote:

> 
> You mean, the URB could have been anchored already, but another CPU 
> could moor it just as this CPU is unachoring it?

I was worrying about accidental unanchoring of a moored URB, actually.

> For one thing, I doubt that a single smp_rmb() will provide any real 
> protection.  For another, it would be best to just avoid races in the 
> first place.  Can you think of any use case where it makes sense to moor 
> an URB just as it is completing (or indeed at any time while it is 
> active)?

No, I am removing it.


> I should have said: require drivers that want to unmoor an URB to do so 
> either before it is submitted or in (or after) the completion handler.  
> In other words, don't moor or unmoor an URB while it is active.  How 
> about that?

Entirely reasonable.

> > What do you think of the API itself?
> 
> It looks fine as far as I can tell.  But I haven't worked on any drivers 
> that use anchors.

Writing decent documentation for that is actually hard. Any sugestions?

	Regards
		Oliver

From 3caa2aa250808a86529302c6553dfcce93bf2927 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Tue, 28 Jul 2020 11:38:23 +0200
Subject: [PATCH] USB: add mooring API

This is a simplified and thereby better version of the anchor API.
Anchors have the problem that they unanchor an URB upon giveback,
which creates a window during which an URB is unanchored but not
yet returned, leading to operations on anchors not having the
semantics many driver errornously assume them to have.
The new API keeps an URB on an anchor until it is explicitly
unmoored.

Signed-off-by: Oliver Neukum <oneukum@suse.de>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/hcd.c |  3 ++-
 drivers/usb/core/urb.c | 27 ++++++++++++++++++++++++++-
 include/linux/usb.h    |  3 +++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index a33b849e8beb..5cebbc2b3600 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1640,7 +1640,8 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
 	unmap_urb_for_dma(hcd, urb);
 	usbmon_urb_complete(&hcd->self, urb, status);
 	usb_anchor_suspend_wakeups(anchor);
-	usb_unanchor_urb(urb);
+	if (!urb->moored)
+		usb_unanchor_urb(urb);
 	if (likely(status == 0))
 		usb_led_activity(USB_LED_EVENT_HOST);
 
diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 7bc23469f4e4..ee3c6c7c2630 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -123,7 +123,7 @@ EXPORT_SYMBOL_GPL(usb_get_urb);
  * This can be called to have access to URBs which are to be executed
  * without bothering to track them
  */
-void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor)
+static void __usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor)
 {
 	unsigned long flags;
 
@@ -137,8 +137,20 @@ void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor)
 
 	spin_unlock_irqrestore(&anchor->lock, flags);
 }
+
+void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor)
+{
+	__usb_anchor_urb(urb, anchor);
+}
 EXPORT_SYMBOL_GPL(usb_anchor_urb);
 
+void usb_moor_urb(struct urb *urb, struct usb_anchor *anchor)
+{
+	urb->moored = true;
+	__usb_anchor_urb(urb, anchor);
+}
+EXPORT_SYMBOL_GPL(usb_moor_urb);
+
 static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
 {
 	return atomic_read(&anchor->suspend_wakeups) == 0 &&
@@ -185,6 +197,19 @@ void usb_unanchor_urb(struct urb *urb)
 }
 EXPORT_SYMBOL_GPL(usb_unanchor_urb);
 
+void usb_unmoor_urb(struct urb *urb)
+{
+	struct usb_anchor *anchor;
+
+	urb->moored = false;
+	anchor = urb->anchor;
+	if (!anchor)
+		return;
+
+	__usb_unanchor_urb(urb, anchor);
+}
+EXPORT_SYMBOL_GPL(usb_unmoor_urb);
+
 /*-------------------------------------------------------------------*/
 
 static const int pipetypes[4] = {
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 20c555db4621..b9e1464a2552 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1565,6 +1565,7 @@ struct urb {
 	void *hcpriv;			/* private data for host controller */
 	atomic_t use_count;		/* concurrent submissions counter */
 	atomic_t reject;		/* submissions will fail */
+	bool moored;			/* the URB is moored not anchored */
 
 	/* public: documented fields in the urb that can be used by drivers */
 	struct list_head urb_list;	/* list head for use by the urb's
@@ -1732,6 +1733,8 @@ extern void usb_anchor_suspend_wakeups(struct usb_anchor *anchor);
 extern void usb_anchor_resume_wakeups(struct usb_anchor *anchor);
 extern void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor);
 extern void usb_unanchor_urb(struct urb *urb);
+extern void usb_moor_urb(struct urb *urb, struct usb_anchor *anchor);
+extern void usb_unmoor_urb(struct urb *urb);
 extern int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
 					 unsigned int timeout);
 extern struct urb *usb_get_from_anchor(struct usb_anchor *anchor);
-- 
2.16.4


