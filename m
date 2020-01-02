Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE47412E599
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 12:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbgABLUt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 06:20:49 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36832 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbgABLUs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 06:20:48 -0500
Received: by mail-lf1-f66.google.com with SMTP id n12so29693043lfe.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Jan 2020 03:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8mJfkhtqf4ZDWrsKZ1u/cTlswjHuWRkOIyw7sKCD/Gs=;
        b=Gi357ZAu/wszVknu3fXy3wSsuRgO+jt1tj+lAOceP4xOQol+f5f1EKUR7VFvSE6F0M
         tS4nXu19j2w53F8R5gSXtd5wR9QILVp5HKYAW8kEflR7s7JwJQVhAMp+6owKQ93duy1S
         ekE006O50lS8xiI6vnY7bwIUcw84/pUBe6KHdKwVZqElx6qJ0eM5uSaQ3n6XFNMZo979
         +bhP53Y6l3hxbWUGoEJ81TUcFo3NjNKVqol8Fbh8k6n2RyFBDhHo5BOM0ZiCEiylUbWG
         A9mTiO406eqkcrRo9wV/pyUsWGaQDpZkE8pp9LW29w4YAM4X2hUeCJVZwE2WfwBCK5JJ
         9kag==
X-Gm-Message-State: APjAAAWLB6phrnG93Y7V6qhfkE5q/Y3JY2IEtDVxCs4D0jTWHNjk+Htk
        T+Hk7n3/0Bn+2zJ7Xp+BvaM=
X-Google-Smtp-Source: APXvYqxM82uUKNRgAWyI0BtH5ocmsmyRpm0MRwoxRp54z0stbX2d0/JzXUsXYbwJW7rcdoKkF+78lA==
X-Received: by 2002:a19:8456:: with SMTP id g83mr47174625lfd.0.1577964046337;
        Thu, 02 Jan 2020 03:20:46 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id s4sm14941538ljd.94.2020.01.02.03.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 03:20:45 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1imyWz-0004gc-VU; Thu, 02 Jan 2020 12:20:46 +0100
Date:   Thu, 2 Jan 2020 12:20:45 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roger Whittaker <Roger.Whittaker@suse.com>,
        Takashi Iwai <tiwai@suse.com>, linux-usb@vger.kernel.org
Subject: Re: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
Message-ID: <20200102112045.GA17614@localhost>
References: <20200101184700.GA3190507@kroah.com>
 <Pine.LNX.4.44L0.2001011459080.20557-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2001011459080.20557-100000@netrider.rowland.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 01, 2020 at 03:09:35PM -0500, Alan Stern wrote:
> On Wed, 1 Jan 2020, Greg KH wrote:
> > On Wed, Jan 01, 2020 at 08:35:59PM +0200, Laurent Pinchart wrote:

> > > [  470.351700] usb 1-1.4.3.1: config 1 interface 2 altsetting 0 endpoint 0x82 has wMaxPacketSize 0, skipping
> > > 
> > > This seems to be the culprit, and it points to the USB core. One
> > > interface is ignored due to its wMaxPacketSize value, and the uvcvideo
> > > driver then fails to find it.
> > > 
> > > The wMaxPacketSize check was added in
> > > 
> > > commit d482c7bb0541d19dea8bff437a9f3c5563b5b2d2
> > > Author: Alan Stern <stern@rowland.harvard.edu>
> > > Date:   Mon Oct 28 10:52:35 2019 -0400
> > > 
> > >     USB: Skip endpoints with 0 maxpacket length
> > > 
> > >     Endpoints with a maxpacket length of 0 are probably useless.  They
> > >     can't transfer any data, and it's not at all unlikely that an HCD will
> > >     crash or hang when trying to handle an URB for such an endpoint.
> > > 
> > >     Currently the USB core does not check for endpoints having a maxpacket
> > >     value of 0.  This patch adds a check, printing a warning and skipping
> > >     over any endpoints it catches.
> > > 
> > >     Now, the USB spec does not rule out endpoints having maxpacket = 0.
> > >     But since they wouldn't have any practical use, there doesn't seem to
> > >     be any good reason for us to accept them.
> > > 
> > >     Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > > 
> > >     Link: https://lore.kernel.org/r/Pine.LNX.4.44L0.1910281050420.1485-100000@iolanthe.rowland.org
> > >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > 
> > > The commit was merged in v5.4 and backported to v5.3.11 in
> > > 47aaab6377204cdbcd16f52a23c584f994fd0d15.
> > > 
> > > For reference for Alan and linux-usb, the issue being discussed is
> > > described in https://bugzilla.suse.com/show_bug.cgi?id=1159811. The
> > > above commit seems to cause a regression with several cameras. I've
> > > attached to this e-mail the lsusb output provided by Roger.
> > 
> > How can a device work with an endpoint of 0 length?
> > 
> > What does the driver expect to do with those endpoints?  Does it expect
> > it to be present but just ignore it?
> 
> I see what's going on.  The endpoint in question is isochronous, and
> the bAlternateSetting value is 0, which makes this the default
> altsetting for that interface.  The USB spec says (at the end of
> section 5.6.3):
> 
> 	All device default interface settings must not include any
> 	isochronous endpoints with non-zero data payload sizes
> 	(specified via wMaxPacketSize in the endpoint descriptor).  
> 	Alternate interface settings may specify non-zero data payload
> 	sizes for isochronous endpoints.
> 
> That explains why the maxpacket size is set to 0.
> 
> So it looks like the endpoint-descriptor parsing code might want to
> make a special case to accept isochronous endpoints with maxpacket 0 if
> bAlternateSetting is 0.  But whether we do this or not, I would expect
> the uvcvideo driver to look for isochronous endpoints in the alternate
> settings it will actually use, not in altsetting 0.  Then the presence
> or absence of that endpoint descriptor would make no difference to
> uvcvideo.
> 
> (Unless the UVC spec _requires_ these endpoint descriptors to be
> present.  If it does then we should simply change the core parsing code
> and leave uvcvideo alone.)

Note that we also have this little gem in the ftdi usb-serial driver
(since 2009) overriding a zero max packet size for devices with broken
descriptors:

	895f28badce9 ("USB: ftdi_sio: fix hi-speed device packet size calculation")

Note sure how common those are but they will no longer work after the
new sanity check in core. I guess we could add quirks for them (to core)
in case we get any reports, but perhaps reverting the check should be
considered.

There doesn't seem to be any other drivers accepting and explicitly
handling zero max packet sizes like this in mainline however.

Johan
