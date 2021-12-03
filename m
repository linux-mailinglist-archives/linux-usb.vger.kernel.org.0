Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B53384679A7
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 15:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381548AbhLCOt5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Dec 2021 09:49:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381562AbhLCOtw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Dec 2021 09:49:52 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442BCC061751
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 06:46:28 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id f186so10011701ybg.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Dec 2021 06:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=PjhwI+CnK9T6aryUKukhix9h2uCKHfEm0SmqIW6SxnM=;
        b=el6R7rJr6dnwcGPXTANKfBdUm0eRYRhRJR9irFePbfAQ0+qz7yMzTEtbRtj+GU+zAe
         qJoKlHe2wHYnW24S2qFeIia3BCtnJN6K4hvMolnkLpDN5wkUu4HW5DnHOv5eZP8NhFUL
         3QARVJ81++o+ldEbSjnpyp1oIevEMYaGCm+sUDcc7CEUmsexGaSrNlMR22zTJvlFWsOR
         uBu5VMuaDf0vBCnRtTdjAaFWmPbDmmiN0wq3nHFF0AHXsHjNCnyopdl+lwoFFihF6pO5
         nrGG2Xfn0ZkaIAMYprOqVP9Ma+EPBIV+DzPnVwNhs0cl3Vtz9QRq9Pa9lVQECr7TYdD1
         Pb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=PjhwI+CnK9T6aryUKukhix9h2uCKHfEm0SmqIW6SxnM=;
        b=ekf76wy99x2UE2/8wmgjhpaO93lXpPowO7vRT8aRPykqxIDZAn4xysDvu4j2JTDuEM
         Sf8mOtTamSZO5VNz5QQdmbUGUJSOnMdbuc3PrdeOhZbtYw2YkhXiwZFQiv6VOUzzXZ6Z
         7dKd9fbt1dCuKF567juRs2NUU75hInHSSbPhAJeivh8GGmA7cthVDNixWCB7HThm4krF
         I/thyiADHhOoHRi2AeDDfOg9O0HUyg0WOWuvTSipnTkE/LsSYWCuaVF2UR9zF0+Lto6l
         I8O+g/P0Zm0OK9gWmsV3RfRtTLrxZER85n4SgduvbKiyPRb2TDFxEu+cAGDyjOMmZDmJ
         /eCw==
X-Gm-Message-State: AOAM531L0Caf5yKJxu9Qvtt9A2WVw5bzF/U0SP/XziSGYIspmaDy+gvr
        1XBligvE166VOrNGgpSMBYBX+O2Q8MopFSnmQck/BelJly8=
X-Google-Smtp-Source: ABdhPJxCkGGxe+9lEdVCYKxkGMczH40fjOExFA6cD4THF+PhWVYRTtcjBYlcVeh+dQfMLbIpPOSsdOmN1pEzjeS6dpU=
X-Received: by 2002:a25:68c9:: with SMTP id d192mr22343774ybc.645.1638542787549;
 Fri, 03 Dec 2021 06:46:27 -0800 (PST)
MIME-Version: 1.0
From:   Volodymyr Lisivka <vlisivka@gmail.com>
Date:   Fri, 3 Dec 2021 16:46:17 +0200
Message-ID: <CAKjGFBUdjXcZoVV4jdrgTz4rKThTfZAK4CqreKmBZ4KHE+K1GA@mail.gmail.com>
Subject: Re: BUG: iPNPstring in f_printer USB gadget is reduced by two bytes
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Tue, Nov 30, 2021 at 08:01:46PM +0200, Volodymyr Lisivka wrote:
> > Description:
> >
> > Printer USB gadget uses iPNPstring to communicate device name and
> > command language with host. Linux driver for printer gadget sends
> > GET_DEVICE_ID response packet without 2 last bytes, which may cause
> > trouble for the host driver.
> >
> > Steps to reproduce:
> >
> > Use Raspberry Pi, or an other device with USB OTG plug. Raspberry Pi 4
> > was used by issue author.
> > Configure plug to be in peripheral mode, e.g. by adding
> > dtoverlay=dwc2,dr_mode=peripheral to /boot/config.txt.
> > Connect OTG port to host and reboot Raspberry Pi.
> > Load g_printer module using command sudo modprobe g_printer.
> > Use command ./get-iPNPstring.pl /dev/usb/lp1 to get iPNPstring from
> > the device. (See get-iPNPstring.pl.gz ). As alternative, kernel usbmon
> > or WireShark can be used to capture raw USB packet for GET_DEVICE_ID
> > response.
> >
> > Expected result:
> >
> > It's expected to receive same string as defined in module:
> > iPNPstring='MFG:linux;MDL:g_printer;CLS:PRINTER;SN:1;'
> >
> > Actual result:
> >
> > iPNPstring='MFG:linux;MDL:g_printer;CLS:PRINTER;SN:'
> >
> > (Notice that last 2 chars are missing).
> >
> > Workarround:
> >
> > Just add two space to the end of printer gadget iPNPstring.
> >
> > Root cause:
> >
> > In drivers/usb/gadget/function/f_printer.c, length of iPNPstring is
> > used as length of the whole packet, without length of 2 byte size
> > field.
>
> If I understand correctly, the length should be inclusive of the two
> length bytes, but currently this driver encodes it exclusive.
>
> The USB printer class specification says:
>
> ... a device ID string that is compatible with IEEE 1284.  See
> IEEE 1284 for syntax and formatting information
>
> and goes on to specify that this includes the length in the first two
> bytes as big endian.
>
> I don't have access to IEEE 1284, but looking in drivers/parport/probe.c
> which implements the host side of IEEE 1284, we find
> parport_read_device_id() with the comment:
>
> /* Some devices wrongly send LE length, and some send it two
> * bytes short. Construct a sorted array of lengths to try. */
>
> and code that assumes the values are inclusive of the length bytes.
>
> So the patch below looks like it does the right thing to me, although it
> appears whitespace damaged and it may be clearer to introduce a separate
> variable for the string length compared to the value.

diff --git a/drivers/usb/gadget/function/f_printer.c
b/drivers/usb/gadget/function/f_printer.c
index 236ecc968..403faa05b 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -987,6 +987,7 @@ static int printer_func_setup(struct usb_function *f,
        u16                     wIndex = le16_to_cpu(ctrl->wIndex);
        u16                     wValue = le16_to_cpu(ctrl->wValue);
        u16                     wLength = le16_to_cpu(ctrl->wLength);
+       u16                     pnp_length;

        DBG(dev, "ctrl req%02x.%02x v%04x i%04x l%d\n",
                ctrl->bRequestType, ctrl->bRequest, wValue, wIndex, wLength);
@@ -1003,11 +1004,12 @@ static int printer_func_setup(struct usb_function *f,
                                value = 0;
                                break;
                        }
-                       value = strlen(dev->pnp_string);
+                       pnp_length = strlen(dev->pnp_string);
+                       value = pnp_length + 2;
                        buf[0] = (value >> 8) & 0xFF;
                        buf[1] = value & 0xFF;
-                       memcpy(buf + 2, dev->pnp_string, value);
-                       DBG(dev, "1284 PNP String: %x %s\n", value,
+                       memcpy(buf + 2, dev->pnp_string, pnp_length);
+                       DBG(dev, "1284 PNP String: %x %s\n", pnp_length,
                            dev->pnp_string);
                        break;



>
> Are you interested in working up a proper patch, as described in
> Documentation/process/submitting-patches.rst ?
>

No. It's my second patch in 15 years. If you have a proper procedure
for diffing/patching, then make corresponding targets in the top
Makefile, e.g. `make diff` or `make patch`.
