Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D874C2B9BCC
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 21:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgKSUBs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 15:01:48 -0500
Received: from netrider.rowland.org ([192.131.102.5]:44093 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727499AbgKSUBs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Nov 2020 15:01:48 -0500
Received: (qmail 584193 invoked by uid 1000); 19 Nov 2020 15:01:47 -0500
Date:   Thu, 19 Nov 2020 15:01:47 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Alberto Sentieri <22t@tripolho.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: kernel locks due to USB I/O
Message-ID: <20201119200147.GB582614@rowland.harvard.edu>
References: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
 <20201110205114.GB204624@rowland.harvard.edu>
 <8152190e-c962-e376-64fd-cc2ebf3e6104@tripolho.com>
 <20201111155130.GB237113@rowland.harvard.edu>
 <9687fac9-94de-50a3-f88e-b7e05d660aba@tripolho.com>
 <20201116170625.GC436089@rowland.harvard.edu>
 <1e58c6f4-c651-b45a-b0fc-7bee40fe61cb@tripolho.com>
 <20201119172250.GC576844@rowland.harvard.edu>
 <0125b936-46b9-0fb8-3fe2-63d1563a1e17@tripolho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0125b936-46b9-0fb8-3fe2-63d1563a1e17@tripolho.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 19, 2020 at 01:50:13PM -0500, Alberto Sentieri wrote:
> > > However, just before the lock, I got this sequence:
> > > 
> > > [  387.326795] usb 1-1.5.3.1: usbdev_do_ioctl: SUBMITURB
> > > [  387.326801] usb 1-1.5.3.1: userurb 0000000000000000, ep1 int-in, length
> > > 64
> > > [  387.327531] usb 1-1.5.3.1: urb complete
> > > [  387.327539] usb 1-1.5.3.1: userurb         pK-error, ep1 int-out,
> > > actual_length 64 status 0
> > > [  387.327582] usb 1-1.5.3.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  387.327590] usb 1-1.5.3.1: reap 0000000000000000
> > > [  387.327598] usb 1-1.5.3.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.109400] usb 3-1.5.7.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.110032] usb 3-1.6.7.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.110169] usb 3-1.5.5.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.110605] usb 3-1.6.5.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.111394] usb 3-1.1.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.403278] usb 3-1.6.4.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.404011] usb 3-1.5.1.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.404344] usb 3-1.6.3.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.404649] usb 3-1.4.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.404790] usb 3-1.3.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.405283] usb 3-1.5.3.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.407828] usb 3-1.6.1.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.408771] usb 3-1.5.4.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.409155] usb 3-1.5.2.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.409452] usb 3-1.5.6.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.409743] usb 3-1.6.6.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.409848] usb 3-1.2.1: usbdev_do_ioctl: REAPURBNDELAY
> > > [  388.410840] usb 3-1.6.2.1: usbdev_do_ioctl: REAPURBNDELAY
> > This rapid sequence of reap requests with no completions or actual
> > reaps is odd.  Is this the sort of thing you expect your program to
> > do?  Maybe you can add some debugging output to the program.
> What apparently happened before that (but unfortunately I did not capture it
> this time) is that the particular device return errno -71 in some URBs,
> without de-enumerating.

That's actually quite bad.  -71 (-EPROTO) indicates a serious error in
the USB protocol.  Most often it means that the kernel did not receive
a reply packet from the device -- this could be caused by the device's
firmware crashing or a USB cable failing.  In a well-functioning
system it should never occur.

> However, I am only seeing userurbs with status 0 in
> my the netconsole capture, before the ones with status -108 (just before the
> lock). So, if error -71 happened, all URBs are reaped and the devices are
> then closed. Usually I see error -71 in the program log happening for a few
> devices at the same time.

That probably means there's something wrong with a hub they are all
connected to.  But of course, a problem in a hub wouldn't explain why
the whole system freezes.

>  After closing the interface, the program opens it
> again. The return from open should be a valid file descriptor, otherwise it
> would fail. After opening the device successfully it starts submitting urbs,
> and error -108 is coming back, telling me that the device just opened is not
> open.

It means that the device is no longer present.  Perhaps it was
logically (if not physically) disconnected after the open but before
the URBs were submitted.

> It just came to my attention now: maybe something to be investigated is what
> the kernel does if a interface is closed due to a URB error and immediately
> opened again.

In itself, that should work perfectly.  But whatever caused the USB
error could go on to cause other things to go wrong.

It might help to see a usbmon trace.  You merely have to send the data 
from /sys/kernel/debug/usb/usbmon/1u (or 3u, or even both -- the number 
refers to the USB bus being monitored) through a UDP pipe, using netcat 
or something similar, to another computer which could safely store the 
output.

Alan Stern
