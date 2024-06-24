Return-Path: <linux-usb+bounces-11571-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EBF914192
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 06:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BE261C22886
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 04:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BEF211187;
	Mon, 24 Jun 2024 04:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnyrpfYv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E98313FEE
	for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 04:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719205159; cv=none; b=RsfBHnPY4cs5bhxjqLCLdsYC7IDMKvODmRZdVv9RgRQW+IJUIJ3XVFE6TDn5TtWfxKAUVhwV3Ajr0p2Tn/IydSQiuTNjoSxQ+q/+PcCij56RTqbJvm1Cs9FFzTIT84aF4mp9p3pnj23DanG0kQx2shhbnKYtcG+oqp93kwUyiw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719205159; c=relaxed/simple;
	bh=+o1CqOTP7VxQTvC5kWrla5qpIG3tX4asvpznZi7ubeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQn2fXGeRMoem16jBWgY7xTbmnxZUDcnN6nReGoRV4+kA2628BKPiQv2YBaMiTiV9Yy42AfmMubaHGblRUDRFV5Ypv8qQdER5OpTGXrui5jt3IPnX6rnORGSnofNMCtH/ElWCOT4p+E6ky4Lcbjt8wR2MtZ2kn62pvV6RVsVGZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnyrpfYv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719205157; x=1750741157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+o1CqOTP7VxQTvC5kWrla5qpIG3tX4asvpznZi7ubeA=;
  b=JnyrpfYvTcyC/k1axZZE155csc13l5go7dzkyHt2gVouRexDlCKXcbeN
   wLKTQM/oG5F8FLVuAHQyjq5r7p3YNhLC63UGztMdXt1krMLK5wo1OshRd
   uOGDN2/wNVA858Ent1AiNBczxvjb0IDsB16nerrdovwCPiCr7n4nJoHjy
   RMe2nyy++3fWZ2CU+aFYDK1NMyuSDiKF715i29XE6vD6UxwwOSf5mHrem
   Qkk5s+YvtKAnLjY19XeceKNrp6e+Rvlgsu34HdCaisgcoVeyTjj91wVIA
   6HyME/wT4DgtH/Nfzk4z+Nfw3B8ULwGB+KvGXhzI76FESkW/yW3ZbUfDV
   w==;
X-CSE-ConnectionGUID: HxjiU5MkRj6h92/XrGcPVQ==
X-CSE-MsgGUID: a012N/WZRPO8W02vcoWZvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="19061764"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="19061764"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 21:59:16 -0700
X-CSE-ConnectionGUID: ot0f5LPSS+KTR1rU41WiWw==
X-CSE-MsgGUID: IOgOzkxGRYe+qR0I56QmUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="42983223"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2024 21:59:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E4B5F1BD; Mon, 24 Jun 2024 07:59:12 +0300 (EEST)
Date: Mon, 24 Jun 2024 07:59:12 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 0/4] Add device links between tunneled USB3 devices and
 USB4 Host
Message-ID: <20240624045912.GJ1532424@black.fi.intel.com>
References: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
 <20240620064115.GH1532424@black.fi.intel.com>
 <9ec62b68-7eef-4d33-bc47-1d13e8eec820@amd.com>
 <20240621061905.GI1532424@black.fi.intel.com>
 <844e3930-7b3d-46a1-ad90-bcecbb99c069@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <844e3930-7b3d-46a1-ad90-bcecbb99c069@amd.com>

