Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EF51E8E1F
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 08:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbgE3GIT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 May 2020 02:08:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:39854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725814AbgE3GIT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 30 May 2020 02:08:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E35B62073B;
        Sat, 30 May 2020 06:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590818898;
        bh=zw2sKkI/x1ytJNu3BmP2doFskXpKjmfgnrXN+h7dvVs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=apeaRdupOky30f+DhqBjLB2FU+hoSEKum1Yked/J8L6Ij6OcKBSkUDsqa0fyy7jOl
         9fkMR+weUv6DVc6Lbw5O7+YyDDlVWx9adtFeJlcAZay+WoLmw70qarMed2tuqzseXJ
         2SVmKabKmlUl68I08U7wfhBuV2xYkkQCVf6fvSCk=
Date:   Sat, 30 May 2020 08:08:14 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing
 WDM_IN_USE bit.
Message-ID: <20200530060814.GD3462734@kroah.com>
References: <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
 <20200528194057.GA21709@rowland.harvard.edu>
 <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
 <20200528205807.GB21709@rowland.harvard.edu>
 <CAAeHK+xx-uodQWBDA2pJ_Et26uBPb6J7fTwu4h6D1uUTv8t3HA@mail.gmail.com>
 <79ba410f-e0ef-2465-b94f-6b9a4a82adf5@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79ba410f-e0ef-2465-b94f-6b9a4a82adf5@i-love.sakura.ne.jp>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 30, 2020 at 09:42:46AM +0900, Tetsuo Handa wrote:
> On 2020/05/30 5:41, Andrey Konovalov wrote:
> > On Thu, May 28, 2020 at 10:58 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >>
> >> On Thu, May 28, 2020 at 09:51:35PM +0200, Andrey Konovalov wrote:
> >>> On Thu, May 28, 2020 at 9:40 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >>>>
> >>>> On Thu, May 28, 2020 at 09:03:43PM +0200, Andrey Konovalov wrote:
> >>>>
> >>>>> Ah, so the problem is that when a process exits, it tries to close wdm
> >>>>> fd first, which ends up calling wdm_flush(), which can't finish
> >>>>> because the USB requests are not terminated before raw-gadget fd is
> >>>>> closed, which is supposed to happen after wdm fd is closed. Is this
> >>>>> correct? I wonder what will happen if a real device stays connected
> >>>>> and ignores wdm requests.
> >>>>>
> >>>>> I don't understand though, how using wait_event_interruptible() will
> >>>>> shadow anything here.
> >>>>>
> >>>>> Alan, Greg, is this acceptable behavior for a USB driver?
> >>>>
> >>>> I don't understand what the problem is.  Can you explain in more general
> >>>> terms -- nothing specific to wdm or anything like that -- what you are
> >>>> concerned about?  Is this something that could happen to any gadget
> >>>> driver?  Or any USB class device driver?  Or does it only affect
> >>>> usespace components of raw-gadget drivers?
> >>>
> >>> So, AFAIU, we have a driver whose flush() callback blocks on
> >>> wait_event(), which can only terminate when either 1) the driver
> >>> receives a particular USB response from the device or 2) the device
> >>> disconnects.
> >>
> >> This sounds like a bug in the driver.  What would it do if someone had a
> >> genuine (not emulated) but buggy USB device which didn't send the
> >> desired response?  The only way to unblock the driver would be to unplug
> >> the device!  That isn't acceptable behavior.
> > 
> > OK, that's what I thought.
> 
> I believe that this is not a bug in the driver but a problem of hardware
> failure. Unless this is high-availability code which is designed for safely
> failing over to other node, we don't need to care about hardware failure.

As Alan said, that's just not true.  It's the job of an operating system
kernel to handle all of the crazy ways hardware is broken, and make it
work properly for people.  We deal with hardware failure all the time.

So don't do uninterruptable waits or loop for forever waiting for some
hardware value to change that might not change.  That's a sure way to
lock up the system and make users mad at you.

thanks,

greg k-h
