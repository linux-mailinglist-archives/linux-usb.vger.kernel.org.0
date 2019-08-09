Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 720A088161
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 19:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406765AbfHIRhD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 13:37:03 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41600 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfHIRhD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 13:37:03 -0400
Received: by mail-pg1-f195.google.com with SMTP id x15so35844719pgg.8
        for <linux-usb@vger.kernel.org>; Fri, 09 Aug 2019 10:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lG3DM7VWIcMNdSmPfM2pNW8wePxvArdwmrXfSCNVEHs=;
        b=uMc0NAp3sH9OhchbVB9V3Kf9dEd2Uex9hGUSl0JV8xyoEzSMZe4roWKKNg+TUITGfH
         PFP6rciJFKsbRyE/I7vmezLG12dKSsBQOV6kzE2z/CVioiiD+3FoKHcdaBtl22GvPM+w
         /azUfAWAj/NWfIwV3/0DWjjuumer8ro5GIBhgmkYg06JdayPxd9KMafgp1S0PYlzyo5o
         5ajpSsvGz6PBIzumN6+YXz3JTvsf7zUgELfGB8KHfOYHr75ZRbx+/ron7PDWI8siHNxE
         s1aJAyZaoRlBZm9XE3BIBZhIfrdVtsKHraeocGj/830hbIOw37Dk5qXUz9mpw79GcIVJ
         zY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lG3DM7VWIcMNdSmPfM2pNW8wePxvArdwmrXfSCNVEHs=;
        b=mpchmEFZVfQC5AVEBBNwO3AC+GyhhTKC+Kiowcc0+nfaQHn306rnHbIz7UzfIpfWqx
         d4lExls9Kr9BJz6PYoKzH6SCu8d2dM5jsXovuCaau/4/rjMi4JrKZd8jqyEjSgbtfMca
         8947I9Nf7PcgOVE77Gt9PNfBKysn2haTOMpXay8Jxqco/dcMe2k5EBH+V03tMoPKIVRW
         a3y9pmh/D0FfdjXrcYxTX94tHLO5VAck984eo668Hu9wsmcR6/QJdJuTVNMBGiTuKZhr
         0dWPn2cUPoZ7u/CEJR96gy5HYERmY5NXtFan5IKugATMXTXPoCRTJsYcvQHv5HDC/Yqk
         APug==
X-Gm-Message-State: APjAAAVQHO5s11JrxXFVrkUlP4edtoUFZD9ER9+/Hy3DVCwRlilAd7U6
        vClxyLUY9iVdmTHc6EU5lH46HSKSO/iSULzKSA66wg==
X-Google-Smtp-Source: APXvYqxJ5ieoTo9TI8BDFIyBKfoRrKZMtv6Jjnd9/HMEarZQJqvcLZUsvuvzjwUHsnxMSxX5tsRoOiuZpYyLd9THNug=
X-Received: by 2002:aa7:97bb:: with SMTP id d27mr22473646pfq.93.1565372221991;
 Fri, 09 Aug 2019 10:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+wb8=Z65_1CGcj0ShT6+NiQSDKhEkBVx+8vPe3kJF8+6g@mail.gmail.com>
 <Pine.LNX.4.44L0.1908081522290.1319-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908081522290.1319-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 9 Aug 2019 19:36:49 +0200
