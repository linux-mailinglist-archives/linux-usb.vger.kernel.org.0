Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D955E1A0EF4
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2020 16:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgDGOO5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Apr 2020 10:14:57 -0400
Received: from mail-wr1-f74.google.com ([209.85.221.74]:34914 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728596AbgDGOO5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Apr 2020 10:14:57 -0400
Received: by mail-wr1-f74.google.com with SMTP id a10so1987888wra.2
        for <linux-usb@vger.kernel.org>; Tue, 07 Apr 2020 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=gOTUaqmgbGCsE0dVLTz9SOZ17zVq8RiTIkdhy3fA4uM=;
        b=RtXu6P/4U4fHkpq2NJTWopKO2cpCfiMN7O8tch7NptGBMwdtYdHqh/THbw9Ct12QaE
         kKT6cmNhVDe4hYgj2Cn/K30IGR+GPiJ8I2xavinT9NLHdgFbpBFJxfSPQVdkr3dhCw1U
         zEYRvhaOiibxKn0gNechJZYO6jEQo2Kw6jxCR5GJSJH15OB6iWadkswM+KgfkDGuNOdW
         wNCf4hgSTdOVE370FnCcOicjkT9irrs2APdaWKvl/m60kMT3YUxVLZ1M/tHUCe3lkAGJ
         7CwBS5zJNuLNY6Xg4JwQnVaVgv0pgLLNlhLMTniAQEIL20LyNMPe14QP52rQXi/JVnJw
         iWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=gOTUaqmgbGCsE0dVLTz9SOZ17zVq8RiTIkdhy3fA4uM=;
        b=hm71H24FItQnuScGmlk/EhU1arFV8fkMjihtLYyC4KdMyLMZCD0pmU/s9H55mpWzWG
         7OC3WDqlb9+0FOZOjd1ZOu0uDJyHkRVEkrMi62/VlHs4zrdSFCP95zQKhs8hB50IIqR6
         I/Fjm/Lt/7C8tEgMNF7lRvZWrTEXbmlH4KRSc69mTVUKNWLEZzlSmUjc7EO4fRCVqXB1
         k4mr09myWbxfi0uHKs59x+CxNvhDcLFxff6+M1pK/MBhWwthwdGxvJZVJ8DcoiJPX6Bz
         liyMiA53QJ/ZjoSYr3gFhbO1Nt5sZ0jPXtJmx0PAn00OevuVLD6Zpft+Powg7yt3R7Xw
         lgGA==
X-Gm-Message-State: AGi0PuY2VZ9QyUB24bMVgBlmS18recTb1X0V4zYH9jwXpUSyj4QGfnTU
        fYVM63kuYjGcoHJVYsRPN3nKkLWov9pt6pzT
X-Google-Smtp-Source: APiQypIuCxxkxv9G1eKVjmIVs2yLdCdb1+xcFVQyqd0Yt5LJUlM//Nn9s+vfGRkkadqLefDR/ZUjlgfZuz1rYxUV
X-Received: by 2002:adf:e691:: with SMTP id r17mr3023185wrm.421.1586268895116;
 Tue, 07 Apr 2020 07:14:55 -0700 (PDT)
Date:   Tue,  7 Apr 2020 16:14:50 +0200
Message-Id: <c4cedb13ee6159857ed7d9884e55718e4b1dede4.1586268809.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
Subject: [PATCH v2] usb: raw-gadget: fix raw_event_queue_fetch locking
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If queue->size check in raw_event_queue_fetch() fails (which normally
shouldn't happen, that check is a fail-safe), the function returns
without reenabling interrupts. This patch fixes that issue, along with
propagating the cause of failure to the function caller.

Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface"
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---

Changes in v2:
- Added a comment before the WARN_ON() call.

Greg, this should apply cleanly on top of Dan's "usb: raw-gadget: Fix
copy_to/from_user() checks" patch.

---
 drivers/usb/gadget/legacy/raw_gadget.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index e490ffa1f58b..85dfbcd461ac 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -81,6 +81,7 @@ static int raw_event_queue_add(struct raw_event_queue *queue,
 static struct usb_raw_event *raw_event_queue_fetch(
 				struct raw_event_queue *queue)
 {
+	int ret;
 	unsigned long flags;
 	struct usb_raw_event *event;
 
@@ -89,11 +90,18 @@ static struct usb_raw_event *raw_event_queue_fetch(
 	 * there's at least one event queued by decrementing the semaphore,
 	 * and then take the lock to protect queue struct fields.
 	 */
-	if (down_interruptible(&queue->sema))
-		return NULL;
+	ret = down_interruptible(&queue->sema);
+	if (ret)
+		return ERR_PTR(ret);
 	spin_lock_irqsave(&queue->lock, flags);
-	if (WARN_ON(!queue->size))
+	/*
+	 * queue->size must have the same value as queue->sema counter (before
+	 * the down_interruptible() call above), so this check is a fail-safe.
+	 */
+	if (WARN_ON(!queue->size)) {
+		spin_unlock_irqrestore(&queue->lock, flags);
 		return NULL;
+	}
 	event = queue->events[0];
 	queue->size--;
 	memmove(&queue->events[0], &queue->events[1],
@@ -522,10 +530,17 @@ static int raw_ioctl_event_fetch(struct raw_dev *dev, unsigned long value)
 	spin_unlock_irqrestore(&dev->lock, flags);
 
 	event = raw_event_queue_fetch(&dev->queue);
-	if (!event) {
+	if (PTR_ERR(event) == -EINTR) {
 		dev_dbg(&dev->gadget->dev, "event fetching interrupted\n");
 		return -EINTR;
 	}
+	if (IS_ERR_OR_NULL(event)) {
+		dev_err(&dev->gadget->dev, "failed to fetch event\n");
+		spin_lock_irqsave(&dev->lock, flags);
+		dev->state = STATE_DEV_FAILED;
+		spin_unlock_irqrestore(&dev->lock, flags);
+		return -ENODEV;
+	}
 	length = min(arg.length, event->length);
 	if (copy_to_user((void __user *)value, event, sizeof(*event) + length))
 		return -EFAULT;
-- 
2.26.0.292.g33ef6b2f38-goog

