Return-Path: <linux-usb+bounces-31247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C4ECABA12
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 22:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1958B3014A11
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 21:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB322DEA77;
	Sun,  7 Dec 2025 21:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kCD5+XtL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C66B1684A4
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 21:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765141938; cv=none; b=qAteZRp+Q7UrQw3Kf4Kx6hcnai1BNiXD9nYPjPMgvCZi5bQcPOkuRMzeS02F8VaUloX0tNh+kPtfg5udc2CwdbtvC4buEanLcL/Ny7fpxenrhuqmkSlmvH05WwKUBz5tILltLJgDmsqIe4xC7B8DPET5HNY8pdOqN9pegLv1fT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765141938; c=relaxed/simple;
	bh=5vpMbREaSTaIOtRJtqvd571O7Q1OuWn2Gf7OGqnbiXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpHtk5mH4r2Qi9nAFVwn1N9PpawEE8LhrrXrasN0JkUxgsTiROHCZOKjbEbNN/2bsU6lO3JmfNXwS74fMD7ko1XL91vXUkzMbS3UOwYUONObZwZigJP2/Nvtc3znf1edZiWbzM0hD4l9j1NAEEBN51gj/BRjHrjSXDfQilCsrf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kCD5+XtL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4C1C4CEFB;
	Sun,  7 Dec 2025 21:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765141937;
	bh=5vpMbREaSTaIOtRJtqvd571O7Q1OuWn2Gf7OGqnbiXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kCD5+XtLGeOrakHUXAXXIapLnLmrIebJB/fvMNuEhPmhiNLG5tbEL/sYUoz2s91nW
	 CDkCA8ZhknP5ROMypwiCbauusX2MCLsytVUWVgIH5Wf5G0OkIow4896N/22CvVW9Hf
	 9yXMXreGg1wIun7nRr00qquluNiJzi/1GD+Gdby0=
Date: Mon, 8 Dec 2025 06:12:15 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Johannes =?iso-8859-1?Q?Br=FCderl?= <johannes.bruederl@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that hang
 on BOS descriptor
Message-ID: <2025120846-nearby-breath-e5fe@gregkh>
References: <2025120708-header-startling-ffaf@gregkh>
 <20251207012059.7899-1-johannes.bruederl@gmail.com>
 <20251207084012.7c232e52.michal.pecio@gmail.com>
 <CAP=XvD+dNNDj75DYjjByE3o7F8i-QxusAdz-5+hG24fCesWYRw@mail.gmail.com>
 <20251207104505.1d5f3718.michal.pecio@gmail.com>
 <CAP=XvDJJP2orxYcgiKzp0FrQE2UMiXndZe8Z6BdBRFvkujWu5w@mail.gmail.com>
 <2025120748-extras-retrain-16eb@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025120748-extras-retrain-16eb@gregkh>

