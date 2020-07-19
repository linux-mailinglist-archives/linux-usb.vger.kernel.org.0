Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 007502253BF
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jul 2020 21:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgGSTsM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jul 2020 15:48:12 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42865 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726073AbgGSTsM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jul 2020 15:48:12 -0400
Received: (qmail 1206014 invoked by uid 1000); 19 Jul 2020 15:48:11 -0400
Date:   Sun, 19 Jul 2020 15:48:11 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Achim Dahlhoff <achimdahlhoff@gmx.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Re: bug: Reproduceable hung-task in snd_usb_pcm or usb-core in
 VM with Behringer device.
Message-ID: <20200719194811.GB1205645@rowland.harvard.edu>
References: <trinity-384b299a-61b0-461c-9abb-1a00fc942b85-1595083781938@3c-app-gmx-bap08>
 <20200719144715.GB1200012@rowland.harvard.edu>
 <trinity-1ebbee57-9733-4e6a-8924-6364303e871f-1595185540319@3c-app-gmx-bs53>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-1ebbee57-9733-4e6a-8924-6364303e871f-1595185540319@3c-app-gmx-bs53>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 19, 2020 at 09:05:40PM +0200, Achim Dahlhoff wrote:
> >> Reproduceable hung-task in snd_usb_pcm or usb-core
> >> in VM with Behringer device.
> >>
> >> Hello maintainers of usb,
> >>
> >> I found a reproduceable hung-task problem when trying to use Behringer
> >> "Uphoria" audio devices inside VMware workstation, on Debian-SID with
> >> kernel 5.7 or with 5.8-rc5 . Kernel-trace and USB IDs are included.
> >>
> >> Am I right to post here?
> >
> >Yes.
> >
> >> The problem occurs every time when accessing the devices.
> >> The problem does NOT occur with:
> >> - another sound device (griffin)
> >> - on native Linux on another machine
> >
> >What about when you use the problematic machine with native Linux?
> >That's really the most important case.
> 
> I have run it with native Linux on the same AMD machine, and now it works.
> Tried both the USB2 and the USB3 ports.
> 
> It still outputs these warnings when connecting:
> 
> [  205.639776] usb 1-6: new high-speed USB device number 8 using xhci_hcd
> [  205.823725] usb 1-6: New USB device found, idVendor=1397, idProduct=0509, bcdDevice= 1.12
> [  205.823732] usb 1-6: New USB device strings: Mfr=1, Product=3, SerialNumber=0
> [  205.823736] usb 1-6: Product: UMC404HD 192k
> [  205.823738] usb 1-6: Manufacturer: BEHRINGER
> [  208.045722] xhci_hcd 0000:03:00.0: WARN: buffer overrun event for slot 7 ep 4 on endpoint
> [  208.045844] xhci_hcd 0000:03:00.0: WARN: buffer overrun event for slot 7 ep 4 on endpoint
> [  208.045969] xhci_hcd 0000:03:00.0: WARN: buffer overrun event for slot 7 ep 4 on endpoint
> [  208.046094] xhci_hcd 0000:03:00.0: WARN: buffer overrun event for slot 7 ep 4 on endpoint

I have no idea what those are caused by.  Do they show up when you use 
the USB-2 port?

> [  208.046468] retire_capture_urb: 3 callbacks suppressed
> 
> But I cannot see the problem anymore. So the problem is related to
> VMware. But other devices, also audio, work in that VMware installation.

So at least you have narrowed it down.  That's progress!

Alan Stern
