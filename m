Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0CF749EE
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2019 11:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390561AbfGYJeC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jul 2019 05:34:02 -0400
Received: from mx2.suse.de ([195.135.220.15]:52260 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390537AbfGYJeB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Jul 2019 05:34:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 8EC60ABE9;
        Thu, 25 Jul 2019 09:34:00 +0000 (UTC)
Message-ID: <1564047229.4670.14.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in usbhid_power
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     andreyknvl@google.com, syzkaller-bugs@googlegroups.com,
        syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        linux-usb@vger.kernel.org
Date:   Thu, 25 Jul 2019 11:33:49 +0200
In-Reply-To: <Pine.LNX.4.44L0.1907241659410.10248-100000@netrider.rowland.org>
References: <Pine.LNX.4.44L0.1907241659410.10248-100000@netrider.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 24.07.2019, 17:02 -0400 schrieb Alan Stern:
> On Wed, 24 Jul 2019, Oliver Neukum wrote:
> 
> >  drivers/hid/usbhid/hid-core.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> > index c7bc9db5b192..98b996ecf4d3 100644
> > --- a/drivers/hid/usbhid/hid-core.c
> > +++ b/drivers/hid/usbhid/hid-core.c
> > @@ -1229,6 +1229,17 @@ static int usbhid_power(struct hid_device *hid, int lvl)
> >  	struct usbhid_device *usbhid = hid->driver_data;
> >  	int r = 0;
> >  
> > +	spin_lock_irq(&usbhid->lock);
> > +	if (test_bit(HID_DISCONNECTED, &usbhid->iofl)) {
> > +		r = -ENODEV;
> > +		spin_unlock_irq(&usbhid->lock);
> > +		goto bail_out;
> > +	} else {
> > +		/* protect against disconnect */
> > +		usb_get_dev(interface_to_usbdev(usbhid->intf));
> > +		spin_unlock_irq(&usbhid->lock);
> > +	}
> > +
> >  	switch (lvl) {
> >  	case PM_HINT_FULLON:
> >  		r = usb_autopm_get_interface(usbhid->intf);
> > @@ -1238,7 +1249,9 @@ static int usbhid_power(struct hid_device *hid, int lvl)
> >  		usb_autopm_put_interface(usbhid->intf);
> >  		break;
> >  	}
> > +	usb_put_dev(interface_to_usbdev(usbhid->intf));
> >  
> > +bail_out:
> >  	return r;
> >  }
> 
> Isn't this treating the symptom instead of the cause?

Sort of. Holding a reference for the whole time would have merit,
but I doubt it is strictly necessary.

> Shouldn't the hid_device hold a reference to usbhid->intf throughout 
> its lifetime?  That way this sort of problem wouldn't arise in any 
> routine, not just usbhid_power().

Unfortunately the semantics would still be wrong without the check
in corner cases. In case disconnect() is called without a physical
unplug, we must not touch the power state.
I am indeed afraid that in that case my putative fix is still racy.
But I don't to just introduce a mutex just for this. Any ideas?

	Regards
		Oliver

