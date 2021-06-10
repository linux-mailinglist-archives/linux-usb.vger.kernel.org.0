Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28D63A2A9A
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 13:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbhFJLtO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 07:49:14 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:34766 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbhFJLtO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Jun 2021 07:49:14 -0400
Received: by mail-yb1-f195.google.com with SMTP id i6so25697001ybm.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Jun 2021 04:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gUtd6SVsmYzpQLQs6XRvTEBT66wFFZJt8Fvp/lcU4FA=;
        b=FCuyy2ZnYWSMDS2+ZyBnccdwqAW28g1jSZDJnjT2xHE7PTgIlyW0oB38JoOKt5DdZ+
         EZr61m3rV8VrFZl+m1p8JCN+phgJ6+AJ6I2kTAGZLJlZH9pn8xV4dE3+IJZdPYb2YQoF
         eJkYUszjf6iII0Cq6LBE5hlpmHQI1O/NfK7F4fr5furZL34Okiz8PbEAkeLADnSawcKO
         5d1tNwX5KbqliX9yT/SYd0XyxS0Qu5je95kRWJ/hTqQozYx8mXjKtm7EMarImPZs6AnS
         5xBeQen6eZyY++Kqs6Nbk3qqi361+qjp7qTlB9almSK6j8gLh1Ov4uZo0GjUkB9wWjxj
         vQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gUtd6SVsmYzpQLQs6XRvTEBT66wFFZJt8Fvp/lcU4FA=;
        b=AvDCpru6KVVrg5A5B0hpDHn4qoq53mD7STGJ+yNdbn69lNMxa5KxfoMswClHL9OKU1
         cDmhx6VPXq6bydfHlHMY+3AWjkoLGjTdqq0frvAKEnxADl+UHKWEd/Ix1cFnT0oB6phF
         dABk9jfLRwZ9A0HJQru5Tud/Zy12cHER++ORFu0RfOFZTycb0/1vbJkc9dqWVY+ZUd3Y
         MNIer5VQsSipfvVDOPsrwCJ+kiRVs+eaOygbhW5w3auk/vjeQIrpG7P6AQ981OEr73ty
         EqpAZ5ZiA0u4sfxNaCwPx2Rg0RXfz+uRg47Le0zw8QrsHx/uT2d70TQgWvbVFU7ADuOw
         8qrQ==
X-Gm-Message-State: AOAM533CDkHzeZLp/vrZUp+zc6dPg+ks17PJgepvTMk3bNW7ZGiCdxQw
        3NVQAM5HS8eGxxU68FI8iFJFnZFnGAuhAR2lJmY=
X-Google-Smtp-Source: ABdhPJy1LMBG+VHoFRW103TtGfBdfqYVtImve5NLwVPx3hu7tXGtCTPr5yhyEf2dpXolWSr8l5kk0ss7oEmUiXKdzpg=
X-Received: by 2002:a25:aa48:: with SMTP id s66mr6629607ybi.341.1623325564891;
 Thu, 10 Jun 2021 04:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAJa5FiHh3oWGt3qMRWTBRorENhsKNODTRd+0meK2qpYnMk6U8g@mail.gmail.com>
 <87v96m119n.fsf@kernel.org> <CAJa5FiGTsM3+QS-+9P=8EZbNxZm+MqpPM3P4KU+=nD4KeA-qew@mail.gmail.com>
 <87eeda0x28.fsf@kernel.org>
In-Reply-To: <87eeda0x28.fsf@kernel.org>
From:   kun peng <kunpeng0891@gmail.com>
Date:   Thu, 10 Jun 2021 19:45:54 +0800
Message-ID: <CAJa5FiEcMws3BWB3ZbMaqJFbW9YX1zaVjOwy-gReGqOZUV_0mQ@mail.gmail.com>
Subject: Re: usb3.0: dwc3: isoc: missisoc while setting the USB transfer UVC data
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 10, 2021 at 7:38 PM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi,
>
> kun peng <kunpeng0891@gmail.com> writes:
> > On Thu, Jun 10, 2021 at 6:07 PM Felipe Balbi <balbi@kernel.org> wrote:
> >>
> >> Hi,
> >>
> >> kun peng <kunpeng0891@gmail.com> writes:
> >> > Hi =EF=BC=8C I'm using the 4*A53 with DWC3 USB controller, my hardwa=
re to work
> >> > like a USB camera and so make use of the USB 3.0 UVC gadget driver=
=E3=80=82
> >> > usb3.0 isoc transfer with  missisoc -18=EF=BC=8Clarger maxburst is s=
et, the
> >> > more -18 appears=E3=80=82
> >> > but from trace info, the trb has been put in advance=E3=80=82
> >> >
> >> > test setting:
> >> > dwc3 driver version=EF=BC=9A5.12
> >> > PC=EF=BC=9A potplayer
> >> >
> >> > maxpacket : 3072
> >> > maxburst : 15
> >> > interval : 1
> >> > UVC_NUM_REQUESTS: 8
> >>
> >> sorry, you're running 4.14.74 kernel. That's far too old for this foru=
m
> >> to help you. Try reproducing with the latest v5.13-rc kernel.
> >>
> >> --
> >> balbi
> >
> > thanks for your reply.
> >
> > my kernel is 4.14, but usb and uvc related driver has been update to
> > 5.12.0 linux main line.
> > The problem mentioned above is after the update.
>
> right, many other things happen in the framework. You could bisect and
> try to find the offending commit, but this forum can't do much to help,
> sorry.
>
> --
> balbi

previous 4.14 was problematic, so we updated it to 5.12.
after the update:
usb2.0 isoc\bulk\ all is well.
usb3.0 isoc with many -18 error...  bulk is normal

thanks
--
kun
