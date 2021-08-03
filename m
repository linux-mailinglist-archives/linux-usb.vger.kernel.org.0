Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 712CF3DF581
	for <lists+linux-usb@lfdr.de>; Tue,  3 Aug 2021 21:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239647AbhHCTXK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Aug 2021 15:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238837AbhHCTXG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Aug 2021 15:23:06 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C680C06175F
        for <linux-usb@vger.kernel.org>; Tue,  3 Aug 2021 12:22:55 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id e4so11950051vsr.13
        for <linux-usb@vger.kernel.org>; Tue, 03 Aug 2021 12:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bJgCHqhMD9Em6pMGw1fdW71SGx2aFTx82DIaIl2I9Ys=;
        b=CCddak14A+GM99hSHiu7epE76CqnYUYPzTR8h1703l29SibcAt1oNz/tPnUdW1DmjF
         pnT0myJvC3kJ+armd3cw4bpjqyeCx1kPWmtvBMag0p5kfaqMqfcI5aLe/JZyHvQMD/ua
         bBXLn8scFNTU2y0g0w/rf0qbHQbFN+YN1LNyvJy11lMwBacFG7HJnSPUdDBCM+8QyuRJ
         Qe3tHD0Dm+ExU/8lrN1RitNdJH4MsDtW5yB1F9Mc6Bqjlw7c3gI5wl6kpcTz5CpVLbQ8
         4d6R1LTBWBMAfPQ9YP9mFbeSOAc8PxnCib1aRnb4uwiUOaSBPKqvWr2MiZFyQfwOTRkt
         Y3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bJgCHqhMD9Em6pMGw1fdW71SGx2aFTx82DIaIl2I9Ys=;
        b=XqgSx/RwHlvAZgPLgye6dpjCWADFDx2ALfG1ekyrN2DBWmtpVu9EIeDCkh20zppGiI
         XqHYG5r7wiH5dL9kJH3Llga86aRTi9Ypzw6G3e+++RYcUWfL1rkKH9mUVpTAH3tpLfYl
         i56dDGj6c9w1RTZw8U1aMg26WUX4apTRX2MKI832fwB5IjsLcBxOq11CSxYT5Jn6SzJg
         0IAwgmHWZ11x06IQkOu0A0FgzAXeT827E/uhWD2a7hN1Z7UA6DUpUlWqcP1yTSk8umHq
         VInwFXjzvicsj7dGYbv8xjy4W4zOe7t2QMXV3NUNDZz76n3P+P1Vowm3HZ4TVQeaNtbw
         6LUg==
X-Gm-Message-State: AOAM533gBpPMbKzDwBu69y4dobjJcY4PGHZIFjbfX6uOV8m2YLg+Oyi4
        Ow8E5iXPWvyGMeZP+9jfVBOQMV7U1PuOuhmshbPRjQ==
X-Google-Smtp-Source: ABdhPJx6WntRS1LwyAOVtG21buIXDaq5qKX689ipeUgnlSJIEfOSkf5j1LpCyFsVGCBiGtStKsd8QaYpng+Q1ojf1+8=
X-Received: by 2002:a67:d393:: with SMTP id b19mr2327100vsj.49.1628018574319;
 Tue, 03 Aug 2021 12:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210803091314.3051302-1-kyletso@google.com> <8dd797be-8912-62e4-a8da-00b8edbfb65b@roeck-us.net>
In-Reply-To: <8dd797be-8912-62e4-a8da-00b8edbfb65b@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 3 Aug 2021 12:22:18 -0700
Message-ID: <CAPTae5KO2cAgCWVOPB+D+bMtDRaH=LhoASKYdAM2_J31Q6ehGA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: Keep other events when receiving FRS
 and Sourcing_vbus events
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Kyle Tso <kyletso@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 3, 2021 at 6:48 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 8/3/21 2:13 AM, Kyle Tso wrote:
> > When receiving FRS and Sourcing_Vbus events from low-level drivers, keep
> > other events which come a bit earlier so that they will not be ignored
> > in the event handler.
> >
> > Fixes: 8dc4bd073663 ("usb: typec: tcpm: Add support for Sink Fast Role SWAP(FRS)")
> > Cc: Badhri Jagan Sridharan <badhri@google.com>
> > Signed-off-by: Kyle Tso <kyletso@google.com>
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
>
> > ---
> >   drivers/usb/typec/tcpm/tcpm.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 5b22a1c931a9..b9bb63d749ec 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -5369,7 +5369,7 @@ EXPORT_SYMBOL_GPL(tcpm_pd_hard_reset);
> >   void tcpm_sink_frs(struct tcpm_port *port)
> >   {
> >       spin_lock(&port->pd_event_lock);
> > -     port->pd_events = TCPM_FRS_EVENT;
> > +     port->pd_events |= TCPM_FRS_EVENT;
> >       spin_unlock(&port->pd_event_lock);
> >       kthread_queue_work(port->wq, &port->event_work);
> >   }
> > @@ -5378,7 +5378,7 @@ EXPORT_SYMBOL_GPL(tcpm_sink_frs);
> >   void tcpm_sourcing_vbus(struct tcpm_port *port)
> >   {
> >       spin_lock(&port->pd_event_lock);
> > -     port->pd_events = TCPM_SOURCING_VBUS;
> > +     port->pd_events |= TCPM_SOURCING_VBUS;
> >       spin_unlock(&port->pd_event_lock);
> >       kthread_queue_work(port->wq, &port->event_work);
> >   }
> >
>
