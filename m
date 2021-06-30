Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 282673B7B09
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jun 2021 02:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235690AbhF3AiZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Jun 2021 20:38:25 -0400
Received: from netrider.rowland.org ([192.131.102.5]:40599 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235637AbhF3AiY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Jun 2021 20:38:24 -0400
Received: (qmail 718644 invoked by uid 1000); 29 Jun 2021 20:35:56 -0400
Date:   Tue, 29 Jun 2021 20:35:56 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux.amoon@gmail.com
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
Message-ID: <20210630003556.GA718579@rowland.harvard.edu>
References: <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu>
 <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu>
 <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu>
 <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 29, 2021 at 06:30:08PM +0200, Martin Blumenstingl wrote:
> Hi Alan,
> 
> On Tue, Jun 29, 2021 at 6:18 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> [...]
> > > >         usbcore.autosuspend=-1
> > > wow, this helps indeed
> > > my steps are:
> > > - power off my Odroid-C1+
> > > - unplug all USB devices
> > > - boot with usbcore.autosuspend=-1 in the kernel cmdline
> > > - plugin my Corsair Voyager USB 3.0 flash drive (which was only
> > > detected before if an additional USB 2.0 flash drive was plugged in
> > > during boot)
> > > -> without any lsusb magic the device was immediately recognized
> >
> > That does show pretty convincingly that runtime suspend is causing the
> > problem.  But I still have no idea why the problem affects some devices
> > and not others.  It's a mystery.
> Maybe because there's two related problems (I am guessing here):
> The first issue is that USB hotplug is not working at all on my
> Odroid-C1+ (which means: dwc2 + GL852G USB hub).
> The second issue is that the workaround we had before (running lsusb
> -vv to make "hot plugged" devices show up) is not working for some USB
> devices.
> 
> It seems that using a different workaround (usbcore.autosuspend=-1)
> makes *all* USB devices show up - even without any "lsusb -vv" call.
> So I think we should focus on the first issue as it may also fix the
> other problem as well.

Those two issues could well be related; they could both be a result of 
improper handling of USB bus suspend.  Fixing that might fix both 
issues.

Alan Stern

> [...]
> > > after rebooting without usbcore.autosuspend=-1 (and no USB device
> > > plugged in during boot):
> > > # grep "" /sys/bus/usb/devices/*/power/autosuspend
> > > /sys/bus/usb/devices/1-1/power/autosuspend:0
> > > /sys/bus/usb/devices/usb1/power/autosuspend:0
> > >
> > > I think the next step is narrowing down which component is causing this issue.
> >
> > Maybe Minas can help.  He knows a lot more about dwc2 than I do (which
> > is practically nothing).
> I'll wait for Minas then
> 
> > > Interestingly my PC (running 5.12.13-arch1-2) also has two Genesys
> > > Logic USB hubs with the same USB vendor and device IDs as my
> > > Odroid-C1+: 05e3:0610.
> > > These hubs are connected to my AMD Ryzen 5000 CPU or the B550 chipset:
> > > usb1              1d6b:0002 09 1IF  [USB 2.00,   480 Mbps,   0mA]
> > > (xhci-hcd 0000:02:00.0) hub
> > >  1-3               05e3:0610 09 1IF  [USB 2.10,   480 Mbps, 100mA]
> > > (GenesysLogic USB2.0 Hub) hub
> > > [...]
> > >  1-7               05e3:0610 09 1IF  [USB 2.00,   480 Mbps, 100mA]
> > > (Genesys Logic, Inc. Hub) hub
> > >
> > > So far I have not observed any problems on my PC.
> >
> > Presumably because it uses xHCI rather than dwc2.
> indeed. I think it's good to know that it's not an issue affecting all
> Genesys Logic USB 2.0 hubs.
> As you mentioned above it's most likely that dwc2 is the culprit here.
> Or it might be some interoperability issue between dwc2 and GL852G
> 
> 
> Best regards,
> Martin
