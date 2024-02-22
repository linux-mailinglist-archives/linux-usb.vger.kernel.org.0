Return-Path: <linux-usb+bounces-6899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1C085FD3F
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 16:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE290B2887E
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 15:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E8414E2F5;
	Thu, 22 Feb 2024 15:55:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D824714E2F9
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 15:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708617322; cv=none; b=hszI9ybtlP/UrEo6ssSlmbJ+MyjFqPD7thd68LIvRDEmbGiRxjvF1rJ+5aIiCUOz77gFoDiwNH6fhCylwJEDgMjpON/UcZCs66vp04ZMj3A+P/ETcCUVwY5tT6sdToTZQ/mt1s2gx8h1zsuqWshBNwPbdrIeQVIpgI0Uwlx5Nkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708617322; c=relaxed/simple;
	bh=5LUqoDfY5+yGrpcAlC3H4jfgZnl12D8p92NN41iGn70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYBxeKQHCTvs99vcHNYMM0k+/h3XEve7/SztQpMLdoeVNzS/qOhp9c98k1p+M121Y+umklfxUdo+3HFcXKO7JcJ0gZUqiyK6OYoB7n80vRjVlvxkloZ/1iUkG0s0Sttm+tiP2VRthUKqHI5oTDEc47+m9VBZbQ/e83aho/DiR/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 626768 invoked by uid 1000); 22 Feb 2024 10:55:13 -0500
Date: Thu, 22 Feb 2024 10:55:13 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Kevin Rowland <kevin.p.rowland@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Control of external VBUS on resume from sleep
Message-ID: <30fa974b-d943-4b8f-b6a7-313f03ca439e@rowland.harvard.edu>
References: <CAHK3GzziwVASKgvBQmv_DnhwLJ8Bj2K=42ptyTrtOFCAAPXcnw@mail.gmail.com>
 <Yp9k4JRcNMcvVi6l@rowland.harvard.edu>
 <CAHK3Gzw7tqgjyiKgEqg0LHMFf4ycjOKE=pdobf6OFeANvUvkQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHK3Gzw7tqgjyiKgEqg0LHMFf4ycjOKE=pdobf6OFeANvUvkQg@mail.gmail.com>

On Wed, Feb 21, 2024 at 02:40:05PM -0800, Kevin Rowland wrote:
> Alan, first, apologies for the extremely late response.
> 
> I successfully hacked around the original issue, things have been
> working for a long
> time, but now I have to revisit it. Responses inline.
> 
> On Tue, Jun 7, 2022 at 7:46 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Mon, Jun 06, 2022 at 03:12:58PM -0700, Kevin Rowland wrote:
> > > Hello all,
> > >
> > > I've got a USB 3.0 host (an NXP i.MX8QM running 5.10.72 with Cadence
> > > XHCI host controller IP) connected to a USB device on the same PCB,
> > > which also happens to run Linux (although I think that's beside the
> > > point here). The quirk is that, although D+/D- are routed directly
> > > from host to device, VBUS is actually controlled by a separate GPIO on
> > > the host. The dedicated VBUS pin on the USB host controller is pulled
> > > high. ID is pulled high on the PBC but driven low by a GPIO from the
> > > i.MX8, so we can imagine it's tied to ground.
> > >
> > > I've made a little schematic drawing [1] to help visualize the connections.
> > >
> > > We've run into an issue where, on resume from STR, the following
> > > sequence occurs:
> > > - the GPIO peripheral on the host is powered back on, VBUS is
> > > immediately driven high
> >
> > Why wasn't the GPIO turned on the whole time the system was suspended?
> > How can remote wakeup work without VBUS power?
> We don't currently use remote wakeup. The device is self-powered and enters
> suspend-to-RAM itself when the host is suspended. The device can then wake
> from an external source, at which point it will wake the host (i.MX8)
> by asserting a
> GPIO.
> 
> We've discussed maintaining VBUS through suspend and using USB remote
> wakeup from the device, but that's off the table right now. Part of
> the reason is
> that our SoC can't get down into its lowest power state without powering off all
> on-chip peripherals like the USB host controller - it can, however,
> get to its lowest
> power state and still wake via GPIO events.
> 
> > > - the device signals attach on DP/DN, but _I believe_ the host
> > > controller on the host is not yet powered on
> Slight correction, we have a 3.0 link so the device signals attach on
> the SS lines,
> then I think it falls back to signaling attach on DP/DN. Hopefully that doesn't
> change things too much.
> 
> > > - the host controller is then powered on and the {hub, hcd, xhci}
> > > drivers all resume, but no port status change is detected; I believe
> > > that attach signaling was missed by the host controller

