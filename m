Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88024C0BF2
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 21:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfI0TJC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 15:09:02 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:57413 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfI0TJC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Sep 2019 15:09:02 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 05B20240003;
        Fri, 27 Sep 2019 19:08:59 +0000 (UTC)
Message-ID: <a66971c74534227b5889e3cf54705b06e6871795.camel@hadess.net>
Subject: Re: Driver for something that's neither a device nor an interface
 driver?
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, benjamin.tissoires@redhat.com
Date:   Fri, 27 Sep 2019 21:08:59 +0200
In-Reply-To: <20190927185755.GA1808068@kroah.com>
References: <5e53febe013938d7b878de46a5ef9f18587bd4db.camel@hadess.net>
         <20190927173809.GB1801491@kroah.com>
         <e9842d24e72a4995047eede8e47e11db662879d7.camel@hadess.net>
         <20190927185755.GA1808068@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-09-27 at 20:57 +0200, Greg KH wrote:
> On Fri, Sep 27, 2019 at 07:44:08PM +0200, Bastien Nocera wrote:
> > On Fri, 2019-09-27 at 19:38 +0200, Greg KH wrote:
> > > What does the usb descriptors for the device look like?  Is it
> > > only
> > > the
> > > "default" control endpoint and no interfaces?  What does the
> > > output
> > > of
> > > 'usbdevices' show for the device?
> > 
> > The device in question can be an iPhone, an iPod Classic/Nano, or
> > an
> > iPad, amongst others, and they usually have useful interfaces, such
> > as
> > mass storage for the older ones, or ethernet, PTP, etc.
> 
> Ah.  Then why do you have to do this from a kernel driver?  Why can't
> you do this from userspace?

Because the kernel has a well-defined API for doing this sort of thing,
and I'd like device drivers to live in the kernel if they can live in
the kernel, making it easier to point at them when writing a policy
daemon, rather than getting told "I won't be using this daemon because
it uses the wrong language, or the wrong library".

I can imagine other implementation for other vendors once the ball
starts rolling.

> > > Normally you just bind to the "default" interface for the device,
> > > and
> > > all is good, there should be a few other drivers in the tree that
> > > do
> > > this, but I can't think of one off the top of my head at the
> > > moment.
> > 
> > All the interfaces (in the different configurations) are used for
> > something in the case of the iPhone 6S I'm trying to use.
> > 
> > I've attached the output of "lsusb -v" for the device below.
> 
> What about interface "9", the "Apple USB Multiplexor"?  What driver
> binds to that thing?  It's a vendor-specific protocol, so there
> shouldn't be any class driver assigned to it, unlike most of the
> other
> interfaces.

There's a user-space daemon called "usbmuxd" that will unbind it and
claim it. This daemon has the exact same API as this daemon under
macOS, and is a drop-in replacement too.

Finds the right configuration:
https://github.com/libimobiledevice/usbmuxd/blob/master/src/usb.h#L28
https://github.com/libimobiledevice/usbmuxd/blob/master/src/usb.c#L448
and claims it:
https://github.com/libimobiledevice/usbmuxd/blob/master/src/usb.c#L485

