Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F15412E8CB
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 17:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728808AbgABQiU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 11:38:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45036 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbgABQiU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 11:38:20 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49323516;
        Thu,  2 Jan 2020 17:38:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1577983097;
        bh=EakE89tJOd3GObfS/u4FO++zBGtF8KQUPS8XEnOhKDg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c5V+EXMc239xu5RmVgPhxFxbA0Pmwd21gq2IDQYS8wAcg6/ZYS/kEERjdL/I78QtB
         xwOlE45y5YpNUOyboCh9HfKwv3tKduJz/XLoOYlafzlIwdPwf7M42WoBFwQC0bJe+f
         9p47Sx/GLq6HVPsZ4JPxeMENpRtGLAx0dLhD/p6M=
Date:   Thu, 2 Jan 2020 18:38:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Roger Whittaker <Roger.Whittaker@suse.com>,
        Takashi Iwai <tiwai@suse.com>, linux-usb@vger.kernel.org
Subject: Re: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
Message-ID: <20200102163807.GE4843@pendragon.ideasonboard.com>
References: <s5hr20ingu5.wl-tiwai@suse.de>
 <Pine.LNX.4.44L0.2001021003130.1546-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2001021003130.1546-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On Thu, Jan 02, 2020 at 10:06:33AM -0500, Alan Stern wrote:
> On Thu, 2 Jan 2020, Takashi Iwai wrote:
> > On Thu, 02 Jan 2020 12:20:45 +0100, Johan Hovold wrote:
> > > On Wed, Jan 01, 2020 at 03:09:35PM -0500, Alan Stern wrote:
> > > > On Wed, 1 Jan 2020, Greg KH wrote:
> > > > > On Wed, Jan 01, 2020 at 08:35:59PM +0200, Laurent Pinchart wrote:
> > > 
> > > > > > [  470.351700] usb 1-1.4.3.1: config 1 interface 2 altsetting 0 endpoint 0x82 has wMaxPacketSize 0, skipping
> > > > > > 
> > > > > > This seems to be the culprit, and it points to the USB core. One
> > > > > > interface is ignored due to its wMaxPacketSize value, and the uvcvideo
> > > > > > driver then fails to find it.
> > > > > > 
> > > > > > The wMaxPacketSize check was added in
> > > > > > 
> > > > > > commit d482c7bb0541d19dea8bff437a9f3c5563b5b2d2
> > > > > > Author: Alan Stern <stern@rowland.harvard.edu>
> > > > > > Date:   Mon Oct 28 10:52:35 2019 -0400
> > > > > > 
> > > > > >     USB: Skip endpoints with 0 maxpacket length
> > > > > > 
> > > > > >     Endpoints with a maxpacket length of 0 are probably useless.  They
> > > > > >     can't transfer any data, and it's not at all unlikely that an HCD will
> > > > > >     crash or hang when trying to handle an URB for such an endpoint.
> > > > > > 
> > > > > >     Currently the USB core does not check for endpoints having a maxpacket
> > > > > >     value of 0.  This patch adds a check, printing a warning and skipping
> > > > > >     over any endpoints it catches.
> > > > > > 
> > > > > >     Now, the USB spec does not rule out endpoints having maxpacket = 0.
> > > > > >     But since they wouldn't have any practical use, there doesn't seem to
> > > > > >     be any good reason for us to accept them.
> > > > > > 
> > > > > >     Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > > > > > 
> > > > > >     Link: https://lore.kernel.org/r/Pine.LNX.4.44L0.1910281050420.1485-100000@iolanthe.rowland.org
> > > > > >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > > 
> > > > > > The commit was merged in v5.4 and backported to v5.3.11 in
> > > > > > 47aaab6377204cdbcd16f52a23c584f994fd0d15.
> > > > > > 
> > > > > > For reference for Alan and linux-usb, the issue being discussed is
> > > > > > described in https://bugzilla.suse.com/show_bug.cgi?id=1159811. The
> > > > > > above commit seems to cause a regression with several cameras. I've
> > > > > > attached to this e-mail the lsusb output provided by Roger.
> > > > > 
> > > > > How can a device work with an endpoint of 0 length?
> > > > > 
> > > > > What does the driver expect to do with those endpoints?  Does it expect
> > > > > it to be present but just ignore it?
> > > > 
> > > > I see what's going on.  The endpoint in question is isochronous, and
> > > > the bAlternateSetting value is 0, which makes this the default
> > > > altsetting for that interface.  The USB spec says (at the end of
> > > > section 5.6.3):
> > > > 
> > > > 	All device default interface settings must not include any
> > > > 	isochronous endpoints with non-zero data payload sizes
> > > > 	(specified via wMaxPacketSize in the endpoint descriptor).  
> > > > 	Alternate interface settings may specify non-zero data payload
> > > > 	sizes for isochronous endpoints.
> > > > 
> > > > That explains why the maxpacket size is set to 0.
> > > > 
> > > > So it looks like the endpoint-descriptor parsing code might want to
> > > > make a special case to accept isochronous endpoints with maxpacket 0 if
> > > > bAlternateSetting is 0.  But whether we do this or not, I would expect
> > > > the uvcvideo driver to look for isochronous endpoints in the alternate
> > > > settings it will actually use, not in altsetting 0.  Then the presence
> > > > or absence of that endpoint descriptor would make no difference to
> > > > uvcvideo.
> > > > 
> > > > (Unless the UVC spec _requires_ these endpoint descriptors to be
> > > > present.  If it does then we should simply change the core parsing code
> > > > and leave uvcvideo alone.)
> > > 
> > > Note that we also have this little gem in the ftdi usb-serial driver
> > > (since 2009) overriding a zero max packet size for devices with broken
> > > descriptors:
> > > 
> > > 	895f28badce9 ("USB: ftdi_sio: fix hi-speed device packet size calculation")
> > > 
> > > Note sure how common those are but they will no longer work after the
> > > new sanity check in core. I guess we could add quirks for them (to core)
> > > in case we get any reports, but perhaps reverting the check should be
> > > considered.
> > 
> > FWIW, Roger confirmed that reverting the commit d482c7bb0541 does
> > indeed fix the issue (with the latest 5.4.y kernel).
> 
> All right.  Suppose instead of reverting that commit, I change the code
> so that it only logs a warning when it finds an endpoint descriptor
> with maxpacket = 0 (and it skips the warning for isochronous endpoints
> in altsetting 0).  At the same time, we can add a check to
> usb_submit_urb() to refuse URBs if the endpoint's maxpacket is 0.
> 
> Sounds good?

It makes it easier for me as I won't have to adapt the uvcvideo driver,
so it certainly sounds good :-)

The USB specification allows different endpoint settings in different
alternate settings, and unless I'm mistaken, it includes a different
number of endpoints and different endpoint numbers. The UVC
specification isn't very clear on this topic, but in practice most
isochronous devices don't include any isochronous endpoint in altsetting
0. Only 5 devices in my database of ~400 has an isochronous endpoint in
altsetting 0, all of them with a wMaxPacketSize value set to 0. The
above commit, if it only ignored the endpoint, should thus be fine, as
the uvcvideo driver checks for endpoints in other alternate settings
(the related code is the loop at the end of uvc_parse_streaming() in
drivers/media/usb/uvc/uvc_driver.c). I thus wonder what's going wrong,
and if the commit couldn't cause the interface to be mistakenly ignored
as a whole ?

Roger, would you be able to set the uvcvideo trace module parameter to
0xffff before plugging the device, and provide the messages printed by
the driver to the kernel log both with and without the above commit ?

-- 
Regards,

Laurent Pinchart
