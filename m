Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28272125072
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2019 19:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfLRST1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Dec 2019 13:19:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:37900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726960AbfLRST0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Dec 2019 13:19:26 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EAF3121582;
        Wed, 18 Dec 2019 18:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576693165;
        bh=W1YWBiNPG9jNM5SC4jK0qOOMJ4yVd5QREeChUcP7gUM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jg0sVF1DOJgtcVcgvECKp5Bby4K4KZq4fXFM0Ugp4ExeyeYtY6K0RG/r/GnDwgUkk
         gO+8zzfaR7cioH3OBXAYcEA8NHAEc0a2CSWAOQkg16aVQ6eFeVbGssN8z5f1+TWHxk
         IR9KaDFiaTIv5J8KF8v8fqzX1KGFXUSWv/zl7iuE=
Date:   Wed, 18 Dec 2019 19:19:21 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Subject: Re: [PATCH v3 1/1] usb: gadget: add raw-gadget interface
Message-ID: <20191218181921.GA882018@kroah.com>
References: <cover.1576087039.git.andreyknvl@google.com>
 <f45a20db3e5b01002ae8c91b3a8ea58e38b7bb65.1576087039.git.andreyknvl@google.com>
 <20191218132328.GA121143@kroah.com>
 <CAAeHK+zXegV1GmSKD8Y3-hTbKUQceWdfo+GJPxSSzYr0zQTYKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+zXegV1GmSKD8Y3-hTbKUQceWdfo+GJPxSSzYr0zQTYKw@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 18, 2019 at 06:28:19PM +0100, Andrey Konovalov wrote:
> On Wed, Dec 18, 2019 at 2:23 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Dec 11, 2019 at 07:02:41PM +0100, Andrey Konovalov wrote:
> > > USB Raw Gadget is a kernel module that provides a userspace interface for
> > > the USB Gadget subsystem. Essentially it allows to emulate USB devices
> > > from userspace. Enabled with CONFIG_USB_RAW_GADGET. Raw Gadget is
> > > currently a strictly debugging feature and shouldn't be used in
> > > production.
> > >
> > > Raw Gadget is similar to GadgetFS, but provides a more low-level and
> > > direct access to the USB Gadget layer for the userspace. The key
> > > differences are:
> > >
> > > 1. Every USB request is passed to the userspace to get a response, while
> > >    GadgetFS responds to some USB requests internally based on the provided
> > >    descriptors. However note, that the UDC driver might respond to some
> > >    requests on its own and never forward them to the Gadget layer.
> > >
> > > 2. GadgetFS performs some sanity checks on the provided USB descriptors,
> > >    while Raw Gadget allows you to provide arbitrary data as responses to
> > >    USB requests.
> > >
> > > 3. Raw Gadget provides a way to select a UDC device/driver to bind to,
> > >    while GadgetFS currently binds to the first available UDC.
> > >
> > > 4. Raw Gadget uses predictable endpoint names (handles) across different
> > >    UDCs (as long as UDCs have enough endpoints of each required transfer
> > >    type).
> > >
> > > 5. Raw Gadget has ioctl-based interface instead of a filesystem-based one.
> >
> > Looks good to me, only minor comments below.
> 
> Great, thanks!
> 
> About reworking the logging to use dev_err/dbg(): can I pass the
> global miscdevice struct into those macros? Or should I pass a pointer
> to this struct into all of the functions that print log messages? The
> latter seems unnecessarily complex, unless there's a reason to do
> that.

Ah, you are right, you only have one misc device here.  No, that's not
good, but you can use it for some messages (your ioctl errors), but
ideally you will have a struct device somewhere for each of the
"instances" you create, right?  That is what you should use for that.

> > > +struct raw_dev {
> > > +     struct kref                     count;
> > > +     spinlock_t                      lock;
> > > +
> > > +     const char                      *udc_name;
> > > +     struct usb_gadget_driver        driver;
> >
> > A dev embeds a driver?
> >
> > Not a pointer?
> >
> > But you have a kref, so the reference count of this object is there,
> > right?
> 
> I didn't get this comment, could you elaborate? I can make it a
> pointer, but for each raw_dev we have a unique usb_gadget_driver
> instance, so embedding it as is is simpler.

Ok, that's fine.  But it feels odd creating a driver dynamically to me,
but it should work (as you show.)  It doesn't give you something to use
for the dev_* messages directly, ah, but you do have something:

> > > +
> > > +     /* Protected by lock: */
> > > +     enum dev_state                  state;
> > > +     bool                            gadget_registered;
> > > +     struct usb_gadget               *gadget;

There, use that pointer for your dev_* messages, and you should be fine.

> > > +static void gadget_unbind(struct usb_gadget *gadget)
> > > +{
> > > +     struct raw_dev *dev = get_gadget_data(gadget);
> > > +     unsigned long flags;
> > > +
> > > +     spin_lock_irqsave(&dev->lock, flags);
> > > +     set_gadget_data(gadget, NULL);
> > > +     spin_unlock_irqrestore(&dev->lock, flags);
> > > +     /* Matches kref_get() in gadget_bind(). */
> > > +     kref_put(&dev->count, dev_free);
> >
> > What protects the kref from being called 'put' twice on the same
> > pointer at the same time?  There should be some lock somewhere, right?
> 
> Hm, kref_put() does refcount_dec_and_test(), which in turns calls
> atomic_dec_and_test(), so this is protected against concurrent puts
> (which is the whole idea of kref?), and no locking is needed. Unless I
> misunderstand something.

It's late, but there should be some lock somewhere to prevent a race
around this type of thing.  That's why we have kref_put_mutex() and
kref_put_lock().

Odds are you are fine here, but just something to be aware of...

thanks,

greg k-h
