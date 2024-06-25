Return-Path: <linux-usb+bounces-11640-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70622916AE0
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 16:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE79228C400
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 14:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90D616C840;
	Tue, 25 Jun 2024 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXdiYMUN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAC21607A7
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719326751; cv=none; b=l+xIOPnfFcxP1sYJIQu+nZm+g+hlgOf3geULyCEDYtn3Fajw13Fu9UqBfd+R0hsBjzIT5X7uvO+GmKnmGYft763rtys99xJOTvaIzM4At9bQ2H2eeBpuCoDZ6UaO6neY9VRB2hqW5mnyCbZBkmBfGlsfkM0uM9O2IZJL+KwVypo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719326751; c=relaxed/simple;
	bh=Z8OrdS+s/3YXvrwm4vs2V05dYKIECbzjp3Y+Pm9oWWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RED2QrP5SVaCpivX3QwdbrPwQutz5+S53HFJ/Lfqlk0ILHKCTIxUphaDa1I8JbSWSYzJjv7wl5U88b7CbZ/faZFUiG02WHNU/yQn9CP11uFg9xsWv2UnoSDvtT9eYFVknLxMS3s6NEWnkAtz9XZxJevCy7CRRD1Zx10aIF0DvCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OXdiYMUN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719326750; x=1750862750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z8OrdS+s/3YXvrwm4vs2V05dYKIECbzjp3Y+Pm9oWWk=;
  b=OXdiYMUNJ3dONAvWF/zhKeXOJ34FdJMHP7UKk8JalIxbWaigXl4StCod
   bOba82BmYC65tBfcOA9UM0ALgKyCgddFwgk+MIEwfrg1qhwVfUAguVFw3
   H/FzbLd+5jJMBbNcF+YXC43z2T5/vhBm47j8+xyJxGtAqw+OYnJOwDouJ
   JrZq2a2AillUw4ke6aDvUw9NFgnhs/DBHW2hBxSFWXUTI1lRcpW35K+9j
   jjVyaqSfzRBhfhIOxR08r4SyKDe467HL5w6NvXVdVrvPBYIMohR+id6wh
   cy1rTZIalZSZ/wg8gRrMWcKfQNJtR3l+epF6tVmrUnqfY6QsAYD9lRuFJ
   g==;
X-CSE-ConnectionGUID: XnLocVifTKmU8R0hEBaBHA==
X-CSE-MsgGUID: 0wfTZjddQeqLRhPga/stOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16472279"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="16472279"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 07:45:49 -0700
X-CSE-ConnectionGUID: IbI8lkivRLGvsKubjJZO1w==
X-CSE-MsgGUID: d6V9iG4fShWeTpLZXLzYsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="48845278"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 25 Jun 2024 07:45:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 94D13346; Tue, 25 Jun 2024 17:45:46 +0300 (EEST)
Date: Tue, 25 Jun 2024 17:45:46 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 0/4] Add device links between tunneled USB3 devices and
 USB4 Host
Message-ID: <20240625144546.GW1532424@black.fi.intel.com>
References: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
 <20240620064115.GH1532424@black.fi.intel.com>
 <9ec62b68-7eef-4d33-bc47-1d13e8eec820@amd.com>
 <20240621061905.GI1532424@black.fi.intel.com>
 <844e3930-7b3d-46a1-ad90-bcecbb99c069@amd.com>
 <20240624045912.GJ1532424@black.fi.intel.com>
 <fea9e9f6-c3b0-6e22-d813-04da3d54a059@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fea9e9f6-c3b0-6e22-d813-04da3d54a059@linux.intel.com>

