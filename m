Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E04233EBC
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 07:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731224AbgGaFr2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 01:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbgGaFr1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jul 2020 01:47:27 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2D8C061574
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 22:47:24 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id c2so15711037edx.8
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 22:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=9ONUvTHyv1eS+fvEfvKwmxZ7RrL+Vz0WPrgtgs1X2RQ=;
        b=uACR6mOq1z87B6CasbJo/lXdnxomC3+lj8+tIrnLhwBoVBpZTV6AlmZ2vim6V4ford
         3bYxBK3k6UEXM61QRuRONgNVKrVnZ0up+L3UeJmypQ0fZ84lVyOKw8mmeHxPyz9cNVt/
         ZcqgrdqsQGIdULie8wKq2g4Ea6kTel7JkAKDftKSwpkpB4NwrdqVlC1EN/E0ou8U2/d8
         EtG5XflJR1VOjlToYsW05lDO5dDTpX9+mhk7ARSC96+7svEyBAifKyjK+aV7G20hJnX3
         Spktyx4LGNSa4CnsJ+uBd1cat2Ka+HLbh6GMAMPsP1YYk6jj2wJGRSGAT1YEzmcjCNKZ
         ZKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9ONUvTHyv1eS+fvEfvKwmxZ7RrL+Vz0WPrgtgs1X2RQ=;
        b=GaFgYD14PVnSX562PN0xJ2+sWMTjaSXIStajbRQF7DguryABSEz3ElX4+ImZvc1QHW
         fJHOi4WgPOOwkYF4jdnB2xJAV2cXGpT14aoNCa/IGrbkKSUQsy1NXHMrS9m9HzU9nt0b
         Lm//CMuWSmnMCNtuIPWpZqYH8JAxQL5l2GUFOyGqUMsZhhaA///bbNrxvdlDM09inDLq
         6f7rCKOoIPB5jFq9OsEIS8DoVoyVa/zjBTMNOZ0GHMkc/jCmEwT68y53Jthd4iefyLcc
         pl1X2naRQ8R1MzQ1JhYQqCJQaW5YR/ZucYOliAsEPBp21VikWExVDmRtCOrHKYx22qsD
         47Yw==
X-Gm-Message-State: AOAM531EkBjy0BdNRAM4KxWbZekRbsp34qEktiOvWr8D6YrMjL+O5iuV
        K08COkIZjXyMoloLafXtvjY=
X-Google-Smtp-Source: ABdhPJxivvytqlHmArLnxs83dyTCl2+RyRWcK+KDAUdtPB/ePJWzF34WcZ53QXoTsy5tc5xIEFeSkw==
X-Received: by 2002:a50:eac5:: with SMTP id u5mr2411824edp.6.1596174443390;
        Thu, 30 Jul 2020 22:47:23 -0700 (PDT)
Received: from ruhe.localdomain (109-186-98-97.bb.netvision.net.il. [109.186.98.97])
        by smtp.gmail.com with ESMTPSA id s5sm7063756ejv.67.2020.07.30.22.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 22:47:22 -0700 (PDT)
From:   eli.billauer@gmail.com
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     hdegoede@redhat.com, oneukum@suse.de, stern@rowland.harvard.edu,
        Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v5] usb: core: Solve race condition in anchor cleanup functions
Date:   Fri, 31 Jul 2020 08:46:50 +0300
Message-Id: <20200731054650.30644-1-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Eli Billauer <eli.billauer@gmail.com>

usb_kill_anchored_urbs() is commonly used to cancel all URBs on an
anchor just before releasing resources which the URBs rely on. By doing
so, users of this function rely on that no completer callbacks will take
place from any URB on the anchor after it returns.

However if this function is called in parallel with __usb_hcd_giveback_urb
processing a URB on the anchor, the latter may call the completer
callback after usb_kill_anchored_urbs() returns. This can lead to a
kernel panic due to use after release of memory in interrupt context.

The race condition is that __usb_hcd_giveback_urb() first unanchors the URB
and then makes the completer callback. Such URB is hence invisible to
usb_kill_anchored_urbs(), allowing it to return before the completer has
been called, since the anchor's urb_list is empty.

Even worse, if the racing completer callback resubmits the URB, it may
remain in the system long after usb_kill_anchored_urbs() returns.

Hence list_empty(&anchor->urb_list), which is used in the existing
while-loop, doesn't reliably ensure that all URBs of the anchor are gone.

A similar problem exists with usb_poison_anchored_urbs() and
usb_scuttle_anchored_urbs().

This patch adds an external do-while loop, which ensures that all URBs
are indeed handled before these three functions return. This change has
no effect at all unless the race condition occurs, in which case the
loop will busy-wait until the racing completer callback has finished.
This is a rare condition, so the CPU waste of this spinning is
negligible.

