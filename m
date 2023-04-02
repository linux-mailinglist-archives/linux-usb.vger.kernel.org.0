Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E006D39EE
	for <lists+linux-usb@lfdr.de>; Sun,  2 Apr 2023 20:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjDBS5c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 Apr 2023 14:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbjDBS5c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 2 Apr 2023 14:57:32 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id AC2189018
        for <linux-usb@vger.kernel.org>; Sun,  2 Apr 2023 11:57:29 -0700 (PDT)
Received: (qmail 301824 invoked by uid 1000); 2 Apr 2023 14:57:28 -0400
Date:   Sun, 2 Apr 2023 14:57:28 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Hans Petter Selasky <hps@selasky.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 217242] CPU hard lockup related to xhci/dma
Message-ID: <c8cbd221-1cd6-4c9d-bc8e-2013558e5e1d@rowland.harvard.edu>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
 <bug-217242-208809-LGiVP9fz4d@https.bugzilla.kernel.org/>
 <7dc47823-01a1-ac19-73d4-4bf7eb07f98d@selasky.org>
 <2023040210-armband-spiffy-b5a5@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023040210-armband-spiffy-b5a5@gregkh>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[Bugzilla removed from the CC: list, since this isn't relevant to the bug 
report]

On Sun, Apr 02, 2023 at 07:25:27PM +0200, Greg KH wrote:
> On Sun, Apr 02, 2023 at 05:54:18PM +0200, Hans Petter Selasky wrote:
> > While that being said, I wish the Linux USB core would take the example of
> > the FreeBSD USB core, and pre-allocate all memory needed for USB transfers,
> > also called URB's, during device attach.
> 
> Many drivers do that today already, which specific ones do you think
> need to have this added that are not doing so?

Hans is undoubtedly referring to the host controller drivers.

usb_alloc_urb() allocates memory for the URB itself.  But the routine does 
not know which device or host controller the URB will eventually be used 
with, so it doesn't know which HCD to tell to set aside adequate memory 
for handling the URB once it is submitted.  And since HCDs tend to process 
URB submissions while holding a private spinlock, when their memory 
allocation does get done it cannot use GFP_KERNEL.

I think it's fair to call this a weak point in Linux's USB stack.  
Balancing this, it should be pointed out that we can't always know in 
advance how large an URB's transfer buffer will be, and the amount of 
memory that the HCD will need can depend on this size.

> > Frequently going through allocate
> > and free cycles during operation, is not just inefficient, but also greatly

In fact, the original Slab memory allocator (in Solaris 2.4) was designed 
to make frequent allocate-and-free cycles extremely efficient.  So much so 
that people would just naturally do things that way instead of 
pre-allocating memory which would then just sit around unused a large 
fraction of the time.

I suspect the allocators in the Linux kernel don't end up being quite as 
efficient as the original Slab, however.

Alan Stern

> > degrades the ability to debug the system.
> 
> Based on the slow USB speeds, "inefficient" isn't anything that I've
> been able to measure specifically, have you?
> 
> > USB is still quite essential when doing remote server access. Yeah,
> > the serial port is great too, but one day inb() and outb() will die
> 
> That's what a USB debugging cable is for :)
> 
> thanks,
> 
> greg k-h
