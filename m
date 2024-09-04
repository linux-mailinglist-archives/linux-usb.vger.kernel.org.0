Return-Path: <linux-usb+bounces-14621-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDF396B039
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 07:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB3A2B216C7
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 05:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E1B823A9;
	Wed,  4 Sep 2024 05:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhxOxJ2P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E4826AC3
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 05:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725426019; cv=none; b=UxZl1Ifswt1gO7rpDvt8pLDc9op6ugUL696wVgjde10cYiIqHgCRLFfyA8eV0daAfIdVH/53OhHbtGYCjLQF8mOH5sChixZ6AB0CMnpQnrZzoedrob86WNpEgMWDejdhNPVkw19Emi5RNb+0c8FJlUhc02g/y6fe0Vp2cY03uAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725426019; c=relaxed/simple;
	bh=tzkvqsXtFO+MVmEbkZes43Kf5l8yzvJINaH83pmW5P8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukofKD0sMSnrF5HCkelFrzvwdbU0iJnDzNwv8GnJ7uqPHkyZLrlTYNOLLWa+F38m+j4JOBHTVJXjdNBwqly9fxmwHca71ZRvxtzWZWT3SdSagHvMleUxqF/dCO2CRmipCqmb3gvfpAbJ9NBOPj0Df7BY+ZQa+UDhC1KnmlNtf/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhxOxJ2P; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725426017; x=1756962017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tzkvqsXtFO+MVmEbkZes43Kf5l8yzvJINaH83pmW5P8=;
  b=bhxOxJ2PAacA7xzh3f5YGxmpSye3fzJkjkBhF43E6IWo9RhAbj9ZYlgA
   L2iXSvVQhVlV6x48+1SgabrPemSMWP2Bg4kVMo/XoeEB2uk4FyuN+4+Fr
   T6NNApBvenpF1jDL00pyvnqJt6NCx9s74tpg86J0ED+lRUdYky5bHD7mI
   LCKDisfN/wZiU/+bYrUhUlYXG9YK2ZgcEhHDTorYxiNJtsghpchTmvyP/
   4H9K+NTntUMSJbCXvOzaY+2bvUFUIBplHLdvfGZyvx/zeuYAWjrEkCU2D
   cClxoSoTwG/29k0UqsAwy69HpIQDplaTXz1G/GneVAMYqd9h5y7NJ+DJ/
   g==;
X-CSE-ConnectionGUID: wLRU5fW1Rrq+3PROXJVr2Q==
X-CSE-MsgGUID: D6qUwtzHT1OdsJKoqzYvJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41556788"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="41556788"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 22:00:16 -0700
X-CSE-ConnectionGUID: EXDm2nL4QquyEQRdhrOTMA==
X-CSE-MsgGUID: D0OyYQD1T2yMMiIRwABCVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="65131908"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 03 Sep 2024 22:00:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C0B48128; Wed, 04 Sep 2024 08:00:13 +0300 (EEST)
Date: Wed, 4 Sep 2024 08:00:13 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, "Rangoju, Raju" <Raju.Rangoju@amd.com>,
	Sanath S <Sanath.S@amd.com>, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 0/4] Add device links between tunneled USB3 devices
 and USB4 Host
Message-ID: <20240904050013.GZ1532424@black.fi.intel.com>
References: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
 <321cf204-cf74-4f51-8ed3-8c5738444359@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <321cf204-cf74-4f51-8ed3-8c5738444359@amd.com>

Hi,

On Tue, Sep 03, 2024 at 10:35:00AM -0500, Mario Limonciello wrote:
> On 8/30/2024 10:26, Mathias Nyman wrote:
> > The relationship between a USB4 Host Interface providing USB3 tunnels,
> > and tunneled USB3 devices is not represented in device hierarchy.
> > 
> > This caused issues with power managment as devices may suspend and
> > resume in incorrect order.
> > A device link between the USB4 Host Interface and the USB3 xHCI was
> > originally added to solve this, preventing the USB4 Host Interface from
> > suspending if the USB3 xHCI Host was still active.
> > This unfortunately also prevents USB4 Host Interface from suspending even
> > if the USB3 xHCI Host is only serving native non-tunneled USB devices.
> > 
> > Improve the current powermanagement situation by creating device links
> > directly from tunneled USB3 devices to the USB4 Host Interface they depend
> > on instead of a device link between the hosts.
> > This way USB4 host may suspend when the last tunneled device is
> > disconnected.
> > 
> > Intel xHCI hosts are capable of reporting if connected USB3 devices are
> > tunneled via vendor specific capabilities.
> > Use this until a standard way is available.
> > 
> > v2:
> >   Create device link by default if xHC host is not capable of tunnel
> >   detection but the USB3 ports have tunnel capability reported in ACPI
> >   _DSD object
> > 
> > Mathias Nyman (4):
> >    xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
> >    usb: Add tunnel_mode parameter to usb device structure
> >    usb: acpi: add device link between tunneled USB3 device and USB4 Host
> >      Interface
> >    thunderbolt: Don't create device link from USB4 Host Interface to USB3
> >      xHC host
> > 
> >   drivers/thunderbolt/acpi.c       | 40 ++++++------------------
> >   drivers/usb/core/usb-acpi.c      | 53 ++++++++++++++++++++++++++++++++
> >   drivers/usb/host/xhci-ext-caps.h |  5 +++
> >   drivers/usb/host/xhci-hub.c      | 36 ++++++++++++++++++++++
> >   drivers/usb/host/xhci.c          | 14 +++++++++
> >   drivers/usb/host/xhci.h          |  3 +-
> >   include/linux/usb.h              |  8 +++++
> >   7 files changed, 128 insertions(+), 31 deletions(-)
> > 
> 
> Hello,
> 
> I had a try with this version of the series but I'm missing a device link
> from XHCI controller after applying it.
> 
> Before series these are the two links (6.11-rc6):
> consumer:pci:0000:00:03.1 ->
> ../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:00:03.1
> consumer:pci:0000:c4:00.3 ->
> ../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:c4:00.3
> 
> After 6.11-rc6 + v2 series only this link:
> consumer:pci:0000:00:03.1 ->
> ../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:00:03.1

Do you have device connected? The link will now be created only when
there is a device router with USB 3.x hub/device connected.

