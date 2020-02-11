Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5003B159955
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 20:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbgBKTCc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 14:02:32 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:33986 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727781AbgBKTCc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Feb 2020 14:02:32 -0500
Received: (qmail 19069 invoked by uid 2102); 11 Feb 2020 14:02:30 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 11 Feb 2020 14:02:30 -0500
Date:   Tue, 11 Feb 2020 14:02:30 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Martin Townsend <mtownsend1973@gmail.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: Enumerating USB devices in the Bootloader
In-Reply-To: <CABatt_x5unKx-O0WENEHfm7az-pPXO8sayk+jWuYrksbEgghnA@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2002111400150.1574-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 11 Feb 2020, Martin Townsend wrote:

> On Mon, Feb 10, 2020 at 3:12 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Mon, 10 Feb 2020, Martin Townsend wrote:
> >
> > > Hi,
> > >
> > > We are using the USB mass storage gadget driver in Linux and
> > > everything is working fairly well but sometimes we are finding that we
> > > are exceeding the 100mA limit (which I think is the default the host
> > > will provide) before Linux has had a change to enumerate the USB
> > > device at which point we ask for 500mA.  We have tried to reduce the
> > > power by ensuring all clocks are turned off, devices not used disabled
> > > etc but can't seem to satisfy the 100mA limit.  We were thinking that
> > > maybe we could enumerate the USB device during U-Boot at which point
> > > we know we are under the 100mA limit.  Does anyone know a reason why
> > > this would not work?
> >
> > It won't work because U-Boot isn't the kernel.  When the kernel takes
> > over the USB controller, it will force the host to re-enumerate the
> > gadget -- and you will be right back where you started.
> >
> > The only way to make this work would be to prevent U-Boot from ever
> > actually booting the Linux kernel.  This probably isn't the way you
> > want your device to behave, though.
> >
> > > would at some point from U-Boot enumerating a new
> > > bMaxPower would the connection be reset and drop back to 100mA during
> > > the kernel startup? Are there any considerations that we would need to
> > > take care of in the kernel for this to work?
> >
> > If you can't satisfy the 100-mA current limit then you should make your
> > device be self-powered instead of relying on power delivered over the
> > USB bus.
> >
> > Be aware also that bus-powered USB-2 hubs can't deliver 500 mA to their
> > downstream ports.  They are always limited to 100 mA or less.  If your
> > gadget was plugged into one of them, it wouldn't be able to work at
> > all.
> >
> > Alan Stern
> >
> 
> Alan,
> Thank you for the swift response.  On the first point, if we modify
> the kernel to re-enumerate the same bMaxPower of 500mA would this
> still be a problem? ie is there a period when the kernel takes over
> the USB controller that the Host side would go back to 100mA after
> U-Boot negotiates the 500mA?

Yes, there is.  Remember, the kernel knows nothing of what U-Boot has 
done.  It has to start fresh.

>  The last point you make is a very good
> one and something I hadn't thought of. If we can overcome the first
> hurdle I think we would be happy for it to be a requirement for the
> device to be plugged directly into a PC.

Or into a powered hub.

Alan Stern

