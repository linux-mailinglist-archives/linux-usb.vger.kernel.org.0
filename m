Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA093232E9C
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 10:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729009AbgG3IYv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 04:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgG3IYu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jul 2020 04:24:50 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F4AC061794
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 01:24:50 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id di22so12127396edb.12
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 01:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=5vW1fdrZNSYfx7dOzWbOxD/oLCdBq/3TiR8o27oWHIg=;
        b=SsR//16IEAZqvRr4yM7DwDaBbIuy2UPbmMG7j15Y6FO2sp1mgGcWU0V3hIRoP7Y/tm
         thXst5Z3knnNSF9LocYoOssL+CnjLO6bi3TtVxCLQcKIFXLbEebITQVXNfp0/ItmWvYo
         1F4XHi/14PB9gJvmMrtqm8wMbUfB6UiZjESyVRZyu+uYC0O4Z974egME6lR2Jv6k1A6Y
         zTD+yKH7jKz4MgTdyNkqL9MZtrrwoWfw/212sNxjDvgMZHBmH6nP/py9o7QD3xQ8wQOZ
         Pos0YD+PbTTJXFoxIJwQKUky0TFOzscXKTunLSn0T/dkuwxeJim/icIIzTXRy59dmKuI
         Zg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5vW1fdrZNSYfx7dOzWbOxD/oLCdBq/3TiR8o27oWHIg=;
        b=HPRAXwrsX/7KzqLlb1+XpOqYHSh1N623G0RQ1ae/k3mnl6fGmSntcMrEzsa4OrEjDz
         7+/zoj9SW+1efBfrJvkoUjjPXUdAuRwwQIKHcQjkF9Ad2m2gkh5blIGKYzvIUN9n3pbE
         ixowEdYDoSsf6dsHhDaSNmvGsaQUXnyUxKYKRbpSxljJ++zF0ATNKxb6rI3nmWeoRjCV
         XpqGw9n1uiI5DofcCGA95BpET3/oRGR9d5pXjlZNzXJgIazNjJNrf+I/UxC0QqxQ2p8g
         VbD7L0oEw/6P3Z48f9cqDXEGye817Vx3N38uok8AS8KRY1OXDgFGEw97h3fEJ0rc21Zp
         hiKA==
X-Gm-Message-State: AOAM532fZsUFzcWW7/bcmh07jsuBBDA6jsX7X6uBbVg7o/a97yxwwMUT
        UZOExGv/1U6LvYqJleAadrs=
X-Google-Smtp-Source: ABdhPJzt3KjNyxRK7Civ1OzFapjx4CrTq+iXTUsWcjT8rN2fdL7BXl/hoMDik4cWz66gQfhrGbCE+A==
X-Received: by 2002:a50:8f83:: with SMTP id y3mr1549913edy.257.1596097487440;
        Thu, 30 Jul 2020 01:24:47 -0700 (PDT)
Received: from ruhe.localdomain (109-186-98-97.bb.netvision.net.il. [109.186.98.97])
        by smtp.gmail.com with ESMTPSA id f20sm4863077ejq.60.2020.07.30.01.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 01:24:46 -0700 (PDT)
From:   eli.billauer@gmail.com
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     hdegoede@redhat.com, oneukum@suse.de, stern@rowland.harvard.edu,
        Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v3] usb: core: Solve race condition in anchor cleanup functions
Date:   Thu, 30 Jul 2020 11:23:38 +0300
Message-Id: <20200730082338.23709-1-eli.billauer@gmail.com>
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
index da923ec17612..aa749c5a906f 100644
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
+	} while (!usb_anchor_safe_empty(anchor));
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
+	} while (!usb_anchor_safe_empty(anchor));
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
+	} while (!usb_anchor_safe_empty(anchor));
 }
 
 EXPORT_SYMBOL_GPL(usb_scuttle_anchored_urbs);
-- 
2.17.1

