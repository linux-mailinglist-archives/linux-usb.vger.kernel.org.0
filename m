Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E12712E02D
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2020 19:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbgAASrE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jan 2020 13:47:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:33098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727268AbgAASrE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jan 2020 13:47:04 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB422206DB;
        Wed,  1 Jan 2020 18:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577904423;
        bh=Pn45iapZ7iYqMWuBgko7GPWhyUo59SOlHrmtqLg7SXw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2E+TTh+aWGEPcS1A7XF3vPEIxHcN1VPmGLEhxOJKItXS1Jb3ylVJaCRb4kgrUOQTo
         7Plk7M9g1fZ9yHOuPf8bE57zMUnhVMOwDf+4eGB6ohR0p6zCajo9b8GBv5kJso7IWZ
         i6Z3N3HHXPSUZA2ZNWo4kJEUqLujef3t3/SOuxrg=
Date:   Wed, 1 Jan 2020 19:47:00 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Roger Whittaker <Roger.Whittaker@suse.com>,
        Takashi Iwai <tiwai@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Subject: Re: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
Message-ID: <20200101184700.GA3190507@kroah.com>
References: <20200101144709.GA8389@suse.com>
 <20200101172449.GF6226@pendragon.ideasonboard.com>
 <20200101175220.GA18140@suse.com>
 <20200101183559.GA15498@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200101183559.GA15498@pendragon.ideasonboard.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 01, 2020 at 08:35:59PM +0200, Laurent Pinchart wrote:
> Hi Roger,
> 
> (CCin'g Alan Stern and linux-usb)
> 
> On Wed, Jan 01, 2020 at 05:52:27PM +0000, Roger Whittaker wrote:
> > On Wed, Jan 01, 2020 at 07:24:49PM +0200, Laurent Pinchart wrote:
> > 
> > > The last message is worse. Could you send me the output of lsusb -v (you
> > > can restrict it to the camera with -d), if possible running as root, for
> > > both the working and non-working kernels ?
> > 
> > Thanks very much for your reply.
> > 
> > The lsusb outputs are attached - they are in fact identical to each
> > other.
> > 
> > Also attached, the dmesg lines when replugging the camera on both
> > kernels.
> 
> Thank you for the information.
> 
> I had missed the following message:
> 
> [  470.351700] usb 1-1.4.3.1: config 1 interface 2 altsetting 0 endpoint 0x82 has wMaxPacketSize 0, skipping
> 
> This seems to be the culprit, and it points to the USB core. One
> interface is ignored due to its wMaxPacketSize value, and the uvcvideo
> driver then fails to find it.
> 
> The wMaxPacketSize check was added in
> 
> commit d482c7bb0541d19dea8bff437a9f3c5563b5b2d2
> Author: Alan Stern <stern@rowland.harvard.edu>
> Date:   Mon Oct 28 10:52:35 2019 -0400
> 
>     USB: Skip endpoints with 0 maxpacket length
> 
>     Endpoints with a maxpacket length of 0 are probably useless.  They
>     can't transfer any data, and it's not at all unlikely that an HCD will
>     crash or hang when trying to handle an URB for such an endpoint.
> 
>     Currently the USB core does not check for endpoints having a maxpacket
>     value of 0.  This patch adds a check, printing a warning and skipping
>     over any endpoints it catches.
> 
>     Now, the USB spec does not rule out endpoints having maxpacket = 0.
>     But since they wouldn't have any practical use, there doesn't seem to
>     be any good reason for us to accept them.
> 
>     Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> 
>     Link: https://lore.kernel.org/r/Pine.LNX.4.44L0.1910281050420.1485-100000@iolanthe.rowland.org
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> The commit was merged in v5.4 and backported to v5.3.11 in
> 47aaab6377204cdbcd16f52a23c584f994fd0d15.
> 
> For reference for Alan and linux-usb, the issue being discussed is
> described in https://bugzilla.suse.com/show_bug.cgi?id=1159811. The
> above commit seems to cause a regression with several cameras. I've
> attached to this e-mail the lsusb output provided by Roger.

How can a device work with an endpoint of 0 length?

What does the driver expect to do with those endpoints?  Does it expect
it to be present but just ignore it?

thanks,

greg k-h
