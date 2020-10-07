Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7E42868AB
	for <lists+linux-usb@lfdr.de>; Wed,  7 Oct 2020 21:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbgJGTzJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Oct 2020 15:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgJGTzJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Oct 2020 15:55:09 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288E2C0613D2
        for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2020 12:55:09 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id e10so2018434pfj.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2020 12:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z1nIr7U6QQK+eKV1AqoVrPMZ6TfX5sEiAi786fm49fw=;
        b=UpSaDqgjCT7Tht8mdHOhS5ieHrnDGYukp1sMbtG+cMb8+wUEMs20Etk2bUUBM8nx71
         44smUHBfYm6VeS4jH+5AFzutTw/byjl9ulFKv0z/73Wd3POerxhFoN676H8cKNb+pRg9
         uNQd9gOyy0Bw0yxPA7tR+6iYmV/8BH088GvdekAKqzMl+mL2wM4EcuuSMgyd51h7Na5n
         +trgAI0PIV0Q3hw+rGNYqWAoBXeSbujGc0qkEDswskIkJuEEB5OPMfH7jAHq7So+fNzg
         dmTS0FNWphLEKds67LByWMVabWlH/SnnWmoB4LOZP8Z25MY1gREZlo94YUe9Nk5EvrDm
         kcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z1nIr7U6QQK+eKV1AqoVrPMZ6TfX5sEiAi786fm49fw=;
        b=n2R9VNsml1nTViCG0ku3pcV6Wy/JjGPj+e+7OnS4McKxW5nIEnqKK+w3wUDivZVilb
         DAFFshxyjxZEctIKjSdOKXKymQ4vy+5mh2plEgZOkwNm4b1ardoDW1te85CNJIUEwazS
         HVB3XwdZ6e9A7NMMKCEMiLZQHNHRfAZ60zuxY38hQhWFjW+O7GOuLsc5Cq605vks84LQ
         PIHGzSsByqvgZyOg3u/KsllaqpJ0lGE9ZZmBifYGNFXo/NqWzUrTpccQ9lehLuG2ICX5
         bO4KUg/DBYnlWqy0gIei7eNTOKXi5biam9vCMg+SKSOEmGe+sKozk1G9zRK85JGlFqAf
         1Nkw==
X-Gm-Message-State: AOAM533lXdIOuJ1vJ+zcJh+On7a7dkYR613YqcaWYJOkstsJJzvoDyL+
        E2dO3CwhHlKmepyBN7Cp7QHR21Ck8O+2Pa+nqxa3qwNOZy0opJF7
X-Google-Smtp-Source: ABdhPJyAr2r2MEVZi+BvPW15TYdt0AHpUY+efF8zbIYRM8BNUsYRCsDObuErLqq3dR5FB3hRK6ks0qU5ktWnS1C34lY=
X-Received: by 2002:a17:90a:cb92:: with SMTP id a18mr4188421pju.136.1602100508165;
 Wed, 07 Oct 2020 12:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <8c71349c3cd9698b8edcfbfc9631c5dcc3b29a37.1602091732.git.andreyknvl@google.com>
 <20201007192945.GB468921@rowland.harvard.edu>
In-Reply-To: <20201007192945.GB468921@rowland.harvard.edu>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 7 Oct 2020 21:54:57 +0200
Message-ID: <CAAeHK+yV=mmrgyor=AeYq6SpLaqvpieHP51iTMrjNHLBhKDzyQ@mail.gmail.com>
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

On Wed, Oct 7, 2020 at 9:29 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, Oct 07, 2020 at 07:30:51PM +0200, Andrey Konovalov wrote:
> > Currently there's a KCOV remote coverage collection section in
> > __usb_hcd_giveback_urb(). Initially that section was added based on the
> > assumption that usb_hcd_giveback_urb() can only be called in interrupt
> > context as indicated by a comment before it.
> >
> > As it turns out, it's actually valid to call usb_hcd_giveback_urb() in task
> > context, provided that the caller turned off the interrupts; USB/IP actually
> > does that. This can lead to a nested KCOV remote coverage collection
> > sections both trying to collect coverage in task context. This isn't
> > supported by KCOV, and leads to a WARNING.
> >
> > The approach this patch takes is to annotate every call of kcov_remote_*()
> > callbacks with the context those callbacks are supposed to be executed in.
> > If the current context doesn't match the mask provided to a callback,
> > that callback is ignored. KCOV currently only supports collecting remote
> > coverage in two contexts: task and softirq.
> >
> > As the result, the coverage from USB/IP related usb_hcd_giveback_urb() calls
> > won't be collected, but the WARNING is fixed.
> >
> > A potential future improvement would be to support nested remote coverage
> > collection sections, but this patch doesn't address that.
> >
> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > ---
>
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -1646,9 +1646,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
> >
> >       /* pass ownership to the completion handler */
> >       urb->status = status;
> > -     kcov_remote_start_usb((u64)urb->dev->bus->busnum);
> > +     kcov_remote_start_usb((u64)urb->dev->bus->busnum, KCOV_CONTEXT_SOFTIRQ);
> >       urb->complete(urb);
> > -     kcov_remote_stop();
> > +     kcov_remote_stop(KCOV_CONTEXT_SOFTIRQ);
>
> This isn't right.  __usb_hcd_giveback_urb() can execute in pretty much
> any context; its constraint is that interrupts must be disabled.

You're right, but here we constraint kcov to only collect coverage in
case __usb_hcd_giveback_urb() is  executed in softirq context. This is
what happens when we're fuzzing USB with the dummy driver, which is
the case we currently take care of. Whenever someone has a desire to
collect coverage in other contexts, it will need to be implemented
separately.