The additional do-while loop relies on usb_anchor_check_wakeup(), which
returns true iff the anchor list is empty, and there is no
__usb_hcd_giveback_urb() in the system that is in the middle of the
unanchor-before-complete phase. The @suspend_wakeups member of
struct usb_anchor is used for this purpose, which was introduced to solve
another problem which the same race condition causes, in commit
6ec4147e7bdb ("usb-anchor: Delay usb_wait_anchor_empty_timeout wake up
till completion is done").

The surely_empty variable is necessary, because usb_anchor_check_wakeup()
must be called with the lock held to prevent races. However the spinlock
must be released and reacquired if the outer loop spins with an empty
URB list while waiting for the unanchor-before-complete passage to finish:
The completer callback may very well attempt to take the very same lock.

To summarize, using usb_anchor_check_wakeup() means that the patched
functions can return only when the anchor's list is empty, and there is
no invisible URB being processed. Since the inner while loop finishes on
the empty list condition, the new do-while loop will terminate as well,
except for when the said race condition occurs.

Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---
Difference from patch v4: Added cpu_relax() calls per Alan's advice.
 drivers/usb/core/urb.c | 89 +++++++++++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index da923ec17612..31ca5abb4c12 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -772,11 +772,12 @@ void usb_block_urb(struct urb *urb)
 EXPORT_SYMBOL_GPL(usb_block_urb);
 
 /**
- * usb_kill_anchored_urbs - cancel transfer requests en masse
+ * usb_kill_anchored_urbs - kill all URBs associated with an anchor
  * @anchor: anchor the requests are bound to
  *
- * this allows all outstanding URBs to be killed starting
- * from the back of the queue
+ * This kills all outstanding URBs starting from the back of the queue,
+ * with guarantee that no completer callbacks will take place from the
+ * anchor after this function returns.
  *
  * This routine should not be called by a driver after its disconnect
  * method has returned.
@@ -784,20 +785,26 @@ EXPORT_SYMBOL_GPL(usb_block_urb);
 void usb_kill_anchored_urbs(struct usb_anchor *anchor)
 {
 	struct urb *victim;
+	int surely_empty;
 
-	spin_lock_irq(&anchor->lock);
-	while (!list_empty(&anchor->urb_list)) {
-		victim = list_entry(anchor->urb_list.prev, struct urb,
-				    anchor_list);
-		/* we must make sure the URB isn't freed before we kill it*/
-		usb_get_urb(victim);
-		spin_unlock_irq(&anchor->lock);
-		/* this will unanchor the URB */
-		usb_kill_urb(victim);
-		usb_put_urb(victim);
+	do {
 		spin_lock_irq(&anchor->lock);
-	}
-	spin_unlock_irq(&anchor->lock);
+		while (!list_empty(&anchor->urb_list)) {
+			victim = list_entry(anchor->urb_list.prev,
+					    struct urb, anchor_list);
+			/* make sure the URB isn't freed before we kill it */
+			usb_get_urb(victim);
+			spin_unlock_irq(&anchor->lock);
+			/* this will unanchor the URB */
+			usb_kill_urb(victim);
+			usb_put_urb(victim);
+			spin_lock_irq(&anchor->lock);
+		}
+		surely_empty = usb_anchor_check_wakeup(anchor);
+
+		spin_unlock_irq(&anchor->lock);
+		cpu_relax();
+	} while (!surely_empty);
 }
 EXPORT_SYMBOL_GPL(usb_kill_anchored_urbs);
 
@@ -816,21 +823,27 @@ EXPORT_SYMBOL_GPL(usb_kill_anchored_urbs);
 void usb_poison_anchored_urbs(struct usb_anchor *anchor)
 {
 	struct urb *victim;
+	int surely_empty;
 
-	spin_lock_irq(&anchor->lock);
-	anchor->poisoned = 1;
-	while (!list_empty(&anchor->urb_list)) {
-		victim = list_entry(anchor->urb_list.prev, struct urb,
-				    anchor_list);
-		/* we must make sure the URB isn't freed before we kill it*/
-		usb_get_urb(victim);
-		spin_unlock_irq(&anchor->lock);
-		/* this will unanchor the URB */
-		usb_poison_urb(victim);
-		usb_put_urb(victim);
+	do {
 		spin_lock_irq(&anchor->lock);
-	}
-	spin_unlock_irq(&anchor->lock);
+		anchor->poisoned = 1;
+		while (!list_empty(&anchor->urb_list)) {
+			victim = list_entry(anchor->urb_list.prev,
+					    struct urb, anchor_list);
+			/* make sure the URB isn't freed before we kill it */
+			usb_get_urb(victim);
+			spin_unlock_irq(&anchor->lock);
+			/* this will unanchor the URB */
+			usb_poison_urb(victim);
+			usb_put_urb(victim);
+			spin_lock_irq(&anchor->lock);
+		}
+		surely_empty = usb_anchor_check_wakeup(anchor);
+
+		spin_unlock_irq(&anchor->lock);
+		cpu_relax();
+	} while (!surely_empty);
 }
 EXPORT_SYMBOL_GPL(usb_poison_anchored_urbs);
 
@@ -970,14 +983,20 @@ void usb_scuttle_anchored_urbs(struct usb_anchor *anchor)
 {
 	struct urb *victim;
 	unsigned long flags;
+	int surely_empty;
+
+	do {
+		spin_lock_irqsave(&anchor->lock, flags);
+		while (!list_empty(&anchor->urb_list)) {
+			victim = list_entry(anchor->urb_list.prev,
+					    struct urb, anchor_list);
+			__usb_unanchor_urb(victim, anchor);
+		}
+		surely_empty = usb_anchor_check_wakeup(anchor);
 
-	spin_lock_irqsave(&anchor->lock, flags);
-	while (!list_empty(&anchor->urb_list)) {
-		victim = list_entry(anchor->urb_list.prev, struct urb,
-				    anchor_list);
-		__usb_unanchor_urb(victim, anchor);
-	}
-	spin_unlock_irqrestore(&anchor->lock, flags);
+		spin_unlock_irqrestore(&anchor->lock, flags);
+		cpu_relax();
+	} while (!surely_empty);
 }
 
 EXPORT_SYMBOL_GPL(usb_scuttle_anchored_urbs);
-- 
2.17.1

