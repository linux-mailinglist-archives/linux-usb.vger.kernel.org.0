Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E24F359E
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 18:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbfKGRWr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 12:22:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:35206 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726231AbfKGRWq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Nov 2019 12:22:46 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 47C2CB157;
        Thu,  7 Nov 2019 17:22:45 +0000 (UTC)
Message-ID: <1573146400.13325.1.camel@suse.de>
Subject: Re: [PATCH] USB: chaoskey: fix error case of a timeout
From:   Oliver Neukum <oneukum@suse.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     keithp@keithp.com, linux-usb@vger.kernel.org
Date:   Thu, 07 Nov 2019 18:06:40 +0100
In-Reply-To: <20191107150140.GA154021@kroah.com>
References: <20191107142856.16774-1-oneukum@suse.com>
         <20191107142856.16774-2-oneukum@suse.com>
         <20191107150140.GA154021@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 07.11.2019, 16:01 +0100 schrieb Greg KH:
> On Thu, Nov 07, 2019 at 03:28:56PM +0100, Oliver Neukum wrote:
> > In case of a timeout or if a signal aborts a read
> > communication with the device needs to be ended
> > lest we overwrite an active URB the next time we
> > do IO to the device, as the URB may still be active.
> > 
> > Signed-off-by: Oliver Neukum <oneukum@suse.de>
> > ---
> >  drivers/usb/misc/chaoskey.c | 24 +++++++++++++++++++++---
> >  1 file changed, 21 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/misc/chaoskey.c b/drivers/usb/misc/chaoskey.c
> > index 34e6cd6f40d3..87067c3d6109 100644
> > --- a/drivers/usb/misc/chaoskey.c
> > +++ b/drivers/usb/misc/chaoskey.c
> > @@ -384,13 +384,17 @@ static int _chaoskey_fill(struct chaoskey *dev)
> >  		!dev->reading,
> >  		(started ? NAK_TIMEOUT : ALEA_FIRST_TIMEOUT) );
> >  
> > -	if (result < 0)
> > +	if (result < 0) {
> > +		usb_kill_urb(dev->urb);
> >  		goto out;
> > +	}
> >  
> > -	if (result == 0)
> > +	if (result == 0) {
> >  		result = -ETIMEDOUT;
> > -	else
> > +		usb_kill_urb(dev->urb);
> > +	} else {
> >  		result = dev->valid;
> > +	}
> >  out:
> >  	/* Let the device go back to sleep eventually */
> >  	usb_autopm_put_interface(dev->interface);
> > @@ -526,7 +530,21 @@ static int chaoskey_suspend(struct usb_interface *interface,
> >  
> >  static int chaoskey_resume(struct usb_interface *interface)
> >  {
> > +	struct chaoskey *dev;
> > +	struct usb_device *udev = interface_to_usbdev(interface);
> > +
> >  	usb_dbg(interface, "resume");
> > +	dev = usb_get_intfdata(interface);
> > +
> > +	/*
> > +	 * We may have lost power.
> > +	 * In that case the device that needs a long time
> > +	 * for the first requests needs an extended timeout
> > +	 * again
> > +	 */
> > +	if (le16_to_cpu(udev->descriptor.idVendor) == ALEA_VENDOR_ID)
> 
> What is this helping with?

THe quirk is specific for this model. The others do
not need it.

> > +		dev->reads_started = false;
> > +
> >  	return 0;
> >  }
> >  #else
> > -- 
> > 2.16.4
> > 
> 
> Why send this twice?

There must be an issue in my scripts. Investigating.

> And did this pass the syzbot testing?

Inconclusive. The test crashed but in another place.
I cannot claim that fix.

	Regards
		Oliver