On Sun, Dec 07, 2025 at 08:00:53PM +0900, Greg KH wrote:
> On Sun, Dec 07, 2025 at 11:47:34AM +0100, Johannes Brüderl wrote:
> > On Sun, Dec 7, 2025 at 10:45 AM Michal Pecio <michal.pecio@gmail.com> wrote:
> > >
> > > On Sun, 7 Dec 2025 10:22:41 +0100, Johannes Brüderl wrote:
> > > > Here's the BOS Descriptor section when running w/ root.
> > > > This is without this patch, so it "reconnected" with SuperSpeed (5Gbps).
> > > >
> > > > Binary Object Store Descriptor:
> > > >   bLength                 5
> > > >   bDescriptorType        15
> > > >   wTotalLength       0x0016
> > > >   bNumDeviceCaps          2
> > > >   USB 2.0 Extension Device Capability:
> > > >     bLength                 7
> > > >     bDescriptorType        16
> > > >     bDevCapabilityType      2
> > > >     bmAttributes   0x00000000
> > > >       (Missing must-be-set LPM bit!)
> > > >   SuperSpeed USB Device Capability:
> > > >     bLength                10
> > > >     bDescriptorType        16
> > > >     bDevCapabilityType      3
> > > >     bmAttributes         0x00
> > > >     wSpeedsSupported   0x000e
> > > >       Device can operate at Full Speed (12Mbps)
> > > >       Device can operate at High Speed (480Mbps)
> > > >       Device can operate at SuperSpeed (5Gbps)
> > > >     bFunctionalitySupport   3
> > > >       Lowest fully-functional device speed is SuperSpeed (5Gbps)
> > > >     bU1DevExitLat           0 micro seconds
> > > >     bU2DevExitLat           0 micro seconds
> > > >
> > > > (Missing must-be-set LPM bit!) seems to be weird? As it looks like
> > > > just nulled data.
> > >
> > > OK, so it's broken during enumeration and after enumeration.
> > >
> > > But that's the "fallback" case after hanging during SS+ enumeration,
> > > which we would like to prevent from happening. What about 5gbps ports,
> > > does it work correctly at SS or still report zero LPM?
> > >
> > > And running at SS+ with the patch applied, does the device produce
> > > sensible BOS descriptor? The previous one did.
> > >
> > > What if you extend the patch to also apply at SS? It won't fix LPM
> > > during enumeration, but would it fix the descriptor seen by lsusb?
> > 
> > Hello Michal,
> > 
> > very good questions.. the result was surprising to me.
> > 
> > 1) How does it do on 5GBps port?
> > 
> > Without patch:
> > 
> > [ 1522.177297] usb 6-1: new SuperSpeed USB device number 4 using xhci_hcd
> > [ 1527.440481] usb 6-1: unable to get BOS descriptor or descriptor too short
> > [ 1527.465514] usb 6-1: unable to read config index 0 descriptor/start: -71
> > [ 1527.465520] usb 6-1: can't read configurations, error -71
> > [ 1527.648035] usb 6-1: new SuperSpeed USB device number 5 using xhci_hcd
> > [ 1527.839295] usb 6-1: LPM exit latency is zeroed, disabling LPM.
> > 
> > Looks like the BOS descriptor cannot be read either.
> > 
> > Any, very interesting:
> > 
> > Binary Object Store Descriptor:
> >   bLength                 5
> >   bDescriptorType        15
> >   wTotalLength       0x0016
> >   bNumDeviceCaps          2
> >   USB 2.0 Extension Device Capability:
> >     bLength                 7
> >     bDescriptorType        16
> >     bDevCapabilityType      2
> >     bmAttributes   0x00000000
> >       (Missing must-be-set LPM bit!)
> >   SuperSpeed USB Device Capability:
> >     bLength                10
> >     bDescriptorType        16
> >     bDevCapabilityType      3
> >     bmAttributes         0x00
> >     wSpeedsSupported   0x000e
> >       Device can operate at Full Speed (12Mbps)
> >       Device can operate at High Speed (480Mbps)
> >       Device can operate at SuperSpeed (5Gbps)
> >     bFunctionalitySupport   3
> >       Lowest fully-functional device speed is SuperSpeed (5Gbps)
> >     bU1DevExitLat           0 micro seconds
> >     bU2DevExitLat           0 micro seconds
> > 
> > Very interesting - even reading it "manually" via lsusb - seems to
> > fail, even at SS.
> > 
> > 2) Does it produce a sensible BOS descriptor post-patch at SS+ ? It
> > looks like it.
> > Binary Object Store Descriptor:
> >   bLength                 5
> >   bDescriptorType        15
> >   wTotalLength       0x002a
> >   bNumDeviceCaps          3
> >   USB 2.0 Extension Device Capability:
> >     bLength                 7
> >     bDescriptorType        16
> >     bDevCapabilityType      2
> >     bmAttributes   0x0000f41e
> >       BESL Link Power Management (LPM) Supported
> >       Baseline BESL value    400 us
> >       Deep BESL value      10000 us
> >   SuperSpeed USB Device Capability:
> >     bLength                10
> >     bDescriptorType        16
> >     bDevCapabilityType      3
> >     bmAttributes         0x00
> >     wSpeedsSupported   0x000e
> >       Device can operate at Full Speed (12Mbps)
> >       Device can operate at High Speed (480Mbps)
> >       Device can operate at SuperSpeed (5Gbps)
> >     bFunctionalitySupport   1
> >       Lowest fully-functional device speed is Full Speed (12Mbps)
> >     bU1DevExitLat          10 micro seconds
> >     bU2DevExitLat        2047 micro seconds
> >   SuperSpeedPlus USB Device Capability:
> >     bLength                20
> >     bDescriptorType        16
> >     bDevCapabilityType     10
> >     bmAttributes         0x00000001
> >       Sublink Speed Attribute count 2
> >       Sublink Speed ID count 1
> >     wFunctionalitySupport   0x1100
> >       Min functional Speed Attribute ID: 0
> >       Min functional RX lanes: 1
> >       Min functional TX lanes: 1
> >     bmSublinkSpeedAttr[0]   0x000a4030
> >       Speed Attribute ID: 0 10Gb/s Symmetric RX SuperSpeedPlus
> >     bmSublinkSpeedAttr[1]   0x000a40b0
> >       Speed Attribute ID: 0 10Gb/s Symmetric TX SuperSpeedPlus
> > 
> > 3) What if I apply the patch to SS as well?
> > 
> > Connect:
> > [    3.293251] usb 6-1: new SuperSpeed USB device number 2 using xhci_hcd
> > [    3.349030] usb 6-1: skipping BOS descriptor
> > [    3.429817] usb 6-1: New USB device found, idVendor=0fd9,
> > idProduct=009c, bcdDevice= 0.02
> > [    3.429825] usb 6-1: New USB device strings: Mfr=6, Product=7, SerialNumber=3
> > [    3.429828] usb 6-1: Product: Elgato 4K X
> > [    3.429830] usb 6-1: Manufacturer: Elgato
> > [    3.429833] usb 6-1: SerialNumber: A7SNB517214G5K
> > [    9.019651] usb 6-1: 3:2: failed to get current value for ch 0 (-22)
> > [    9.028103] usb 6-1: Found UVC 1.00 device Elgato 4K X (0fd9:009c)
> > 
> > sudo lsusb -v -d 0fd9:009c
> > Binary Object Store Descriptor:
> >   bLength                 5
> >   bDescriptorType        15
> >   wTotalLength       0x0016
> >   bNumDeviceCaps          2
> >   USB 2.0 Extension Device Capability:
> >     bLength                 7
> >     bDescriptorType        16
> >     bDevCapabilityType      2
> >     bmAttributes   0x00000000
> >       (Missing must-be-set LPM bit!)
> >   SuperSpeed USB Device Capability:
> >     bLength                10
> >     bDescriptorType        16
> >     bDevCapabilityType      3
> >     bmAttributes         0x00
> >     wSpeedsSupported   0x000e
> >       Device can operate at Full Speed (12Mbps)
> >       Device can operate at High Speed (480Mbps)
> >       Device can operate at SuperSpeed (5Gbps)
> >     bFunctionalitySupport   3
> >       Lowest fully-functional device speed is SuperSpeed (5Gbps)
> >     bU1DevExitLat           0 micro seconds
> >     bU2DevExitLat           0 micro seconds
> > 
> > Again (Missing must-be-set LPM bit!).
> > 
> > So.. if i summarize it correctly: on SS, BOS fetch seems to fail
> > immediately when connecting, but also "later" when I use lsusb.
> > But, on SS+, if i skip BOS fetch on connect, it works when done later...
> > 
> > For what it's worth: I've recorded a few hours of Gameplay with the
> > patch, and rebooted a couple times, it seems to do the trick.
> 
> This is really odd.  I just picked one of these devices up and will try
> this out next week when I get a chance to connect it to a system that
> isn't just my laptop (I don't think my laptop's usb ports are that fast,
> but I could be wrong, will try it out later this week...)

Ok, I can duplicate this here.  Maybe we just don't ask for the BOS
descriptor if no one needs/asks for it.  I can play with that later and
see if that helps as I'm sure this isn't going to be the only device
that can't handle the BOS descriptor if Windows isn't querying for it,
so we don't want to make a huge quirk table if we don't have to.

thanks,

greg k-h

