Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB5DA88428
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 22:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbfHIUko (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 16:40:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:57820 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725943AbfHIUko (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 16:40:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 7B3B0AE56;
        Fri,  9 Aug 2019 20:40:42 +0000 (UTC)
Message-ID: <1565382368.7092.4.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in usbhid_power
From:   Oliver Neukum <oneukum@suse.com>
To:     Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hillf Danton <hdanton@sina.com>,
        syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>
Date:   Fri, 09 Aug 2019 22:26:08 +0200
In-Reply-To: <CAAeHK+wb8=Z65_1CGcj0ShT6+NiQSDKhEkBVx+8vPe3kJF8+6g@mail.gmail.com>
References: <1564047229.4670.14.camel@suse.com>
         <Pine.LNX.4.44L0.1907251057110.1512-100000@iolanthe.rowland.org>
         <CAAeHK+wb8=Z65_1CGcj0ShT6+NiQSDKhEkBVx+8vPe3kJF8+6g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 08.08.2019, 20:54 +0200 schrieb Andrey Konovalov:
> On Thu, Jul 25, 2019 at 5:09 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > 
> > On Thu, 25 Jul 2019, Oliver Neukum wrote:
> > 
> > > Am Mittwoch, den 24.07.2019, 17:02 -0400 schrieb Alan Stern:
> > > > On Wed, 24 Jul 2019, Oliver Neukum wrote:
> > > > 
> > > > >  drivers/hid/usbhid/hid-core.c | 13 +++++++++++++
> > > > >  1 file changed, 13 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> > > > > index c7bc9db5b192..98b996ecf4d3 100644
> > > > > --- a/drivers/hid/usbhid/hid-core.c
> > > > > +++ b/drivers/hid/usbhid/hid-core.c
> > > > > @@ -1229,6 +1229,17 @@ static int usbhid_power(struct hid_device *hid, int lvl)
> > > > >   struct usbhid_device *usbhid = hid->driver_data;
> > > > >   int r = 0;
> > > > > 
> > > > > + spin_lock_irq(&usbhid->lock);
> > > > > + if (test_bit(HID_DISCONNECTED, &usbhid->iofl)) {
> > > > > +         r = -ENODEV;
> > > > > +         spin_unlock_irq(&usbhid->lock);
> > > > > +         goto bail_out;
> > > > > + } else {
> > > > > +         /* protect against disconnect */
> > > > > +         usb_get_dev(interface_to_usbdev(usbhid->intf));
> > > > > +         spin_unlock_irq(&usbhid->lock);
> > > > > + }
> > > > > +
> > > > >   switch (lvl) {
> > > > >   case PM_HINT_FULLON:
> > > > >           r = usb_autopm_get_interface(usbhid->intf);
> > > > > @@ -1238,7 +1249,9 @@ static int usbhid_power(struct hid_device *hid, int lvl)
> > > > >           usb_autopm_put_interface(usbhid->intf);
> > > > >           break;
> > > > >   }
> > > > > + usb_put_dev(interface_to_usbdev(usbhid->intf));
> > > > > 
> > > > > +bail_out:
> > > > >   return r;
> > > > >  }
> > > > 
> > > > Isn't this treating the symptom instead of the cause?
> > > 
> > > Sort of. Holding a reference for the whole time would have merit,
> > > but I doubt it is strictly necessary.
> > 
> > Just to be crystal clear, I was talking about a device reference --
> > usb_{get,put}_dev or usb_{get,put}_intf -- not a runtime PM reference.
> > 
> > (Incidentally, your patch could be simplified by using usb_get_intf
> > instead of usb_get_dev.)
> > 
> > > > Shouldn't the hid_device hold a reference to usbhid->intf throughout
> > > > its lifetime?  That way this sort of problem wouldn't arise in any
> > > > routine, not just usbhid_power().
> > > 
> > > Unfortunately the semantics would still be wrong without the check
> > > in corner cases. In case disconnect() is called without a physical
> > > unplug, we must not touch the power state.
> > > I am indeed afraid that in that case my putative fix is still racy.
> > > But I don't to just introduce a mutex just for this. Any ideas?
> > 
> > That's a separate issue.  USB drivers -- indeed, all drivers -- are
> > required to balance their runtime PM gets and puts (although in the
> > case of a physical disconnection it doesn't matter).  Are you asking
> > about the best way to do this?
> > 
> > Normally a driver's release or disconnect routine will stop all
> > asynchronous accesses to the device (interrupt handlers, work queues,
> > URBs, and so on).  At that point the only remaining runtime PM activity
> > will be whatever the routine itself does.  So it can see if any extra
> > runtime PM gets or puts are needed, and do whatever is necessary.
> > 
> > Does that answer your question?  I can't tell for sure...
> > 
> > Note: I did not try to track down the reason for the invalid access
> > reported by syzbot.  It looked like a simple use-after-free, which
> > would normally be fixed by taking the appropriate reference.  Which is
> > what your patch does, except that it holds the reference only for a
> > short time instead of over the entire lifetime of the private data
> > structure (the usbhid structure), which is what normally happens.
> 
> This report looks like very similar to these two:
> 
> https://syzkaller.appspot.com/bug?extid=b156665cf4d1b5e00c76
> https://syzkaller.appspot.com/bug?extid=3cbe5cd105d2ad56a1df

Yes, they stem from the same root cause most likely.

> Maybe we should mark those two as duplicates.
> 
> Hillf suggested a fix on one of them, but it looks different from what
> you propose:
> 
> https://groups.google.com/d/msg/syzkaller-bugs/xW7LvKfpyn0/SpKbs5ZLEAAJ

The fix may indeed be necessary, but it is incomplete. It does
not help keeping the PM counters consistent.

	Regards
		Oliver

