Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E0C86AA3
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 21:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390201AbfHHTh3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 15:37:29 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:58462 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2390172AbfHHTh3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 15:37:29 -0400
Received: (qmail 5570 invoked by uid 2102); 8 Aug 2019 15:37:28 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 Aug 2019 15:37:28 -0400
Date:   Thu, 8 Aug 2019 15:37:28 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Subject: Re: KASAN: use-after-free Read in usbhid_power
In-Reply-To: <CAAeHK+wb8=Z65_1CGcj0ShT6+NiQSDKhEkBVx+8vPe3kJF8+6g@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1908081522290.1319-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 8 Aug 2019, Andrey Konovalov wrote:

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

> This report looks like very similar to these two:
> 
> https://syzkaller.appspot.com/bug?extid=b156665cf4d1b5e00c76
> https://syzkaller.appspot.com/bug?extid=3cbe5cd105d2ad56a1df

It also seems to resemble extids a7a6b9c609b9457c62c6, 
62a1e04fd3ec2abf099e, and 75e6910bf03e266a277f, although this may be an 
illusion.

> Maybe we should mark those two as duplicates.
> 
> Hillf suggested a fix on one of them, but it looks different from what
> you propose:
> 
> https://groups.google.com/d/msg/syzkaller-bugs/xW7LvKfpyn0/SpKbs5ZLEAAJ

Go ahead and try it out on all of them.  I don't have a clear feeling 
about it, not having worked on usbhid in quite a while.

Alan Stern

