Return-Path: <linux-usb+bounces-30907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D20E9C84D27
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 12:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 126A53A6201
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 11:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1B03168EE;
	Tue, 25 Nov 2025 11:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gs0S6/Vw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D67315D2A;
	Tue, 25 Nov 2025 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764071614; cv=none; b=ThyA/FPBy0i6Dy/mC6vACun1USnKYQo5lPZKNyCugGdGI2+81wRAsdF9uMoL6dna1GsX8cEg2//Q2KnHjSo1pCZlkdlHVUyp7NNbpXVjqFMzGu6Belxtxb79COPuFIPTFQbttaAGaKt+IQWIZm3o8o/etWhQ6ljtdAy92oEEMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764071614; c=relaxed/simple;
	bh=73EYR9Xrajc2wyhAiX7bWT3jiakpelgS+Tug6SCSxAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ir/DwpqqR90cTZmdVB0hX+TD0uw5xYBUaD/yTF/5mXPliXLd00C/yc4JugVyR9y1ZfRpzMTuRCOt76BX6GoFxRAZ+7x21W1Mnti2JUYi79ANuJMBv+AD3d/C1HlBZ2saQsjxwcw1L1vyb197tMeBYdHBrCVMtJ7XI59c1IeYvZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gs0S6/Vw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B0AC4CEF1;
	Tue, 25 Nov 2025 11:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764071614;
	bh=73EYR9Xrajc2wyhAiX7bWT3jiakpelgS+Tug6SCSxAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gs0S6/VwB4ZmWjdkHhrB5isLu5IvtHNue1Bcw70e64aLa4b0QevLVK9FptIZ6aCF8
	 jP6gFixPLLL0dvJuAxOuff868KSPjCrBJZmrTmIRXKJ8xDe/Q5T+yA4xzIN99dTLRC
	 oBTTfRUaxXT6qj6mnlgIbxTt6EWMb09R7B/+pQ5c=
Date: Tue, 25 Nov 2025 12:53:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: jerry xzq <jerry.xzq@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: of: filter disabled device node
Message-ID: <2025112548-angling-labored-b841@gregkh>
References: <20251122112539.4130712-1-jerry.xzq@gmail.com>
 <CAD48c-UjbPK4GewGpVVdEY30fhnhdAGQqrXQ3r0RgHc6suMo7Q@mail.gmail.com>
 <2025112237-brush-unseemly-7a95@gregkh>
 <CAEXTbpeKUMJKz-PV-ft5WCg5TYo22knBaMX2WwCWn=ix4OgX+g@mail.gmail.com>
 <2025112426-seventeen-duvet-d9c4@gregkh>
 <CAEXTbpeN0Mk+Y-UeV79JzE547UCa_Fhh7T75L+2mhoSq3ark8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEXTbpeN0Mk+Y-UeV79JzE547UCa_Fhh7T75L+2mhoSq3ark8g@mail.gmail.com>

On Tue, Nov 25, 2025 at 05:44:04PM +0800, Pin-yen Lin wrote:
> > > In our use case, the USB hub and the USB devices (e.g., modem card,
> > > USB camera) are fixed on the board, and describing them allows us to:
> > > (1) Describe the extra resources for the USB devices, like the usages
> > > in drivers/misc/onboard_usb_dev.c. They are mostly USB hubs that
> > > require extra power or reset pin, but there are also USB device
> > > usages.
> >
> > The USB devices should NOT be in DT at all, only for hub controls that
> > you need the extra pin controls please.
> 
> I assumed we should describe USB devices because [1] introduced
> bindings for downstream USB ports for on-board hubs. Or should we only
> describe USB connectors but not USB devices?

Describe the USB connectors please, not USB devices.  USB devices
already properly describe themselves.

> > > This is the usage from a downstream DTS that hasn't been upstreamed.
> >
> > There's nothing we can do about that.  Please work to get it upstream.
> >
> > > The USB hub and devices are defined in a DTSI file, and another DTS
> > > inherits it but wants to disable those USB devices. We expected that
> > > disabling them should be the same as removing them.
> >
> > No, just disable them from userspace properly.
> 
> I mean, it is disabled because of some DTS inheritance, and I believe
> we usually disable the nodes instead of removing them. How do we
> disable them from userspace in this case?

You can disable USB devices in userspace through sysfs.

> > > We haven't had a driver for the LTE card on the linux mainline.
> >
> > Why is it not merged upstream?  That should be a very simple thing to
> > get accepted.
> 
> We would love to, but those work was deprioritized internally.

As you know, we can't do anything about external drivers, so there's
nothing we can do.  Please revisit that decision, it's one that is
already costing you time and money :(

> > > But,
> > > it is using M.2 USB interface and requires reset and enable pins, so I
> > > believe we want to describe it as a USB device in DT, and implement
> > > the resource control in onboard_usb_dev.c.
> >
> > No, that is not how USB devices work, they should control themselves.
> 
> I see "RTL8188ETV 2.4GHz WiFi" is included in the onboard_usb_hub.c
> driver, and it also seems to be a USB device that requires extra
> resources. Shouldn't we describe them describe them in DT and include
> it in onboard_usb_dev.c if there are hardwares designed like this?

The driver for the USB device itself should handle this, but really, DT
should never be used for this as that goes against what USB is supposed
to be (i.e. your devices are not passing the USB standard by relying on
external DT information.)

thanks,

greg k-h

