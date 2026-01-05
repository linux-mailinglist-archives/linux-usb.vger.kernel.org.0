Return-Path: <linux-usb+bounces-31940-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B579CF5738
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 21:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24EA730FF193
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 19:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DD331A555;
	Mon,  5 Jan 2026 19:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o3P1qXUa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A701D2BE051;
	Mon,  5 Jan 2026 19:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767643147; cv=none; b=l7uS41GYuZjXmkk42a21vA7RbzpKs9EebK8gvFPOWjB5BZC7aJpYlXYU/RegSh89dn/dt1Pbvv26kkK4BXg/IcOjgnssPjjMOFiiG3/k6A29DGDr1iXLl1lf4T9pIpTfGObhz/JqntUcI2gEnuvEsHORzLKOsyjaFo5wP1JJSv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767643147; c=relaxed/simple;
	bh=cRaS5r3lgkI/yPdjV2VtjiMfycKB0unfFxQ5VsEkHGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUc7UgdC8n16w4ukCv/dRn5Y4IhQd5q1GRBdK8yVUn2kTfH6ZLWxAm9J/WgQbpub+M4k3/S+7uLh2ePH8VEf0Hx4HfQ6GcqnTkYpbDyflSbk8E8fGoVHO0wSJiCaRwYjRR81lcqA2oSgHSWKjC/tsxl8lyc5s3vbSB6H82kCLvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o3P1qXUa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5642C116D0;
	Mon,  5 Jan 2026 19:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767643147;
	bh=cRaS5r3lgkI/yPdjV2VtjiMfycKB0unfFxQ5VsEkHGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o3P1qXUayEhhRve+eqKN/vQ/4NXgOaAW1TW4Bb6VwhBcvBnw6sH9yyaSt+y3rpGRi
	 /FTWvtBziJsUg+chAt4VVxoPFxq1gBmg7wtcIP6a5dwPsAWNP7ljK7DUFZdZU2V1w/
	 2gy0njFsKwbn3O6hRlvqmvltMu/HbWOki4EQt0V8=
Date: Mon, 5 Jan 2026 20:59:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Prashanth K <prashanth.k@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Add the DWC3 instance name in traces
Message-ID: <2026010513-kinsman-moody-6d63@gregkh>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <2026010555-squealing-easily-7659@gregkh>
 <20260105161145.podzns57ekzjg3pj@synopsys.com>
 <2026010528-animal-avenging-dad2@gregkh>
 <20260105170044.vuuoyiszyptokmfp@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105170044.vuuoyiszyptokmfp@synopsys.com>

On Mon, Jan 05, 2026 at 05:01:00PM +0000, Thinh Nguyen wrote:
> On Mon, Jan 05, 2026, Greg Kroah-Hartman wrote:
> > On Mon, Jan 05, 2026 at 04:11:50PM +0000, Thinh Nguyen wrote:
> > > Hi Greg,
> > > 
> > > On Mon, Jan 05, 2026, Greg Kroah-Hartman wrote:
> > > > On Mon, Jan 05, 2026 at 05:23:22PM +0530, Prashanth K wrote:
> > > > > When multiple DWC3 controllers are being used, trace events from
> > > > > different instances get mixed up making debugging difficult as
> > > > > there's no way to distinguish which instance generated the trace.
> > > > > 
> > > > > Hence append the controller base address into ftrace. This needs
> > > > > the following reworks which is addressed using this patch series.
> > > > > 
> > > > >   1. Removal of dep->regs and use dwc->regs everywhere
> > > > >   2. Use dwc pointer in all dwc3_readl/writel()
> > > > >   3. Adding the base addr in traces.
> > > > > 
> > > > > Changes in v2:
> > > > > - Avoid using macros for dwc3_readl/writel()
> > > > > - Use base address intraces instead of dev name.
> > > > 
> > > > Wait, why change this?  The dev name is what you should care about.
> > > > "base address" doesn't make much sense as this is on a lot of different
> > > > busses, right?
> > > > 
> > > 
> > > I asked Prashanth to do so. The reason is because the device name is not
> > > consistent and not obvious for different busses. For example, for PCI
> > > devices, the device name may be in a form of "dwc3.N.auto". If we only
> > > have access to the traces and not the testing setup (which often is the
> > > case), it's difficult to tell which is which. Also, very often the
> > > consumer of the traces is also the hardware validation engineer, and
> > > IMO, it's more understandable reading base address than device name.
> > 
> > But all you need to know is "this is different than the other one", you
> > don't "need" the io address, right?  And if you really did, just add
> > that to the trace as well _when_ you actually need it.
> 
> The base address preserves that context to know which instance is which.
> If we have the base address, do we still need the device name?

If you have only the "base address", how do you know which device is which?

thanks,

greg k-h

