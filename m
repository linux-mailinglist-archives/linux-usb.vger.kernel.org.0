Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3501251BF
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2019 20:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfLRTXA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Dec 2019 14:23:00 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35581 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbfLRTXA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Dec 2019 14:23:00 -0500
Received: by mail-pg1-f193.google.com with SMTP id l24so1793459pgk.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2019 11:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1lrpuyzodRAJXe9cj7WS4xeUR6dCGUEFq0g86NY3jaI=;
        b=Ar7HTocj3ss1FOQ0KSQqCk77BLMaYyI5MUoXqCCjpwA5/KfyuTBlVoB2oytzOYuFZi
         SH3AgYQreSXDzQa683Nvk7/IcZL2VoxgwnHt/R6Qv76YRV2oVFZ4KlRsYe3Sn5Uo1IiJ
         OCQhpashNoGtCbWke/u3GGQorYf6hgf7SbLGhx8upORWzq95TxfaxzYJBd3Xn9oC3huF
         7DRenzD31a62zVSUcCICrgceIfFjKKVcIYKGtO7It6vWuLfgFU+cX/KGkctHdY8RoOzW
         R+qe/S/CAfkabL5VN4btu8bdPPHBt90O8hDLwc1gyOAVB/3/mjJr39U07Qy/jDVtgRBV
         jXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1lrpuyzodRAJXe9cj7WS4xeUR6dCGUEFq0g86NY3jaI=;
        b=Q0PwnL8q3zpRlUIx8pY2lT+xKx/643sTm633YE4kQgJVPwQQnob63khwfRnaY5dO6x
         El5IzkHpF/gseUAY5Fd+ExVX4V38P6lRIaAWozLJCi7ax93n0TvBsB6l/LzBBr3kZlOA
         AlgY2eetirzlxAlrUxP/EC9DTjA8dlG4Dl00iqtRGhTXNmlbCSe/wrKO7AWsTYUGK1PL
         +ZrmwK2/O8m672B9oewWdEcjHIgo0enOMUHlEyrUo5LzbWab+hAyYNozG0rzOCTD0ZHX
         +vTtgEDT9j8JWXQJs5FwT723ELziLuIm0GkUzOC+rlQEWOxXkrb5d7qq8mGfhfvypCS3
         nvrw==
X-Gm-Message-State: APjAAAXguQ3m8pK6MwaCh+Za74TBaBP/DpOfM7ThQO6pzYQh2gAitr5v
        Blgk/sUM/H4mw1XpN1O+6NVKacsLxFcQ34gXbElMAQ==
X-Google-Smtp-Source: APXvYqxf3lN/zM4WEYaZs6naC0bKRZ1Q2nxmq4+ZPqrLJWC2LzrvzdSKfL/T4ePsM/4Td1gUlUWmscZ7GK11RsXIuqg=
X-Received: by 2002:a63:31d0:: with SMTP id x199mr4890159pgx.286.1576696979210;
 Wed, 18 Dec 2019 11:22:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576087039.git.andreyknvl@google.com> <f45a20db3e5b01002ae8c91b3a8ea58e38b7bb65.1576087039.git.andreyknvl@google.com>
 <20191218132328.GA121143@kroah.com> <CAAeHK+zXegV1GmSKD8Y3-hTbKUQceWdfo+GJPxSSzYr0zQTYKw@mail.gmail.com>
 <20191218181921.GA882018@kroah.com>
