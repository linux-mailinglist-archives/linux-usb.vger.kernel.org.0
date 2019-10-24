Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0CA8E3B6C
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 20:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504186AbfJXS4D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 14:56:03 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39857 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504189AbfJXS4B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 14:56:01 -0400
Received: by mail-pg1-f194.google.com with SMTP id p12so14771014pgn.6
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2019 11:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zIsOYlF+Hfsx0uQ6HDxs/ZLm/Efmg1cPtI+tKoRa+Ng=;
        b=fwQs8HtsbJC9TUXndyJvvRCSoM3v6KN1oAJTDP4jM6iDp7RiEChmUmkSfgcD9hrL32
         dx4RALPc8vlvE5fZ/IQbv0hnM6XhYSw01JxzCQbLwgA0U4VbrnHk7p1AmgcsbwUweSnT
         FIjrOwiJF5IE7d1++6ArnJN3EZAH9wAePU20+J7wEZYcQUvvMQJPZX/t/m1/TWMAKDoX
         jvFHVfTgM5DBQG2eLVTWNpVQX4tJoaIP29Oapbf6H3Q+ogUaYIdWv8KQ/loM6fGpi6kt
         ERDAVhC7vZAsJ+NLuPJFLEkDkdKn0boNcGRQ5CpiNLbMVUBSG7stG68qLSb1aevbFfYI
         tkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zIsOYlF+Hfsx0uQ6HDxs/ZLm/Efmg1cPtI+tKoRa+Ng=;
        b=VxLkPaVaeAtChacL0HKghjj6Esf0i3CSaSo0ITPz/QOGsGUle7Dzbp7MmMy+RVJSrO
         1qsmB0PdbOI3dbC9H86OgbtUpzP6thybsY3Ioq3mLmFZubHgK+t91e6eubQZErycj/A3
         le4+vmq3R91uexaYfgH3qqb1V28nScj31lIUQsaR8IDV12DivhSW+r+YSXep+FfcaHOc
         6/pwcTZxmfwP2uDa3jgQFKZEDE8QyOl15pmZ7pwoFF77yhK2wqcj9WMu973GoEjhETUo
         B8THhenqgdK/5GyDDaBQTd0JgDakhdqfvsmoW6Rd1INTIWvBXt1NiQvUGxM495bWNJAM
         a2Kg==
X-Gm-Message-State: APjAAAWeOQatwK9TPinCdm10/3Vi/FIcY2gkODWD3uLTF4taFvi+eSHP
        5nsau5uSrt76/F3l1HGmfYqmp8rhlPpEBsvLVINPFQ==
X-Google-Smtp-Source: APXvYqwaOT3FEr+3qKwPmfNbI0gl2kNtUMfI82LNX1yvphFCTA/cRn6O4jDY8NzKyj6NhNKToKL6mL0jsxkmXM0wkH8=
X-Received: by 2002:a63:541e:: with SMTP id i30mr18286107pgb.130.1571943359247;
 Thu, 24 Oct 2019 11:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+xHTtkSRkMv5kV1hKcR3mhTPkyfUparka3oRBSs6U8yLQ@mail.gmail.com>
 <Pine.LNX.4.44L0.1910241336130.1318-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1910241336130.1318-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 24 Oct 2019 20:55:48 +0200
Message-ID: <CAAeHK+yu2MYmh86wJ_DxYoUEU-vp9R+jXRVMh_SpsSNFdHVO7g@mail.gmail.com>
Subject: Re: divide error in dummy_timer
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+8ab8bf161038a8768553@syzkaller.appspotmail.com>,
        "Jacky . Cao @ sony . com" <Jacky.Cao@sony.com>,
        Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 24, 2019 at 7:57 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, 24 Oct 2019, Andrey Konovalov wrote:
>
> > > Is this really the sort of thing we need to catch?  It isn't a bug in
> > > any existing kernel code, as far as I know.  Maybe only gadgetfs and
> > > configfs need to worry about it.
> >
> > Hi Alan,
> >
> > Do you mean that the gadget driver must ensure that the max packet
> > size in the endpoint descriptor is not zero? Do HCDs rely on that? I
> > can add this check into the driver we use for USB fuzzing.
>
> Well, if there are any gadget drivers in the kernel which do set an
> endpoint's maxpacket size to 0, they should be fixed.  I'm not aware of
> any.
>
> Of course, gadget drivers in userspace are always suspect.  That's why
> I suggested having gadgetfs and configfs perform this check.  Even so
> it's not really a _security_ risk, because only the superuser is
> allowed to run a userspace gadget driver.  (Although obviously it is
> better to have a clean failure than to crash the system when a buggy
> program runs with superuser privileges.)
>
> Yes, HCDs do depend on endpoints having reasonable maxpacket values.  I
> suppose the core should check for this.  Currently we check for values
> that are too large or invalid in other ways (like high-speed bulk
> endpoints with maxpacket != 512), but we don't check for 0.

Oh, I think I've confused the terms here. I meant to ask about UDCs.
The question is whether it's OK to try and emulate a gadget with
maxpacket = 0 on a board with a hardware UDC? Or can it cause issues?
The fact that HCDs must ensure correct maxpacket values of course
makes sense.

>
> In fact, that sounds like a much better solution to the problem
> overall.  Let's see if this patch fixes the bug...
>
> Alan Stern
>
> #syz test: https://github.com/google/kasan.git 22be26f7
>
>  drivers/usb/core/config.c |    5 +++++
>  1 file changed, 5 insertions(+)
>
> Index: usb-devel/drivers/usb/core/config.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/config.c
> +++ usb-devel/drivers/usb/core/config.c
> @@ -348,6 +348,11 @@ static int usb_parse_endpoint(struct dev
>
>         /* Validate the wMaxPacketSize field */
>         maxp = usb_endpoint_maxp(&endpoint->desc);
> +       if (maxp == 0) {
> +               dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has wMaxPacketSize 0, skipping\n",
> +                   cfgno, inum, asnum, d->bEndpointAddress);
> +               goto skip_to_next_endpoint_or_interface_descriptor;
> +       }
>
>         /* Find the highest legal maxpacket size for this endpoint */
>         i = 0;          /* additional transactions per microframe */
>
