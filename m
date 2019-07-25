Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6767522F
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2019 17:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389011AbfGYPJ0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jul 2019 11:09:26 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:41716 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2388922AbfGYPJ0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jul 2019 11:09:26 -0400
Received: (qmail 29070 invoked by uid 2102); 25 Jul 2019 11:09:24 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Jul 2019 11:09:24 -0400
Date:   Thu, 25 Jul 2019 11:09:24 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     andreyknvl@google.com, <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        <linux-usb@vger.kernel.org>
Subject: Re: KASAN: use-after-free Read in usbhid_power
In-Reply-To: <1564047229.4670.14.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1907251057110.1512-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 25 Jul 2019, Oliver Neukum wrote:

> Am Mittwoch, den 24.07.2019, 17:02 -0400 schrieb Alan Stern:
> > On Wed, 24 Jul 2019, Oliver Neukum wrote:
> > 
> > >  drivers/hid/usbhid/hid-core.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> > > index c7bc9db5b192..98b996ecf4d3 100644
> > > --- a/drivers/hid/usbhid/hid-core.c
> > > +++ b/drivers/hid/usbhid/hid-core.c
> > > @@ -1229,6 +1229,17 @@ static int usbhid_power(struct hid_device *hid, int lvl)
> > >  	struct usbhid_device *usbhid = hid->driver_data;
> > >  	int r = 0;
> > >  
> > > +	spin_lock_irq(&usbhid->lock);
> > > +	if (test_bit(HID_DISCONNECTED, &usbhid->iofl)) {
> > > +		r = -ENODEV;
> > > +		spin_unlock_irq(&usbhid->lock);
> > > +		goto bail_out;
> > > +	} else {
> > > +		/* protect against disconnect */
> > > +		usb_get_dev(interface_to_usbdev(usbhid->intf));
> > > +		spin_unlock_irq(&usbhid->lock);
> > > +	}
> > > +
> > >  	switch (lvl) {
> > >  	case PM_HINT_FULLON:
> > >  		r = usb_autopm_get_interface(usbhid->intf);
> > > @@ -1238,7 +1249,9 @@ static int usbhid_power(struct hid_device *hid, int lvl)
> > >  		usb_autopm_put_interface(usbhid->intf);
> > >  		break;
> > >  	}
> > > +	usb_put_dev(interface_to_usbdev(usbhid->intf));
> > >  
> > > +bail_out:
> > >  	return r;
> > >  }
> > 
> > Isn't this treating the symptom instead of the cause?
> 
> Sort of. Holding a reference for the whole time would have merit,
> but I doubt it is strictly necessary.

Just to be crystal clear, I was talking about a device reference --
usb_{get,put}_dev or usb_{get,put}_intf -- not a runtime PM reference.  

(Incidentally, your patch could be simplified by using usb_get_intf
instead of usb_get_dev.)

> > Shouldn't the hid_device hold a reference to usbhid->intf throughout 
> > its lifetime?  That way this sort of problem wouldn't arise in any 
> > routine, not just usbhid_power().
> 
> Unfortunately the semantics would still be wrong without the check
> in corner cases. In case disconnect() is called without a physical
> unplug, we must not touch the power state.
> I am indeed afraid that in that case my putative fix is still racy.
> But I don't to just introduce a mutex just for this. Any ideas?

That's a separate issue.  USB drivers -- indeed, all drivers -- are 
required to balance their runtime PM gets and puts (although in the 
case of a physical disconnection it doesn't matter).  Are you asking 
about the best way to do this?

Normally a driver's release or disconnect routine will stop all
asynchronous accesses to the device (interrupt handlers, work queues,
URBs, and so on).  At that point the only remaining runtime PM activity
will be whatever the routine itself does.  So it can see if any extra
runtime PM gets or puts are needed, and do whatever is necessary.

Does that answer your question?  I can't tell for sure...

Note: I did not try to track down the reason for the invalid access 
reported by syzbot.  It looked like a simple use-after-free, which 
would normally be fixed by taking the appropriate reference.  Which is 
what your patch does, except that it holds the reference only for a 
short time instead of over the entire lifetime of the private data 
structure (the usbhid structure), which is what normally happens.

Alan Stern

