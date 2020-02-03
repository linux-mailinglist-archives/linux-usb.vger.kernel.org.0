Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA4C1150F1D
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2020 19:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728889AbgBCSIz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Feb 2020 13:08:55 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36070 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728319AbgBCSIz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Feb 2020 13:08:55 -0500
Received: by mail-pg1-f195.google.com with SMTP id k3so8231661pgc.3
        for <linux-usb@vger.kernel.org>; Mon, 03 Feb 2020 10:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b2IyM27KyGz4uJ+vHY0/xwqTCFrd9ysYN6CzGQ8O0cA=;
        b=cyf3WXeo+GEVwg/4OZISbxU2gp/IhQjjuTpf8rT81hx7LGyqXIgw1pC1AHBtKK8cOg
         Ed5B57Gd7EuRpya4U0ZQS6SYWIUt8ZmLpczD7cuVp0vHxXG0p3wgIY6YroY1V6mw3uFJ
         u6zQCQj+nWL4HUPvvseKDYTAEkkA4aYHxmYv42odgtN5Eq9hY/er5NgCwIpXfbCRdF72
         PLJNxPgE3dYbWh1wBM2XCpA/oqdBLfctvl2Bdsj0p/5V9Be+l2blYWAmdtlsq6WQisHZ
         In3pLgrZAuQIpEHrj69GmUsPJIEV/HoMa9JP9MMVn62C8VLvfFA2sEL2vwJTPdevw9TI
         dkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b2IyM27KyGz4uJ+vHY0/xwqTCFrd9ysYN6CzGQ8O0cA=;
        b=lvULxC5Z3ca2Bc+Ad8NwwYJxgMpyU790DWAYhSdsbBRGpSbh6mRv0ghws8iulbyz7z
         75vQS4MkZLU6BEqS/4zc4on6TP0pGc4KFdFDEJBB6b6sOMHJAbwgvOXGpRHSz1GrKYF2
         PDPX6cSHhd4l4o97lxINP0eAFMHY6eO03LKQMUhaD3ujUKa0nxntAI2FHIJDrgSc1rSp
         lCadJ1O6YECiyhcy2TP0bj4UqR6k+2Su8sQnFwMOIsk5vPIKXi5Kfw0AkDbSKWlm08S2
         Ucvzumhr20bOJ9pVggnJF8E+VJoeJgczTskz4Ekg+MEQBdZ3Xi9HsEC0cgLEfEes7aDS
         91uw==
X-Gm-Message-State: APjAAAVJbt+7i32AHN8L5kVN4a/wVlVHtJrw8UCADZIBdrAp4ATsJ5m5
        grhWk09gry9yx4VCeweKdaCaVQnwJlPslKshDfntgg==
X-Google-Smtp-Source: APXvYqyhUchSG2HsKkW7TBXJrPuGOTXzynXq+EVVt9qQtbLQHc/WCqbzSLTWdw+gfP4BBVQ/xDXtvq95tbTf5V4kZD4=
X-Received: by 2002:a65:678f:: with SMTP id e15mr26594774pgr.130.1580753332411;
 Mon, 03 Feb 2020 10:08:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579007786.git.andreyknvl@google.com> <461a787e63a9a01d83edc563575b8585bc138e8d.1579007786.git.andreyknvl@google.com>
 <87ftfv7nf0.fsf@kernel.org> <CAAeHK+wwmis4z9ifPAnkM36AnfG2oESSLAkKvDkuAa0QUM2wRg@mail.gmail.com>
 <87a7637ise.fsf@kernel.org>
