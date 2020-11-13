Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920F62B1B94
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 14:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgKMNHy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 08:07:54 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:33529 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgKMNHx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 08:07:53 -0500
Received: by mail-oi1-f169.google.com with SMTP id k26so10363646oiw.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 05:07:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=WMapi4sLx7k1sEpFhENqmNDxDSYFe9WPUXZBdHUlYQU=;
        b=Iqp79oWJO+E4m8V164amcGzuzj/zChBHyfGFteRQymoedkNF5bWgltQLEQ4CeWaxxe
         srRbRzJ9sBpNHSQIzwnGql2DWHdvqUXVx9OSnseW6ngoUqO6Y4yfMB+c3Nm88bLV1VDa
         OCM27MVOVZw67CiBOJat/t7U8sBP7LT24tWjO809W9h8IAlM8qKU08ZXaO8ktwBUpaaq
         k0jSCbw7wmCD1YGY0h7Ywq/EfPLynLmyJFPAtxqN+k4edlE+KJJN5OaQQEFoy8XOj3dr
         KzwNSUEX3EGU+Bb1RrINYg0hVEQhYwIHwNw9DImmoHmqAKY7KMvDIcT0wVtinwHCFPCh
         oiVw==
X-Gm-Message-State: AOAM532AqWOQs5h1/JTI7m/8JStX7fjGg3uC55fDQLDWoVAk9/+bpLzs
        2gYG/DNiU9EhBv6JlaI+44PJGOpkWJ2Hw0he9a0=
X-Google-Smtp-Source: ABdhPJwWl+IG1Dz7ekvRmz7JNKmPOgRsT+UFnm7YTVKR0sGH1FvJr3yBx0SY/UcIwN2/hEAxqwiphyfP7cxU1oijauY=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr1239801oia.153.1605272872403;
 Fri, 13 Nov 2020 05:07:52 -0800 (PST)
MIME-Version: 1.0
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 13 Nov 2020 14:07:41 +0100
Message-ID: <CAMuHMdU4VQ8kvM=1bXpDmVGicU7-T78f0uZw8G2wZWctnwsJog@mail.gmail.com>
Subject: USB multi-serial using few endpoints?
To:     Johan Hovold <johan@kernel.org>, Bin Liu <b-liu@ti.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Kieran Bingham <kbingham@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

TL;DR: I'm looking for a USB-to-multi-serial solution that uses as few
USB endpoints as possible.  Anyone with a good suggestion?

Full description:

I have a board farm that is controlled by a single BeagleBone Black.
Serial consoles are connected to the boneblack using USB: most
contemporary boards have on-board USB serial console (cp210x/ftdi_sio/
cdc_acm), some still rely on external USB-to-serial convertors.
I also have a USB webcam, to keep an eye on a board's display.
For power control, I use BayLibre ACME[1].
As I ran out of channels on the ACME, I designed my own board[2] to add
more power channels, including two serial ports and opto-isolated
outputs.  Each bcu2 board has a Teensy 3.2, which connects to the
boneblack using USB, providing 3 USB-serial ports (one interactive
control channel, two for the two physical serial ports, using cdc_acm).

Unfortunately the musb USB host controller on am335x is limited to 16
endpoints.  If no free endpoint is available, the dreaded

    musb-hdrc musb-hdrc.1: int hwep alloc failed for 1x1

message is printed (only on v4.13 and newer).
As I understand EP0 and EP1 are reserved, and one extra endpoint is
reserved for multiplexing bulk transfers, this means 13 endpoints are
available for "locked" use by drivers.

By looking at bNumEndpoints in the lsusb output, and by adding debug
code to the musb_host driver, I derived the following endpoint use by
various usb drivers:
  - cp210x: 2 endpoints per serial port (1 locked when in use),
  - ftdi_sio: 2 endpoints per serial port (1 locked when in use),
  - cdc_acm: 3 endpoints per serial port (2 locked when in use),
  - mos7840: 9 endpoints for 4 serial ports (up to 4 locked when in use),
  - spca561: 1 endpoint per camera (1 locked when in use).

As you see, cdc_acm seems to be the worst way to provide a USB serial
port, as each port needs 2 "locked" endpoints.  That means each bcu2
board needs 6 locked endpoints, and I cannot use (at the same time) more
than 2 bcu2 boards connected to a single boneblack.

While I cannot replace USB-serial convertors on development boards, I
can replace the USB serial implementation on the Teensy.  Hence I'm
looking for a more efficient USB-multi-serial protocol (preferably one
that has a Linux driver), using as few endpoints as possible.
I'm not a USB expert, but If I'm not mistaken, an N-port
USB-multi-serial adapter could be implemented using only 2 or 3
endpoints (one "locked" input endpoint for signalling, and one (TX/RX
combined) or two (TX and RX separated) multiplexed endpoints for data)?

If no such thing exists, I guess I can use the mos7840 protocol instead?
Or is there a better solution?

Thanks for your comments!

[1] https://baylibre.com/acme/
[2] https://github.com/geertu/pcb-bcu2

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
