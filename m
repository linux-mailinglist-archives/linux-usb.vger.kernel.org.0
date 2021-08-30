Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB7B3FB22A
	for <lists+linux-usb@lfdr.de>; Mon, 30 Aug 2021 09:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234246AbhH3H5y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Aug 2021 03:57:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:39150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234166AbhH3H5x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Aug 2021 03:57:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E77660F45;
        Mon, 30 Aug 2021 07:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630310220;
        bh=cHY2tAhsOW5h0V4Y9RGuS8hgGIJkWgPEvdaVnoALDCs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ABPp7Ae5kJB2CEkOmkPUzmHmhVgfNkdYun4eVtknDS/BBnW47LrEUsTGPrVSA5Vfc
         rZljNZxadTHhI0qY/rHGI4jz1NOGCzCw28dCIH5DjYOV9Xz1iZ6SBgCAnJ97W2x5Za
         h7bhEOeAmOdAS9P8+gWrLYPZ4j9hWd9z6zO0vD6LVfdfAGgeNSLUfIH4ky+Oy33Ypu
         Y9NLER71TV6VH19jxlA+94UDfxNxP9uTP0iHc0BdMKxDpKCrLYuTP1KKtXyxAwALqC
         UM0Tn3E1Eph7R4+GZI/iLFcwwCn9oBDpps2A/5+TxPYuJr0kgKYIPUdiHd3n5MgXTs
         V4ylKsqgkLO6Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mKc9y-0005CS-Pu; Mon, 30 Aug 2021 09:56:51 +0200
Date:   Mon, 30 Aug 2021 09:56:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>,
        syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Make usb_start_wait_urb() interruptible
Message-ID: <YSyPQqMPHRiUvYEx@hovoldconsulting.com>
References: <20210828180358.GA291431@rowland.harvard.edu>
 <0000000000000f37f405caa41e79@google.com>
 <20210829015825.GA297712@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210829015825.GA297712@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 28, 2021 at 09:58:25PM -0400, Alan Stern wrote:
> usb_start_wait_urb() can be called from user processes by means of the
> USBDEVFS_BULK and USBDEVFS_CONTROL ioctls in usbfs.  Consequently it
> should not contain an uninterruptible wait of arbitrarily long length
> (the timeout value is specified here by the user, so it can be
> practically anything).  Doing so leads the kernel to complain about
> "Task X blocked for more than N seconds", as found in testing by
> syzbot:
> 
> INFO: task syz-executor.0:8700 blocked for more than 143 seconds.
>       Not tainted 5.14.0-rc7-syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor.0  state:D stack:23192 pid: 8700 ppid:  8455 flags:0x00004004
> Call Trace:
>  context_switch kernel/sched/core.c:4681 [inline]
>  __schedule+0xc07/0x11f0 kernel/sched/core.c:5938
>  schedule+0x14b/0x210 kernel/sched/core.c:6017
>  schedule_timeout+0x98/0x2f0 kernel/time/timer.c:1857
>  do_wait_for_common+0x2da/0x480 kernel/sched/completion.c:85
>  __wait_for_common kernel/sched/completion.c:106 [inline]
>  wait_for_common kernel/sched/completion.c:117 [inline]
>  wait_for_completion_timeout+0x46/0x60 kernel/sched/completion.c:157
>  usb_start_wait_urb+0x167/0x550 drivers/usb/core/message.c:63
>  do_proc_bulk+0x978/0x1080 drivers/usb/core/devio.c:1236
>  proc_bulk drivers/usb/core/devio.c:1273 [inline]
>  usbdev_do_ioctl drivers/usb/core/devio.c:2547 [inline]
>  usbdev_ioctl+0x3441/0x6b10 drivers/usb/core/devio.c:2713
> ...
> 
> This patch fixes the problem by converting the uninterruptible wait to
> an interruptible one.  For the most part this won't affect calls to
> usb_start_wait_urb(), because they are made by kernel threads and so
> can't receive most signals.
> 
> But in some cases such calls may occur in user threads in contexts
> other than usbfs ioctls.  A signal in these circumstances could cause
> a USB transfer to fail when otherwise it wouldn't.  The outcome
> wouldn't be too dreadful, since USB transfers can fail at any time and
> the system is prepared to handle these failures gracefully.  In
> theory, for example, a signal might cause a driver's probe routine to
> fail; in practice if the user doesn't want a probe to fail then he
> shouldn't send interrupt signals to the probing process.

While probe() triggered through sysfs or by module loading is one
example, the USB msg helpers are also called in a lot of other
user-thread contexts such as open() calls etc. It might even be that the
majority of these calls can be done from user threads (post
enumeration).

> Overall, then, making these delays interruptible seems to be an
> acceptable risk.

Possibly, but changing the API like this to fix the usbfs ioctls seems
like using a bit of a too big hammer to me, especially when backporting
to stable.

> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reported-and-tested-by: syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com
> CC: stable@vger.kernel.org

Johan
