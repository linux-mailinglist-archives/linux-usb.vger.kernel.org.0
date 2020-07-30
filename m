Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED1D233427
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 16:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgG3OTB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 10:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgG3OTA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jul 2020 10:19:00 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC03C061574
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 07:19:00 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id bo3so5508205ejb.11
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 07:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=B6n3K9t23i+L6NzkXj5PBwS/fGvAQww5YbzJnBOMBo4=;
        b=p4mEdk229TiIxd9haSripuKeVBBlqGnEH6zDxk843teIJBE6WunzYk80OZ5rhRnzDk
         UweF9wXosVOtij3s3bpbn9u/obYK3xaQJkNGuAbYL1JWC5ToFEGV8OPlUhzgLHXcHrfb
         zTeEMnnA1GCYFbB2mAOP94QRfcoixBDTSKoSvgpPsTAbhbfs8cou2JrHDNqNnw2g2O7t
         oUGZ4XBio7pzaR0cQSNses/kIw+pB6U1lfIWdLvWq9ZZWtjkt8UuA/39y5wFrh4bKtQP
         3yx+01LVvG1lcdmU/XTyp6HOI98negg4/l+Xnfw/zfULCKC5ZVZUnsRMuUa34k9mwRzQ
         N1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=B6n3K9t23i+L6NzkXj5PBwS/fGvAQww5YbzJnBOMBo4=;
        b=QT86PDXGvLdgYwNDqN8abms27WBOBd+POKtANwqYNep5QEx9yvQXoRnRB2BXmaK47I
         +NQLNCCxxgb69jEYRuiBxZ08UCSn9Xy4Cq6ZnyAnA3UiZ+oaQE7ltJFoJFqNJCvHdCNG
         NuMHnAZoPmWptYdZX6Xu5MExrAEVx+evlfhFV9tBhXwum81C22l1AQ8tpd2iPvIVS3xZ
         1zKISQMfGy3PYwMxFG6dp/H6c9rQgiy16bCPZSTEGAWoTN22YDev+rbb1APHmIPFk3UP
         GpfQiNVMnumCssqOw3cBvA504qliIigz7sx9nnJp8btMqFxGHWb3533/yPbU8ZMmJ8pi
         zc/A==
X-Gm-Message-State: AOAM533pEvNXlZi7KMSDfE5umJOu8nwHW8vwFgo8cx7H4ZNvDKgaTkf6
        8UB+rB4SkCJSyfzFBk2gHbE=
X-Google-Smtp-Source: ABdhPJxb4HNo7uUMr/Z3GlBLB/WVtAjagZ0Sk8LFFW22bdjKLhzbuGQM1ZQ6QSYfn8p28t8FkNLqCw==
X-Received: by 2002:a17:906:c0d9:: with SMTP id bn25mr2796406ejb.176.1596118738933;
        Thu, 30 Jul 2020 07:18:58 -0700 (PDT)
Received: from ruhe.localdomain (109-186-98-97.bb.netvision.net.il. [109.186.98.97])
        by smtp.gmail.com with ESMTPSA id mj22sm6205507ejb.118.2020.07.30.07.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 07:18:57 -0700 (PDT)
From:   eli.billauer@gmail.com
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     hdegoede@redhat.com, oneukum@suse.de, stern@rowland.harvard.edu,
        Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v4] usb: core: Solve race condition in anchor cleanup functions
Date:   Thu, 30 Jul 2020 17:18:36 +0300
Message-Id: <20200730141836.16550-1-eli.billauer@gmail.com>
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
 drivers/usb/core/urb.c | 86 +++++++++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index da923ec17612..ec193ada5f08 100644
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
@@ -784,20 +785,25 @@ EXPORT_SYMBOL_GPL(usb_block_urb);
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
+	} while (!surely_empty);
 }
 EXPORT_SYMBOL_GPL(usb_kill_anchored_urbs);
 
@@ -816,21 +822,26 @@ EXPORT_SYMBOL_GPL(usb_kill_anchored_urbs);
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
+	} while (!surely_empty);
 }
 EXPORT_SYMBOL_GPL(usb_poison_anchored_urbs);
 
@@ -970,14 +981,19 @@ void usb_scuttle_anchored_urbs(struct usb_anchor *anchor)
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
+	} while (!surely_empty);
 }
 
 EXPORT_SYMBOL_GPL(usb_scuttle_anchored_urbs);
-- 
2.17.1