In-Reply-To: <20191218181921.GA882018@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 18 Dec 2019 20:22:47 +0100
Message-ID: <CAAeHK+zqzXBwdBnfPjN+tY4y3dZ2Fb_FR0es5_-ynOZyhrL6uQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] usb: gadget: add raw-gadget interface
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 18, 2019 at 7:19 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Dec 18, 2019 at 06:28:19PM +0100, Andrey Konovalov wrote:
> > On Wed, Dec 18, 2019 at 2:23 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Dec 11, 2019 at 07:02:41PM +0100, Andrey Konovalov wrote:
> > > > USB Raw Gadget is a kernel module that provides a userspace interface for
> > > > the USB Gadget subsystem. Essentially it allows to emulate USB devices
> > > > from userspace. Enabled with CONFIG_USB_RAW_GADGET. Raw Gadget is
> > > > currently a strictly debugging feature and shouldn't be used in
> > > > production.
> > > >
> > > > Raw Gadget is similar to GadgetFS, but provides a more low-level and
> > > > direct access to the USB Gadget layer for the userspace. The key
> > > > differences are:
> > > >
> > > > 1. Every USB request is passed to the userspace to get a response, while
> > > >    GadgetFS responds to some USB requests internally based on the provided
> > > >    descriptors. However note, that the UDC driver might respond to some
> > > >    requests on its own and never forward them to the Gadget layer.
> > > >
> > > > 2. GadgetFS performs some sanity checks on the provided USB descriptors,
> > > >    while Raw Gadget allows you to provide arbitrary data as responses to
> > > >    USB requests.
> > > >
> > > > 3. Raw Gadget provides a way to select a UDC device/driver to bind to,
> > > >    while GadgetFS currently binds to the first available UDC.
> > > >
> > > > 4. Raw Gadget uses predictable endpoint names (handles) across different
> > > >    UDCs (as long as UDCs have enough endpoints of each required transfer
> > > >    type).
> > > >
> > > > 5. Raw Gadget has ioctl-based interface instead of a filesystem-based one.
> > >
> > > Looks good to me, only minor comments below.
> >
> > Great, thanks!
> >
> > About reworking the logging to use dev_err/dbg(): can I pass the
> > global miscdevice struct into those macros? Or should I pass a pointer
> > to this struct into all of the functions that print log messages? The
> > latter seems unnecessarily complex, unless there's a reason to do
> > that.
>
> Ah, you are right, you only have one misc device here.  No, that's not
> good, but you can use it for some messages (your ioctl errors), but
> ideally you will have a struct device somewhere for each of the
> "instances" you create, right?  That is what you should use for that.

OK, I think I got the idea. Will do in v4.

>
> > > > +struct raw_dev {
> > > > +     struct kref                     count;
> > > > +     spinlock_t                      lock;
> > > > +
> > > > +     const char                      *udc_name;
> > > > +     struct usb_gadget_driver        driver;
> > >
> > > A dev embeds a driver?
> > >
> > > Not a pointer?
> > >
> > > But you have a kref, so the reference count of this object is there,
> > > right?
> >
> > I didn't get this comment, could you elaborate? I can make it a
> > pointer, but for each raw_dev we have a unique usb_gadget_driver
> > instance, so embedding it as is is simpler.
>
> Ok, that's fine.  But it feels odd creating a driver dynamically to me,
> but it should work (as you show.)  It doesn't give you something to use
> for the dev_* messages directly, ah, but you do have something:
>
> > > > +
> > > > +     /* Protected by lock: */
> > > > +     enum dev_state                  state;
> > > > +     bool                            gadget_registered;
> > > > +     struct usb_gadget               *gadget;
>
> There, use that pointer for your dev_* messages, and you should be fine.
>
> > > > +static void gadget_unbind(struct usb_gadget *gadget)
> > > > +{
> > > > +     struct raw_dev *dev = get_gadget_data(gadget);
> > > > +     unsigned long flags;
> > > > +
> > > > +     spin_lock_irqsave(&dev->lock, flags);
> > > > +     set_gadget_data(gadget, NULL);
> > > > +     spin_unlock_irqrestore(&dev->lock, flags);
> > > > +     /* Matches kref_get() in gadget_bind(). */
> > > > +     kref_put(&dev->count, dev_free);
> > >
> > > What protects the kref from being called 'put' twice on the same
> > > pointer at the same time?  There should be some lock somewhere, right?
> >
> > Hm, kref_put() does refcount_dec_and_test(), which in turns calls
> > atomic_dec_and_test(), so this is protected against concurrent puts
> > (which is the whole idea of kref?), and no locking is needed. Unless I
> > misunderstand something.
>
> It's late, but there should be some lock somewhere to prevent a race
> around this type of thing.  That's why we have kref_put_mutex() and
> kref_put_lock().
>
> Odds are you are fine here, but just something to be aware of...

Ah, I see. So AFAIU kref_put_lock/mutex() are meant to be used in
cases when there might be a concurrent user that doesn't have the
reference counter incremented, but holds the lock? We don't do this
kind of stuff here.
