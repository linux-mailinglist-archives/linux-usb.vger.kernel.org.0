Return-Path: <linux-usb+bounces-11150-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD02B903FDB
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 17:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7305E1F2464C
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 15:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C40208AF;
	Tue, 11 Jun 2024 15:21:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id C26D014A96
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 15:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718119261; cv=none; b=J6hDN4XlYpT/lR96qPyzIl7cyoSTvSa4mNQqj2+cWKMLxBjhBfCN7N+TVHppW3DcKuFGcQpdZP/2DKKFiJVKLa2+afWzuhnWGFxRnglZpTXTvC9Z0+3+XAU66GEcimbMOoFSA7xCaDPxkbU9cztd/w+QYDvcWcaOEJyzA47aY58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718119261; c=relaxed/simple;
	bh=Er6PA3/Modh6YaGC9UL3eMxeB6uHpwFIoxsNj22/flE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukNpzy1Is0We5Wq7Q9VqXqhxELokRhqvAFaXFNGAJazee7d52MBIB3gsV67qL9/KBSv4tMDgoWN2WbX/A+aihvnd2r3t0UJZ1rMfeXZ+MhV1068xAZAAtEO6DnKveFmuwPbG8yGDsJqvJ7gB2w9bs72G7ahX7IHvh5gWk4Scxog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 189524 invoked by uid 1000); 11 Jun 2024 11:20:57 -0400
Date: Tue, 11 Jun 2024 11:20:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: rcu detected stall in raw_ioctl
Message-ID: <23b1962c-044d-4dbd-a705-58754f0914cb@rowland.harvard.edu>
References: <c3073a8c-bdaa-4123-ae27-9143d916a701@rowland.harvard.edu>
 <000000000000386b64061a8ec33d@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000386b64061a8ec33d@google.com>

On Mon, Jun 10, 2024 at 01:12:03PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> 
> Reported-and-tested-by: syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com
> 
> Tested on:
> 
> commit:         8867bbd4 mm: arm64: Fix the out-of-bounds issue in con..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=15f51bce980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3b4350cf56c61c80
> dashboard link: https://syzkaller.appspot.com/bug?extid=5f996b83575ef4058638
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm64
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=151b5fce980000
> 
> Note: testing is done by a robot and is best-effort only.

That's not much use.  Let's see what happens without all the error 
messages filling up the log, and let's test how well the timer emulation 
works.

The kernel config has CONFIG_HZ set to 100, which is not a very good 
value for dummy-hcd although it should still work.  But the 
multiple-millisecond intervals between timer interrupts are worrisome.

Alan Stern

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git 8867bbd4a056

Index: usb-devel/drivers/usb/class/cdc-wdm.c
===================================================================
--- usb-devel.orig/drivers/usb/class/cdc-wdm.c
+++ usb-devel/drivers/usb/class/cdc-wdm.c
@@ -265,18 +265,11 @@ static void wdm_int_callback(struct urb
 			set_bit(WDM_INT_STALL, &desc->flags);
 			dev_err(&desc->intf->dev, "Stall on int endpoint\n");
 			goto sw; /* halt is cleared in work */
-		default:
-			dev_err(&desc->intf->dev,
-				"nonzero urb status received: %d\n", status);
-			break;
 		}
 	}
 
-	if (urb->actual_length < sizeof(struct usb_cdc_notification)) {
-		dev_err(&desc->intf->dev, "wdm_int_callback - %d bytes\n",
-			urb->actual_length);
+	if (urb->actual_length < sizeof(struct usb_cdc_notification))
 		goto exit;
-	}
 
 	switch (dr->bNotificationType) {
 	case USB_CDC_NOTIFY_RESPONSE_AVAILABLE:
Index: usb-devel/drivers/usb/gadget/legacy/raw_gadget.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/legacy/raw_gadget.c
+++ usb-devel/drivers/usb/gadget/legacy/raw_gadget.c
@@ -596,8 +596,6 @@ static int raw_ioctl_run(struct raw_dev
 
 	spin_lock_irqsave(&dev->lock, flags);
 	if (ret) {
-		dev_err(dev->dev,
-			"fail, usb_gadget_register_driver returned %d\n", ret);
 		dev->state = STATE_DEV_FAILED;
 		goto out_unlock;
 	}
Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -1699,8 +1699,6 @@ int usb_gadget_register_driver_owner(str
 	mutex_lock(&udc_lock);
 	if (!driver->is_bound) {
 		if (driver->match_existing_only) {
-			pr_warn("%s: couldn't find an available UDC or it's busy\n",
-					driver->function);
 			ret = -EBUSY;
 		} else {
 			pr_info("%s: couldn't find an available UDC\n",
Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -989,12 +989,42 @@ static DEVICE_ATTR_RO(function);
  * for each driver that registers:  just add to a big root hub.
  */
 
+static struct timer_list	alan_timer;
+static int			alan_count;
+#define ALAN_MAX		20
+
+static void alan_callback(struct timer_list *t)
+{
+	if (++alan_count >= ALAN_MAX)
+		return;
+	mod_timer(&alan_timer, jiffies + msecs_to_jiffies(1));
+}
+
+static void test_alan_timer(void)
+{
+	int	alan_prev;
+
+	alan_prev = alan_count = 0;
+	mod_timer(&alan_timer, jiffies + msecs_to_jiffies(1));
+	for (;;) {
+		if (alan_prev != alan_count) {
+			alan_prev = alan_count;
+			pr_info("alan_count %d\n", alan_prev);
+			if (alan_prev >= ALAN_MAX)
+				break;
+		}
+		cpu_relax();
+	}
+}
+
 static int dummy_udc_start(struct usb_gadget *g,
 		struct usb_gadget_driver *driver)
 {
 	struct dummy_hcd	*dum_hcd = gadget_to_dummy_hcd(g);
 	struct dummy		*dum = dum_hcd->dum;
 
+	test_alan_timer();
+
 	switch (g->speed) {
 	/* All the speeds we support */
 	case USB_SPEED_LOW:
@@ -2769,6 +2799,8 @@ static int __init dummy_hcd_init(void)
 	int	i;
 	struct	dummy *dum[MAX_NUM_UDC] = {};
 
+	timer_setup(&alan_timer, alan_callback, TIMER_PINNED);
+
 	if (usb_disabled())
 		return -ENODEV;
 

