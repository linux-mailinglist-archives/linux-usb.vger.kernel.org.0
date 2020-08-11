Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12962422D3
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 01:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgHKX0a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 19:26:30 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:65161 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgHKX0a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 19:26:30 -0400
Received: from fsav402.sakura.ne.jp (fsav402.sakura.ne.jp [133.242.250.101])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 07BNQRoG097608;
        Wed, 12 Aug 2020 08:26:27 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav402.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav402.sakura.ne.jp);
 Wed, 12 Aug 2020 08:26:27 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav402.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 07BNQG3U097550
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 12 Aug 2020 08:26:27 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Oliver Neukum <oneukum@suse.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>
Subject: [PATCH] USB: cdc-wdm: Remove unsafe wdm_flush().
Date:   Wed, 12 Aug 2020 08:26:15 +0900
Message-Id: <1597188375-4787-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot is reporting hung task at wdm_flush() [1], for there is a circular
dependency that wdm_flush() from flip_close() for /dev/cdc-wdm0 forever
waits for /dev/raw-gadget to be closed while close() for /dev/raw-gadget
cannot be called unless close() for /dev/cdc-wdm0 completes.

It turned out that wdm_flush() is broken in multiple aspects.

(1) Since multiple threads can concurrently call wait_event() from
    wdm_flush() using multiple file descriptors which refer the same
    "desc", we need to use wake_up_all() when clearing WDM_IN_USE
    in order to make sure that all waiters are woken up.

But such change did not help because it turned out that the root cause is
the circular dependency described above.

I considered that such circular dependency is an usage error [2] which
corresponds to an unresponding broken hardware [3]. But Alan Stern
responded that we should be prepared for such hardware [4]. Therefore,
we tried to handle an unresponding broken hardware.

(2) Since multiple threads can share same "desc" using multiple file
    descriptors, there is no guarantee that failure notice received via
    wdm_flush() via some file descriptor corresponds to usb_submit_urb()
    request from wdm_write() call from that file descriptor.

(3) Since wdm_flush() is called without locks held, it is not safe to
    dereference desc->intf after checking that WDM_DISCONNECTING is not
    set [5].

We could change wdm_write() to synchronously wait for response [6] in
order to make sure that a thread which issued usb_submit_urb() request
will receive failure notice for that request. But Oliver Neukum responded
that such change impacts performance and timers. I tried to know
how heavily wdm requests/responses are processed, but I could not receive
response from developers [7].

One year has elapsed since this bug was reported, and this bug is the
third top crasher for syzbot. Waiting for another year without progress
is a waste of resource.

Therefore, for now, simply remove wdm_flush() completely at the cost of
giving up ability to receive failure notice for somebody's
usb_submit_urb() request from somebody's wdm_write() call.

Since I can't touch wdm_write() without knowing how heavily wdm
requests/responses are processed, this patch does not handle unresponding
broken hardware in wdm_write() which forever waits for an response from
such hardware issued by previous usb_submit_urb() request from previous
wdm_write() call [5].

[1] https://syzkaller.appspot.com/bug?id=e7b761593b23eb50855b9ea31e3be5472b711186
[2] https://lkml.kernel.org/r/27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp
[3] https://lkml.kernel.org/r/79ba410f-e0ef-2465-b94f-6b9a4a82adf5@i-love.sakura.ne.jp
[4] https://lkml.kernel.org/r/20200530011040.GB12419@rowland.harvard.edu
[5] https://lkml.kernel.org/r/c85331fc-874c-6e46-a77f-0ef1dc075308@i-love.sakura.ne.jp
[6] https://lkml.kernel.org/r/b347b882-a986-24c6-2b37-0b1a092931b9@i-love.sakura.ne.jp
[7] https://lkml.kernel.org/r/f6de3d3a-6825-1904-65f4-8d96594a9846@i-love.sakura.ne.jp

Reported-by: syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 7f5de95..dd7259a 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -583,30 +583,6 @@ static int service_outstanding_interrupt(struct wdm_device *desc)
 	return rv;
 }
 
-static int wdm_flush(struct file *file, fl_owner_t id)
-{
-	struct wdm_device *desc = file->private_data;
-
-	wait_event(desc->wait,
-			/*
-			 * needs both flags. We cannot do with one
-			 * because resetting it would cause a race
-			 * with write() yet we need to signal
-			 * a disconnect
-			 */
-			!test_bit(WDM_IN_USE, &desc->flags) ||
-			test_bit(WDM_DISCONNECTING, &desc->flags));
-
-	/* cannot dereference desc->intf if WDM_DISCONNECTING */
-	if (test_bit(WDM_DISCONNECTING, &desc->flags))
-		return -ENODEV;
-	if (desc->werr < 0)
-		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
-			desc->werr);
-
-	return usb_translate_errors(desc->werr);
-}
-
 static __poll_t wdm_poll(struct file *file, struct poll_table_struct *wait)
 {
 	struct wdm_device *desc = file->private_data;
@@ -730,7 +706,6 @@ static long wdm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	.read =		wdm_read,
 	.write =	wdm_write,
 	.open =		wdm_open,
-	.flush =	wdm_flush,
 	.release =	wdm_release,
 	.poll =		wdm_poll,
 	.unlocked_ioctl = wdm_ioctl,
-- 
1.8.3.1

