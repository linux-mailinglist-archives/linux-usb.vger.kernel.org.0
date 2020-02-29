Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECFEF174873
	for <lists+linux-usb@lfdr.de>; Sat, 29 Feb 2020 18:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbgB2RhE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Feb 2020 12:37:04 -0500
Received: from netrider.rowland.org ([192.131.102.5]:35791 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727349AbgB2RhE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Feb 2020 12:37:04 -0500
Received: (qmail 20504 invoked by uid 500); 29 Feb 2020 12:37:03 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 29 Feb 2020 12:37:03 -0500
Date:   Sat, 29 Feb 2020 12:37:03 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     James <bjlockie@lockie.ca>
cc:     linux-usb@vger.kernel.org
Subject: Re: USB2 device?
In-Reply-To: <40906feb-3f4e-860d-ed31-a6ecbf6fbc89@lockie.ca>
Message-ID: <Pine.LNX.4.44L0.2002291215060.16560-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 29 Feb 2020, James wrote:

> On 2020-02-29 11:12 a.m., Alan Stern wrote:
> > On Fri, 28 Feb 2020, James wrote:
> >
> >
> >> $ lsusb -t
> >> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
> >> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
> >>       |__ Port 1: Dev 6, If 0, Class=Vendor Specific Class,
> >> Driver=rtl88x2bu, 480M
> >>
> >>     bcdUSB               2.10
> >> Means it's USB2,  right?
> >
> >> How reliable is this?
> > Quite reliable.  However, on occasion something goes wrong when a
> > USB-3 device is plugged in.  For some reason the USB-3 connection
> > fails; when this happens the device switches over to the USB-2
> > connection and then communicates at the lower speed.  It still works,
> > but in a degraded manner.
> >
> >
> If something went wrong would it still say bcdUSB 2.10?

A good question.  According to the USB-3 specification, it would still
say bcdUSB >= 3.00.  But some devices might not behave that way.

> It's marketed as USB 3 and it is important to have the bandwidth because 
> it is a network device.

The bandwidth is different from the USB version.  In any case, the 
information you want is in the Binary Object Store descriptor.  Here's 
the information you posted originally:

> Binary Object Store Descriptor:
>    bLength                 5
>    bDescriptorType        15
>    wTotalLength       0x0016
>    bNumDeviceCaps          2
>    USB 2.0 Extension Device Capability:
>      bLength                 7
>      bDescriptorType        16
>      bDevCapabilityType      2
>      bmAttributes   0x00000002
>        HIRD Link Power Management (LPM) Supported
>    SuperSpeed USB Device Capability:
>      bLength                10
>      bDescriptorType        16
>      bDevCapabilityType      3
>      bmAttributes         0x00
>      wSpeedsSupported   0x0006
>        Device can operate at Full Speed (12Mbps)
>        Device can operate at High Speed (480Mbps)
>      bFunctionalitySupport   1
>        Lowest fully-functional device speed is Full Speed (12Mbps)
>      bU1DevExitLat          10 micro seconds
>      bU2DevExitLat        1023 micro seconds

The wSpeedsSupported bitmap indicates that the device will only
communicate at USB-2 speed; it doesn't support SuperSpeed Gen1 (5000
Mbps) or Gen2 (10000 Mbps).

FYI, the USB-3.0 specification includes this sentence (section 
3.2.6.1):

	A USB 3.0 peripheral device must provide support for both
	SuperSpeed and at least one other non-SuperSpeed speed.

So the fact that the RealTek doesn't support SuperSpeed operation,
combined with the fact that it reports its USB version as 2.10,
indicates that it really isn't a USB-3 device.

What this says about the bandwidth is for you to judge.

Alan Stern

