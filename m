Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1DE1E6CF5
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 22:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406652AbgE1U6J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 16:58:09 -0400
Received: from netrider.rowland.org ([192.131.102.5]:43357 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2407433AbgE1U6I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 16:58:08 -0400
Received: (qmail 27544 invoked by uid 1000); 28 May 2020 16:58:07 -0400
Date:   Thu, 28 May 2020 16:58:07 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing
 WDM_IN_USE bit.
Message-ID: <20200528205807.GB21709@rowland.harvard.edu>
References: <1590134662.19681.12.camel@suse.com>
 <03894591-a1ac-496a-a35f-55953e5bcc06@i-love.sakura.ne.jp>
 <1590408381.2838.4.camel@suse.com>
 <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
 <20200528194057.GA21709@rowland.harvard.edu>
 <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 28, 2020 at 09:51:35PM +0200, Andrey Konovalov wrote:
> On Thu, May 28, 2020 at 9:40 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Thu, May 28, 2020 at 09:03:43PM +0200, Andrey Konovalov wrote:
> >
> > > Ah, so the problem is that when a process exits, it tries to close wdm
> > > fd first, which ends up calling wdm_flush(), which can't finish
> > > because the USB requests are not terminated before raw-gadget fd is
> > > closed, which is supposed to happen after wdm fd is closed. Is this
> > > correct? I wonder what will happen if a real device stays connected
> > > and ignores wdm requests.
> > >
> > > I don't understand though, how using wait_event_interruptible() will
> > > shadow anything here.
> > >
> > > Alan, Greg, is this acceptable behavior for a USB driver?
> >
> > I don't understand what the problem is.  Can you explain in more general
> > terms -- nothing specific to wdm or anything like that -- what you are
> > concerned about?  Is this something that could happen to any gadget
> > driver?  Or any USB class device driver?  Or does it only affect
> > usespace components of raw-gadget drivers?
> 
> So, AFAIU, we have a driver whose flush() callback blocks on
> wait_event(), which can only terminate when either 1) the driver
> receives a particular USB response from the device or 2) the device
> disconnects.

This sounds like a bug in the driver.  What would it do if someone had a 
genuine (not emulated) but buggy USB device which didn't send the 
desired response?  The only way to unblock the driver would be to unplug 
the device!  That isn't acceptable behavior.

> For 1) the emulated device doesn't provide required
> responses. For 2) the problem is that the emulated via raw-gadget
> device disconnects when the process is killed (and raw-gadget fd is
> closed). But that process is the same process that is currently stuck
> on wait_event() in the flush callback(), and therefore unkillable.

What would happen if you unload dummy-hcd at this point?  Or even just 
do: echo 0 >/sys/bus/usb/devices/usbN/bConfigurationValue, where N is 
the bus number of the dummy-hcd bus?

> This can generally happen with any driver that goes into
> uninterruptible sleep within one of its code paths reachable from
> userspace that can only be unblocked by a particular behavior from the
> USB device. But I haven't seen any such drivers so far, wdm is the
> first.

Drivers should never go into uninterruptible sleep states unless they 
can guarantee that the duration will be bounded somehow (for example, by 
a reasonable timeout).  Or that cutting the sleep state short would 
cause the system to crash -- but that's not an issue here.

Alan Stern
