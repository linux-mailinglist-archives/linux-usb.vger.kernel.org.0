Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 389333C95B1
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jul 2021 03:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhGOBrp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 21:47:45 -0400
Received: from netrider.rowland.org ([192.131.102.5]:54363 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231628AbhGOBro (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 21:47:44 -0400
Received: (qmail 397993 invoked by uid 1000); 14 Jul 2021 21:44:51 -0400
Date:   Wed, 14 Jul 2021 21:44:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
Message-ID: <20210715014451.GA397753@rowland.harvard.edu>
References: <20210629161807.GB703497@rowland.harvard.edu>
 <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
 <CAFBinCA083iP4T2b1+MoDGZFKMO8eyy-WceRBA-QibatqboO1A@mail.gmail.com>
 <f084f45a-5be0-9542-260a-f4641e1215d0@synopsys.com>
 <CAFBinCCj5zUiv9LS2jKRxzX5pfcFTr4tVZwR7TA2CRQg68qwTw@mail.gmail.com>
 <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
 <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
 <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com>
 <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 15, 2021 at 01:16:44AM +0200, Martin Blumenstingl wrote:
> Hi Minas,
> 
> On Wed, Jul 14, 2021 at 5:27 PM Minas Harutyunyan
> <Minas.Harutyunyan@synopsys.com> wrote:
> >
> > Hi Martin,

> > Per our understanding this issue is because of power budget and
> > autosuspend functionality.
> Many thanks for doing this investigation!
> 
> > Autosuspend. Please review this patch: "usb: core: hub: Disable
> > autosuspend for Cypress CY7C65632"
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=a7d8d1c7a7f73e780aa9ae74926ae5985b2f895f
> >
> > It's very similar to your case. Actually you already tested
> > usbcore.autosuspend=-1 and it's helped you.
> > Could you please develop same patch for your soldered hub and test it.
> I found that drivers/usb/core/hub.c already has an entry for Genesys
> Logic USB hubs.
> It uses HUB_QUIRK_CHECK_PORT_AUTOSUSPEND instead of
> HUB_QUIRK_DISABLE_AUTOSUSPEND though.
> So I wrote a patch to change that (I attached it to this mail for
> reference, I will submit it as a proper patch one I understand enough
> about this).
> 
> With this patch applied all USB devices I have are auto-detected when
> hot-plugged.

Yeah, I suspect this patch will not be accepted.  There are a _lot_ of 
Genesys Logic hubs out there, and apparently none of them besides the 
ones in your Odroid systems have trouble with runtime suspend.

> My doubt with this is that my desktop PC (using an ASUS B550-F
> motherboard) comes with a few of these USB hubs soldered down as well
> - and there the behavior is different.
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
>    ID 1d6b:0002 Linux Foundation 2.0 root hub
>    /sys/bus/usb/devices/usb1  /dev/bus/usb/001/001
>    |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>        ID 05e3:0610 Genesys Logic, Inc. Hub
>        /sys/bus/usb/devices/1-3  /dev/bus/usb/001/002
> [...]
>    |__ Port 7: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
>        ID 05e3:0610 Genesys Logic, Inc. Hub
>        /sys/bus/usb/devices/1-7  /dev/bus/usb/001/005
> 
> I plugged in the Corsair Voyager USB 3.0 drive which is not being
> detected on my Odroid-C1+ and instantly this shows up in my kernel
> log:
>   usb 1-7.3: new high-speed USB device number 46 using xhci_hcd
>   usb 1-7.3: New USB device found, idVendor=1b1c, idProduct=1a03,
> bcdDevice= a.00
>   usb 1-7.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>   usb 1-7.3: Product: Voyager 3.0
>   usb 1-7.3: Manufacturer: Corsair
> 
> So I am wondering why it works there but not on my Odroid-C1, with the
> (only known) difference being the host controller (xhci_hcd vs dwc2)
> which is being used.

Indeed.

Martin, here's another test you can try, on both the Odroid and PC 
systems.  Boot with usb.autosuspend=-1 on the command line to disable 
default runtime suspend.  But then before plugging in the drive, start a 
usbmon trace and do:

	echo 2 >/sys/bus/usb/devices/1-2/power/autosuspend

to enable runtime suspend for the Genesys Logic hub.  (On the PC, 
replace the 1-2 with 1-5 or whatever the appropriate device path is for 
the GL hub.)

Wait at least two seconds for the hub to go into runtime suspend before 
plugging in the Corsair drive and stopping the trace.  It might turn out 
that allowing the GL hub to suspend while keeping the DWC2 root hub 
active will make a difference.

(The reason for doing this on the PC as well as on the Odroid is to make 
sure that the sequence of USB requests sent to the hub and responses 
received from it is exactly the same in both cases.)

Alan Stern
