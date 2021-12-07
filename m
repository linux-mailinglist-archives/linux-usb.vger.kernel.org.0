Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1DE46B8F4
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 11:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235101AbhLGKau (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 05:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235090AbhLGKau (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 05:30:50 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6995DC061574
        for <linux-usb@vger.kernel.org>; Tue,  7 Dec 2021 02:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=jsCRYjmC5W2AdQaMovOOrYCYhmJS7ZQgOLr2K+HribU=; b=VTSvA
        DiztJpJB08RrO2Iu806wQRifAkIM7Tc+/oUGSa2/WFUI4BXcgGVH7Dk9/GgEgctdgnUV4zEDgk9ev
        8plprbaCF9AOghrlEyCkmjt9U5TamAnVGhWzPOmy045g/GbqrQr386Bo5J+PhSYtm5exo/03UTJEY
        y2TKRNVjMGV3Ch5qhQbH9wTbg8xdFs4xr47nW9vdPAzTBXAVp1oSNYkjrVQ7dZbVaR79MCTsjrw/Y
        ybYENKeF7wjzR2mGK++N3VuqFCJlyGTFLR8HcKnZnlsJ0M7a8dhQsmP+ZWckzghxmvjrbU8pQxvsZ
        kzfg/+qqg6bjdvtOke/7NxhlLWu7g==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1muXgq-0003uN-Hf; Tue, 07 Dec 2021 10:27:16 +0000
Date:   Tue, 7 Dec 2021 10:27:11 +0000
From:   John Keeping <john@metanate.com>
To:     Volodymyr Lisivka <vlisivka@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: BUG: iPNPstring in f_printer USB gadget is reduced by two bytes
Message-ID: <Ya82/4kQ2+7Iuzl6@donbot>
References: <CAKjGFBUdjXcZoVV4jdrgTz4rKThTfZAK4CqreKmBZ4KHE+K1GA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKjGFBUdjXcZoVV4jdrgTz4rKThTfZAK4CqreKmBZ4KHE+K1GA@mail.gmail.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 03, 2021 at 04:46:17PM +0200, Volodymyr Lisivka wrote:
> > On Tue, Nov 30, 2021 at 08:01:46PM +0200, Volodymyr Lisivka wrote:
> > > Description:
> > >
> > > Printer USB gadget uses iPNPstring to communicate device name and
> > > command language with host. Linux driver for printer gadget sends
> > > GET_DEVICE_ID response packet without 2 last bytes, which may cause
> > > trouble for the host driver.
> > >
> > > Steps to reproduce:
> > >
> > > Use Raspberry Pi, or an other device with USB OTG plug. Raspberry Pi 4
> > > was used by issue author.
> > > Configure plug to be in peripheral mode, e.g. by adding
> > > dtoverlay=dwc2,dr_mode=peripheral to /boot/config.txt.
> > > Connect OTG port to host and reboot Raspberry Pi.
> > > Load g_printer module using command sudo modprobe g_printer.
> > > Use command ./get-iPNPstring.pl /dev/usb/lp1 to get iPNPstring from
> > > the device. (See get-iPNPstring.pl.gz ). As alternative, kernel usbmon
> > > or WireShark can be used to capture raw USB packet for GET_DEVICE_ID
> > > response.
> > >
> > > Expected result:
> > >
> > > It's expected to receive same string as defined in module:
> > > iPNPstring='MFG:linux;MDL:g_printer;CLS:PRINTER;SN:1;'
> > >
> > > Actual result:
> > >
> > > iPNPstring='MFG:linux;MDL:g_printer;CLS:PRINTER;SN:'
> > >
> > > (Notice that last 2 chars are missing).
> > >
> > > Workarround:
> > >
> > > Just add two space to the end of printer gadget iPNPstring.
> > >
> > > Root cause:
> > >
> > > In drivers/usb/gadget/function/f_printer.c, length of iPNPstring is
> > > used as length of the whole packet, without length of 2 byte size
> > > field.
> >
> > If I understand correctly, the length should be inclusive of the two
> > length bytes, but currently this driver encodes it exclusive.
> >
> > The USB printer class specification says:
> >
> > ... a device ID string that is compatible with IEEE 1284.  See
> > IEEE 1284 for syntax and formatting information
> >
> > and goes on to specify that this includes the length in the first two
> > bytes as big endian.
> >
> > I don't have access to IEEE 1284, but looking in drivers/parport/probe.c
> > which implements the host side of IEEE 1284, we find
> > parport_read_device_id() with the comment:
> >
> > /* Some devices wrongly send LE length, and some send it two
> > * bytes short. Construct a sorted array of lengths to try. */
> >
> > and code that assumes the values are inclusive of the length bytes.
> >
> > So the patch below looks like it does the right thing to me, although it
> > appears whitespace damaged and it may be clearer to introduce a separate
> > variable for the string length compared to the value.
> 
> diff --git a/drivers/usb/gadget/function/f_printer.c
> b/drivers/usb/gadget/function/f_printer.c
> index 236ecc968..403faa05b 100644
> --- a/drivers/usb/gadget/function/f_printer.c
> +++ b/drivers/usb/gadget/function/f_printer.c
> @@ -987,6 +987,7 @@ static int printer_func_setup(struct usb_function *f,
>         u16                     wIndex = le16_to_cpu(ctrl->wIndex);
>         u16                     wValue = le16_to_cpu(ctrl->wValue);
>         u16                     wLength = le16_to_cpu(ctrl->wLength);
> +       u16                     pnp_length;
> 
>         DBG(dev, "ctrl req%02x.%02x v%04x i%04x l%d\n",
>                 ctrl->bRequestType, ctrl->bRequest, wValue, wIndex, wLength);
> @@ -1003,11 +1004,12 @@ static int printer_func_setup(struct usb_function *f,
>                                 value = 0;
>                                 break;
>                         }
> -                       value = strlen(dev->pnp_string);
> +                       pnp_length = strlen(dev->pnp_string);
> +                       value = pnp_length + 2;
>                         buf[0] = (value >> 8) & 0xFF;
>                         buf[1] = value & 0xFF;
> -                       memcpy(buf + 2, dev->pnp_string, value);
> -                       DBG(dev, "1284 PNP String: %x %s\n", value,
> +                       memcpy(buf + 2, dev->pnp_string, pnp_length);
> +                       DBG(dev, "1284 PNP String: %x %s\n", pnp_length,
>                             dev->pnp_string);
>                         break;
> 
> 
> 
> >
> > Are you interested in working up a proper patch, as described in
> > Documentation/process/submitting-patches.rst ?
> >
> 
> No. It's my second patch in 15 years. If you have a proper procedure
> for diffing/patching, then make corresponding targets in the top
> Makefile, e.g. `make diff` or `make patch`.

Do you mean `git format-patch`? ;-)

Note that the diff is only part of a patch, the commit message and
Signed-off-by line ceritifying the developer certificate of origin [1]
are also important.

[1] https://developercertificate.org/
