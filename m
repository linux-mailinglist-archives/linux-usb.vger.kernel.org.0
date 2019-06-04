Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91A6B34DF8
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 18:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbfFDQs4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 12:48:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:50434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727814AbfFDQs4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Jun 2019 12:48:56 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17E7823CE8;
        Tue,  4 Jun 2019 16:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559666935;
        bh=9HjRAxuIKuIU0Ep+MCFG2odOk327i3pDuyyLpvrpjYc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vxJ2Xzi34JxIQKdEc0n8piONhreyR4rKhHNkXSm9xGNwoXfxU0KIqd75ztIkUvRjX
         mMbVuVntijw/NqZ7R9xWy1Tuv8ZzAnBt07PD6cwiNl5VH2x1Gt0+8kzhpfr8YmM7bW
         18sN0OM9e7L22PncXIhogRDKpqP6/7GxI5UOnSwk=
Date:   Tue, 4 Jun 2019 18:48:53 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        libusb-devel@lists.sourceforge.net
Subject: Re: Extending USB_CONNECTINFO ioctl
Message-ID: <20190604164853.GA14605@kroah.com>
References: <20190604002410.GA36666@dtor-ws>
 <Pine.LNX.4.44L0.1906040952480.1731-100000@iolanthe.rowland.org>
 <20190604161451.GB226219@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604161451.GB226219@dtor-ws>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 04, 2019 at 09:14:51AM -0700, Dmitry Torokhov wrote:
> Hi Alan,
> 
> On Tue, Jun 04, 2019 at 10:17:25AM -0400, Alan Stern wrote:
> > On Mon, 3 Jun 2019, Dmitry Torokhov wrote:
> > 
> > > Hi Alan, Greg,
> > > 
> > > When running software in a jailed environment where sysfs or udev is not
> > > readily available and one can only have an FD to usbdevfs device passed
> > > into the jail, there is a desire to allow libusb working. Alan recently
> > > added USBDEVFS_GET_SPEED, but we are still missing bus number and list
> > > of port numbers on the way to the root to be able to better identify the
> > > device in question.
> > > 
> > > What do you think about adding a new ioctl:
> > > 
> > > struct usbdevfs_connectinfo_ex {
> > > 	__u32 size;		/* size of the structure from the kernel POV */
> > 
> > This should be an input/output parameter.  That is, the original value
> > says how big the userspace structure is, and the value stored by the
> > kernel says how much space was actually filled in.  Or alternatively, 
> > have two size fields (one for input and one for output).
> 
> The "incoming" size is encoded in the ioctl number (the 'len' argument
> in USBDEVFS_CONNINFO_EX()), there is no reason to add it separately (or
> make read/write).
> 
> > 
> > > 	__u32 busnum;
> > > 	__u32 devnum;
> > > 	__u32 speed;		/* USB_SPEED_* form ch9.h */
> > > 	u8 num_ports;		/* Number of entries in port_numbers array */
> > > 	u8 port_numbers[31];	/* Current limit in USB3.0 spec is 7 */
> > > };
> > 
> > Yeah, 31 is overkill.  Even the USB-2.0 spec limits the topology to 7
> > tiers (including the root hub), meaning that only 6 port numbers are
> > needed.
> 
> If you insist I can bring it down to 7, but this structure is short
> lived, on stack, and there should not be many of them in the kernel, so
> if we can avoid extending a particular field in the future I think it is
> worth it.

I don't know what USB 4 has in it (and if I did, I couldn't mention it),
but someone who can see those specs might want to take a look at them to
just say "yeah, 31 looks like a good number" or "nope, make it a bit
bigger please!"

thanks,

greg k-h
