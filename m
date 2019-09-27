Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE517C0AA5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 19:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfI0R4V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 13:56:21 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:56368 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726385AbfI0R4U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Sep 2019 13:56:20 -0400
Received: (qmail 5450 invoked by uid 2102); 27 Sep 2019 13:56:19 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 27 Sep 2019 13:56:19 -0400
Date:   Fri, 27 Sep 2019 13:56:19 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Bastien Nocera <hadess@hadess.net>
cc:     linux-usb@vger.kernel.org, <benjamin.tissoires@redhat.com>
Subject: Re: Driver for something that's neither a device nor an interface
 driver?
In-Reply-To: <5e53febe013938d7b878de46a5ef9f18587bd4db.camel@hadess.net>
Message-ID: <Pine.LNX.4.44L0.1909271351260.4732-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 27 Sep 2019, Bastien Nocera wrote:

> Hey,
> 
> I'm trying to write a "power supply" class driver for Apple MFi
> devices, and struggling a little with the USB drivers.
> 
> To ask many Apple devices to draw more power, we need to make a call to
> the device using a vendor command. It doesn't go to an interface, but
> to the device itself.
> 
> The call done in the kernel would look something like:
> usb_control_msg(mfi->udev, usb_sndctrlpipe(mfi->udev, 0), 
>                 0x40, /* Vendor-defined USB get enabled capabilities request. */
>                 USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
>                 current_ma, /* wValue, current offset */
>                 current_ma, /* wIndex, current offset */
>                 NULL, 0, USB_CTRL_GET_TIMEOUT);
> 
> But I can't figure out what type of driver I'd need to just be able to
> export that power_supply interface.
> 
> Trying to use a "struct usb_device_driver" didn't work as probe
> functions were never called, and a "struct usb_driver" gets unbound
> after user-space and the ipheth drivers comes around.
> 
> This is my "struct usb_driver" attempt:
> https://github.com/hadess/apple-mfi-fastcharge
> 
> Any ideas what type of driver, or what trick I should be using here?

Is there any reason this needs to be done in a kernel driver?  Can it 
be handled from userspace instead?

You said this was for a "power supply" class driver.  It's not clear 
what that means -- the devices you want to communicate with are 
iphones, ipads, etc., not power supplies.

Under what circumstances would these messages need to get sent?  What 
piece of code is responsible for them?

If necessary, you can modify the core/generic.c driver.  However that 
might not be the right approach, considering that this is meant only 
for devices manufactured by Apple.

Alan Stern