You mean the port is physically attached to the device but the host 
controller reports that it is not connected?

As part of its resume handling, the hub driver polls all the port 
statuses.  If there was a status change, it would be aware unless the 
controller's root hub simply did not report the new port status at all.

> > > I'd like for the host controller driver (or the root hub driver??) to
> > > have explicit control of VBUS, so that it's driven high only when the
> > > host controller regains power and is ready to detect attach signaling.

In fact, the hub driver is aware of none of this.  The host controller 
driver, or better, the host controller's platform driver is where all 
the knowledge about the VBUS GPIO resides.

How does your resume sequence work?  Does the PM core call a resume 
routine in the platform driver, which then tells the xHCI core to do its 
resume processing?  If that's the case then all you have to is turn on 
the GPIO after the xHCI resume processing is finished, just before the 
platform driver's resume routine returns.

If that's not how it works then you might have to add some 
platform-specific glue code to the end of the xHCI core resume routine.  
Maybe controlled by a quirk flag.

> > > I see device-tree documentation about the USB connector node and
> > > `vbus-supply`, but I'm having a hard time understanding how to square
> > > my use-case with `drivers/usb/common/usb-conn-gpio.c`, which reacts to
> > > state changes on VBUS or ID.
> > >
> > > Any thoughts on where I should stick the logic that enables VBUS on
> > > resume? My current (very hacky) fix is to initialize a global (argh!)
> > > gpio_desc to refer to the VBUS GPIO, then to call
> > > `gpiod_set_value(<gpio_desc>, 0); gpiod_set_value(<gpio_desc>, 1);` in
> > > `usb_port_resume()`, which is where I ended up when tracking the
> > > original issue. This toggles VBUS and allows us to catch the new round
> > > of attach signaling from the device.
> >
> > The hub driver already knows to turn on port power when a hub is
> > initialized or during a reset-resume.  It doesn't do so during a
> > regular resume because it assumes power was on the whole time.  You can
> > change this, if necessary.
> Via set_port_feature(PORT_FEAT_POWER) in hub_power_on? Does this mean
> I should patch in some extra logic to ask the platform-specific driver
> to assert the
> external VBUS GPIO? I'm happy to do that, I just don't want to miss logic that's
> already built-in to the drivers.
> 
> If I'm reading the indirection correctly, I'll need:
> hcd_to_xhci(bus_to_hcd(hub->hdev->bus))
> 
> to access the struct xhci_hcd. I don't yet see how to go from there to
> the platform
> driver.

This is a good indication that you're trying to do things in the wrong 
place.  Since what you're talking about is all platform-specific stuff, 
that best place to put it all is in the platform driver.

Alan Stern

> > > I'm happy to use the fixed-regulator framework instead, I'm just not
> > > sure which driver should own the gpio_desc / regulator and where it
> > > should be disabled / enabled during suspend / resume.
> >
> > Probably whichever platform-specific driver manages your xHCI controller
> > should be the one to interact with the GPIO.  But it should make changes
> > only when told to do so by a higher layer (such as the hub driver).
> This helps, thanks.
> 
> Best,
> Kevin
> 
> 
> 
> > Alan Stern
> >
> > > Best,
> > > Kevin
> > >
> > > [1]
> > >
> > >  i.MX8                      device
> > > .----------------.         .-------------.
> > > |     GPIOX.Y ---|-------->| VBUS (in)   |
> > > |                |         |             |
> > > |  USB           |    _    |             |
> > > | .------------. |    |    |             |
> > > | |    VBUS ---|-|----'    |             |
> > > | |     DP <---|-|-------->| DP          |
> > > | |     DP <---|-|-------->| DN          |
> > > | |     ID ----|-|----.    '-------------'
> > > | '------------' |    |
> > > '----------------'    v

