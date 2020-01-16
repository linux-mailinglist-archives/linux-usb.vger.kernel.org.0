Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1E0F13FBA5
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2020 22:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730166AbgAPVki (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jan 2020 16:40:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:44284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730059AbgAPVki (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Jan 2020 16:40:38 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE5BB2072B;
        Thu, 16 Jan 2020 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579210837;
        bh=Nbq/4U3v4JSzNciz+0MlD4VwuQP2bHM83+ItJHJQykA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I+o7KKsALUea1SW/LP3lWzoH8CstrXo/WDYkAhtEI1S4GXLMHHQilNse8blbquoTO
         EArvpNy7YV+rHBuwZDtGo32sE+ZX4c7yfdfk+CAZAUR9cPhBihyH1WmhMVNuzVz88u
         Eyh8Xr7JzKRFu6q00UdWz/MZG9fqV/b3AujjGaiE=
Date:   Thu, 16 Jan 2020 22:40:34 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Chris Dickens <christopher.a.dickens@gmail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Inconsistency in how URBs are unlinked
Message-ID: <20200116214034.GA1250873@kroah.com>
References: <CAL-1MmW7_DVGyOQytz=_fDeswUT=n_sfePS5yNm7SRU2ORSomQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL-1MmW7_DVGyOQytz=_fDeswUT=n_sfePS5yNm7SRU2ORSomQ@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 16, 2020 at 01:34:21PM -0800, Chris Dickens wrote:
> Hi,
> 
> A bug [1] has been reported against libusb about a segfault that
> occurs when a device is disconnected while processing isochronous
> transfers.  In my investigation I discovered an interesting
> inconsistency in how URBs are unlinked across the USB core.
> 
> The usbfs driver will unlink URBs in the same order they are
> submitted.  From what I can see this code is executed when
> setting/releasing an interface or when alloc'ing/freeing streams.  I
> see there is also a call within the usbfs driver's disconnect
> function, but that appears to be a no-op (is this really the case?) as
> by the time that function is called the interface would have already
> been disabled and thus usb_hcd_flush_endpoint() would have been
> called.
> 
> Since commit 2eac136243 ("usb: core: unlink urbs from the tail of the
> endpoint's urb_list"), the usb_hcd_flush_endpoint() function will
> unlink URBs in the reverse order of submission.  This subtle change is
> what led to the crash within libusb.  The bug manifests when transfers
> within libusb are split into multiple URBs.  Prior to this change, the
> order in which URBs were reaped matched the order in which they were
> submitted.  Internally libusb expects this order to match and frees
> memory when it encounters the last URB in a multi-URB transfer, but
> since it reaps the last URB first the memory is freed right away and
> things take a turn when the freed memory is accessed when reaping the
> other URB(s) in that same transfer.

That commit was from July 2017, has no one really noticed since then?

Anyway, who is splitting the urb up, libusb or usbfs?  I'm guessing
libusb here as otherwise this wouldn't be an issue, but if you are
splitting them up, shouldn't you never count on the order in which they
are handled as some host controllers can reorder them (I think xhci
can).  So this type of fix for libusb is to be expected I would think,
you can't count on an async interface ever working in an ordered manner,
right?

Also, what does other operating systems do here?

> I will fix libusb to account for this behavior, but I thought it worth
> mentioning as this new behavior isn't what I (and possibly others)
> necessarily expect.

New as of 2017 :)

thanks,

greg k-h
