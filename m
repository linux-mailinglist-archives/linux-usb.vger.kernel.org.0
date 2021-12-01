Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC2924651A5
	for <lists+linux-usb@lfdr.de>; Wed,  1 Dec 2021 16:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350969AbhLAPbq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Dec 2021 10:31:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350972AbhLAPbo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Dec 2021 10:31:44 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEBDC061574
        for <linux-usb@vger.kernel.org>; Wed,  1 Dec 2021 07:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=0UudUOsuYHlWv48N8ECBFpqnRvk8jIOIK4d58T1+fKc=; b=otb0P
        afRm9pDCmWXPFbpyDTow3CAZ0BFUiQzvGGsbu0BCBALjXgZq7Ho1RAfwUhB+maEmYZ4efHh3jtwNI
        9lVmJSeUwejgC44DHEZHbkRHqVFGj+7nnlD5MCU1+5g7pFdNswfzGTOAAE6hRcfqxiRqGsyY/PUcV
        7dOsgf0qaLnGNNlj0OWuUN+L+7rFQz97PJn8icMmtPDeczTy6s3XESzaYFPc5W/CJJOmA5Q+mjL1Y
        IdsqVh8+wRDufRYSqOBxaWmwvOslXI4CgSDQ/AsOOUKRwJfYuDN+lLmgqHUP6iCXxQp7tqGkMJoTo
        woy+Nx5S7Qz8YiO3VXiAO4L/Knz1w==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1msRWr-00088s-S2; Wed, 01 Dec 2021 15:28:17 +0000
Date:   Wed, 1 Dec 2021 15:28:16 +0000
From:   John Keeping <john@metanate.com>
To:     Volodymyr Lisivka <vlisivka@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: BUG: iPNPstring in f_printer USB gadget is reduced by two bytes
Message-ID: <YaeUkBRS9KuUQZcK@donbot>
References: <CAKjGFBVrUevZtS4bDihRz3s3U3E0a8_DhdxEuata0vS3hLEvTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKjGFBVrUevZtS4bDihRz3s3U3E0a8_DhdxEuata0vS3hLEvTQ@mail.gmail.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 30, 2021 at 08:01:46PM +0200, Volodymyr Lisivka wrote:
> Description:
> 
> Printer USB gadget uses iPNPstring to communicate device name and
> command language with host. Linux driver for printer gadget sends
> GET_DEVICE_ID response packet without 2 last bytes, which may cause
> trouble for the host driver.
> 
> Steps to reproduce:
> 
> Use Raspberry Pi, or an other device with USB OTG plug. Raspberry Pi 4
> was used by issue author.
> Configure plug to be in peripheral mode, e.g. by adding
> dtoverlay=dwc2,dr_mode=peripheral to /boot/config.txt.
> Connect OTG port to host and reboot Raspberry Pi.
> Load g_printer module using command sudo modprobe g_printer.
> Use command ./get-iPNPstring.pl /dev/usb/lp1 to get iPNPstring from
> the device. (See get-iPNPstring.pl.gz ). As alternative, kernel usbmon
> or WireShark can be used to capture raw USB packet for GET_DEVICE_ID
> response.
> 
> Expected result:
> 
> It's expected to receive same string as defined in module:
> iPNPstring='MFG:linux;MDL:g_printer;CLS:PRINTER;SN:1;'
> 
> Actual result:
> 
> iPNPstring='MFG:linux;MDL:g_printer;CLS:PRINTER;SN:'
> 
> (Notice that last 2 chars are missing).
> 
> Workarround:
> 
> Just add two space to the end of printer gadget iPNPstring.
> 
> Root cause:
> 
> In drivers/usb/gadget/function/f_printer.c, length of iPNPstring is
> used as length of the whole packet, without length of 2 byte size
> field.

If I understand correctly, the length should be inclusive of the two
length bytes, but currently this driver encodes it exclusive.

The USB printer class specification says:

	... a device ID string that is compatible with IEEE 1284.  See
	IEEE 1284 for syntax and formatting information

and goes on to specify that this includes the length in the first two
bytes as big endian.

I don't have access to IEEE 1284, but looking in drivers/parport/probe.c
which implements the host side of IEEE 1284, we find
parport_read_device_id() with the comment:

	/* Some devices wrongly send LE length, and some send it two
	 * bytes short. Construct a sorted array of lengths to try. */

and code that assumes the values are inclusive of the length bytes.

So the patch below looks like it does the right thing to me, although it
appears whitespace damaged and it may be clearer to introduce a separate
variable for the string length compared to the value.

Are you interested in working up a proper patch, as described in
Documentation/process/submitting-patches.rst ?

> Patch:
> 
> --- f_printer.c.orig 2021-11-26 19:12:21.632221126 +0200
> +++ f_printer.c 2021-11-26 19:09:19.454991670 +0200
> @@ -1003,11 +1003,11 @@
>   value = 0;
>   break;
>   }
> - value = strlen(dev->pnp_string) ;
> + value = strlen(dev->pnp_string) + 2;
>   buf[0] = (value >> 8) & 0xFF;
>   buf[1] = value & 0xFF;
> - memcpy(buf + 2, dev->pnp_string, value);
> - DBG(dev, "1284 PNP String: %x %s\n", value,
> + memcpy(buf + 2, dev->pnp_string, value - 2);
> + DBG(dev, "1284 PNP String: %x %s\n", value - 2,
>       dev->pnp_string);
>   /* Length of packet is length of length field and length of iPNPstring. */
>   break;
