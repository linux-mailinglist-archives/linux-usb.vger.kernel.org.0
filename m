Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E50A43B75E7
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jun 2021 17:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233073AbhF2Pyb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Jun 2021 11:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232929AbhF2Pya (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Jun 2021 11:54:30 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78063C061760
        for <linux-usb@vger.kernel.org>; Tue, 29 Jun 2021 08:52:03 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id nd37so37220918ejc.3
        for <linux-usb@vger.kernel.org>; Tue, 29 Jun 2021 08:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xM/tkT/GPS6chgDovlrJLUCLh8SRJ9QQOLwPJZFx9ds=;
        b=aOrABFKmmHNJL4ocxxHXSZ2DmAJjm5EzlKBMVljZVraw3gwq//06mHHOfx0PzCQo3h
         yx230bOLGgQNWtxiRydz9c1Th8aYWsJODZDIkl3uFgjn/EBMcYPo+OLO75ubZO5Et9Db
         KVDNdYEFPoOOtlZApfsP/PNGcOVRamWbYgfD/xQ7wOLzi2jsRHK0HWkkWOAYA/Xy8J3O
         LjFiRjZK4dwHVYK86tTAJOta1+Ssl9yw+SD02eAQOIfw2cRAnxgoc7D1NxDsjnQurI1g
         284vJXgunRb8j12q9/11Vurn+kvKbWPDm4qPBuW4n2+2Dr6RoXPvxbPW+QwO5qiAPok6
         u4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xM/tkT/GPS6chgDovlrJLUCLh8SRJ9QQOLwPJZFx9ds=;
        b=ssV4L+HBm6EXfMaQVe4uXwMJLqxqK5MY/cqgyrFhIXoyvEZ3eGENztpqQLPQanf2OC
         8mIhjgY4Ze5mjRvzCmKKk52sS6dEzgrBaoYnTVT7g5eDNrK17g0HkP83hy2WrfvPgPlC
         kPkXdED05v+k2U3/0TrlBNDbkcxtPSlz3aoCivtABUZAxRZar4uNeBpuOsClZ6WFJxi/
         auOSEhHbNd0D54QlrMiQduUfWTa9UbBv8+4Wi4fHdsY2i1KSEfCv3uEzpeAnmy1Y78UV
         0J7DphTFrHh+21E7pFaUAroxGhgt5tlVxjuBmol0Wsq/I5g0QW+sMg8QTwRHvAqJzUuu
         WqmA==
X-Gm-Message-State: AOAM5330YSd8XuQOtzi/UNz0bqdGXHwqCInkEj0F4+CjGAfeLm56Zl71
        TzYOokj1evanJDdE4qj6+iJzqqHDACqNmqKCo8A=
X-Google-Smtp-Source: ABdhPJxzsdqC2WrSFDo7TtSAAn2U0t5CNfpahdnc+eKlDtIrM0RzHnMAnB6InNbkuUUgdLkNUz9jiHe+iT6Jddjky6E=
X-Received: by 2002:a17:906:39c3:: with SMTP id i3mr15721290eje.527.1624981922000;
 Tue, 29 Jun 2021 08:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu> <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu> <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu> <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu>
In-Reply-To: <20210629150541.GB699290@rowland.harvard.edu>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 29 Jun 2021 17:51:51 +0200
Message-ID: <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Matt Corallo <oc2udbzfd@mattcorallo.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux.amoon@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

Your help here is very much appreciated!

On Tue, Jun 29, 2021 at 5:05 PM Alan Stern <stern@rowland.harvard.edu> wrote:
[...]
> > The attached mon1.txt is the output I get
>
> Did you remove something from the beginning of this trace?  It starts
> with what appears to be the tail end of a resume sequence for the
> on-board Genesys Logic hub.  If you didn't remove anything then
> something is pretty wrong because the hub was apparently only
> partially suspended.
I have not removed anything from the output (at least not on purpose).
To verify I just re-tried and got a similar result

> Anyway, the trace says that when the lsusb command ran, the hub woke up
> and didn't see any connections on any of its ports.  This could be
> caused by a bug in the hub itself, a bug in the way the system handles
> the hub, or maybe a bug in the way it handles a PHY or other component
> external to the hub.
This reminds me of commit cc10ce0c51b13d ("usb: dwc2: disable
power_down on Amlogic devices") [0]
I checked and the code for this commit is still in mainline (so it was
not reverted - either on purpose or by accident).

[...]
> > In case it's relevant for your further analysis:
> > - Odroid-C1+ and Odroid-C2 both use the USB PHY driver from
> > drivers/phy/amlogic/phy-meson8b-usb2.c
> > - Odroid-C1+ and Odroid-C2 both use use the dwc2 driver (running in
> > host-only mode in this scenario. there's a second OTG capable dwc2
> > controller which is currently disabled in mainline Linux on both
> > devices)
> > - Odroid-C1+ and Odroid-C2 have a soldered down 4-port Genesys Logic USB hub
> > - Odroid-C1+ does not use any GPIO to control VBUS on usb1
>
> Since the problem may be related to runtime power management, you
> should try booting with the command line parameter
>
>         usbcore.autosuspend=-1
wow, this helps indeed
my steps are:
- power off my Odroid-C1+
- unplug all USB devices
- boot with usbcore.autosuspend=-1 in the kernel cmdline
- plugin my Corsair Voyager USB 3.0 flash drive (which was only
detected before if an additional USB 2.0 flash drive was plugged in
during boot)
-> without any lsusb magic the device was immediately recognized

> to disable default USB runtime suspends.  Also, check the contents of
> /sys/bus/usb/devices/1-2/power/autosuspend to make sure that runtime
> suspend really is disabled.  Does that make the problem go away?
with usbcore.autosuspend=-1 (after plugging in my Corsair Voyager):
# grep "" /sys/bus/usb/devices/*/power/autosuspend
/sys/bus/usb/devices/1-1.1/power/autosuspend:-1
/sys/bus/usb/devices/1-1/power/autosuspend:-1
/sys/bus/usb/devices/usb1/power/autosuspend:-1

after rebooting without usbcore.autosuspend=-1 (and no USB device
plugged in during boot):
# grep "" /sys/bus/usb/devices/*/power/autosuspend
/sys/bus/usb/devices/1-1/power/autosuspend:0
/sys/bus/usb/devices/usb1/power/autosuspend:0

I think the next step is narrowing down which component is causing this issue.

Interestingly my PC (running 5.12.13-arch1-2) also has two Genesys
Logic USB hubs with the same USB vendor and device IDs as my
Odroid-C1+: 05e3:0610.
These hubs are connected to my AMD Ryzen 5000 CPU or the B550 chipset:
usb1              1d6b:0002 09 1IF  [USB 2.00,   480 Mbps,   0mA]
(xhci-hcd 0000:02:00.0) hub
 1-3               05e3:0610 09 1IF  [USB 2.10,   480 Mbps, 100mA]
(GenesysLogic USB2.0 Hub) hub
[...]
 1-7               05e3:0610 09 1IF  [USB 2.00,   480 Mbps, 100mA]
(Genesys Logic, Inc. Hub) hub

So far I have not observed any problems on my PC.

This is the lsusb.py output on my Odroid-C1+:
usb1              1d6b:0002 09 1IF  [USB 2.00,   480 Mbps,   0mA]
(Linux 5.13.0-02058-g8452e2c291aa-dirty dwc2_hsotg DWC OTG Controller
c90c0000.usb) hub
 1-1               05e3:0610 09 1IF  [USB 2.00,   480 Mbps, 100mA]
(Genesys Logic, Inc. Hub) hub


Best regards,
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/dwc2/params.c?id=cc10ce0c51b13d1566d0ec1dcb472fb86330b391
