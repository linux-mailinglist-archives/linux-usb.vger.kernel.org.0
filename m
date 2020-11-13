Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2F42B1E74
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 16:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgKMPUt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 10:20:49 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:42527 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgKMPUt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 10:20:49 -0500
Received: (qmail 18103 invoked by uid 484); 13 Nov 2020 15:20:47 -0000
X-Qmail-Scanner-Diagnostics: from ppp-82-135-76-196.dynamic.mnet-online.de by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(82.135.76.196):. 
 Processed in 0.401076 secs); 13 Nov 2020 15:20:47 -0000
Received: from ppp-82-135-76-196.dynamic.mnet-online.de (HELO ingxiaomi.fritz.box) (Authenticated_SSL:irohloff@[82.135.76.196])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <gregkh@linuxfoundation.org>; 13 Nov 2020 15:20:46 -0000
Date:   Fri, 13 Nov 2020 16:20:45 +0100
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] usb: gadget: User space URBs for FunctionFS
Message-ID: <20201113161753.55588bcf@ingxiaomi.fritz.box>
In-Reply-To: <X66WIqMoGWLUyraz@kroah.com>
References: <20201111170718.3381-1-ingo.rohloff@lauterbach.com>
        <X6wwNo5ZYYugyHu7@kroah.com>
        <20201112180528.33bbe44c@ingxiaomi.fritz.box>
        <X66WIqMoGWLUyraz@kroah.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

> The gadget code has always used AIO since the very beginning, this is
> nothing new (decades old).  While it might feel "odd", I recommend
> working with it first before trying to create new kernel apis that
> duplicate existing functionality for the only reason being that AIO is
> "different".

Forget my patch: You are right: I am now convinced, that using the AIO
of the kernel should really provide the same.

For me it was the other way round: I wrote code talking to "devio.c" on
the USB Host and using "ioctl"; so that sounded natural to me.
I think "devio.c" does not support async I/O ?
So when starting, I was not aware at all that the gadget side supports
AIO; and then I got misled by the POSIX aio interface (which did hide
the native Linux aio system calls from me.)

The "bug" I found is a bug in the example code (not in the kernel)
as far as I can tell.

The other thing I want in the future:
> > > The final goal here is to be able to directly let user space
> > > provide data buffers (via mmap I guess), which are then
> > > transferred via USB; but this is the next step.    
> 
> > Isn't that kind of what the AIO inteface provides today?  :)  
>
> I think my explanation was not clear at all:
> What I want to have is a "zero copy" transfer.

I now think this can be implemented within the already existing
AIO framework in f_fs.c by implementing a suitable mmap call.

But before doing any of that I need test code.

So my plan right now:
- Write a working (fast) echo example using libaio

- Write a working (fast) echo example using liburing
  (https://github.com/axboe/liburing)
  because this should result in even faster AIO.
  Another big reason for not doing extra ioctls;
  using the existing AIO framework in the kernel
  should allow to use liburing :)

- Once I have done that I will look into extending
  f_fs.c with a mmap call so that complete zero copy
  transfers to/from USB bulk endpoints should become possible.

Then I should be able to do some performance tests via USB 3.0
to see how much this helps.

I will post again once I have some working code.

Thank you for your time and comments; 
that really helps me to find a better solution :-)

so long
  Ingo


PS: Not important:
> >   https://pagure.io/libaio 
> >   version 0.3.111
>
> I do not know if this is the latest one or not, sorry.  Ask your Linux
> distro about this, or use the "raw" kernel aio syscalls.

Thanks to gentoo, I found out there is 
  https://releases.pagure.org/libaio/
and this one has the 0.3.112 release; and of course there is always the
git repository (which unfortunately does not include tags for anything
more recent than 0.3.110).
