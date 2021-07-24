Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4873D4718
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 12:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234991AbhGXJtb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Jul 2021 05:49:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:43962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234333AbhGXJtb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Jul 2021 05:49:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31F2660E53;
        Sat, 24 Jul 2021 10:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627122602;
        bh=syNWjhvZuDJFJxbPSaeLdz4zTz6MLCTm1SYOQNJ/Rx0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jpWjZd9mp8pWkUNlh2O0ysggB209o1WV2GzI0m4TZD9cbpb8GwreyJyJ1I7oCpM96
         QSFqqyoJLqdv8zf2Ob1MxS23MocRPpu8AAmuXzPp+Lyai7U7L68k3khzXH17sOSjn3
         FZcciIq16Twl3i33oPPxacCHxgDHU9uWDIISBPtw=
Date:   Sat, 24 Jul 2021 12:29:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Mainlining Linux Sunxi SoC AW USB
Message-ID: <YPvrpUZ/VRc0eHvA@kroah.com>
References: <YPvjYIsu0G0HSu5I@pevik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPvjYIsu0G0HSu5I@pevik>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 24, 2021 at 11:54:40AM +0200, Petr Vorel wrote:
> Hi,
> 
> I'd like to cleanup and mainline Linux Sunxi SoC AW USB host driver [1].

Great!

> What are the most ugly parts which should be replaced? Loading module does not
> complain about anything?
> [267044.912155] awusb: loading out-of-tree module taints kernel.

That will be fixed by moving it into the tree.

> [267044.912257] awusb: module verification failed: signature and/or required key missing - tainting kernel

That shows a mis-match between you building a kernel and what keys were
used to build the distro kernel you are using.

> [267044.913399] usbcore: registered new interface driver allwinner
> [267044.913401] awusb: v0.5:AW USB driver

Looks fine.

> BTW should it go to the host/Kconfig or misc/Kconfig or elsewhere?

No idea, is this a host driver or does it control a USB device you plug
into the system?

> [1] https://github.com/linux-sunxi/sunxi-livesuite/blob/master/awusb/awusb.c

I looked at this, and it's a device driver, not a host controller
driver.

But it looks to need a userspace program for the ioctls, where is that
code at?  And why does it need any ioctls at all?

Why is this even a driver at all, it looks like you can write a small
userspace program using libusb to do everything it does, right?  What
exactly is this driver needed for?

thanks,

greg k-h
