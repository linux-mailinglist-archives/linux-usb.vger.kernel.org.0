Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C94137191D
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 15:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732448AbfGWNYX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 09:24:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:48586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725778AbfGWNYX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Jul 2019 09:24:23 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C4E5521903;
        Tue, 23 Jul 2019 13:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563888262;
        bh=87Zyy2CdkssSH6p/eKKxbb30U3YFgI1PYy404oOesDc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=y/XpzaL+K9YLOLKaRUOj4WOI1SP5bYTKaPgFmdLJylSvnj2AL1CwWenU/lGf+v6Zi
         ZsUYUiYbha2AkKNbL/6CmYggCOZjSHVSzYbXfCMZC+eC6dQgXb8NF2GTjXcJoI6oC1
         M2ldNCFctleGlCPoIU4OcqfLOYRimNtuCHXUGla0=
Date:   Tue, 23 Jul 2019 15:24:19 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Frank Bergmann <frank.bergmann@project-open.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: High-Impact: xhci_hid - "Not enough bandwidth for new device
 state"
Message-ID: <20190723132419.GA4848@kroah.com>
References: <27f21154-659d-67b5-ac90-b931695614c8@project-open.com>
 <20190723124457.GB5356@kroah.com>
 <41433e67-2496-97a5-a233-8026f13dfaba@project-open.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41433e67-2496-97a5-a233-8026f13dfaba@project-open.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 23, 2019 at 03:12:53PM +0200, Frank Bergmann wrote:
> Hi Greg,
> 
> 
> Thank you for answering! You are my hero.
> 
> 
> > not much to be done [...] bandwidth
> > [...] we can't do the impossible here
> 
> 
> It is not the bandwidth! That would be easy...
> 
> 
> 1. USB 3.0 on my Dell XPS 15 9370 has 10GB/s, that's enough for a Webcam
> (USB 2.0) plus some audio...

Are you sure?  It all depends on what that devices are asking for.
Remember USB 2 devices suck the bandwidth of a USB connection like a
starving sponge.

> 2. It works after a reboot for a while, if I first add the Webcam and
> then(!) start the VM (VMware Player or Workstation 15)

It depends on the order in which you ask for resources.

I have no idea what vmware does, and how it is faking all of this out by
possibly using kernel drivers or userspace interactions.  So I wouldn't
use that as an example of anything working well :)

> 3. It worked in Windows 7 and Windows 10 (WebCam plus audio from VMware
> Player (Windows versions)) before I switched to Ubuntu 18.04.

Windows 7, like older versions of Linux, would not try to calculate the
bandwidth requirements ahead of time, and would just try to work.  That
causes problems with dropped packets and other fun issues.  Linux solved
this in newer releases by doing the calculations "up front" and you are
seeing the result.  You always were going over the max limit, but when
using the device, "getting lucky".

I think Windows 10 also does what Windows 7 did, but am not quite sure.
Try asking on a Windows list...

> 4. RedHad guys acknowledged the bug:
> https://bugzilla.redhat.com/show_bug.cgi?id=1411604
> 
> 
> > Many people have that configuration
> 
> 
> Please search Google for 'USB "Not enough bandwidth for new device state"'.
> You will find 650 results with quite specific and similar error
> descriptions.

It all comes down to the configuration of your devices and root hubs and
controller.  Yes, lots of people can duplicate this issue, but then
again, that's why we put the check in there, to give people a chance to
understand why things would later stop working.

> The bug seems to occur in the isochronic transmission part of USB 3.0.
> Somebody suspected it occurs if there are two devices trying to transmit at
> the same time (WebCam + VM audio).

Probably.

> > separate USB hub
> 
> 
> Already tried that and zillions of other combinations. In particular I tried
> with no USB hub at all, just WebCam + VM and no other hardware.

Root hub.  The device that connects the PCI device to the USB bus.  On
some laptops there is one root hub per USB port, on others, only 1 root
hub for all plugs together.  It depends on your system.  If you have a
desktop system, try plugging in a new PCI USB controller, that is a root
hub device.

> After downgrading to USB 2.0 via BIOS it worked, though... But that's not
> possible for other reasons.

Yes, that is a normal solution as then your USB 3 devices do not ask for
"too much" bandwidth.  There's also issues with having to reserve ahead
of time the max bandwidth possible for a 2.0 device on a 3.0 bus that
causes problems as you can see.

It's not a simple problem and is always easier to just get a different
USB controller as you will end up having issues on other operating
systems as well, if they don't try to do the reservations ahead of time,
it's just harder to notice.

sorry,

greg k-h
