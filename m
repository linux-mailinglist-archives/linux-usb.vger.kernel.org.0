Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF0F81EAE
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 16:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729424AbfHEOHI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 10:07:08 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:50226 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728878AbfHEOHI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 10:07:08 -0400
Received: (qmail 1814 invoked by uid 2102); 5 Aug 2019 10:07:07 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 5 Aug 2019 10:07:07 -0400
Date:   Mon, 5 Aug 2019 10:07:06 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: About usb_new_device() API
In-Reply-To: <1564994594.2877.12.camel@opensource.cirrus.com>
Message-ID: <Pine.LNX.4.44L0.1908051003420.1626-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 5 Aug 2019, Mayuresh Kulkarni wrote:

> I think I found what is happening here:
> - Looks like, the USB audio class driver is
> calling usb_enable_autosuspend().

The audio maintainers must have some good reason for doing that, but I 
don't know what it is.  Normally kernel drivers are not supposed to 
enable autosuspend.

> - Please check $KERNEL_SRC/sound/usb, card.c, usb_audio_probe().
> - It is using interface_to_usbdev() to get the parent of its interface
> device, which is the USB device allocated by the hub driver.
> And hence, in above use-case, I can see L2 when our device is in
> composite USB-audio mode.
> 
> Moreover, the HID-class driver doesn't seem to call
> usb_enable_autosuspend() on its parent and hence I don't see L2 when our
> device operates as a vendor specific HID device.
> So a simple fix would be to call usb_enable_autosuspend() from HID class
> driver as well.
> 
> With that said, what would be your recommendation here, Alan -
> 1. Is it OK for USB-class drivers to call usb_enable_autosuspend() on
> their parent device to ensure low power state is entered?

Generally it is _not_ okay.  Especially not for the HID class driver -- 
there are far too many HID devices (like mice and keyboards) that don't 
work correctly when they go to low power.

> OR
> 2. Is it recommended to call usb_enable_autosuspend() from user-space by
> writing "auto" to "cat /sys/bus/usb/devices/.../power/control"?

That is the recommended approach.

> In my opinion, both should be fine.

Alan Stern

