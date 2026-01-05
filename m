Return-Path: <linux-usb+bounces-31931-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8275CF4C46
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 17:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0939300A922
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 16:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4EF314D2A;
	Mon,  5 Jan 2026 16:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="14hux3Ra"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4091F2D97B5;
	Mon,  5 Jan 2026 16:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630473; cv=none; b=bn3rFeeb/ztz/Ota2NcUUGt8hNAflvNlOKa33BwtosBzcsD1DrJIp6BsAVBD5a3wrK6jGweHqQoRiGZipvBrU7RpV6gzvBLUtBH7rk19Yrv2ifZ5YhDqdK/Y0nCl6+CzkO6qn+/EaFReh6OII0mHD4l/fnprDOLffqB1M4bq8Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630473; c=relaxed/simple;
	bh=P0a3EQx3om18xEGI1A6m2E4Bk4dei6gG1+wZfR9LXmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCRMFkfBAIKF+ImxDjmkrp/STPtIu2J1C97PqlqKtntyx9bSxzerWsDexBNs+wTGCan2j3T7Kj26/NIUwY+CEn+Rnli7dq4iES7es903z94Fpfa/kYbIpPE3hh+lh3L+DfhTLUkBX+Ji1gpU4FQ/+/Ih/LeOa+9JlfVRjSf2JEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=14hux3Ra; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C63C116D0;
	Mon,  5 Jan 2026 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767630472;
	bh=P0a3EQx3om18xEGI1A6m2E4Bk4dei6gG1+wZfR9LXmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=14hux3RamtF3ha94Oc4mQEF5SgzS2AO1mAPkRHp0ipbz8ybi5hd9p7LRcUEP5WPEK
	 rhH3hP8/uFdKei5YyL4LIXKDqUFgICWxldvUZb6Uo2hSR5cljoH91Snx6T7Jj03q5M
	 Kkp7NA0My0Fbs4MQ9e++A90p9mt9sCJ37qusT6bw=
Date: Mon, 5 Jan 2026 17:27:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Prashanth K <prashanth.k@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Add the DWC3 instance name in traces
Message-ID: <2026010528-animal-avenging-dad2@gregkh>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <2026010555-squealing-easily-7659@gregkh>
 <20260105161145.podzns57ekzjg3pj@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105161145.podzns57ekzjg3pj@synopsys.com>

On Mon, Jan 05, 2026 at 04:11:50PM +0000, Thinh Nguyen wrote:
> Hi Greg,
> 
> On Mon, Jan 05, 2026, Greg Kroah-Hartman wrote:
> > On Mon, Jan 05, 2026 at 05:23:22PM +0530, Prashanth K wrote:
> > > When multiple DWC3 controllers are being used, trace events from
> > > different instances get mixed up making debugging difficult as
> > > there's no way to distinguish which instance generated the trace.
> > > 
> > > Hence append the controller base address into ftrace. This needs
> > > the following reworks which is addressed using this patch series.
> > > 
> > >   1. Removal of dep->regs and use dwc->regs everywhere
> > >   2. Use dwc pointer in all dwc3_readl/writel()
> > >   3. Adding the base addr in traces.
> > > 
> > > Changes in v2:
> > > - Avoid using macros for dwc3_readl/writel()
> > > - Use base address intraces instead of dev name.
> > 
> > Wait, why change this?  The dev name is what you should care about.
> > "base address" doesn't make much sense as this is on a lot of different
> > busses, right?
> > 
> 
> I asked Prashanth to do so. The reason is because the device name is not
> consistent and not obvious for different busses. For example, for PCI
> devices, the device name may be in a form of "dwc3.N.auto". If we only
> have access to the traces and not the testing setup (which often is the
> case), it's difficult to tell which is which. Also, very often the
> consumer of the traces is also the hardware validation engineer, and
> IMO, it's more understandable reading base address than device name.

But all you need to know is "this is different than the other one", you
don't "need" the io address, right?  And if you really did, just add
that to the trace as well _when_ you actually need it.

device name is how Linux handles devices, please use that otherwise it
just gets confusing for everyone in the end (hint, teach the hardware
engineer what it means.)

thanks,

greg k-h

