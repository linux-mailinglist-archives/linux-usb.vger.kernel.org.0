Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACFDF24550D
	for <lists+linux-usb@lfdr.de>; Sun, 16 Aug 2020 02:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728966AbgHPAdV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Aug 2020 20:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgHPAdU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 Aug 2020 20:33:20 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D297C061786;
        Sat, 15 Aug 2020 17:33:18 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ep8so5974702pjb.3;
        Sat, 15 Aug 2020 17:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2hsGUTMtSmldpxSglT5XCdls6Nl9z7yGQFxFM8j69ok=;
        b=iPzLmhq1lbZdRk9ssjTOAOE1Hqdx8jpjqjD0Hr84GKijJDLUlQ/JUglvsYKOLm49eM
         HI/xorQgybj5PGKnaiq4lxbDk8C3ue93xTS5mqWdp94qopKMtwDNobeiBh1e9yhVgFuh
         XNhnSqtbFrzwn7/qcrAQ5MvBtNc/6OZSNR5xXwcYMXbM9M72gNxylW3Un69rKu0AmTlG
         gCbGYE1Dva361vDd6FVpWXxUH1PBKLYKxljwEjjpbid+1yjIcZK8SIx6R170KCQ8DqPQ
         4YlzYuttTPeJn4skglQah6KTIkzy5o8jCWM47l2VcP52A9yQDuV7tw4PTJzAuFG/qkD/
         OhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=2hsGUTMtSmldpxSglT5XCdls6Nl9z7yGQFxFM8j69ok=;
        b=eOkVdtrUnZq0kJD00tF5X3XsiIcIgv9MqSP802ii6DzWIOcJVRVAtxFug6AVe6wcMu
         fypu2LW3R/T+NqaFJRvCEz4fEkM1YJK/d+wxPfdT2CxG2x0/Mkr3imYe5DbK5fxj3F2b
         8zcWbHGKY4e0ynHvaK8G/3MGfZiiWOa/IdIjlc0yTQBVFhUVOk1zdK1+UWJ6hSfW/5lS
         PXrlWmWn09shricJdI6mCBpuvuDYuvKIHjVFc6mX3QJKWCqevWY538WXWzjBmyxlFUIM
         ot6sTRVYJjxv+eNv7GgT0kXRywBqi/VDgsu/c59ib3bCYIsWRD/3I4A3dKXyqLGpEoGc
         n55Q==
X-Gm-Message-State: AOAM533aG8TXR9g0wBRgpd5/bvNEvNK0LpD9RD3DcBX6W2FCsiMwXr/C
        GShPMEwNhwRdRvv+R+oGSNE=
X-Google-Smtp-Source: ABdhPJyYE2l3+s1DxCtnlRFWDrnoxE3LYSq8j89XfrcQDiz6AQ7/5992fRmffBc32o4a0SLzLl0qMw==
X-Received: by 2002:a17:90a:c28d:: with SMTP id f13mr3954446pjt.124.1597537997361;
        Sat, 15 Aug 2020 17:33:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q25sm12936068pfn.181.2020.08.15.17.33.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Aug 2020 17:33:16 -0700 (PDT)
Date:   Sat, 15 Aug 2020 17:33:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-media@vger.kernel.org, linux-uvc-devel@lists.sourceforge.net
Subject: Protecting uvcvideo againt USB device disconnect [Was: Re:
 Protecting usb_set_interface() against device removal]
Message-ID: <20200816003315.GA13826@roeck-us.net>
References: <b0a7247c-bed3-934b-2c73-7f4b0adb5e75@roeck-us.net>
 <20200815020739.GB52242@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200815020739.GB52242@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+ linux-uvc-devel@lists.sourceforge.net
+ linux-media@vger.kernel.org
+ laurent.pinchart@ideasonboard.com

and changed subject