On Fri, Jun 21, 2024 at 11:30:05AM -0500, Mario Limonciello wrote:
> On 6/21/2024 01:19, Mika Westerberg wrote:
> > Hi Mario,
> > 
> > On Thu, Jun 20, 2024 at 01:36:56PM -0500, Mario Limonciello wrote:
> > > On 6/20/2024 01:41, Mika Westerberg wrote:
> > > > +CC Mario from AMD side to check that we are good and don't break
> > > > anything accidentally.
> > > > 
> > > > On Wed, Jun 19, 2024 at 04:03:01PM +0300, Mathias Nyman wrote:
> > > > > The relationship between a USB4 Host Interface providing USB3 tunnels,
> > > > > and tunneled USB3 devices is not represented in device hierarchy.
> > > > > 
> > > > > This caused issues with power managment as devices may suspend and
> > > > > resume in incorrect order.
> > > > > A device link between the USB4 Host Interface and the USB3 xHCI was
> > > > > originally added to solve this, preventing the USB4 Host Interface from
> > > > > suspending if the USB3 xHCI Host was still active.
> > > > > This unfortunately also prevents USB4 Host Interface from suspending even
> > > > > if the USB3 xHCI Host is only serving native non-tunneled USB devices.
> > > > > 
> > > > > Improve the current powermanagement situation by creating device links
> > > > > directly from tunneled USB3 devices to the USB4 Host Interface they depend
> > > > > on instead of a device link between the hosts.
> > > > > This way USB4 host may suspend when the last tunneled device is
> > > > > disconnected.
> > > > > 
> > > > > Intel xHCI hosts are capable of reporting if connected USB3 devices are
> > > > > tunneled via vendor specific capabilities.
> > > > > Use this until a standard way is available.
> > > > > 
> > > > > Mathias Nyman (4):
> > > > >     xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
> > > > >     usb: Add tunneled parameter to usb device structure
> > > > >     usb: acpi: add device link between tunneled USB3 device and USB4 Host
> > > > >       Interface
> > > > >     thunderbolt: Don't create device link from USB4 Host Interface to USB3
> > > > >       xHC host
> > > > > 
> > > > >    drivers/thunderbolt/acpi.c       | 40 ++++++------------------
> > > > >    drivers/usb/core/usb-acpi.c      | 52 ++++++++++++++++++++++++++++++++
> > > > >    drivers/usb/host/xhci-ext-caps.h |  5 +++
> > > > >    drivers/usb/host/xhci-hub.c      | 29 ++++++++++++++++++
> > > > >    drivers/usb/host/xhci.c          | 12 ++++++++
> > > > >    drivers/usb/host/xhci.h          |  1 +
> > > > >    include/linux/usb.h              |  2 ++
> > > > >    7 files changed, 111 insertions(+), 30 deletions(-)
> > > > > 
> > > > > -- 
> > > > > 2.25.1
> > > 
> > > Hi Mika,
> > > 
> > > Thanks for looping me in.  Unfortunately with this is appears the XHCI
> > > controller link never gets created.  I've not checked functional impact from
> > > this, but I'd guess there "should" be some functional problems too.
> > 
> > Thanks for checking!
> > 
> > I think the code that sets up the device link based on ->tunneled should
> > do that always if the hardware cannot tell if this is native or tunneled
> > link to keep the existing functionality and only do the "optimization"
> > if the hardware is capable of identifying that.
> > 
> > Perhaps it can be a callback provided by the xHCI controller driver
> > (->is_tunneled()) that then defaults to true if the
> > "usb4-host-interface" property is there and in case of Intel hardware
> > also checks the proprietary register?
> 
> So I think the problem is you will have an ordering dependency between the
> two drivers for when the link gets created.
> 
> Like if thunderbolt.ko loads you would end up with links to PCIe root port
> for tunneling as well as XHCI controller.

With this patch we only create links to PCIe Root/Downstream ports from
Thunderbolt side and the USB core will deal with the USB ones.

> Then xhci loads and you end up also adding links to individual ports.
> Would you remove the link to the controller?

See above.

> And if the order is the other way around you end up with a larger state
> machine.
> 
> How about PCIe core provides a helper to know whether or not a PCIe device
> will support the proprietary register?

I think the xHCI can be non-PCIe device too (Apple silicon for
instance). The links here are created dynamically and only if there is
need (and support from the hardware) so we can let the USB4 controller
enter D3hot if there is no USB 3.x tunnel needed.

