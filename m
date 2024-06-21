Return-Path: <linux-usb+bounces-11531-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A71911B79
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 08:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9059F281A88
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 06:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5FA167D98;
	Fri, 21 Jun 2024 06:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="md8E3ApO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6D6167D83
	for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 06:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950759; cv=none; b=A5PZP1v0h6bgD5WT+eAgW6guYeMRaBc1tmI02wl+sPfPK1/FCk5+JkRfpcQbQbUZlOjjTygDczRZM6aWLelNhP3JHTpiY88F+YZXsnF2u7RoF7bqy+owYGwphWTfkXOftEfGU0LeLrIw1fEIbA0IwkLZpjC1iBZhvWNdB7gxh88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950759; c=relaxed/simple;
	bh=k8ZIXT6ACMFkOTn0ymC2XBCS0I4j5hsIzjnDVucWtN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWUn413nUl3jKRc3L6EllYaP7WnBVQNyn01MlicIfDo0PxtBg25wejXyVQjE5mgHh0olMy5cJU1bM6nOEpySehE2DoFi9+4g4xewXpqgLEV/EepmVBQdvWAkxnl4onbGimCFwug+AMNw6BrUoYj/cS+vKCEF9fRZ7u7DLl/Y+aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=md8E3ApO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718950758; x=1750486758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k8ZIXT6ACMFkOTn0ymC2XBCS0I4j5hsIzjnDVucWtN8=;
  b=md8E3ApOoYv/YfA6GSVkAOKxqHl9HsfMFMR4nBX1m/Ne8/w3LnKnbi2b
   3gZ9+MvCURKzppvtX33Eg+zquKNRhHDfJdoIQBJO4o37T03gLW8AEFmIU
   BCgxGfBRcxmvEbVCY4UZC47FqjrKwuo/RPJBUsry/JGEJ0gFQIVKezLd3
   2Bkoz0rCbmgBRpRKtkoIAGD7elV+6js/pkGitnrWcyfz1SR1+iZKT1p9P
   0dZ4bmPHwkFL5D7GqZ6VWB+CxwGW20U9xDXQgphSftJupXsifUG/h+zvU
   23B3+SlN9VAyeHiEN6veFbp1ZOt+Ji8AyPpeM2pJsaZLj6n6PC2b8lxUQ
   Q==;
X-CSE-ConnectionGUID: eas19nu2QNiGRlQpDUJP6g==
X-CSE-MsgGUID: 1jIDEBmFSPKOLiEWAi7Tpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="27390307"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="27390307"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 23:19:08 -0700
X-CSE-ConnectionGUID: CaxOBe9uTUiuvSJrkq6dag==
X-CSE-MsgGUID: 9JJpcHOJSHGhQyBI9pioMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="42589900"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jun 2024 23:19:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5405A12A; Fri, 21 Jun 2024 09:19:05 +0300 (EEST)
Date: Fri, 21 Jun 2024 09:19:05 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 0/4] Add device links between tunneled USB3 devices and
 USB4 Host
Message-ID: <20240621061905.GI1532424@black.fi.intel.com>
References: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
 <20240620064115.GH1532424@black.fi.intel.com>
 <9ec62b68-7eef-4d33-bc47-1d13e8eec820@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ec62b68-7eef-4d33-bc47-1d13e8eec820@amd.com>

Hi Mario,

On Thu, Jun 20, 2024 at 01:36:56PM -0500, Mario Limonciello wrote:
> On 6/20/2024 01:41, Mika Westerberg wrote:
> > +CC Mario from AMD side to check that we are good and don't break
> > anything accidentally.
> > 
> > On Wed, Jun 19, 2024 at 04:03:01PM +0300, Mathias Nyman wrote:
> > > The relationship between a USB4 Host Interface providing USB3 tunnels,
> > > and tunneled USB3 devices is not represented in device hierarchy.
> > > 
> > > This caused issues with power managment as devices may suspend and
> > > resume in incorrect order.
> > > A device link between the USB4 Host Interface and the USB3 xHCI was
> > > originally added to solve this, preventing the USB4 Host Interface from
> > > suspending if the USB3 xHCI Host was still active.
> > > This unfortunately also prevents USB4 Host Interface from suspending even
> > > if the USB3 xHCI Host is only serving native non-tunneled USB devices.
> > > 
> > > Improve the current powermanagement situation by creating device links
> > > directly from tunneled USB3 devices to the USB4 Host Interface they depend
> > > on instead of a device link between the hosts.
> > > This way USB4 host may suspend when the last tunneled device is
> > > disconnected.
> > > 
> > > Intel xHCI hosts are capable of reporting if connected USB3 devices are
> > > tunneled via vendor specific capabilities.
> > > Use this until a standard way is available.
> > > 
> > > Mathias Nyman (4):
> > >    xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
> > >    usb: Add tunneled parameter to usb device structure
> > >    usb: acpi: add device link between tunneled USB3 device and USB4 Host
> > >      Interface
> > >    thunderbolt: Don't create device link from USB4 Host Interface to USB3
> > >      xHC host
> > > 
> > >   drivers/thunderbolt/acpi.c       | 40 ++++++------------------
> > >   drivers/usb/core/usb-acpi.c      | 52 ++++++++++++++++++++++++++++++++
> > >   drivers/usb/host/xhci-ext-caps.h |  5 +++
> > >   drivers/usb/host/xhci-hub.c      | 29 ++++++++++++++++++
> > >   drivers/usb/host/xhci.c          | 12 ++++++++
> > >   drivers/usb/host/xhci.h          |  1 +
> > >   include/linux/usb.h              |  2 ++
> > >   7 files changed, 111 insertions(+), 30 deletions(-)
> > > 
> > > -- 
> > > 2.25.1
> 
> Hi Mika,
> 
> Thanks for looping me in.  Unfortunately with this is appears the XHCI
> controller link never gets created.  I've not checked functional impact from
> this, but I'd guess there "should" be some functional problems too.

Thanks for checking!

I think the code that sets up the device link based on ->tunneled should
do that always if the hardware cannot tell if this is native or tunneled
link to keep the existing functionality and only do the "optimization"
if the hardware is capable of identifying that.

Perhaps it can be a callback provided by the xHCI controller driver
(->is_tunneled()) that then defaults to true if the
"usb4-host-interface" property is there and in case of Intel hardware
also checks the proprietary register?