Message-ID: <CAAeHK+yWhR2bwknCA9pTjy8qFE3-xCcEEZ5Skm5=sYCuypvo_A@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in usbhid_power
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Content-Type: multipart/mixed; boundary="0000000000003c5c32058fb29fad"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--0000000000003c5c32058fb29fad
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 8, 2019 at 9:37 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, 8 Aug 2019, Andrey Konovalov wrote:
>
> > On Thu, Jul 25, 2019 at 5:09 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Thu, 25 Jul 2019, Oliver Neukum wrote:
> > >
> > > > Am Mittwoch, den 24.07.2019, 17:02 -0400 schrieb Alan Stern:
> > > > > On Wed, 24 Jul 2019, Oliver Neukum wrote:
> > > > >
> > > > > >  drivers/hid/usbhid/hid-core.c | 13 +++++++++++++
> > > > > >  1 file changed, 13 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> > > > > > index c7bc9db5b192..98b996ecf4d3 100644
> > > > > > --- a/drivers/hid/usbhid/hid-core.c
> > > > > > +++ b/drivers/hid/usbhid/hid-core.c
> > > > > > @@ -1229,6 +1229,17 @@ static int usbhid_power(struct hid_device *hid, int lvl)
> > > > > >   struct usbhid_device *usbhid = hid->driver_data;
> > > > > >   int r = 0;
> > > > > >
> > > > > > + spin_lock_irq(&usbhid->lock);
> > > > > > + if (test_bit(HID_DISCONNECTED, &usbhid->iofl)) {
> > > > > > +         r = -ENODEV;
> > > > > > +         spin_unlock_irq(&usbhid->lock);
> > > > > > +         goto bail_out;
> > > > > > + } else {
> > > > > > +         /* protect against disconnect */
> > > > > > +         usb_get_dev(interface_to_usbdev(usbhid->intf));
> > > > > > +         spin_unlock_irq(&usbhid->lock);
> > > > > > + }
> > > > > > +
> > > > > >   switch (lvl) {
> > > > > >   case PM_HINT_FULLON:
> > > > > >           r = usb_autopm_get_interface(usbhid->intf);
> > > > > > @@ -1238,7 +1249,9 @@ static int usbhid_power(struct hid_device *hid, int lvl)
> > > > > >           usb_autopm_put_interface(usbhid->intf);
> > > > > >           break;
> > > > > >   }
> > > > > > + usb_put_dev(interface_to_usbdev(usbhid->intf));
> > > > > >
> > > > > > +bail_out:
> > > > > >   return r;
> > > > > >  }
>
> > This report looks like very similar to these two:
> >
> > https://syzkaller.appspot.com/bug?extid=b156665cf4d1b5e00c76
> > https://syzkaller.appspot.com/bug?extid=3cbe5cd105d2ad56a1df
>
> It also seems to resemble extids a7a6b9c609b9457c62c6,
> 62a1e04fd3ec2abf099e, and 75e6910bf03e266a277f, although this may be an
> illusion.
>
> > Maybe we should mark those two as duplicates.
> >
> > Hillf suggested a fix on one of them, but it looks different from what
> > you propose:
> >
> > https://groups.google.com/d/msg/syzkaller-bugs/xW7LvKfpyn0/SpKbs5ZLEAAJ
>
> Go ahead and try it out on all of them.  I don't have a clear feeling
> about it, not having worked on usbhid in quite a while.
>
> Alan Stern
>

Let's try on this one first:

#syz test: https://github.com/google/kasan.git 6a3599ce

--0000000000003c5c32058fb29fad
Content-Type: text/x-patch; charset="US-ASCII"; name="hid-core.patch"
Content-Disposition: attachment; filename="hid-core.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jz4e6neq0>
X-Attachment-Id: f_jz4e6neq0

LS0tIGEvZHJpdmVycy9oaWQvdXNiaGlkL2hpZC1jb3JlLmMKKysrIGIvZHJpdmVycy9oaWQvdXNi
aGlkL2hpZC1jb3JlLmMKQEAgLTE0MTAsNiArMTQxMCw3IEBAIHN0YXRpYyB2b2lkIHVzYmhpZF9k
aXNjb25uZWN0KHN0cnVjdCB1c2IKIAlzcGluX2xvY2tfaXJxKCZ1c2JoaWQtPmxvY2spOwkvKiBT
eW5jIHdpdGggZXJyb3IgYW5kIGxlZCBoYW5kbGVycyAqLwogCXNldF9iaXQoSElEX0RJU0NPTk5F
Q1RFRCwgJnVzYmhpZC0+aW9mbCk7CiAJc3Bpbl91bmxvY2tfaXJxKCZ1c2JoaWQtPmxvY2spOwor
CWhpZF9od19zdG9wKGhpZCk7CiAJaGlkX2Rlc3Ryb3lfZGV2aWNlKGhpZCk7CiAJa2ZyZWUodXNi
aGlkKTsKIH0K
--0000000000003c5c32058fb29fad--