In-Reply-To: <87a7637ise.fsf@kernel.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 3 Feb 2020 19:08:41 +0100
Message-ID: <CAAeHK+zNuqwmHG4NJwZNtQHizdaOpriHxoQffZHMffeke_hsGQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] usb: gadget: add raw-gadget interface
To:     Felipe Balbi <balbi@kernel.org>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 31, 2020 at 4:22 PM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi,
>
> Andrey Konovalov <andreyknvl@google.com> writes:
> >> > diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> >> > new file mode 100644
> >> > index 000000000000..51796af48069
> >> > --- /dev/null
> >> > +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> >> > @@ -0,0 +1,1068 @@
> >> > +// SPDX-License-Identifier: GPL-2.0
> >>
> >> V2 only
> >
> > Like this: SPDX-License-Identifier: GPL-2.0 only ?
>
> Right, you need to choose if you want 2.0-only or 2.0-or-later and make
> sure spdx and module_license() agree.
>
> https://spdx.org/licenses/GPL-2.0-only.html
>
> What you had before, implies GPL-2.0-only...
>
> >> > +MODULE_LICENSE("GPL");
>
> but this is GPL 2+
>
> /me goes look
>
> Actually Thomas Gleixner changed the meaning of MODULE_LICENSE("GPL"),
> so I don't really know how this should look today.
>
> >> > +static int raw_event_queue_add(struct raw_event_queue *queue,
> >> > +     enum usb_raw_event_type type, size_t length, const void *data)
> >> > +{
> >> > +     unsigned long flags;
> >> > +     struct usb_raw_event *event;
> >> > +
> >> > +     spin_lock_irqsave(&queue->lock, flags);
> >> > +     if (WARN_ON(queue->size >= RAW_EVENT_QUEUE_SIZE)) {
> >> > +             spin_unlock_irqrestore(&queue->lock, flags);
> >> > +             return -ENOMEM;
> >> > +     }
> >> > +     event = kmalloc(sizeof(*event) + length, GFP_ATOMIC);
> >>
> >> I would very much prefer dropping GFP_ATOMIC here. Must you have this
> >> allocation under a spinlock?
> >
> > The issue here is not the spinlock, but that this might be called in
> > interrupt context. The number of atomic allocations here is restricted
> > by 128, and we can reduce the limit even further (until some point in
> > the future when and if we'll report more different events). Another
> > option would be to preallocate the required number of objects
> > (although we don't know the required size in advance, so we'll waste
> > some memory) and use those. What would you prefer?
>
> I think you shouldn't do either :-) Here's what I think you should do:
>
> 1. support O_NONBLOCK. This just means conditionally removing your
>    wait_for_completion_interruptible().

I don't think non blocking read/writes will work for us. We do
coverage-guided fuzzing and need to collect coverage for each syscall.
In the USB case "syscall" means processing a USB request from start to
end, and thus we need to wait until the kernel finishes processing it,
otherwise we'll fail to associate coverage properly (It's actually a
bit more complex, as we collect coverage for the whole initial
enumeration process as for one "syscall", but the general idea stands,
that we need to wait until the operation finishes.)

>
> 2. Every time user calls write(), you usb_ep_alloc(), allocate a buffer
>    with the write size, copy buffer to kernel space,
>    usb_ep_queue(). When complete() callback is called, then you free the
>    request. This would allow us to amortize the cost of copy_from_user()
>    with several requests being queued to USB controller.

I'm not sure I really get this part. We'll still need to call
copy_from_user() and usb_ep_queue() once per each operation/request.
How does it get amortized? Or do you mean that having multiple
requests queued will allow USB controller to process them in bulk?
This makes sense, but again, we"ll then have an issue with coverage
association.

>
> 3. Have a pre-allocated list of requests (128?) for read(). Enqueue them
>    all during set_alt(). When user calls read() you will:
>
>    a) check if there are completed requests to be copied over to
>       userspace. Recycle the request.
>
>    b) if there are no completed requests, then it depends on O_NONBLOCK
>
>       i) If O_NONBLOCK, return -EWOULDBLOCK
>       ii) otherwise, wait_for_completion

See response to #1, if we prequeue requests, then the kernel will
start handling them before we do read(), and we'll fail to associate
coverage properly. (This will also require adding another ioctl to
imitate set_alt(), like the USB_RAW_IOCTL_CONFIGURE that we have.)

> I think this can all be done without any GFP_ATOMIC allocations.

Overall, supporting O_NONBLOCK might be a useful feature for people
who are doing something else other than fuzzing, We can account for
potential future extensions that'll support it, so detecting
O_NONBLOCK and returning an error for now makes sense.

WDYT?

Thanks!
