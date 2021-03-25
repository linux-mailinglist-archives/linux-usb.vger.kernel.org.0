Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C007349060
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 12:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhCYLea (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Mar 2021 07:34:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:37796 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232005AbhCYLcf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Mar 2021 07:32:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1616671954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=YgCNTq+7XoG+o3ukxHpLvhLmNvF5xCrV6cdJdF0to6s=;
        b=ACNbeuoxM0BZpOZ57pJFp9WznrEP+2jqIw9sD+iVSW2ZFQqVvIjgh4SZNH1pcAPOxTnFsX
        gqZCdXtlr6HIHLBfCn4uGF5mHDJv7aCcUFDeLd/Uyg1ShwU99OgFHBUIn4VLj/VEM0kTA+
        N3oU4PHO+qgrLUe12ekmUa6tF1CCZOU=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AC32BAA55;
        Thu, 25 Mar 2021 11:32:34 +0000 (UTC)
Message-ID: <5b3c30d268ea2d13d303759ef3dfee8d72830084.camel@suse.com>
Subject: [RFC]extension of the anchor API
From:   Oliver Neukum <oneukum@suse.com>
To:     stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org
Date:   Thu, 25 Mar 2021 12:03:33 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

looking at the anchor API it seems to me that it is
weak due to removing an URB from its anchor upon completion.
That is not always what drivers want. If you throw away
the URB after usage, then this is good, as you typically do on a write
path. If, however, you are recieving, you typically reuse the URB
and you reanchor it right in the completion handler.

To make this easier I am proposing a feature called a "mooring"
which makes the association between anchor and URB permanent
and a few helper functions.

What do you think?

	Regards
		Oliver

From 577795900c90d7a40b082935747086be94d7f8be Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Tue, 28 Jul 2020 11:38:23 +0200
Subject: [PATCH 1/2] USB: add mooring API

This is a simplified and thereby better version of the anchor API.
Anchors have the problem that they unanchor an URB upon giveback,
which creates a window during which an URB is unanchored but not
yet returned, leading to operations on anchors not having the
semantics many driver errornously assume them to have.
The new API keeps an URB on an anchor until it is explicitly
unmoored.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 Documentation/driver-api/usb/anchors.rst | 39 +++++++++-
 drivers/usb/core/hcd.c                   | 15 +++-
 drivers/usb/core/urb.c                   | 97 +++++++++++++++++++++++-
 include/linux/usb.h                      | 10 +++
 4 files changed, 157 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/usb/anchors.rst b/Documentation/driver-api/usb/anchors.rst
index 4b248e691bd6..501f46aea75f 100644
--- a/Documentation/driver-api/usb/anchors.rst
+++ b/Documentation/driver-api/usb/anchors.rst
@@ -1,8 +1,8 @@
 USB Anchors
 ~~~~~~~~~~~
 
-What is anchor?
-===============
+What is an anchor?
+==================
 
 A USB driver needs to support some callbacks requiring
 a driver to cease all IO to an interface. To do so, a
@@ -12,6 +12,19 @@ for them. The anchor is a data structure takes care of
 keeping track of URBs and provides methods to deal with
 multiple URBs.
 
+What is a mooring?
+==================
+
+A mooring is a permanent anchoring that persist across
+the completion of an URB.
+The drawback of anchors is that there is an unavoidable
+window between taking an URB off an anchor for completion
+and the completion itself.
+A mooring acts as a permanent anchor to which you can add
+URBs. The order of URBs will be maintained in such a way
+that completing URBs go to the back of the chain.
+The whole anchor can then be manipulated as a whole.
+
 Allocation and Initialisation
 =============================
 
@@ -35,6 +48,13 @@ is automatic. A function is provided to forcibly finish (kill)
 all URBs associated with an anchor.
 Furthermore, disassociation can be made with :c:func:`usb_unanchor_urb`
 
+Association and disassociation of URBs with moorings
+====================================================
+
+An association of URBs to an anchor is made by an explicit
+call to :c:func:`usb_moor_urb`. A moored URB can be turned
+into an anchored URB by :c:func:`usb_unmoor_urb`
+
 Operations on multitudes of URBs
 ================================
 
@@ -81,3 +101,18 @@ Returns the oldest anchored URB of an anchor. The URB is unanchored
 and returned with a reference. As you may mix URBs to several
 destinations in one anchor you have no guarantee the chronologically
 first submitted URB is returned.
+
+:c:func:`usb_submit_anchored_urbs`
+---------------------------------
+
+The URBs contained in anchor are chronologically submitted until
+they are all submitted or an error happens during submission.
+
+:c:func:`usb_transfer_anchors`
+------------------------------
+
+Transfers URBs from an anchor to another anchor by means of a
+transform function you pass to the method. It proceeds until
+all URBs are transfered or an error is encountered during transfer.
+
+
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 3f0381344221..99b599d0056d 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1631,6 +1631,7 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
 	struct usb_hcd *hcd = bus_to_hcd(urb->dev->bus);
 	struct usb_anchor *anchor = urb->anchor;
 	int status = urb->unlinked;
+	unsigned long flags;
 
 	urb->hcpriv = NULL;
 	if (unlikely((urb->transfer_flags & URB_SHORT_NOT_OK) &&
@@ -1641,7 +1642,19 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
 	unmap_urb_for_dma(hcd, urb);
 	usbmon_urb_complete(&hcd->self, urb, status);
 	usb_anchor_suspend_wakeups(anchor);
-	usb_unanchor_urb(urb);
+	if (!urb->moored) {
+		usb_unanchor_urb(urb);
+	} else {
+		/*
+		 * we do not kick it off the list
+		 * but it needs to go to the end
+		 * this needs to be done atomically
+		 */
+		spin_lock_irqsave(&anchor->lock, flags);
+		list_del(&urb->anchor_list);
+		list_add_tail(&urb->anchor_list, &anchor->urb_list);
+		spin_unlock_irqrestore(&anchor->lock, flags);
+	}
 	if (likely(status == 0))
 		usb_led_activity(USB_LED_EVENT_HOST);
 
diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 357b149b20d3..cd351c2ffd38 100644
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
@@ -170,6 +182,7 @@ void usb_unanchor_urb(struct urb *urb)
 		return;
 
 	anchor = urb->anchor;
+	urb->moored = false;
 	if (!anchor)
 		return;
 
@@ -185,6 +198,86 @@ void usb_unanchor_urb(struct urb *urb)
 }
 EXPORT_SYMBOL_GPL(usb_unanchor_urb);
 
+int usb_submit_anchored_urbs(struct usb_anchor *anchor, int *error, gfp_t gfp)
+{
+	int rv = 0;
+	int count = 0;
+	unsigned long flags;
+	struct urb *cur;
+
+	spin_lock_irqsave(&anchor->lock, flags);
+	list_for_each_entry(cur, &anchor->urb_list, urb_list) {
+		usb_get_urb(cur);
+		spin_unlock_irqrestore(&anchor->lock, flags);
+		rv = usb_submit_urb(cur, gfp);
+		if (!rv) {
+			count++;
+		} else {
+			usb_put_urb(cur);
+			goto bail_out;
+		}
+		spin_lock_irqsave(&anchor->lock, flags);
+		usb_put_urb(cur);
+	}
+	spin_unlock_irqrestore(&anchor->lock, flags);
+
+bail_out:
+	if (error)
+		*error = rv;
+	return count;
+}
+EXPORT_SYMBOL_GPL(usb_submit_anchored_urbs);
+
+int usb_transfer_anchors(
+		struct usb_anchor *from,
+		struct usb_anchor *to,
+		int *error,
+		int (*transform_fn)(struct urb *urb, gfp_t gfp),
+		gfp_t gfp)
+{
+	int rv = 0;
+	int count = 0;
+	unsigned long flags;
+	struct urb *cur;
+	bool moor;
+
+	spin_lock_irqsave(&from->lock, flags);
+	list_for_each_entry(cur, &from->urb_list, urb_list) {
+		usb_get_urb(cur);
+		moor = cur->moored;
+		__usb_unanchor_urb(cur, from);
+		__usb_anchor_urb(cur, to);
+		spin_unlock_irqrestore(&from->lock, flags);
+		rv = (transform_fn)(cur, gfp);
+		spin_lock_irqsave(&from->lock, flags);
+		if (rv < 0) {
+			/* put it back */
+			__usb_unanchor_urb(cur, to);
+			__usb_anchor_urb(cur, from);
+			cur->moored = moor;
+			spin_unlock_irqrestore(&from->lock, flags);
+			goto bail_out;
+		} else {
+			count++;
+		}
+		usb_put_urb(cur);
+	}
+	spin_unlock_irqrestore(&from->lock, flags);
+
+bail_out:
+	if (error)
+		*error = rv;
+	return count;
+
+}
+EXPORT_SYMBOL_GPL(usb_transfer_anchors);
+
+void inline usb_unmoor_urb(struct urb *urb)
+{
+	urb->moored = false;
+}
+EXPORT_SYMBOL_GPL(usb_unmoor_urb);
+
 /*-------------------------------------------------------------------*/
 
 static const int pipetypes[4] = {
@@ -978,6 +1071,7 @@ struct urb *usb_get_from_anchor(struct usb_anchor *anchor)
 				    anchor_list);
 		usb_get_urb(victim);
 		__usb_unanchor_urb(victim, anchor);
+		victim->moored = false;
 	} else {
 		victim = NULL;
 	}
@@ -1005,6 +1099,7 @@ void usb_scuttle_anchored_urbs(struct usb_anchor *anchor)
 		while (!list_empty(&anchor->urb_list)) {
 			victim = list_entry(anchor->urb_list.prev,
 					    struct urb, anchor_list);
+			victim->moored = false;
 			__usb_unanchor_urb(victim, anchor);
 		}
 		surely_empty = usb_anchor_check_wakeup(anchor);
diff --git a/include/linux/usb.h b/include/linux/usb.h
index d6a41841b93e..07c431dfeaf5 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1567,6 +1567,7 @@ struct urb {
 	void *hcpriv;			/* private data for host controller */
 	atomic_t use_count;		/* concurrent submissions counter */
 	atomic_t reject;		/* submissions will fail */
+	bool moored;			/* the URB is moored not anchored */
 
 	/* public: documented fields in the urb that can be used by drivers */
 	struct list_head urb_list;	/* list head for use by the urb's
@@ -1726,6 +1727,13 @@ extern void usb_kill_urb(struct urb *urb);
 extern void usb_poison_urb(struct urb *urb);
 extern void usb_unpoison_urb(struct urb *urb);
 extern void usb_block_urb(struct urb *urb);
+extern int usb_submit_anchored_urbs(struct usb_anchor *anchor, int *error, gfp_t gfp);
+extern int usb_transfer_anchors(
+		struct usb_anchor *from,
+		struct usb_anchor *to,
+		int *error,
+		int (*transform_fn)(struct urb *urb, gfp_t gfp),
+		gfp_t gfp);
 extern void usb_kill_anchored_urbs(struct usb_anchor *anchor);
 extern void usb_poison_anchored_urbs(struct usb_anchor *anchor);
 extern void usb_unpoison_anchored_urbs(struct usb_anchor *anchor);
@@ -1734,6 +1742,8 @@ extern void usb_anchor_suspend_wakeups(struct usb_anchor *anchor);
 extern void usb_anchor_resume_wakeups(struct usb_anchor *anchor);
 extern void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor);
 extern void usb_unanchor_urb(struct urb *urb);
+extern void usb_moor_urb(struct urb *urb, struct usb_anchor *anchor);
+extern void inline usb_unmoor_urb(struct urb *urb);
 extern int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
 					 unsigned int timeout);
 extern struct urb *usb_get_from_anchor(struct usb_anchor *anchor);
-- 
2.26.2


