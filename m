Return-Path: <linux-usb+bounces-31950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BADEECF6D21
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 06:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFFF03023558
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 05:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76571E412A;
	Tue,  6 Jan 2026 05:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l/2LO8RX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7E91E1DE5;
	Tue,  6 Jan 2026 05:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767678635; cv=none; b=WNU8k8wg/vowQ/yo5KraWf+E6a/++0rhyu+CYgYYhPhXwl8WIpGaYrieLvNFT580Lbkt0i1wmjueReNuPoRCiX4Pz1M9QLAW2OzMLgg5s7wMvWHFNe7/V6uyyiEeZZJtoqrYVwjBkzlKb8KBeUT5j9G0aZrky7zgb5FKk5zL0Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767678635; c=relaxed/simple;
	bh=qiwWpX8NzLbG8fom7PMu6e0lLeXLGd33dWZP1cdlTYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNMsF24EgErCBHs8ONoHGlo98iRCBEOC2ivPpZyo7GataYX6oJRSDspx0vGEgkSwiu8rdKOFBnj1cOnCowl6Ixmc8hHa6enFrbexFUhnd6o7vyY2SLtHnA0jNx0lIFCsAqCNhe9if7zM6X01hYJ89B/Jv4qQ5H8NH2Hf9m3Dc/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l/2LO8RX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB50C116C6;
	Tue,  6 Jan 2026 05:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767678634;
	bh=qiwWpX8NzLbG8fom7PMu6e0lLeXLGd33dWZP1cdlTYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/2LO8RXDUj18X0mlzeP37mpuqJjRgDYTz4mGEztNiBicgnEXPJQ32tio96z5GPeD
	 YbIi69HhUvNyyRCheIVsjKO5rivXNdUqdoqy6X0pLXYGhOgWYp187HhOGvCQYimFXR
	 QlDdGouu0h8eiTl8qN14Pr80obs1vyQIbJdL26g0=
Date: Tue, 6 Jan 2026 06:50:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Prashanth K <prashanth.k@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Add the DWC3 instance name in traces
Message-ID: <2026010601-alright-footage-a2f8@gregkh>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <2026010555-squealing-easily-7659@gregkh>
 <20260105161145.podzns57ekzjg3pj@synopsys.com>
 <2026010528-animal-avenging-dad2@gregkh>
 <20260105170044.vuuoyiszyptokmfp@synopsys.com>
 <2026010513-kinsman-moody-6d63@gregkh>
 <20260105211608.eoiet7ccyg5oztbc@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105211608.eoiet7ccyg5oztbc@synopsys.com>

On Mon, Jan 05, 2026 at 09:16:12PM +0000, Thinh Nguyen wrote:
> On Mon, Jan 05, 2026, Greg Kroah-Hartman wrote:
> > On Mon, Jan 05, 2026 at 05:01:00PM +0000, Thinh Nguyen wrote:
> > > On Mon, Jan 05, 2026, Greg Kroah-Hartman wrote:
> > > > On Mon, Jan 05, 2026 at 04:11:50PM +0000, Thinh Nguyen wrote:
> > > > > Hi Greg,
> > > > > 
> > > > > On Mon, Jan 05, 2026, Greg Kroah-Hartman wrote:
> > > > > > On Mon, Jan 05, 2026 at 05:23:22PM +0530, Prashanth K wrote:
> > > > > > > When multiple DWC3 controllers are being used, trace events from
> > > > > > > different instances get mixed up making debugging difficult as
> > > > > > > there's no way to distinguish which instance generated the trace.
> > > > > > > 
> > > > > > > Hence append the controller base address into ftrace. This needs
> > > > > > > the following reworks which is addressed using this patch series.
> > > > > > > 
> > > > > > >   1. Removal of dep->regs and use dwc->regs everywhere
> > > > > > >   2. Use dwc pointer in all dwc3_readl/writel()
> > > > > > >   3. Adding the base addr in traces.
> > > > > > > 
> > > > > > > Changes in v2:
> > > > > > > - Avoid using macros for dwc3_readl/writel()
> > > > > > > - Use base address intraces instead of dev name.
> > > > > > 
> > > > > > Wait, why change this?  The dev name is what you should care about.
> > > > > > "base address" doesn't make much sense as this is on a lot of different
> > > > > > busses, right?
> > > > > > 
> > > > > 
> > > > > I asked Prashanth to do so. The reason is because the device name is not
> > > > > consistent and not obvious for different busses. For example, for PCI
> > > > > devices, the device name may be in a form of "dwc3.N.auto". If we only
> > > > > have access to the traces and not the testing setup (which often is the
> > > > > case), it's difficult to tell which is which. Also, very often the
> > > > > consumer of the traces is also the hardware validation engineer, and
> > > > > IMO, it's more understandable reading base address than device name.
> > > > 
> > > > But all you need to know is "this is different than the other one", you
> > > > don't "need" the io address, right?  And if you really did, just add
> > > > that to the trace as well _when_ you actually need it.
> > > 
> > > The base address preserves that context to know which instance is which.
> > > If we have the base address, do we still need the device name?
> > 
> > If you have only the "base address", how do you know which device is which?
> > 
> 
> By association with the design layout, pci configuration space, device
> tree, etc.
> 
> The inclusion of base address is helpful when matching along with other
> traces such as internal signals or reading pcie traffic traces. They
> capture IO access which includes the base address.
> 
> Of course, we can also request whoever provides the tracepoints to note
> the device name and base address associates with it, then parse of the
> tracepoints afterward... an extra step I can potenially skip if the
> tracepoints are simple enough.

Ok, as you will be the one having to intrepret these, I'll trust you
that they are providing enough information for you to be able to debug
things :)

thanks,

greg k-h

