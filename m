Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 000981A0F9A
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2020 16:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgDGOsD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Apr 2020 10:48:03 -0400
Received: from mail-wm1-f73.google.com ([209.85.128.73]:39325 "EHLO
        mail-wm1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729208AbgDGOsD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Apr 2020 10:48:03 -0400
Received: by mail-wm1-f73.google.com with SMTP id f8so823687wmh.4
        for <linux-usb@vger.kernel.org>; Tue, 07 Apr 2020 07:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=kBwtinCCbQD3d1i0W2BxWgZFWTEf8D3Zw/F9mdZ06Jo=;
        b=BNEPSE0i8ARIophwmS/TfQV8URnTXgM7H88FFcYI1mefm7MRNzS602/NFMRBGmANX1
         di6r/78+mPNVawgfAa1U7JL9oJ2BHxq8FuZO/Ea4b6mFUR6sjAWEtcRwlOFiduw8n+cX
         3JL8Jiwp4Td+bDdkGXF/4+H4YwlauOSM3JhmLN8as860cROD2yFXU1EpN8XUg6C1V1z1
         XbfrcT0K7ztziOhy0f+xSeAxi3vMvjIfR0qj1V7b07b6ALk8fgtlv1E9UXc29IvyJ7rp
         MgT8aNYQox7waYe1/EpaJEiEjIac/Olz53DSDXWB8uhX0NlXDuVs2oW04SXjpgoEtFvh
         Zstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=kBwtinCCbQD3d1i0W2BxWgZFWTEf8D3Zw/F9mdZ06Jo=;
        b=CaGzOxu1YHoXSuWBqE1gWFDxEmGZ1czNgE++CHvcyDVwm2JWF2syDGLA8Qvkt0NpHi
         1XjG4A4+txPv48D3Iyhqr4PwZgGFHeWBTDj7xxHy4A7wRojen5UyWeQ3XKTGDmR2uoTI
         RXIJmSg1IcUOKZVwu8gzsw4S4NylaeXFMyBknRNmSbrtgxDuYYDLOHi7ukmU0D+j0g8U
         ReTuyrNCWVL0LOvOaCFqPtwuD/dmoWVOv5Jf+qYLCakGUzlkw5MPFWMDHy+zkyc0Nry9
         XkQvpVcLQbRkawCC+vLx5NiX4SgVCKEL74wIQfZEqfEipNaYI3LjoGQ2c1/YPg2bau2U
         2uxw==
X-Gm-Message-State: AGi0PuZOd2hy7iEHaV5NyqM5ND5BLK9t8mXT6BTduDnjh9EKjOotSqju
        GTWNCzOqGYCPc5sezi3pGoKcAYfDRcDkIp9M
X-Google-Smtp-Source: APiQypI9dbRfSFBjBzZlPOeHHSm0VSKX2n7bXJQdB3MU8o7qN8FqnsRORojqoLqm6nFbaGri/ULx5j08PxaoYWUk
X-Received: by 2002:adf:92a3:: with SMTP id 32mr3356166wrn.254.1586270881011;
 Tue, 07 Apr 2020 07:48:01 -0700 (PDT)
Date:   Tue,  7 Apr 2020 16:47:54 +0200
Message-Id: <9f7ce7a1472cfb9447f6c5a494186fa1f2670f6f.1586270396.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
Subject: [PATCH v3] usb: raw-gadget: fix raw_event_queue_fetch locking
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

Changes in v3:
- Don't return NULL from raw_event_queue_fetch() in case on an error.

Changes in v2:
- Added a comment before the WARN_ON() call.

Greg, this should apply cleanly on top of Dan's "usb: raw-gadget: Fix
copy_to/from_user() checks" patch.

---
 drivers/usb/gadget/legacy/raw_gadget.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index e490ffa1f58b..ca7d95bf7397 100644
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
-		return NULL;
+	/*
+	 * queue->size must have the same value as queue->sema counter (before
+	 * the down_interruptible() call above), so this check is a fail-safe.
+	 */
+	if (WARN_ON(!queue->size)) {
+		spin_unlock_irqrestore(&queue->lock, flags);
+		return ERR_PTR(-ENODEV);
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
+	if (IS_ERR(event)) {
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

