Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67CFD19FA70
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2020 18:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729640AbgDFQlz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Apr 2020 12:41:55 -0400
Received: from mail-wr1-f73.google.com ([209.85.221.73]:51918 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729638AbgDFQly (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Apr 2020 12:41:54 -0400
Received: by mail-wr1-f73.google.com with SMTP id j12so78362wrr.18
        for <linux-usb@vger.kernel.org>; Mon, 06 Apr 2020 09:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=MRjytoTEBKrt8aQLsMYC6tlVfTx2Uch92ldjURsQQQI=;
        b=hTqD+W5OPhE0YOBWh6tJD21i4lK36j0CqvGr/4l2eL71mqbpXSi0D4mVaqQcXRHciM
         cxGCEy9S9WafkNQT7BIcKBpjaXBvkX/UZCRPcgcFmGmd+vOBYh4DRHk3drpoyX/58VoU
         O2gfzNHVjK022wBaAU2iic6LoqsqtlOeZ99UuaVToQi170Zg61P6e3rptmLqx0wPZd3M
         NF5A5ZCFtmcsO/lehpJS48UpcVwbxqLvbi7qJpWs9pZ8bsz9Zl63jNPFF2sqrcb79oHY
         35zN7CPfk1oTM/i6dL4jLh/jYfTErgpudqBKk569mSng4b/orWxdZIjcImcO+AtiOIxz
         aRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=MRjytoTEBKrt8aQLsMYC6tlVfTx2Uch92ldjURsQQQI=;
        b=ph0jHgob4ipLcUBR6+Lc7+yz3bYZnDv1SiVw2k+dJ67cbRWzYGLIDNkmnwvQQSlTRN
         XHusnhwoWawCLBhImpCAY2VHh0nmFj0CiGXjheDt3/5tQzw8Zj7/PMQ0tzN/hqD9FSGV
         w08CjvRfz/5A7unLFRBqAYDWxL1mjmvtD0TJ8/ha7RaWcwckp95vwpB0aYvxLRMa389I
         EMcb0l2BHlb9Yro+4lEOmI5IJNIptuRRscX2dYtxXmPu1Dq0qCoAtcxduBn9hRgUUn3y
         RfHUuMFSYwHlco6awFIwosifRM7LrbfYeeKn+03dTE+iq/6db0ZJhCPRMN8Sv4lKWAhp
         8hOQ==
X-Gm-Message-State: AGi0PuYqf2lLKnPgw49keVHwz16ec22NPiLasRfO6IwT7YG6/hIm+P6t
        luCCAGDybCswdaRS/eC2TqZJpAaeDJk3YGqt
X-Google-Smtp-Source: APiQypIeFTvKOe10+l4Jx6e6TStaYbpWIpj4TLTkuc3VbMP4026hAOnsx5axG05+zGwYzFQLTenvn/KS5NoqcIkB
X-Received: by 2002:a5d:6a47:: with SMTP id t7mr54263wrw.131.1586191312456;
 Mon, 06 Apr 2020 09:41:52 -0700 (PDT)
Date:   Mon,  6 Apr 2020 18:41:44 +0200
Message-Id: <178e01023f2e6664908f7c9660fa6527a55a22d6.1586191134.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
Subject: [PATCH] usb: raw-gadget: fix raw_event_queue_fetch locking
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

Greg, this should apply cleanly on top of Dan's "usb: raw-gadget: Fix
copy_to/from_user() checks" patch.

---
 drivers/usb/gadget/legacy/raw_gadget.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index e490ffa1f58b..1582521ec774 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -81,6 +81,7 @@ static int raw_event_queue_add(struct raw_event_queue *queue,
 static struct usb_raw_event *raw_event_queue_fetch(
 				struct raw_event_queue *queue)
 {
+	int ret;
 	unsigned long flags;
 	struct usb_raw_event *event;
 
@@ -89,11 +90,14 @@ static struct usb_raw_event *raw_event_queue_fetch(
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
+	if (WARN_ON(!queue->size)) {
+		spin_unlock_irqrestore(&queue->lock, flags);
 		return NULL;
+	}
 	event = queue->events[0];
 	queue->size--;
 	memmove(&queue->events[0], &queue->events[1],
@@ -522,10 +526,17 @@ static int raw_ioctl_event_fetch(struct raw_dev *dev, unsigned long value)
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

