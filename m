Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F15F53139B
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2019 19:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfEaRQ1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 May 2019 13:16:27 -0400
Received: from crumpet.qq2.net ([80.247.17.44]:33386 "EHLO crumpet.qq2.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbfEaRQ0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 May 2019 13:16:26 -0400
X-Greylist: delayed 2147 seconds by postgrey-1.27 at vger.kernel.org; Fri, 31 May 2019 13:16:24 EDT
Received: from mail-oi1-f177.google.com ([209.85.167.177])
        by crumpet.qq2.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <geoff@defgeoff.co.uk>)
        id 1hWka4-0000Gl-96
        for linux-usb@vger.kernel.org ; Fri, 31 May 2019 17:40:36 +0100
Received: by mail-oi1-f177.google.com with SMTP id b21so4237260oic.8
        for <linux-usb@vger.kernel.org>; Fri, 31 May 2019 09:40:36 -0700 (PDT)
X-Gm-Message-State: APjAAAV4bVawVTY2xWYY9V9h/BvlvhJveEHU43Tns7Z6P6qKPQoGdkuL
        2NhGOS1rywXyzSJzks3S56zZJ5lX4CUTs9WmxQ==
X-Google-Smtp-Source: APXvYqyMu/ZTHZfSTrDn1kRbw4LDtMq1P+k6FnZ6ozFaAC+JpxavOduUuAZ24PvQvTPygGP0cnlOVKKWYUR1O1KHWag=
X-Received: by 2002:aca:3287:: with SMTP id y129mr6455931oiy.102.1559320834801;
 Fri, 31 May 2019 09:40:34 -0700 (PDT)
MIME-Version: 1.0
From:   Geoff Winkless <geoff@defgeoff.co.uk>
Date:   Fri, 31 May 2019 17:40:23 +0100
X-Gmail-Original-Message-ID: <CAEzk6fe0+LHFbZgN4t8_NVS_fysj7wHFGerMB1fhoHmXsCogVw@mail.gmail.com>
Message-ID: <CAEzk6fe0+LHFbZgN4t8_NVS_fysj7wHFGerMB1fhoHmXsCogVw@mail.gmail.com>
To:     Linux-USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on crumpet.qq2.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.2
Subject: ehci support on old VIA vt82xxx disappeared around kernel 3.8.
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

Apologies if this is the incorrect place to post this, if so please
feel free to call me names and then suggest somewhere more appropriate
:)

We have an embedded device on an old EPIA Mini-ITX board that runs
Linux 2.6. There are features in more recent (>3.10) kernels that
would be useful to us, so I tried to build them for it; however while
the kernel runs perfectly fine, ehci support simply fails, which is
catastrophic for the device's use - we need USB2 speeds.

I worked backwards and found that it runs normally on 3.7.9, but on
3.7.10 it starts throwing up errors:

usb 1-5: new high-speed USB device number 3 using ehci_hcd
usb 1-5: device descriptor read/8, error -110
usb 1-5: device descriptor read/8, error -110
usb 1-5: new high-speed USB device number 4 using ehci_hcd
usb 1-5: device not accepting address 4, error -110
usb 1-5: new high-speed USB device number 5 using ehci_hcd

By 3.8.0 ehci simply doesn't work, as if someone decided these errors
were too hard to deal with and just disabled the device support.

Chipset is VIA vt82xxx; the ID of the offending bus is 1106:3104

I tried every combination of loading ehci before and after etc,
setting the old_scheme_first value, disabling acpi/apm, basically
anything I could find on the web that seems related to ehci problems,
but nothing seems to make the ehci driver even recognise the device.

/proc/bus/pci/devices shows

0000 11063123 0  e6000008        0   0   0    0 0     0  400000
0 0 0  0 0     0 agpgart-via
0008 1106b091 0         0        0   0   0    0 0     0       0
0 0 0  0 0     0
0080 11063038 c         0        0   0   0 d001 0     0       0
0 0 0 20 0     0 uhci_hcd
0081 11063038 c         0        0   0   0 d401 0     0       0
0 0 0 20 0     0 uhci_hcd
0082 11063038 5         0        0   0   0 d801 0     0       0
0 0 0 20 0     0 uhci_hcd
0083 11063104 9  e6400000        0   0   0    0 0     0     100
0 0 0  0 0     0
0088 11063177 0         0        0   0   0    0 0     0       0
0 0 0  0 0     0
0089 11060571 0       1f0      3f6 170 376 dc01 0     0       8
0 8 0 10 0     0 VIA_IDE
008d 11063059 5      e001        0   0   0    0 0     0     100
0 0 0  0 0     0 snd_via82xx
0090 11063065 c      e801 e6401000   0   0    0 0     0     100
100 0 0  0 0     0 via-rhine
0100 11063122 c  e0000008 e4000000   0   0    0 0 c0002 4000000
1000000 0 0  0 0 20000

(apologies for the long lines, I cut down the spacing as much as I could).

So you can see that the 11063104 line doesn't even have the ehci-hcd
driver associated; on earlier kernel versions the line reads

0083 11063104 9  e6400000 0 0 0 0 0 0 100 0 0 0 0 0 0 ehci_hcd

Output from lsmod, just in case you're thinking I just haven't
inserted the ehci driver...

usbnet 10726 0 - Live 0xcfb4f000
ohci_hcd 15520 0 - Live 0xcfad9000
uhci_hcd 15679 0 - Live 0xcfa94000
ehci_hcd 30853 0 - Live 0xcfa49000
pl2303 6016 0 - Live 0xcf979000
ftdi_sio 25410 0 - Live 0xcf940000
option 18882 0 - Live 0xcf8e7000
usb_wwan 4082 1 option, Live 0xcf8a2000

I'm happy to dig for myself - I appreciate this is a fairly niche
problem; I have getting on for 30 years' development experience in
various platforms, including low-level hardware access in assembly
when I was young, but all I've ever done with the kernel is modify in
a very small way a few device drivers and I don't even know where to
start with this so could do with some pointers.

I tried running a diff on drivers/usb between 3.7.9 and 3.7.10, but
other than a few changes around usbserial there doesn't seem to be
much, which seems odd given that the behaviour clearly changed. The
3.7.10 changelog only lists some usb-audio changes, a change for
memory allocation for some urb blocks, and some fixes for usb-serial,
so I guess something else changing has modified the way the USB core
interacts with the hardware.

Did we intentionally simply drop support for this chipset in 3.8?

Thanks!

Geoff