On Fri, Aug 14, 2020 at 10:07:39PM -0400, Alan Stern wrote:
> On Fri, Aug 14, 2020 at 04:07:03PM -0700, Guenter Roeck wrote:
> > Hi all,
> > 
> > over time, there have been a number of reports of crashes in usb_ifnum_to_if(),
> > called from usb_hcd_alloc_bandwidth, which is in turn called from usb_set_interface().
> > Examples are [1] [2] [3]. A typical backtrace is:
> > 
> > <3>[ 3489.445468] intel_sst_acpi 808622A8:00: sst: Busy wait failed, cant send this msg
> > <6>[ 3490.507273] usb 1-4: USB disconnect, device number 3
> > <1>[ 3490.516670] BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
> > <6>[ 3490.516680] PGD 0 P4D 0
> > <4>[ 3490.516687] Oops: 0000 [#1] PREEMPT SMP PTI
> > <4>[ 3490.516693] CPU: 0 PID: 5633 Comm: V4L2CaptureThre Not tainted 4.19.113-08536-g5d29ca36db06 #1
> > <4>[ 3490.516696] Hardware name: GOOGLE Edgar, BIOS Google_Edgar.7287.167.156 03/25/2019
> > <4>[ 3490.516706] RIP: 0010:usb_ifnum_to_if+0x29/0x40
> > <4>[ 3490.516710] Code: ee 0f 1f 44 00 00 55 48 89 e5 48 8b 8f f8 03 00 00 48 85 c9 74 27 44 0f b6 41 04 4d 85 c0 74 1d 31 ff 48 8b 84 f9 98 00 00 00 <48> 8b 10 0f b6 52 02 39 f2 74 0a 48 ff c7 4c 39 c7 72 e5 31 c0 5d
> > <4>[ 3490.516714] RSP: 0018:ffffa46f42a47a80 EFLAGS: 00010246
> > <4>[ 3490.516718] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff904a396c9000
> > <4>[ 3490.516721] RDX: ffff904a39641320 RSI: 0000000000000001 RDI: 0000000000000000
> > <4>[ 3490.516724] RBP: ffffa46f42a47a80 R08: 0000000000000002 R09: 0000000000000000
> > <4>[ 3490.516727] R10: 0000000000009975 R11: 0000000000000009 R12: 0000000000000000
> > <4>[ 3490.516731] R13: ffff904a396b3800 R14: ffff904a39e88000 R15: 0000000000000000
> > <4>[ 3490.516735] FS: 00007f396448e700(0000) GS:ffff904a3ba00000(0000) knlGS:0000000000000000
> > <4>[ 3490.516738] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > <4>[ 3490.516742] CR2: 0000000000000000 CR3: 000000016cb46000 CR4: 00000000001006f0
> > <4>[ 3490.516745] Call Trace:
> > <4>[ 3490.516756] usb_hcd_alloc_bandwidth+0x1ee/0x30f
> > <4>[ 3490.516762] usb_set_interface+0x1a3/0x2b7
> > <4>[ 3490.516773] uvc_video_start_transfer+0x29b/0x4b8 [uvcvideo]
> > <4>[ 3490.516781] uvc_video_start_streaming+0x91/0xdd [uvcvideo]
> > <4>[ 3490.516787] uvc_start_streaming+0x28/0x5d [uvcvideo]
> > <4>[ 3490.516795] vb2_start_streaming+0x61/0x143 [videobuf2_common]
> > <4>[ 3490.516801] vb2_core_streamon+0xf7/0x10f [videobuf2_common]
> > <4>[ 3490.516807] uvc_queue_streamon+0x2e/0x41 [uvcvideo]
> > <4>[ 3490.516814] uvc_ioctl_streamon+0x42/0x5c [uvcvideo]
> > <4>[ 3490.516820] __video_do_ioctl+0x33d/0x42a
> > <4>[ 3490.516826] video_usercopy+0x34e/0x5ff
> > <4>[ 3490.516831] ? video_ioctl2+0x16/0x16
> > <4>[ 3490.516837] v4l2_ioctl+0x46/0x53
> > <4>[ 3490.516843] do_vfs_ioctl+0x50a/0x76f
> > <4>[ 3490.516848] ksys_ioctl+0x58/0x83
> > <4>[ 3490.516853] __x64_sys_ioctl+0x1a/0x1e
> > <4>[ 3490.516858] do_syscall_64+0x54/0xde
> > 
> > I have been able to reproduce the problem on a Chromebook by strategically placing
> > msleep() calls into usb_set_interface() and usb_disable_device(). Ultimately, the
> > problem boils down to lack of protection against device removal in usb_set_interface()
> > [and/or possibly other callers of usb_ifnum_to_if()].
> > 
> > Sequence of events is roughly as follows:
> > 
> > - usb_set_interface() is called and proceeds to some point, possibly to
> >   mutex_lock(hcd->bandwidth_mutex);
> > - Device removal event is detected, and usb_disable_device() is called
> 
> At this point all interface drivers get unbound (their disconnect 
> routines are called).
> 
> > - usb_disable_device() starts removing actconfig data. It has removed
> >   and cleared dev->actconfig->interface[i], but not dev->actconfig
> > - usb_set_interface() calls usb_hcd_alloc_bandwidth(), which calls
> >   usb_ifnum_to_if()
> > - In usb_ifnum_to_if(), dev->actconfig is not NULL, but
> >   dev->actconfig->interface[i] is NULL
> > - crash
> > 
> > Question is what we can do about this. Checking if dev->state != USB_STATE_NOTATTACHED
> > in usb_ifnum_to_if() might be a possible approach, but strictly speaking it would
> > still be racy since there is still no lock against device removal. I have not tried
> > calling usb_lock_device() in usb_set_interface() - would that possibly be an option ?
> 
> As far as I know, protecting against these races is the responsibility 
> of the USB interface drivers.  They must make sure that their disconnect 
> routines block until all outstanding calls to usb_set_interface return 
> (in fact, until all outstanding device accesses have finished).
> 
> For instance, in the log extract you showed, it's obvious that the 
> uvc_start_streaming routine was running after the disconnect routine had 
> returned, which looks like a bug in itself: Once the disconnect routine 
> returns, the driver is not supposed to try to access the device at all 
> because some other driver may now be bound to it.
> 
> We can't just call usb_lock_device from within usb_set_interface, 
> because usb_set_interface is often called with that lock already held.
> 
I had a closer look into the uvcvideo driver and compared it to other usb
drivers, including drivers in drivers/media/usb/ which connect to the video
subsystem.

The usbvideo driver lacks protection against calls to uvc_disconnect() while
calls into file operations are ongoing. This is pretty widespread, and not
even limited to file operations (for example, there is a worker which is only
canceled in uvc_delete, not in ucv_disconnect). The existing protection only
ensures that no file operations are started after the call to ucv_disconnect,
but that is insufficient.

Other drivers do have that protection and make sure that no usb operations
can happen after the disconnect call.

The only remedy I can see is to rework the usbvideo driver and add the
necessary protections. At first glance, it looks like this may be a
substantial amount of work. I'd sign up for that, but before I start,
I would like to get input from the usbvideo community. Is such an effort
already going on ? If yes, how can I help ? If not, is the problem
understood and accepted ? Are there any ideas on how to solve it ?

Thanks,
Guenter
