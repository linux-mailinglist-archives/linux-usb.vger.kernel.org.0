Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED8B1EB81B
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 11:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgFBJOZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 05:14:25 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33398 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725811AbgFBJOY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jun 2020 05:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591089262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4RDDGu/p3yDXdb7tcQQ0NXx81PbLpa+m/UKBUd+JAOM=;
        b=Oo56AxdHmF7A3xu3tjLlX+cY6uR00oyqyghbu8RBjn3LyKNkuLKpxAIzLHxzjRZNF7k/nW
        /g/CpN9jkiqQqZ+oByJwgBEEwlfEgB/KtCaVMhpVY7CEgXkQ0VZA5P7+vSwdtmePMb4Ybc
        fQnWKHirGKwHwaiCCgYelG/XriIzxWQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-VhfqUjRVOx-Eyyv9rakqFw-1; Tue, 02 Jun 2020 05:14:21 -0400
X-MC-Unique: VhfqUjRVOx-Eyyv9rakqFw-1
Received: by mail-qv1-f71.google.com with SMTP id r4so2861402qvh.10
        for <linux-usb@vger.kernel.org>; Tue, 02 Jun 2020 02:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4RDDGu/p3yDXdb7tcQQ0NXx81PbLpa+m/UKBUd+JAOM=;
        b=UTpNedXKvSea5Sp6FkX9KzoO9Om8r/puxizcvcNs4xhaE2vmb1XK2vmSCrdifM0Wn5
         R1Vd83X0zcS8Fo8qbYtB2SZmCVRBpDSg2qVM6z0Xc/5nAB8L5G4BgBGzY8BSmv2i+h1g
         LTi503jOHICMiTF5n2Fg5cepCc54QwoPPQc1htqt+hVjKssSmJF+53wtn+8mWJAEPywB
         T7IuCWTsa8tdBoYr/1MR9b86uTiiKiIIkS3aXvru0A9b5fH3KfpdUxIZpAVgl9TcKzpl
         mQ8+UisS2tidsh++j7fmbvGvxb3NUd29lMRedQJj/yEHAN7FeYKULwLJgPTVSxSLuFbL
         UJiA==
X-Gm-Message-State: AOAM530mDqbkwyA6mY9t7yDFk+ZxKJqpNJaX5TZtjlJCvKkK72B7Dfx0
        E/hHvjvZTpSCT6dT2oaDCMvbAH3g0ygkNn04xn6FpDDRIFSFq6ym1pq64NM15yxtxOfZ2XD7OHB
        bAStcq02/v8E5S3gk1JAqKZZkoo/esljCZZXV
X-Received: by 2002:ac8:2a3a:: with SMTP id k55mr25902502qtk.294.1591089260956;
        Tue, 02 Jun 2020 02:14:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1WsROjUW769DDxgpU4rag4njM1zCpRsTRcIP45qynEm0hFX3w+3IiwkjfSW1L8qjbkw7t1oMXMfjCmYljgak=
X-Received: by 2002:ac8:2a3a:: with SMTP id k55mr25902481qtk.294.1591089260695;
 Tue, 02 Jun 2020 02:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200529195951.GA3767@dtor-ws> <CANMq1KDDa8jGwo9BNneJ=8y1HunM9hiRS2c0i5ASJ6+X4qvodw@mail.gmail.com>
 <CABXOdTeTHUtWyutfQ3oO7c_g=q5GrDsdKZbSe1dwLWSeNFi-sQ@mail.gmail.com>
 <20200530010926.GM89269@dtor-ws> <CABXOdTexbFqvHNALBeXrU5djbrLaK93fBTd6_rTCOhbEadYRgg@mail.gmail.com>
 <20200530013419.GN89269@dtor-ws> <nycvar.YFH.7.76.2006011912150.13242@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2006011912150.13242@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 2 Jun 2020 11:14:09 +0200
Message-ID: <CAO-hwJLTrGs39OsxtY_r0He02Au64vg1x1_tzGjCQzyNzBCARw@mail.gmail.com>
Subject: Re: [PATCH] HID: usbhid: do not sleep when opening device
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Guenter Roeck <groeck@google.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 1, 2020 at 7:13 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Fri, 29 May 2020, Dmitry Torokhov wrote:
>
> > > > > > > usbhid tries to give the device 50 milliseconds to drain its queues
> > > > > > > when opening the device, but does it naively by simply sleeping in open
> > > > > > > handler, which slows down device probing (and thus may affect overall
> > > > > > > boot time).
> > > > > > >
> > > > > > > However we do not need to sleep as we can instead mark a point of time
> > > > > > > in the future when we should start processing the events.
> > > > > > >
> > > > > > > Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > > > ---
> > > > > > >  drivers/hid/usbhid/hid-core.c | 27 +++++++++++++++------------
> > > > > > >  drivers/hid/usbhid/usbhid.h   |  1 +
> > > > > > >  2 files changed, 16 insertions(+), 12 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> > > > > > > index c7bc9db5b192..e69992e945b2 100644
> > > > > > > --- a/drivers/hid/usbhid/hid-core.c
> > > > > > > +++ b/drivers/hid/usbhid/hid-core.c
> > > > > > > @@ -95,6 +95,19 @@ static int hid_start_in(struct hid_device *hid)
> > > > > > >                                 set_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > > > > > >                 } else {
> > > > > > >                         clear_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > > > > > > +
> > > > > > > +                       if (test_and_clear_bit(HID_RESUME_RUNNING,
> > > > > > > +                                              &usbhid->iofl)) {
> > > > > > > +                               /*
> > > > > > > +                                * In case events are generated while nobody was
> > > > > > > +                                * listening, some are released when the device
> > > > > > > +                                * is re-opened. Wait 50 msec for the queue to
> > > > > > > +                                * empty before allowing events to go through
> > > > > > > +                                * hid.
> > > > > > > +                                */
> > > > > > > +                               usbhid->input_start_time = jiffies +
> > > > > > > +                                                          msecs_to_jiffies(50);
> > > > > > > +                       }
> > > > > > >                 }
> > > > > > >         }
> > > > > > >         spin_unlock_irqrestore(&usbhid->lock, flags);
> > > > > > > @@ -280,7 +293,8 @@ static void hid_irq_in(struct urb *urb)
> > > > > > >                 if (!test_bit(HID_OPENED, &usbhid->iofl))
> > > > > > >                         break;
> > > > > > >                 usbhid_mark_busy(usbhid);
> > > > > > > -               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> > > > > > > +               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl) &&
> > > > > > > +                   time_after(jiffies, usbhid->input_start_time)) {
> > > > > >
> > > > > > Are we worried about jiffies overflowing (32-bit@1000Hz is "only" 49.7 days...)
> > > > > >
> > > > >
> > > > > time_after() is overflow-safe. That is why it is used and jiffies is
> > > > > not compared directly.
> > > >
> > > > Well, it is overflow safe, but still can not measure more than 50 days,
> > > > so if you have a device open for 50+ days there will be a 50msec gap
> > > > where it may lose events.
> > > >
> > >
> > > Or you could explicitly use 64-bit jiffies.
> >
> > Indeed.
> >
> > Jiri, Benjamin, do you have preference between jiffies64 and ktime_t? I
> > guess jiffies64 is a tiny bit less expensive.
>
> If I would be writing the code, I'd use ktime_t, because I personally like
> that abstraction more :) But either variant works for me.

I don't have a strong opinion on either variant. Feel free to use
whatever you like the most.

Cheers,
Benjamin

>
> Thanks!
>
> --
> Jiri Kosina
> SUSE Labs
>

