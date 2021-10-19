Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 372F2433691
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 15:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235719AbhJSND4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 09:03:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:48036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231616AbhJSNDz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Oct 2021 09:03:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B3A760FC2;
        Tue, 19 Oct 2021 13:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634648503;
        bh=Ou8N2yzlv96KKZKRywo3323nZQ3APgCv8/T4RDjyUYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tOnuv7bOUqlDSC6/dhhjbdzJVT+7EwVQeLdkAUyLhFmHgcQ9kqvHlKbs2OPE36l2w
         3dw06f/AKpRibgam3apxC+NamB144tFWZZKfzb9JKGHTuQ/LoUxgnMGJKAcmJWT+6w
         AWcRAKLkBgpCFGO/MM+pkqr/WQeekCX7D4wCfYE8=
Date:   Tue, 19 Oct 2021 15:01:40 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     mark_k@iname.com
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB2 Link USB-SCSI converter and LUNs
Message-ID: <YW7BtIHwVH3n13yH@kroah.com>
References: <trinity-d3be8a5b-2b1c-45f8-8767-cf9cf758a0c0-1634638509008@3c-app-mailcom-lxa12>
 <YW6pjieI5UwOM9LW@kroah.com>
 <trinity-7db5ef0c-99a3-4fa0-a1d7-1e57c80cc4ff-1634648008985@3c-app-mailcom-lxa13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-7db5ef0c-99a3-4fa0-a1d7-1e57c80cc4ff-1634648008985@3c-app-mailcom-lxa13>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 19, 2021 at 02:53:29PM +0200, mark_k@iname.com wrote:
> On Tuesday, October 19, 2021 at 12:18 PM "Greg KH" <gregkh@linuxfoundation.org> wrote:
> > On Tue, Oct 19, 2021 at 12:15:09PM +0200, mark_k@iname.com wrote:
> > > I have a Core Micro Systems USB2 Link USB-SCSI converter (07B4:0380).
> > >
> > > Adding an entry to unusual_devs.h should get it to work, just needing
> > > USB_PR_BULK. That should at least allow the connected device with SCSI ID 0
> > > to be accessed.
> >
> > Why do you need any quirk at all for this?
> 
> My mistake, sorry. Its interface descriptor has
>   bInterfaceClass 0xFF
>   bInterfaceSubClass 0x06
>   bInterfaceProtocol 0x50
> so an entry with USB_SC_DEVICE, USB_PR_DEVICE would work.

Again, why is a quirk needed at all?

> > > I'm just wondering, how does the usb-storage driver handle these cases:
> > >
> > >  - (What it thinks are) LUNs are not contiguous. Suppose the user has two
> > >    SCSI devices in the chain, one with ID 0 the other with ID 3. Would it
> > >    scan LUNs (which map to separate targets) 1, 2, 4, 5 and 6? Or would it
> > >    give up on getting no response from LUN 1?
> > >
> > >  - "LUN" 0 is not present. E.g. where the connected SCSI devices have IDs 1
> > >    and 3.
> > >
> > >  - When different "LUNs" are completely different devices (e.g. one a
> > >    CD-ROM, another a hard disk, another a tape drive).
> > >
> >
> > That should all be up to the scsi layer in the kernel.  If this device
> > is not following the standard, how is it supposed to work at all?
> >
> > Does it require custom drivers for other operating systems?
> 
> My guess is that (with quirk entry) it will work when there is a SCSI
> device with ID 0. If all other devices in the chain have contiguous IDs
> they could be accessible too.
> 
> I can tell Windows to use its built-in mass storage driver and that works
> to access the device with ID 0 only. I haven't yet checked with more than
> one SCSI device in the chain.

Does this work properly with Linux in this way with no quirk as well?

And how do you know that the device will work with additional scsi
devices?

> It could/should be possible to properly support multiple targets and LUNs
> by using a similar method to the SCM USB-SCSI converters. (Those, after a
> special intitialisation request, take the target ID from the *upper* 4 bits
> of CBW byte 13.)

Are you sure this device actually supports this?  If so, what operating
system does it work on?

thanks,

greg k-h
