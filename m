Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06441E8CC1
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 03:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728798AbgE3BKn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 21:10:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39039 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728794AbgE3BKm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 21:10:42 -0400
Received: (qmail 14706 invoked by uid 1000); 29 May 2020 21:10:41 -0400
Date:   Fri, 29 May 2020 21:10:40 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing
 WDM_IN_USE bit.
Message-ID: <20200530011040.GB12419@rowland.harvard.edu>
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
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 30, 2020 at 09:42:46AM +0900, Tetsuo Handa wrote:
> On 2020/05/30 5:41, Andrey Konovalov wrote:
> > On Thu, May 28, 2020 at 10:58 PM Alan Stern <stern@rowland.harvard.edu> wrote:

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

Oh my!  I can't even imagine what Linus would say if he saw that...  :-(

Have you heard of Bad USB?

The kernel most definitely does need to protect itself against 
misbehaving hardware.  Let's just leave it at that.  If you don't 
believe me, ask Greg KH.

I admit, causing a driver to hang isn't the worst thing a buggy device 
can do.  But the kernel is supposed to be able to cope with such things 
gracefully.

Alan Stern
