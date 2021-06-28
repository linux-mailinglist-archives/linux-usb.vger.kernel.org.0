Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA873B5692
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jun 2021 03:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbhF1BSz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Jun 2021 21:18:55 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34727 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231706AbhF1BSy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Jun 2021 21:18:54 -0400
Received: (qmail 639439 invoked by uid 1000); 27 Jun 2021 21:16:28 -0400
Date:   Sun, 27 Jun 2021 21:16:28 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Matt Corallo <oc2udbzfd@mattcorallo.com>
Cc:     linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
Message-ID: <20210628011628.GC638648@rowland.harvard.edu>
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 27, 2021 at 09:05:25PM -0400, Matt Corallo wrote:
> 
> 
> On 6/27/21 20:58, Alan Stern wrote:
> > On Sun, Jun 27, 2021 at 08:32:21PM -0400, Matt Corallo wrote:
> > > On an ODROID-C1/C2 device, using the dwc2 driver, only some devices cause USB bus to enumerate devices.
> > > 
> > > Specifically, both on boot and during normal operation, if some devices are
> > > plugged in, all USB devices are detected, but if those devices are removed,
> > > no detection of any devices occurs.
> > 
> > So if you boot with no devices plugged in, and then you plug in (say) a
> > flash drive, it doesn't get detected?
> 
> There is a separate and long-standing bug on the ODROID-C1 and ODROID-C2
> devices where hotplug doesn't work reliably, which is why I mentioned
> rebooting. This specific bug all works identically whether booting fresh
> with the devices or testing hotplug (which sometimes works with lsusb -vvv).

That doesn't answer my question.  If no devices are plugged in (either 
at boot or during normal operation), and then you plug in a device like 
a flash drive, does it get detected?  What you wrote seems to imply that 
it does not.

> > > I sadly don't have a lot more to go on, but xdarklight on IRC (I believe ==
> > > Martin, CC'd) confirmed the findings with a grab bag of USB devices he had
> > > sitting around as well, and may be able to provide CONFIG_USB_DWC2_DEBUG
> > > output.
> > > 
> > > Any further guidance on where to look to debug this issue would be appreciated.
> > > 
> > > As a sample, some devices which, when plugged in (either alone or together)
> > > do not cause any USB device detection (see attached lsusb -v files):
> > > 
> > > Samsung T7 USB 3 drive
> > > Samsung-Branded Silicon Motion USB 3 Flash Drive
> > > 
> > > Some devices which, when plugged in cause all USB devices to be detected:
> > > 
> > > Mushkin-Branded Kingston USB 3 Flash Drive
> > > Kingston-Branded Kingston USB 2 Flash Drive
> > > USB-3 MicroSD Card reader (lsusb/testing by xdarklight)
> > > SanDisk USB 3 Flash Drive (lsusb/testign by xdkarlight)
> > 
> > This could simply be a question of power.  Most of the flash drives and
> > the card reader probably don't require very much power, whereas some of
> > them need more.  You can this, to some extent, in the MaxPower fields of
> > the lsusb -v listings.
> 
> That seems strange, though, given that the first group of devices appear and
> work totally fine, but only when something from the second group of devices
> is plugged in. If the second group is not present, then the first group of
> devices do not appear at all.

You mean that only devices in the first group are affected by this bug?  
Devices in the second group are always detected correctly regardless of 
what else is plugged in?  (This contradicts what you wrote above.)

Still, you are right that this does not seem like an insufficient power 
problem.

Alan Stern

> > Do things work better if you plug these devices into a powered hub
> > rather than directly into the computer?  If the hub can provide the
> > power that these devices need, the computer won't be overloaded.
> 
> I don't have a powered hub handy, sadly. Maybe Martin does and can comment when he wakes.
> 
> Matt
