Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2459E231CC0
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 12:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgG2KcN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 06:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2KcM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jul 2020 06:32:12 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC5DC061794
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2020 03:32:12 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id f24so3304418ejx.6
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2020 03:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qCfq8ivCttE3ghDrMZzvqVXa7AAbw5lS0wtqbbyfBhA=;
        b=ocOEprw/xZvYxh/mOxINfjR/QztCkmlauEMBZr0VfU1emEc8+LAFahJGJJ5c3IpCoK
         TVxME3EqZ3mw63q4CKz832z53VvePr2oVrmnKEfF0sxQy2gzNXX9NOzYQMmnL0QTI4I9
         oc8KdvBkKJ0UcIpX1tj5CwVfC2mMiID0di5g/MiZ8ABLAmQOUs/RjJdHCqeGkQH7yA7c
         675qe2pC6AtPjnh1gH90mjYU68ydZnYlt0oUvWiQvKD74p8JXyXLSJZmkmKRwykVMgvd
         y2zOw9jVGygY1DDdTWHeonj2vtIT3AFqAgwirsz3BNaR6A3U57T14MjxrcOW0qrnbfyY
         eTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qCfq8ivCttE3ghDrMZzvqVXa7AAbw5lS0wtqbbyfBhA=;
        b=OUlSzcgBZT1P/lARXcFVhmWVclSEYAyWDjr5Z3bVFWnStXl/4cZF33odJgNDzqjHrK
         cimP8/875rEILTtS7OA4aqtEnEECU+G4/5OffbR545tY2PRxBzQVNGQH3gWcB2qJx4C2
         NPs238PUWYI3fq9GT/S3RJzV9EvZAVDKsCzM1Mzf8WiMjr++oU/eFyeYnfuUHOQaNQXh
         A4ad2KYZcJMYKmeSXTOkD4vskWEmSOirG2QL7OrnAuz+w+bgN0n/dxXCnPCO5rNvlSqn
         N1BelJN1t32ZPLlGr2a1t0RxbcH9XfDeDaSgvl9ThGzetBNGZIa6IcDWjXfp1ZWiHD1k
         nxzg==
X-Gm-Message-State: AOAM530nrzhI3Wku26ZQJ2ZxJGzwwY3rzqAl0ve8kzKxoMYx3cqiBu5l
        cD81xi/fyRe4S+fpyVKyY+Q=
X-Google-Smtp-Source: ABdhPJwLAE9jQFmTzrPuqmuRpX8eM8fCvWC7VnsQ2W4/VGORqraZuSVax1kq+djIDuU8zy2bemlN6w==
X-Received: by 2002:a17:906:7017:: with SMTP id n23mr29043003ejj.262.1596018731040;
        Wed, 29 Jul 2020 03:32:11 -0700 (PDT)
Received: from ruhe.localdomain (109-186-98-97.bb.netvision.net.il. [109.186.98.97])
        by smtp.gmail.com with ESMTPSA id g10sm1225610ejm.120.2020.07.29.03.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 03:32:10 -0700 (PDT)
From:   eli.billauer@gmail.com
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     hdegoede@redhat.com, oneukum@suse.de, stern@rowland.harvard.edu,
        Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v2] usb: core: Solve race condition in anchor cleanup functions
Date:   Wed, 29 Jul 2020 13:31:39 +0300
Message-Id: <20200729103139.49229-1-eli.billauer@gmail.com>
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

The additional do-while loop relies on the new usb_anchor_safe_empty()
function, which is like usb_anchor_check_wakeup(), only the former takes
the anchor's lock before checking. Both functions return true iff the
anchor list is empty, and there is no __usb_hcd_giveback_urb() in the
system that is in the middle of the unanchor-before-complete phase.
The @suspend_wakeups member of struct usb_anchor is used for this purpose,
which was introduced to solve another problem which the same race
condition causes, in commit 6ec4147e7bdb ("usb-anchor: Delay
usb_wait_anchor_empty_timeout wake up till completion is done").

To summarize, using usb_anchor_safe_empty() means that the patched
functions can return only when the anchor's list is empty, and there is
no invisible URB being processed. Since the inner while loop finishes on
the empty list condition, the new do-while loop will terminate as well,
except for when the said race condition occurs.

Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---
 drivers/usb/core/urb.c | 90 ++++++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index da923ec17612..44db8b8fabc9 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -145,6 +145,19 @@ static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
 		list_empty(&anchor->urb_list);
 }
 
+static int usb_anchor_safe_empty(struct usb_anchor *anchor)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&anchor->lock, flags);
+	ret = atomic_read(&anchor->suspend_wakeups) == 0 &&
+		list_empty(&anchor->urb_list);
+	spin_unlock_irqrestore(&anchor->lock, flags);
+
+	return ret;
+}
+
 /* Callers must hold anchor->lock */
 static void __usb_unanchor_urb(struct urb *urb, struct usb_anchor *anchor)
 {
@@ -772,11 +785,12 @@ void usb_block_urb(struct urb *urb)
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
@@ -785,19 +799,21 @@ void usb_kill_anchored_urbs(struct usb_anchor *anchor)
 {
 	struct urb *victim;
 
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
+		spin_unlock_irq(&anchor->lock);
+	} while (unlikely(!usb_anchor_safe_empty(anchor)));
 }
 EXPORT_SYMBOL_GPL(usb_kill_anchored_urbs);
 
@@ -817,20 +833,22 @@ void usb_poison_anchored_urbs(struct usb_anchor *anchor)
 {
 	struct urb *victim;
 
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
+		spin_unlock_irq(&anchor->lock);
+	} while (unlikely(!usb_anchor_safe_empty(anchor)));
 }
 EXPORT_SYMBOL_GPL(usb_poison_anchored_urbs);
 
@@ -971,13 +989,15 @@ void usb_scuttle_anchored_urbs(struct usb_anchor *anchor)
 	struct urb *victim;
 	unsigned long flags;
 
-	spin_lock_irqsave(&anchor->lock, flags);
-	while (!list_empty(&anchor->urb_list)) {
-		victim = list_entry(anchor->urb_list.prev, struct urb,
-				    anchor_list);
-		__usb_unanchor_urb(victim, anchor);
-	}
-	spin_unlock_irqrestore(&anchor->lock, flags);
+	do {
+		spin_lock_irqsave(&anchor->lock, flags);
+		while (!list_empty(&anchor->urb_list)) {
+			victim = list_entry(anchor->urb_list.prev,
+					    struct urb, anchor_list);
+			__usb_unanchor_urb(victim, anchor);
+		}
+		spin_unlock_irqrestore(&anchor->lock, flags);
+	} while (unlikely(!usb_anchor_safe_empty(anchor)));
 }
 
 EXPORT_SYMBOL_GPL(usb_scuttle_anchored_urbs);
-- 
2.17.1

