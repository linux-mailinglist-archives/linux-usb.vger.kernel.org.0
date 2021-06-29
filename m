Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDD63B74CF
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jun 2021 17:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234598AbhF2PIJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Jun 2021 11:08:09 -0400
Received: from netrider.rowland.org ([192.131.102.5]:53895 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232521AbhF2PIJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Jun 2021 11:08:09 -0400
Received: (qmail 701135 invoked by uid 1000); 29 Jun 2021 11:05:41 -0400
Date:   Tue, 29 Jun 2021 11:05:41 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Matt Corallo <oc2udbzfd@mattcorallo.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux.amoon@gmail.com
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
Message-ID: <20210629150541.GB699290@rowland.harvard.edu>
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu>
 <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 28, 2021 at 08:37:38PM +0200, Martin Blumenstingl wrote:
> Hi Alan,
> 
> I am also interested in finding a fix for this issue just like Matt.
> Also I think Anand is interested in this, so +Cc Anand.
> 
> On Mon, Jun 28, 2021 at 4:24 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> [...]
> > Okay.  You can try collecting some usbmon traces to see what's going on.
> >
> > First test: Boot with nothing plugged in, start a usbmon trace for bus 0
> > (cat /sys/kernel/debug/usb/usbmon/0u >mon1.txt), plug in a first-group
> > device, run lsusb -v to trigger enumeration, and then kill the "cat"
> > process.
> My first-group device is a Corsair Voyager USB 3.0 flash drive
> To be precise, "lsusb -v" doesn't make new devices show up for me, so
> I am using "lsusb -vv". I am just pointing this out so we're both on
> the same page here
> 
> The attached mon1.txt is the output I get

Did you remove something from the beginning of this trace?  It starts
with what appears to be the tail end of a resume sequence for the
on-board Genesys Logic hub.  If you didn't remove anything then
something is pretty wrong because the hub was apparently only
partially suspended.

Anyway, the trace says that when the lsusb command ran, the hub woke up 
and didn't see any connections on any of its ports.  This could be 
caused by a bug in the hub itself, a bug in the way the system handles 
the hub, or maybe a bug in the way it handles a PHY or other component 
external to the hub.

> > Second test: Same as the first except that you boot with a second-group
> > device already plugged in.
> mon2.txt is the result of:
> - power off my board (Odroid-C1+)
> - plug in a second-group device (cheap 1GB USB 2.0 flash drive)
> - boot Linux (which detects the USB 2.0 flash drive during boot)
> - cat usbmon ...
> - plug in my first-group Corsair Voyager
> - (this was now automatically detected, even without running lsusb)

This trace shows that the hub was not suspended and it did see the new 
connection.

> > The differences between the two traces may indicate where the problem
> > is.
> My interpretation of mon1.txt is that there's nothing seen on the bus.
> I don't see many similarities with the other outputs so I am hoping
> that you have some hint for me
> 
> In case it's relevant for your further analysis:
> - Odroid-C1+ and Odroid-C2 both use the USB PHY driver from
> drivers/phy/amlogic/phy-meson8b-usb2.c
> - Odroid-C1+ and Odroid-C2 both use use the dwc2 driver (running in
> host-only mode in this scenario. there's a second OTG capable dwc2
> controller which is currently disabled in mainline Linux on both
> devices)
> - Odroid-C1+ and Odroid-C2 have a soldered down 4-port Genesys Logic USB hub
> - Odroid-C1+ does not use any GPIO to control VBUS on usb1

Since the problem may be related to runtime power management, you
should try booting with the command line parameter

	usbcore.autosuspend=-1

to disable default USB runtime suspends.  Also, check the contents of
/sys/bus/usb/devices/1-2/power/autosuspend to make sure that runtime
suspend really is disabled.  Does that make the problem go away?

Alan Stern

> Maybe Matt can also share the usbmon output from his Odroid-C2 (a
> device I don't have) to confirm that it's the same issue (and we're
> not hunting two different problems).
> 
> 
> Best regards,
> Martin
