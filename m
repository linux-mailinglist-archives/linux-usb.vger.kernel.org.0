Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB82B2B1F1E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 16:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgKMPrS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 10:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbgKMPrR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 10:47:17 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2782C0617A6
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 07:47:17 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id k3so9266051otp.12
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 07:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ITN/VwmToF8JO+5dUf151w/YV2UUx/XnMJGOWKQ4yB0=;
        b=e3B8zi+09jNaeLEgxxw8TGHRusy89tboB52gu4WqUpg07/U1n/7Pnq001IusQnQbGm
         KgI7YjFCmV9THbu0RmYqbfIChtHkHnjBHtfIefezbKoYD5PijIkwWFps4fY2O7eSz0Ob
         dBOnCoBpAF6Li+NdlgJwX85OIN28aAv3IfHcjKp8zBMiSTDx1JlJQB9YlfGM36uhbZTU
         bHScsXijCTtKxfg5KLOdIsZA/xuALvcXzRJcNlpOgYCV/1Db4VGDPK9VKShDwKoT9HZ+
         NJNsNWRQvQiB4XwxwINWlHEDai31yCUxTnsI09SDH5J/iMrf3v53zSMNv1BtXP1KiuEO
         x1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ITN/VwmToF8JO+5dUf151w/YV2UUx/XnMJGOWKQ4yB0=;
        b=Q3hbhRs9eGXGqNsNfYDd0PQt9oWt3J/cC4DnUj9YrVDm+R5ANHFN1uKRUHEdEzDuha
         HG9BLXQXdb4Tdv99OjuUk1ulpCP/to0g4Em+aERvyK4MouqX9oONHG6ngvvJ+yYuwO5Z
         FeaBhlWH1od6vBeTPEmla+1ISxz3wZmRmOGM1gqDdV9xxY/NU4/0CUhTjlkmaKwrr9Ho
         cg67BSL6LtbO0YBL4oGJAzhR48Kf2fNeYJrXKPPzchO8IAJiATY/OoRgodvk3TorXqz3
         gumHvdfDhrjur0V+IJ6dPF8uzkXnEe/tblg2p2cmqnP7EwE0vfBKPvVptl+xLT0/aM+h
         PRMQ==
X-Gm-Message-State: AOAM53013DpjRXh0DF3FBhbFvCXIP4bkq+apBBWoNnVeXupD8foiqmXO
        ehKqahlSjH7CdwV+eMSabv+zM2z/2GhY2wWQih0Zlw==
X-Google-Smtp-Source: ABdhPJw4Fyli3vIWE2XQlPNOh8R9pZQFlkyPbhp1mahj4h/JWo0EdgjcEGKfBqlE3Ycn835yt0E9GRBzfsgpJ43ojGI=
X-Received: by 2002:a9d:649:: with SMTP id 67mr2020465otn.233.1605282432199;
 Fri, 13 Nov 2020 07:47:12 -0800 (PST)
MIME-Version: 1.0
References: <f3a7a153f0719cb53ec385b16e912798bd3e4cf9.1602856358.git.andreyknvl@google.com>
 <20201113123035.tjllvijjzd54npsf@linutronix.de> <CAAeHK+zd0ucaj8EJ8ro+0ekubrxp5GiBMaBULHJB05dDrzpQGw@mail.gmail.com>
 <20201113132818.zhtdhzg6ukv4wgxl@linutronix.de> <CAAeHK+yZEQ7r1bBWbUhdys8s1CntwpOyF+Fm+H=NiuK0g3KwYg@mail.gmail.com>
In-Reply-To: <CAAeHK+yZEQ7r1bBWbUhdys8s1CntwpOyF+Fm+H=NiuK0g3KwYg@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 13 Nov 2020 16:47:00 +0100
Message-ID: <CANpmjNNd1-0+UX8Pkjov7Roq-c2RHcHed2znqvMVMxmoX-3LXg@mail.gmail.com>
Subject: Re: [PATCH v4] kcov, usb: only collect coverage from
 __usb_hcd_giveback_urb in softirq
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Shuah Khan <shuah@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Nazime Hande Harputluoglu <handeharput@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 13 Nov 2020 at 14:42, Andrey Konovalov <andreyknvl@google.com> wrote:
> On Fri, Nov 13, 2020 at 2:28 PM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> >
> > On 2020-11-13 13:51:19 [+0100], Andrey Konovalov wrote:
> > > Hi Sebastian,
> >
> > Hi Andrey,
> >
> > > Replaced with what and why?
> >
> > Linus requested in
> >         https://lkml.kernel.org/r/CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com/
> >
> > that drivers should not change their behaviour on context magic like
> > in_atomic(), in_interrupt() and so on.
> > The USB bits were posted in
> >         https://lkml.kernel.org/r/20201019100629.419020859@linutronix.de

Arguably this patch is *not* changing "driver behaviour", it's only
changing how and when KCOV collects coverage, which is not related to
how the driver behaves.

> > and merged (which is probably the same time as this patch).
> >
> > I haven't look what this code should do or does but there are HCDs for
> > which this is never true like the UHCI/OHCI controller for instance.
>
> We could go back to adding softirq-specific kcov callbacks. Perhaps
> with a simpler implementation than what we had before to only cover
> this case. Something like kcov_remote_start_usb_softirq() and
> kcov_remote_stop_softirq() that do the softirq check internally.

Is this a matter of simply banning such functions entirely without
understanding their use? Because that sounds wrong. But if it is, we
probably have to just add some static inline functions in
include/linux/kcov.h that simply does the check.

Thanks,
-- Marco
