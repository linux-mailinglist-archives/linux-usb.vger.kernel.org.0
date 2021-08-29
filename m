Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6807D3FA82E
	for <lists+linux-usb@lfdr.de>; Sun, 29 Aug 2021 03:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbhH2B7R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Aug 2021 21:59:17 -0400
Received: from netrider.rowland.org ([192.131.102.5]:33525 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229725AbhH2B7R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Aug 2021 21:59:17 -0400
Received: (qmail 297895 invoked by uid 1000); 28 Aug 2021 21:58:25 -0400
Date:   Sat, 28 Aug 2021 21:58:25 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Make usb_start_wait_urb() interruptible
Message-ID: <20210829015825.GA297712@rowland.harvard.edu>
References: <20210828180358.GA291431@rowland.harvard.edu>
 <0000000000000f37f405caa41e79@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000000f37f405caa41e79@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_start_wait_urb() can be called from user processes by means of the
USBDEVFS_BULK and USBDEVFS_CONTROL ioctls in usbfs.  Consequently it
should not contain an uninterruptible wait of arbitrarily long length
(the timeout value is specified here by the user, so it can be
practically anything).  Doing so leads the kernel to complain about
"Task X blocked for more than N seconds", as found in testing by
syzbot:

INFO: task syz-executor.0:8700 blocked for more than 143 seconds.
      Not tainted 5.14.0-rc7-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.0  state:D stack:23192 pid: 8700 ppid:  8455 flags:0x00004004
Call Trace:
 context_switch kernel/sched/core.c:4681 [inline]
 __schedule+0xc07/0x11f0 kernel/sched/core.c:5938
 schedule+0x14b/0x210 kernel/sched/core.c:6017
 schedule_timeout+0x98/0x2f0 kernel/time/timer.c:1857
 do_wait_for_common+0x2da/0x480 kernel/sched/completion.c:85
 __wait_for_common kernel/sched/completion.c:106 [inline]
 wait_for_common kernel/sched/completion.c:117 [inline]
 wait_for_completion_timeout+0x46/0x60 kernel/sched/completion.c:157
 usb_start_wait_urb+0x167/0x550 drivers/usb/core/message.c:63
 do_proc_bulk+0x978/0x1080 drivers/usb/core/devio.c:1236
 proc_bulk drivers/usb/core/devio.c:1273 [inline]
 usbdev_do_ioctl drivers/usb/core/devio.c:2547 [inline]
 usbdev_ioctl+0x3441/0x6b10 drivers/usb/core/devio.c:2713
...

This patch fixes the problem by converting the uninterruptible wait to
an interruptible one.  For the most part this won't affect calls to
usb_start_wait_urb(), because they are made by kernel threads and so
can't receive most signals.

But in some cases such calls may occur in user threads in contexts
other than usbfs ioctls.  A signal in these circumstances could cause
a USB transfer to fail when otherwise it wouldn't.  The outcome
wouldn't be too dreadful, since USB transfers can fail at any time and
the system is prepared to handle these failures gracefully.  In
theory, for example, a signal might cause a driver's probe routine to
fail; in practice if the user doesn't want a probe to fail then he
shouldn't send interrupt signals to the probing process.

Overall, then, making these delays interruptible seems to be an
acceptable risk.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com
CC: stable@vger.kernel.org

---


[as1964]


 drivers/usb/core/message.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

Index: usb-devel/drivers/usb/core/message.c
===================================================================
--- usb-devel.orig/drivers/usb/core/message.c
+++ usb-devel/drivers/usb/core/message.c
@@ -60,12 +60,18 @@ static int usb_start_wait_urb(struct urb
 		goto out;
 
 	expire = timeout ? msecs_to_jiffies(timeout) : MAX_SCHEDULE_TIMEOUT;
-	if (!wait_for_completion_timeout(&ctx.done, expire)) {
+	retval = wait_for_completion_interruptible_timeout(&ctx.done, expire);
+	if (retval <= 0) {
 		usb_kill_urb(urb);
-		retval = (ctx.status == -ENOENT ? -ETIMEDOUT : ctx.status);
+		if (ctx.status != -ENOENT)	/* URB already completed */
+			retval = ctx.status;
+		else if (retval == 0)
+			retval = -ETIMEDOUT;
+		else
+			retval = -EINTR;
 
 		dev_dbg(&urb->dev->dev,
-			"%s timed out on ep%d%s len=%u/%u\n",
+			"%s timed out or interrupted on ep%d%s len=%u/%u\n",
 			current->comm,
 			usb_endpoint_num(&urb->ep->desc),
 			usb_urb_dir_in(urb) ? "in" : "out",
