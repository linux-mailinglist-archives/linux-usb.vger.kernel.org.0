Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE2F286926
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 20:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390334AbfHHSzA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 14:55:00 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35737 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390228AbfHHSy7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 14:54:59 -0400
Received: by mail-pl1-f195.google.com with SMTP id w24so43900733plp.2
        for <linux-usb@vger.kernel.org>; Thu, 08 Aug 2019 11:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nuk0ToqSIa5mZjUqxaULD0iCIxhe6PM8NZiEktjKui8=;
        b=V2lO4FghKvCefio/Am1HmysrL04w7IHEmwOIc7rX5Qb02Ieph/xMJ+3gavXaJquQw9
         NpxXM3Jn1yu39R3S1tFE7BcMgbsPfsrZlD7cUQCoZ57grHYhFRn+k629SioFgV0UbXV+
         WNsy9W0fEnin4rWJH57mFb0MBKS3t9X53PcevwDeafzZ9LlY7hBr78ES3+MWIKbguWN6
         349Qr+6KiIGWBtMA39NjRS7lDCv89T2Lo+9VYITwjskFINM02aGA52dtH8xV7XECmuHa
         mtR+GdfmfZsDXbPPUtXp7+t6tzRCbAsVjwhi78AqKehvSyxcs3sFNPwIg9E8+W0wO76L
         U7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nuk0ToqSIa5mZjUqxaULD0iCIxhe6PM8NZiEktjKui8=;
        b=nuZ9KK2oUxMk9xWrUdh4/l10yc4feKb2eADYpJyq1iAuzRtRUkbKEJrdj98aMO5s7k
         aR7L2ImtHn1pIydX//0aIorYcJx6+C8AO+Pj3C+MPPHwhbIedlj/f4ZgA+cpMSzlacLb
         kuqej4yD+qiuzqo9HLRPsBpKf8eW4QR+kx1hzxQf29SgzK9K5F19gsRKOvM74eunxdvu
         mlEWO9OqkCsVAS73UNn3VOyphFB7H8Tq6cMSNYulCrkJbWZoSVZi+IKZbuglSl+4c7h7
         J532cAYe4zOPGBjy51KdJJbLPzHsHT7UCKtt/gvsur8+cRZZ8iDrZ7Je1lZxjwbv5wq7
         9kOA==
X-Gm-Message-State: APjAAAVy/U0rxI5357OaQLAH6Z/jz49NlNqDw6d9aTz4Tdje8yU1Ij7v
        xPIrYyJ1fXMj8X8+BxMFTzHVua0Cyf5BuIS3c2bcLQ==
X-Google-Smtp-Source: APXvYqzIVAjmN0aasQk34NFXx7hTY7N+SeKBGhHdQBQfGqLZecgzZlCIdmxt3+doK8CGjwPEy4/18aYUjK51CB5Li40=
X-Received: by 2002:a17:902:ab96:: with SMTP id f22mr8584883plr.147.1565290498138;
 Thu, 08 Aug 2019 11:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <1564047229.4670.14.camel@suse.com> <Pine.LNX.4.44L0.1907251057110.1512-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1907251057110.1512-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 8 Aug 2019 20:54:46 +0200
Message-ID: <CAAeHK+wb8=Z65_1CGcj0ShT6+NiQSDKhEkBVx+8vPe3kJF8+6g@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in usbhid_power
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 25, 2019 at 5:09 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, 25 Jul 2019, Oliver Neukum wrote:
>
> > Am Mittwoch, den 24.07.2019, 17:02 -0400 schrieb Alan Stern:
> > > On Wed, 24 Jul 2019, Oliver Neukum wrote:
> > >
> > > >  drivers/hid/usbhid/hid-core.c | 13 +++++++++++++
> > > >  1 file changed, 13 insertions(+)
> > > >
> > > > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> > > > index c7bc9db5b192..98b996ecf4d3 100644
> > > > --- a/drivers/hid/usbhid/hid-core.c
> > > > +++ b/drivers/hid/usbhid/hid-core.c
> > > > @@ -1229,6 +1229,17 @@ static int usbhid_power(struct hid_device *hid, int lvl)
> > > >   struct usbhid_device *usbhid = hid->driver_data;
> > > >   int r = 0;
> > > >
> > > > + spin_lock_irq(&usbhid->lock);
> > > > + if (test_bit(HID_DISCONNECTED, &usbhid->iofl)) {
> > > > +         r = -ENODEV;
> > > > +         spin_unlock_irq(&usbhid->lock);
> > > > +         goto bail_out;
> > > > + } else {
> > > > +         /* protect against disconnect */
> > > > +         usb_get_dev(interface_to_usbdev(usbhid->intf));
> > > > +         spin_unlock_irq(&usbhid->lock);
> > > > + }
> > > > +
> > > >   switch (lvl) {
> > > >   case PM_HINT_FULLON:
> > > >           r = usb_autopm_get_interface(usbhid->intf);
> > > > @@ -1238,7 +1249,9 @@ static int usbhid_power(struct hid_device *hid, int lvl)
> > > >           usb_autopm_put_interface(usbhid->intf);
> > > >           break;
> > > >   }
> > > > + usb_put_dev(interface_to_usbdev(usbhid->intf));
> > > >
> > > > +bail_out:
> > > >   return r;
> > > >  }
> > >
> > > Isn't this treating the symptom instead of the cause?
> >
> > Sort of. Holding a reference for the whole time would have merit,
> > but I doubt it is strictly necessary.
>
> Just to be crystal clear, I was talking about a device reference --
> usb_{get,put}_dev or usb_{get,put}_intf -- not a runtime PM reference.
>
> (Incidentally, your patch could be simplified by using usb_get_intf
> instead of usb_get_dev.)
>
> > > Shouldn't the hid_device hold a reference to usbhid->intf throughout
> > > its lifetime?  That way this sort of problem wouldn't arise in any
> > > routine, not just usbhid_power().
> >
> > Unfortunately the semantics would still be wrong without the check
> > in corner cases. In case disconnect() is called without a physical
> > unplug, we must not touch the power state.
> > I am indeed afraid that in that case my putative fix is still racy.
> > But I don't to just introduce a mutex just for this. Any ideas?
>
> That's a separate issue.  USB drivers -- indeed, all drivers -- are
> required to balance their runtime PM gets and puts (although in the
> case of a physical disconnection it doesn't matter).  Are you asking
> about the best way to do this?
>
> Normally a driver's release or disconnect routine will stop all
> asynchronous accesses to the device (interrupt handlers, work queues,
> URBs, and so on).  At that point the only remaining runtime PM activity
> will be whatever the routine itself does.  So it can see if any extra
> runtime PM gets or puts are needed, and do whatever is necessary.
>
> Does that answer your question?  I can't tell for sure...
>
> Note: I did not try to track down the reason for the invalid access
> reported by syzbot.  It looked like a simple use-after-free, which
> would normally be fixed by taking the appropriate reference.  Which is
> what your patch does, except that it holds the reference only for a
> short time instead of over the entire lifetime of the private data
> structure (the usbhid structure), which is what normally happens.

This report looks like very similar to these two:

https://syzkaller.appspot.com/bug?extid=b156665cf4d1b5e00c76
https://syzkaller.appspot.com/bug?extid=3cbe5cd105d2ad56a1df

Maybe we should mark those two as duplicates.

Hillf suggested a fix on one of them, but it looks different from what
you propose:

https://groups.google.com/d/msg/syzkaller-bugs/xW7LvKfpyn0/SpKbs5ZLEAAJ
