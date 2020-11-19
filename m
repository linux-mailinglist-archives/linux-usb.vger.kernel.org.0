Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2E22B98D1
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 18:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgKSRC3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 12:02:29 -0500
Received: from netrider.rowland.org ([192.131.102.5]:36183 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726474AbgKSRC3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Nov 2020 12:02:29 -0500
Received: (qmail 577160 invoked by uid 1000); 19 Nov 2020 12:02:28 -0500
Date:   Thu, 19 Nov 2020 12:02:28 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     Vamsi Krishna Samavedam <vskrishn@codeaurora.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Change %pK for __user pointers to %px
Message-ID: <20201119170228.GB576844@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 2f964780c03b ("USB: core: replace %p with %pK") used the %pK
format specifier for a bunch of __user pointers.  But as the 'K' in
the specifier indicates, it is meant for kernel pointers.  The reason
for the %pK specifier is to avoid leaks of kernel addresses, but when
the pointer is to an address in userspace the security implications
are minimal.  In particular, no kernel information is leaked.

This patch changes the __user %pK specifiers (used in a bunch of
debugging output lines) to %px, which will always print the actual
address with no mangling.  (Notably, there is no printk format
specifier particularly intended for __user pointers.)

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 2f964780c03b ("USB: core: replace %p with %pK"
CC: Vamsi Krishna Samavedam <vskrishn@codeaurora.org>
CC: <stable@vger.kernel.org>

---


[as1948]


 drivers/usb/core/devio.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

Index: usb-devel/drivers/usb/core/devio.c
===================================================================
--- usb-devel.orig/drivers/usb/core/devio.c
+++ usb-devel/drivers/usb/core/devio.c
@@ -482,11 +482,11 @@ static void snoop_urb(struct usb_device
 
 	if (userurb) {		/* Async */
 		if (when == SUBMIT)
-			dev_info(&udev->dev, "userurb %pK, ep%d %s-%s, "
+			dev_info(&udev->dev, "userurb %px, ep%d %s-%s, "
 					"length %u\n",
 					userurb, ep, t, d, length);
 		else
-			dev_info(&udev->dev, "userurb %pK, ep%d %s-%s, "
+			dev_info(&udev->dev, "userurb %px, ep%d %s-%s, "
 					"actual_length %u status %d\n",
 					userurb, ep, t, d, length,
 					timeout_or_status);
@@ -1997,7 +1997,7 @@ static int proc_reapurb(struct usb_dev_s
 	if (as) {
 		int retval;
 
-		snoop(&ps->dev->dev, "reap %pK\n", as->userurb);
+		snoop(&ps->dev->dev, "reap %px\n", as->userurb);
 		retval = processcompl(as, (void __user * __user *)arg);
 		free_async(as);
 		return retval;
@@ -2014,7 +2014,7 @@ static int proc_reapurbnonblock(struct u
 
 	as = async_getcompleted(ps);
 	if (as) {
-		snoop(&ps->dev->dev, "reap %pK\n", as->userurb);
+		snoop(&ps->dev->dev, "reap %px\n", as->userurb);
 		retval = processcompl(as, (void __user * __user *)arg);
 		free_async(as);
 	} else {
@@ -2142,7 +2142,7 @@ static int proc_reapurb_compat(struct us
 	if (as) {
 		int retval;
 
-		snoop(&ps->dev->dev, "reap %pK\n", as->userurb);
+		snoop(&ps->dev->dev, "reap %px\n", as->userurb);
 		retval = processcompl_compat(as, (void __user * __user *)arg);
 		free_async(as);
 		return retval;
@@ -2159,7 +2159,7 @@ static int proc_reapurbnonblock_compat(s
 
 	as = async_getcompleted(ps);
 	if (as) {
-		snoop(&ps->dev->dev, "reap %pK\n", as->userurb);
+		snoop(&ps->dev->dev, "reap %px\n", as->userurb);
 		retval = processcompl_compat(as, (void __user * __user *)arg);
 		free_async(as);
 	} else {
@@ -2624,7 +2624,7 @@ static long usbdev_do_ioctl(struct file
 #endif
 
 	case USBDEVFS_DISCARDURB:
-		snoop(&dev->dev, "%s: DISCARDURB %pK\n", __func__, p);
+		snoop(&dev->dev, "%s: DISCARDURB %px\n", __func__, p);
 		ret = proc_unlinkurb(ps, p);
 		break;
 
