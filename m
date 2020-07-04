Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4B42146ED
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jul 2020 17:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgGDPe0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jul 2020 11:34:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:48318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726405AbgGDPe0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 Jul 2020 11:34:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DFCC20747;
        Sat,  4 Jul 2020 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593876865;
        bh=+fjCzy5OXfDBbp5TlsdttNfhj/6HagnqAIixisnClWQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i9Kaf5DiiMddEyIiGkQMiWhu+DlK7LCMLoXZPiKVZsdKGVyeAXk1+pzWv/yRfSx/U
         esbOYjjAFO9/sIK9dMYJnnmDwPQQYBmrrj2hYR6sX7YgZlBoDLtf93T483AzJbPrAj
         NKIR2n7v2Mb9EakQlhNYwrWAG06ghepk3xsJWqMI=
Date:   Sat, 4 Jul 2020 17:34:29 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dan Halbert <halbert@halwitz.org>
Cc:     Linux USB List <linux-usb@vger.kernel.org>
Subject: Re: Kernel crash during USB device enumeration or MSC mounting
Message-ID: <20200704153429.GA433456@kroah.com>
References: <aa7c2ad9-3daa-7fec-3f2a-9e35a3196938@halwitz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa7c2ad9-3daa-7fec-3f2a-9e35a3196938@halwitz.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 04, 2020 at 11:15:29AM -0400, Dan Halbert wrote:
> Hi -- I was referred to this list by Kai-Heng Feng after filing an issue on
> the Ubuntu bug tracker here:
> 
>   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1871143.
> 
> Many further details are in that report, including "lsusb -v", "lspci -v",
> dmesg, and call trace output.

Where is the kernel crash in those logs?  I don't seem to be able to
find the correct one, can you just send it here so we can read and
comment on it in the email thread?  I see something odd with the fat
driver, are you sure you are creating a correct filesystem image for it
to handle?

> We are seeing kernel crashes from certain composite USB devices that present
> as MSC, CDC, HID, and MIDI. The devices are microcontroller boards running
> CircuitPython (https://github.com/adafruit/circuitpython), which uses the
> TinyUSB USB stack: https://github.com/hathach/tinyusb.
> 
> The board is commanded to forcibly reformat its MSC FAT12 filesystem and
> then reset. This causes a USB reset and re-enumeration, which can often
> (though not all the time) cause a kernel crash.

What do you mean by "reset"?  Are you disconnecting the device from the
USB bus causing it to electronically be removed and then added back?  Or
doing something else?

> The crashes may be some kind of use-after-free bug in the kernel USB driver.

Maybe, but the traces seem _very_ short on the stuff on the web page,
can you send us the full traceback from the crash?

> We have seen this or similar crashes caused by several different boards that
> use different microcontrollers. The hosts are x64, including Dell
> Intel-chipset desktops and an older Mac Mini running Linux (also Intel
> chipset).

That's not good, but might mean it is a filesystem issue, not a USB
issue.

thanks,

greg k-h
