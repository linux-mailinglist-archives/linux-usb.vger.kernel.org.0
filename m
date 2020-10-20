Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFDD0286906
	for <lists+linux-usb@lfdr.de>; Wed,  7 Oct 2020 22:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbgJGU3U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Oct 2020 16:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgJGU3T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Oct 2020 16:29:19 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4878C0613D2
        for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2020 13:29:19 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k8so2079506pfk.2
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2020 13:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l3f8u+o7Wxn0SzLj42qtZwHgKYsu0609rXHJ8bNzD/s=;
        b=h+j1laDsPci4uNsZTmO6UioL8RIyeYMb5QZp0fKUNU13H28KQl9ce8Zt+4IBOT3VLQ
         H+JmiMq3iq5yCyu43APmr1b10/C5jN/Wdttar4JG9MhBne+LEF0hgWuVqe7C04oJpo/a
         Ds+fWYUeBSCdwluvnU40PC7B2+laUfq2KOU0i797WkyDQQfwH3Kz0r1llRQ0mNSiuw+C
         1yCcv9xYemoGUQ/Zd5A5v4xUwnWdhghVD1F0uQxhSycO+BR5dHBDoq6Y3xY8YiqS/ec/
         RKqcuJX4we0NJgDoQ58jfI6bIzPRGFw8E/FBX4sO855cjZUvsB5uvt/c+jsrgFZJE1Dx
         lZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l3f8u+o7Wxn0SzLj42qtZwHgKYsu0609rXHJ8bNzD/s=;
        b=RVCQyAVI9FDDyAA4c7nrujSO70rsSbcuamiQ3DGAGLhysxpllmSHWPQYFdapuqROXl
         bm/Gob+dyBTGCVrtvwJeJhV2H4Aiu0OXt5jfQOdLoOFqq3qXYMCB4F90czbQgT6rLv1z
         xdfgbc1/0SNVlA0yMOkqrY2mYz3Lpwzwuz5Gb3gOvQOv4WIfU0zt4PaXZLHUfme8y8hF
         213e3pvgzm8UIxs3fwxaErw9kMFvu3E7n4dT9BJAS22zEMY1IBtfAVEUuWR1jYImfWzX
         T4att68YrSBontrBohFJ4xxeLZCwWmwFeT3f0YHOTTKJ2bFj4sUUx9mn3dE2HZH9UnAc
         p+Gg==
X-Gm-Message-State: AOAM5332W8vKg1YQUnn87qbu/tv89zsiyeAB4IS0YX7nnR7jpoC1YPee
        75C7sgOCh66jHZ1VIeKDU+8PYBaGpM8ZQHLmOrvjmA==
X-Google-Smtp-Source: ABdhPJwK+g5kS2cb1MfZRv0nGCff5eyN+Grtrb0FT4WKwO54msr68X0xz39uabaLkLtTFF9v1uPa3NeUwZCRG5KyS3s=
X-Received: by 2002:a62:7695:0:b029:152:3ddd:24a3 with SMTP id
 r143-20020a6276950000b02901523ddd24a3mr4226723pfc.2.1602102559126; Wed, 07
 Oct 2020 13:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <8c71349c3cd9698b8edcfbfc9631c5dcc3b29a37.1602091732.git.andreyknvl@google.com>
 <20201007192945.GB468921@rowland.harvard.edu> <CAAeHK+yV=mmrgyor=AeYq6SpLaqvpieHP51iTMrjNHLBhKDzyQ@mail.gmail.com>
 <20201007200755.GD468921@rowland.harvard.edu>
In-Reply-To: <20201007200755.GD468921@rowland.harvard.edu>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 7 Oct 2020 22:29:08 +0200
Message-ID: <CAAeHK+w33ybQfN0b2LfmXn9tOJ_gj6q7LB-sNUFBVq+-4ytscw@mail.gmail.com>
Subject: Re: [PATCH] kcov, usb, vhost: specify contexts for remote coverage sections
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shuah Khan <shuah@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Nazime Hande Harputluoglu <handeharputlu@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 7, 2020 at 10:07 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, Oct 07, 2020 at 09:54:57PM +0200, Andrey Konovalov wrote:
> > On Wed, Oct 7, 2020 at 9:29 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Wed, Oct 07, 2020 at 07:30:51PM +0200, Andrey Konovalov wrote:
> > > > Currently there's a KCOV remote coverage collection section in
> > > > __usb_hcd_giveback_urb(). Initially that section was added based on the
> > > > assumption that usb_hcd_giveback_urb() can only be called in interrupt
> > > > context as indicated by a comment before it.
> > > >
> > > > As it turns out, it's actually valid to call usb_hcd_giveback_urb() in task
> > > > context, provided that the caller turned off the interrupts; USB/IP actually
> > > > does that. This can lead to a nested KCOV remote coverage collection
> > > > sections both trying to collect coverage in task context. This isn't
> > > > supported by KCOV, and leads to a WARNING.
> > > >
> > > > The approach this patch takes is to annotate every call of kcov_remote_*()
> > > > callbacks with the context those callbacks are supposed to be executed in.
> > > > If the current context doesn't match the mask provided to a callback,
> > > > that callback is ignored. KCOV currently only supports collecting remote
> > > > coverage in two contexts: task and softirq.
> > > >
> > > > As the result, the coverage from USB/IP related usb_hcd_giveback_urb() calls
> > > > won't be collected, but the WARNING is fixed.
> > > >
> > > > A potential future improvement would be to support nested remote coverage
> > > > collection sections, but this patch doesn't address that.
> > > >
> > > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > > > ---
> > >
> > > > --- a/drivers/usb/core/hcd.c
> > > > +++ b/drivers/usb/core/hcd.c
> > > > @@ -1646,9 +1646,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
> > > >
> > > >       /* pass ownership to the completion handler */
> > > >       urb->status = status;
> > > > -     kcov_remote_start_usb((u64)urb->dev->bus->busnum);
> > > > +     kcov_remote_start_usb((u64)urb->dev->bus->busnum, KCOV_CONTEXT_SOFTIRQ);
> > > >       urb->complete(urb);
> > > > -     kcov_remote_stop();
> > > > +     kcov_remote_stop(KCOV_CONTEXT_SOFTIRQ);
> > >
> > > This isn't right.  __usb_hcd_giveback_urb() can execute in pretty much
> > > any context; its constraint is that interrupts must be disabled.
> >
> > You're right, but here we constraint kcov to only collect coverage in
> > case __usb_hcd_giveback_urb() is  executed in softirq context. This is
> > what happens when we're fuzzing USB with the dummy driver, which is
> > the case we currently take care of. Whenever someone has a desire to
> > collect coverage in other contexts, it will need to be implemented
> > separately.
>
> Oh, sorry.  I thought the constraint meant that it would be an error
> if kcov observed __usb_hcd_giveback_urb() executing in anything other
> than softirq context.

Ah, no, it will just be ignored. But I'll clarify this in v2, thank you!
