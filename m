Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607133B765D
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jun 2021 18:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbhF2QVF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Jun 2021 12:21:05 -0400
Received: from netrider.rowland.org ([192.131.102.5]:44691 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232307AbhF2QVB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Jun 2021 12:21:01 -0400
Received: (qmail 704222 invoked by uid 1000); 29 Jun 2021 12:18:07 -0400
Date:   Tue, 29 Jun 2021 12:18:07 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Matt Corallo <oc2udbzfd@mattcorallo.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux.amoon@gmail.com
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
Message-ID: <20210629161807.GB703497@rowland.harvard.edu>
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu>
 <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu>
 <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I think we should CC: the maintainer of the dwc2 driver (added).

On Tue, Jun 29, 2021 at 05:51:51PM +0200, Martin Blumenstingl wrote:
> Hi Alan,
> 
> Your help here is very much appreciated!
> 
> On Tue, Jun 29, 2021 at 5:05 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> [...]
> > > The attached mon1.txt is the output I get
> >
> > Did you remove something from the beginning of this trace?  It starts
> > with what appears to be the tail end of a resume sequence for the
> > on-board Genesys Logic hub.  If you didn't remove anything then
> > something is pretty wrong because the hub was apparently only
> > partially suspended.
> I have not removed anything from the output (at least not on purpose).
> To verify I just re-tried and got a similar result

Yeah, okay.  This indicates that the dwc2 driver has got a problem with 
suspending ports.  Perhaps not surprising, given the context...

> > Anyway, the trace says that when the lsusb command ran, the hub woke up
> > and didn't see any connections on any of its ports.  This could be
> > caused by a bug in the hub itself, a bug in the way the system handles
> > the hub, or maybe a bug in the way it handles a PHY or other component
> > external to the hub.
> This reminds me of commit cc10ce0c51b13d ("usb: dwc2: disable
> power_down on Amlogic devices") [0]
> I checked and the code for this commit is still in mainline (so it was
> not reverted - either on purpose or by accident).

This isn't exactly about powering down; this is about putting the port 
into suspend.  If the dwc2 driver is really suspending the port, it's 
not telling the USB core drivers.  But that commit may be related.

It's possible that the Genesys Logic hub doesn't like to have remote 
wakeup enabled without going into suspend.

> [...]
> > > In case it's relevant for your further analysis:
> > > - Odroid-C1+ and Odroid-C2 both use the USB PHY driver from
> > > drivers/phy/amlogic/phy-meson8b-usb2.c
> > > - Odroid-C1+ and Odroid-C2 both use use the dwc2 driver (running in
> > > host-only mode in this scenario. there's a second OTG capable dwc2
> > > controller which is currently disabled in mainline Linux on both
> > > devices)
> > > - Odroid-C1+ and Odroid-C2 have a soldered down 4-port Genesys Logic USB hub
> > > - Odroid-C1+ does not use any GPIO to control VBUS on usb1
> >
> > Since the problem may be related to runtime power management, you
> > should try booting with the command line parameter
> >
> >         usbcore.autosuspend=-1
> wow, this helps indeed
> my steps are:
> - power off my Odroid-C1+
> - unplug all USB devices
> - boot with usbcore.autosuspend=-1 in the kernel cmdline
> - plugin my Corsair Voyager USB 3.0 flash drive (which was only
> detected before if an additional USB 2.0 flash drive was plugged in
> during boot)
> -> without any lsusb magic the device was immediately recognized

That does show pretty convincingly that runtime suspend is causing the 
problem.  But I still have no idea why the problem affects some devices 
and not others.  It's a mystery.

> > to disable default USB runtime suspends.  Also, check the contents of
> > /sys/bus/usb/devices/1-2/power/autosuspend to make sure that runtime
> > suspend really is disabled.  Does that make the problem go away?
> with usbcore.autosuspend=-1 (after plugging in my Corsair Voyager):
> # grep "" /sys/bus/usb/devices/*/power/autosuspend
> /sys/bus/usb/devices/1-1.1/power/autosuspend:-1
> /sys/bus/usb/devices/1-1/power/autosuspend:-1
> /sys/bus/usb/devices/usb1/power/autosuspend:-1
> 
> after rebooting without usbcore.autosuspend=-1 (and no USB device
> plugged in during boot):
> # grep "" /sys/bus/usb/devices/*/power/autosuspend
> /sys/bus/usb/devices/1-1/power/autosuspend:0
> /sys/bus/usb/devices/usb1/power/autosuspend:0
> 
> I think the next step is narrowing down which component is causing this issue.

Maybe Minas can help.  He knows a lot more about dwc2 than I do (which 
is practically nothing).

> Interestingly my PC (running 5.12.13-arch1-2) also has two Genesys
> Logic USB hubs with the same USB vendor and device IDs as my
> Odroid-C1+: 05e3:0610.
> These hubs are connected to my AMD Ryzen 5000 CPU or the B550 chipset:
> usb1              1d6b:0002 09 1IF  [USB 2.00,   480 Mbps,   0mA]
> (xhci-hcd 0000:02:00.0) hub
>  1-3               05e3:0610 09 1IF  [USB 2.10,   480 Mbps, 100mA]
> (GenesysLogic USB2.0 Hub) hub
> [...]
>  1-7               05e3:0610 09 1IF  [USB 2.00,   480 Mbps, 100mA]
> (Genesys Logic, Inc. Hub) hub
> 
> So far I have not observed any problems on my PC.

Presumably because it uses xHCI rather than dwc2.

Alan Stern

> This is the lsusb.py output on my Odroid-C1+:
> usb1              1d6b:0002 09 1IF  [USB 2.00,   480 Mbps,   0mA]
> (Linux 5.13.0-02058-g8452e2c291aa-dirty dwc2_hsotg DWC OTG Controller
> c90c0000.usb) hub
>  1-1               05e3:0610 09 1IF  [USB 2.00,   480 Mbps, 100mA]
> (Genesys Logic, Inc. Hub) hub
> 
> 
> Best regards,
> Martin
> 
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/dwc2/params.c?id=cc10ce0c51b13d1566d0ec1dcb472fb86330b391
