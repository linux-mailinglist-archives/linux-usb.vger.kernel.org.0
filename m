Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8382EAF82
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 16:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbhAEP4h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 10:56:37 -0500
Received: from smtp2.unipi.it ([131.114.21.21]:45090 "EHLO smtp.unipi.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728354AbhAEP4g (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Jan 2021 10:56:36 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp.unipi.it (Postfix) with ESMTP id 7455780EDF
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 16:55:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at unipi.it
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
        (Authenticated User)
        by smtp.unipi.it (Postfix) with ESMTPSA id ACD3C80081
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 16:55:53 +0100 (CET)
Received: by mail-ua1-f44.google.com with SMTP id w7so18043uap.13
        for <linux-usb@vger.kernel.org>; Tue, 05 Jan 2021 07:55:53 -0800 (PST)
X-Gm-Message-State: AOAM530pQtyqc8xisMhTDhpNwj2RBreFXuFGGkkIg3enDZk+TEogjBUP
        d+6XF0oxM9cBsxR91mOGlv4VcYvvUZS2KvC5txk=
X-Google-Smtp-Source: ABdhPJxwRJtsGqpUv0//ElnfAf14IbOFllmO+Q+NttfBxEm4WiNmcU25ffZdyQbjGdrLfdtDhwp4/e/FUunHjg/YnJE=
X-Received: by 2002:ab0:5542:: with SMTP id u2mr382852uaa.41.1609862152907;
 Tue, 05 Jan 2021 07:55:52 -0800 (PST)
MIME-Version: 1.0
References: <CAOefePC_PEkra4adLq4Risea3VCtN41jU42_C=5UJ=mYuGfFog@mail.gmail.com>
 <X/SFeQM48WUyVR9V@kroah.com>
In-Reply-To: <X/SFeQM48WUyVR9V@kroah.com>
From:   Augusto Ciuffoletti <augusto.ciuffoletti@unipi.it>
Date:   Tue, 5 Jan 2021 16:55:41 +0100
X-Gmail-Original-Message-ID: <CAOefePCJzObfprvXHsruzO7sRn4ZkPO2PD_LJae+BhwgyDOytw@mail.gmail.com>
Message-ID: <CAOefePCJzObfprvXHsruzO7sRn4ZkPO2PD_LJae+BhwgyDOytw@mail.gmail.com>
Subject: Re: Problem with the CH341 driver in Ubuntu 20.04
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

thank you for your reply.

The kernel version I am using is the one currently shipped with the
latest release of Ubuntu 20.04 (LTS). They will certainly upgrade the
kernel in the future: if you tell me that the problem does not exist
in a successive kernel release, I will post the info and close the
issue.

You ask me "Where is your usb-to-serial device here?". The point is
that nothing appears in the lsusb related to the device, although it
is plugged in (the device receives power). Plugin/unplugging the
device does not result in any output in syslog/dmesg. I tried to
manually insert the driver, with no result. The device is not
discovered at all, but it was (and worked perfectly) in the previous
Ubuntu release (19.10), and I just guess the kernel was
5.3.0-64-generic. So I have no clue..., and it would be helpful to
have a way to obtain any sort of.

Thank you,

Augusto

Il giorno mar 5 gen 2021 alle ore 16:26 Greg KH
<gregkh@linuxfoundation.org> ha scritto:
>
> On Tue, Jan 05, 2021 at 04:14:14PM +0100, Augusto Ciuffoletti wrote:
> > I run into this problem trying to program an ESP8266 board, which uses
> > the CH341 chip in the programming interface as a USB-to-Serial
> > interface. The problem appeared after an upgrade from Ubuntu 19.10 to
> > 20.04 (that I carried out one week ago).
> >
> > This is the kernel I am using:
> >
> > ===
> > $ uname -r
> > 5.4.0-58-generic
>
> That's an old kernel, you should get support from your distro if you
> want to stick with that, but:
>
> > ===
> >
> > When I connect the ESP8266 board (a Wemos D1 mini) to the USB there is
> > no activity on the syslog (or dmesg), and the kernel module is not
> > loaded. In fact I do not see the /dev/ttyACM0 device in the /dev
> > directory and no useful device appears in the Arduino GUI.
> >
> > I have found the module in the kernel tree but, even forcing the
> > installation, nothing happens:
> >
> > ===
> > augusto@Legion:~$ ls
> > /usr/lib/modules/5.4.0-58-generic/kernel/drivers/usb/serial/ch*
> > /usr/lib/modules/5.4.0-58-generic/kernel/drivers/usb/serial/ch341.ko
> > augusto@Legion:~$ sudo modprobe ch341
> > [sudo] password di augusto:
> > augusto@Legion:~$ lsusb
> > Bus 002 Device 002: ID 05e3:0626 Genesys Logic, Inc. USB3.1 Hub
> > Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> > Bus 001 Device 003: ID 13d3:56a6 IMC Networks Integrated Camera
> > Bus 001 Device 005: ID 0cf3:e500 Qualcomm Atheros Communications
> > Bus 001 Device 006: ID 046d:c517 Logitech, Inc. LX710 Cordless Desktop Laser
> > Bus 001 Device 004: ID 093a:2510 Pixart Imaging, Inc. Optical Mouse
> > Bus 001 Device 002: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
> > Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>
> Where is your usb-to-serial device here?  Are you sure it's actually
> working?  I don't see it in the list of devices, which is a pretty good
> reason why the serial driver isn't working :)
>
> Try looking in the kernel log when you plug the device in, perhaps it
> says something?
>
> thanks,
>
> greg k-h
