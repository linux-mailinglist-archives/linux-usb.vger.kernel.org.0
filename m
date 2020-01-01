Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 018EA12E057
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2020 21:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgAAUJg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jan 2020 15:09:36 -0500
Received: from netrider.rowland.org ([192.131.102.5]:49945 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725871AbgAAUJg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jan 2020 15:09:36 -0500
Received: (qmail 21112 invoked by uid 500); 1 Jan 2020 15:09:35 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 1 Jan 2020 15:09:35 -0500
Date:   Wed, 1 Jan 2020 15:09:35 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Greg KH <gregkh@linuxfoundation.org>
cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roger Whittaker <Roger.Whittaker@suse.com>,
        Takashi Iwai <tiwai@suse.com>, <linux-usb@vger.kernel.org>
Subject: Re: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
In-Reply-To: <20200101184700.GA3190507@kroah.com>
Message-ID: <Pine.LNX.4.44L0.2001011459080.20557-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 1 Jan 2020, Greg KH wrote:

> On Wed, Jan 01, 2020 at 08:35:59PM +0200, Laurent Pinchart wrote:
> > Hi Roger,
> > 
> > (CCin'g Alan Stern and linux-usb)
> > 
> > On Wed, Jan 01, 2020 at 05:52:27PM +0000, Roger Whittaker wrote:
> > > On Wed, Jan 01, 2020 at 07:24:49PM +0200, Laurent Pinchart wrote:
> > > 
> > > > The last message is worse. Could you send me the output of lsusb -v (you
> > > > can restrict it to the camera with -d), if possible running as root, for
> > > > both the working and non-working kernels ?
> > > 
> > > Thanks very much for your reply.
> > > 
> > > The lsusb outputs are attached - they are in fact identical to each
> > > other.
> > > 
> > > Also attached, the dmesg lines when replugging the camera on both
> > > kernels.
> > 
> > Thank you for the information.
> > 
> > I had missed the following message:
> > 
> > [  470.351700] usb 1-1.4.3.1: config 1 interface 2 altsetting 0 endpoint 0x82 has wMaxPacketSize 0, skipping
> > 
> > This seems to be the culprit, and it points to the USB core. One
> > interface is ignored due to its wMaxPacketSize value, and the uvcvideo
> > driver then fails to find it.
> > 
> > The wMaxPacketSize check was added in
> > 
> > commit d482c7bb0541d19dea8bff437a9f3c5563b5b2d2
> > Author: Alan Stern <stern@rowland.harvard.edu>
> > Date:   Mon Oct 28 10:52:35 2019 -0400
> > 
> >     USB: Skip endpoints with 0 maxpacket length
> > 
> >     Endpoints with a maxpacket length of 0 are probably useless.  They
> >     can't transfer any data, and it's not at all unlikely that an HCD will
> >     crash or hang when trying to handle an URB for such an endpoint.
> > 
> >     Currently the USB core does not check for endpoints having a maxpacket
> >     value of 0.  This patch adds a check, printing a warning and skipping
> >     over any endpoints it catches.
> > 
> >     Now, the USB spec does not rule out endpoints having maxpacket = 0.
> >     But since they wouldn't have any practical use, there doesn't seem to
> >     be any good reason for us to accept them.
> > 
> >     Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > 
> >     Link: https://lore.kernel.org/r/Pine.LNX.4.44L0.1910281050420.1485-100000@iolanthe.rowland.org
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> > The commit was merged in v5.4 and backported to v5.3.11 in
> > 47aaab6377204cdbcd16f52a23c584f994fd0d15.
> > 
> > For reference for Alan and linux-usb, the issue being discussed is
> > described in https://bugzilla.suse.com/show_bug.cgi?id=1159811. The
> > above commit seems to cause a regression with several cameras. I've
> > attached to this e-mail the lsusb output provided by Roger.
> 
> How can a device work with an endpoint of 0 length?
> 
> What does the driver expect to do with those endpoints?  Does it expect
> it to be present but just ignore it?

I see what's going on.  The endpoint in question is isochronous, and
the bAlternateSetting value is 0, which makes this the default
altsetting for that interface.  The USB spec says (at the end of
section 5.6.3):

	All device default interface settings must not include any
	isochronous endpoints with non-zero data payload sizes
	(specified via wMaxPacketSize in the endpoint descriptor).  
	Alternate interface settings may specify non-zero data payload
	sizes for isochronous endpoints.

That explains why the maxpacket size is set to 0.

So it looks like the endpoint-descriptor parsing code might want to
make a special case to accept isochronous endpoints with maxpacket 0 if
bAlternateSetting is 0.  But whether we do this or not, I would expect
the uvcvideo driver to look for isochronous endpoints in the alternate
settings it will actually use, not in altsetting 0.  Then the presence
or absence of that endpoint descriptor would make no difference to
uvcvideo.

(Unless the UVC spec _requires_ these endpoint descriptors to be
present.  If it does then we should simply change the core parsing code
and leave uvcvideo alone.)

Alan Stern

