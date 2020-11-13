Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8DBD2B1D08
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 15:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgKMOT0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 09:19:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:55664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726503AbgKMOT0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Nov 2020 09:19:26 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7031722240;
        Fri, 13 Nov 2020 14:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605277161;
        bh=hIH22I2UqQ15Y9iIOIcq0UO8w4CmXoXJajaZ0Vq25+4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=171i4JeYVRjw3hoyK2hi40/qag8TGRV+PK8sZfDbg6oBFjI79u4VrkrnFGT5iGMh3
         16ef+9TdM90OdcjM4W7trrAGk6TkHuagZxPjvwKTma6svbfW7qoBgFrRla3GLaqjo0
         q2R1tCjTU8T8uwqp3f8Yi0Qj00vlBxxdG+bH2GpY=
Date:   Fri, 13 Nov 2020 15:20:18 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] usb: gadget: User space URBs for FunctionFS
Message-ID: <X66WIqMoGWLUyraz@kroah.com>
References: <20201111170718.3381-1-ingo.rohloff@lauterbach.com>
 <X6wwNo5ZYYugyHu7@kroah.com>
 <20201112180528.33bbe44c@ingxiaomi.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112180528.33bbe44c@ingxiaomi.fritz.box>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 12, 2020 at 06:05:35PM +0100, Ingo Rohloff wrote:
> On Wed, 11 Nov 2020 19:40:54 +0100
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Wed, Nov 11, 2020 at 06:07:16PM +0100, Ingo Rohloff wrote:
> > ...
> > > I now implement two new ioctls for FunctionFS:
> > >   FUNCTIONFS_SUBMITBULKURB
> > >   FUNCTIONFS_REAPBULKURB
> > > which provide simliar functionality.
> > > 
> > > A similar functionality is already implemented via AIO. But: To use
> > > this API, your user space environment needs to know how to use
> > > these system calls.  
> 
> OK I now understand why I was confused myself:
> I was looking into the POSIX AIO functions ("man 7 aio").
> At least in the C library which I use, the implementation of
> POSIX AIO does not use the native Linux system calls.
> What I meant above was: This C library does not know about the native
> Linux system calls.

Then use a new library :)

> Now because of your comment I learned about "libaio", which uses the
> Linux native system calls.

Great!

> The first problem here: Where do you get this library from ?
> At the end I got it from here:
>   https://pagure.io/libaio 
>   version 0.3.111
> I am still not sure if this is the right place, because at least
> Debian provides a 0.3.112 version, which seems to use an extra
> system call (io_pgetevents); no clue if I should use the Debian
> version or not.

I do not know if this is the latest one or not, sorry.  Ask your Linux
distro about this, or use the "raw" kernel aio syscalls.

The gadget code has always used AIO since the very beginning, this is
nothing new (decades old).  While it might feel "odd", I recommend
working with it first before trying to create new kernel apis that
duplicate existing functionality for the only reason being that AIO is
"different".

But if you find bugs in the current implementation, we will gladly
accept patches.

thanks,

greg k-h