On Tue, Jun 25, 2024 at 05:37:27PM +0300, Mathias Nyman wrote:
> On 24.6.2024 7.59, Mika Westerberg wrote:
> > On Fri, Jun 21, 2024 at 11:30:05AM -0500, Mario Limonciello wrote:
> > > On 6/21/2024 01:19, Mika Westerberg wrote:
> > > > Hi Mario,
> > > > 
> > > > On Thu, Jun 20, 2024 at 01:36:56PM -0500, Mario Limonciello wrote:
> > > > > On 6/20/2024 01:41, Mika Westerberg wrote:
> > > > > > +CC Mario from AMD side to check that we are good and don't break
> > > > > > anything accidentally.
> > > > > > 
> > > > > > On Wed, Jun 19, 2024 at 04:03:01PM +0300, Mathias Nyman wrote:
> > > > > > > The relationship between a USB4 Host Interface providing USB3 tunnels,
> > > > > > > and tunneled USB3 devices is not represented in device hierarchy.
> > > > > > > 
> > > > > > > This caused issues with power managment as devices may suspend and
> > > > > > > resume in incorrect order.
> > > > > > > A device link between the USB4 Host Interface and the USB3 xHCI was
> > > > > > > originally added to solve this, preventing the USB4 Host Interface from
> > > > > > > suspending if the USB3 xHCI Host was still active.
> > > > > > > This unfortunately also prevents USB4 Host Interface from suspending even
> > > > > > > if the USB3 xHCI Host is only serving native non-tunneled USB devices.
> > > > > > > 
> > > > > > > Improve the current powermanagement situation by creating device links
> > > > > > > directly from tunneled USB3 devices to the USB4 Host Interface they depend
> > > > > > > on instead of a device link between the hosts.
> > > > > > > This way USB4 host may suspend when the last tunneled device is
> > > > > > > disconnected.
> > > > > > > 
> > > > > > > Intel xHCI hosts are capable of reporting if connected USB3 devices are
> > > > > > > tunneled via vendor specific capabilities.
> > > > > > > Use this until a standard way is available.
> > > > > > > 
> > > > > > > Mathias Nyman (4):
> > > > > > >      xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
> > > > > > >      usb: Add tunneled parameter to usb device structure
> > > > > > >      usb: acpi: add device link between tunneled USB3 device and USB4 Host
> > > > > > >        Interface
> > > > > > >      thunderbolt: Don't create device link from USB4 Host Interface to USB3
> > > > > > >        xHC host
> > > > > > > 
> > > > > > >     drivers/thunderbolt/acpi.c       | 40 ++++++------------------
> > > > > > >     drivers/usb/core/usb-acpi.c      | 52 ++++++++++++++++++++++++++++++++
> > > > > > >     drivers/usb/host/xhci-ext-caps.h |  5 +++
> > > > > > >     drivers/usb/host/xhci-hub.c      | 29 ++++++++++++++++++
> > > > > > >     drivers/usb/host/xhci.c          | 12 ++++++++
> > > > > > >     drivers/usb/host/xhci.h          |  1 +
> > > > > > >     include/linux/usb.h              |  2 ++
> > > > > > >     7 files changed, 111 insertions(+), 30 deletions(-)
> > > > > > > 
> > > > > > > -- 
> > > > > > > 2.25.1
> > > > > 
> > > > > Hi Mika,
> > > > > 
> > > > > Thanks for looping me in.  Unfortunately with this is appears the XHCI
> > > > > controller link never gets created.  I've not checked functional impact from
> > > > > this, but I'd guess there "should" be some functional problems too.
> > > > 
> > > > Thanks for checking!
> > > > 
> > > > I think the code that sets up the device link based on ->tunneled should
> > > > do that always if the hardware cannot tell if this is native or tunneled
> > > > link to keep the existing functionality and only do the "optimization"
> > > > if the hardware is capable of identifying that.
> > > > 
> > > > Perhaps it can be a callback provided by the xHCI controller driver
> > > > (->is_tunneled()) that then defaults to true if the
> > > > "usb4-host-interface" property is there and in case of Intel hardware
> > > > also checks the proprietary register?
> 
> How about changing the boolean udev->tunneled into a 3 value enum with
> "link_unknown", "link_native", and "link_tunneled" options.
> 
> "link_unknown" would be default, xhci driver only changes this to "link_tunneled" or
> "link_native" if the host can detect tunnels.
> 
> device link to USB4 host would be created for USB3 devices that have
> "usb4-host-interface" property and udev->tunneled != native.

Sounds good to me :)

