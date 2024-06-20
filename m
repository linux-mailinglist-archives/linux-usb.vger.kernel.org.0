Return-Path: <linux-usb+bounces-11468-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D2390FCE7
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 08:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65A4C1F2197E
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 06:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D833F9F9;
	Thu, 20 Jun 2024 06:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAm7TRSS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB933BBCB
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 06:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718865687; cv=none; b=YXIFt187CZpoStR6VJT8CAIRfk/8p4RV7ifC7T44vWgFDA1Lj9jpvM0kLbzKqrPYfrJDrV6MBeSiKzcrLy6HeJDFxloY0hUGBNqT7Y/9D4XzYiOHjLuJGvKpz+t+nZGeig/RA3AnbnUy11llXCbcpsraT5/jI7fH0URaD3oPEXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718865687; c=relaxed/simple;
	bh=+VDy+MoZokNx3jVmCQgCms2MloQmn2QAZdAZ5/1ohlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJUQSUgFHQ3vQiZOaD37r72qAHuPufSnm1iD7cW7i0sSmrYju04tCkj96eICuN4v419dA4clXuE7Mcr7NX4zBMGyt4GdbnGAi0gy0huvZQNU4Cqs/fZsk4ArdJczNWENnBgfyuUKWxtS6H15cuVBfnieX3Jm/Noi8M88vF0n8yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAm7TRSS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718865685; x=1750401685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+VDy+MoZokNx3jVmCQgCms2MloQmn2QAZdAZ5/1ohlg=;
  b=KAm7TRSS706slYHTU2Awss0m9f3QtVWSY2ZFdiYaBgegIU7KGezCxGv8
   NLdn+xHqnGWcDAgZsjg6o23tvw9r6j5pLAUC/5pv5+eQVe6b+QAb3s5kj
   ZFcg4JrdbXqM37zqKmaRTbXhbNDyN+A9GWlY8eO8rfedL1aXJcmdFBlGT
   FOpk0UrbFX/MOY6QTn4bImF+TxdkmD4Dx4upaMaXGT+C28cnUe5j0ecGC
   pmXUtdBVjqIqLKA8FpeDENT23qoOAotGJjN78A4kGYt6Yq0PS/uqQz2IN
   aZYaf2Yatt+3TppZTWHuRIvB68cvzZpcNBVCH713w3vYa061MbR3U0rqg
   w==;
X-CSE-ConnectionGUID: kaWBLfNNQbuppgqMyfrmLQ==
X-CSE-MsgGUID: OUvXi+b9RjKE1ybaOO8m5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="41227591"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="41227591"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 23:41:18 -0700
X-CSE-ConnectionGUID: cfDvxoEARHSSAP+rDZiuYQ==
X-CSE-MsgGUID: a5HSMv5iRp2zWpJKkP66HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42259796"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 19 Jun 2024 23:41:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 32E2E1D6; Thu, 20 Jun 2024 09:41:15 +0300 (EEST)
Date: Thu, 20 Jun 2024 09:41:15 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 0/4] Add device links between tunneled USB3 devices and
 USB4 Host
Message-ID: <20240620064115.GH1532424@black.fi.intel.com>
References: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>

+CC Mario from AMD side to check that we are good and don't break
anything accidentally.

On Wed, Jun 19, 2024 at 04:03:01PM +0300, Mathias Nyman wrote:
> The relationship between a USB4 Host Interface providing USB3 tunnels,
> and tunneled USB3 devices is not represented in device hierarchy.
> 
> This caused issues with power managment as devices may suspend and
> resume in incorrect order.
> A device link between the USB4 Host Interface and the USB3 xHCI was
> originally added to solve this, preventing the USB4 Host Interface from
> suspending if the USB3 xHCI Host was still active.
> This unfortunately also prevents USB4 Host Interface from suspending even
> if the USB3 xHCI Host is only serving native non-tunneled USB devices.
> 
> Improve the current powermanagement situation by creating device links
> directly from tunneled USB3 devices to the USB4 Host Interface they depend
> on instead of a device link between the hosts.
> This way USB4 host may suspend when the last tunneled device is
> disconnected.
> 
> Intel xHCI hosts are capable of reporting if connected USB3 devices are
> tunneled via vendor specific capabilities.
> Use this until a standard way is available.
> 
> Mathias Nyman (4):
>   xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
>   usb: Add tunneled parameter to usb device structure
>   usb: acpi: add device link between tunneled USB3 device and USB4 Host
>     Interface
>   thunderbolt: Don't create device link from USB4 Host Interface to USB3
>     xHC host
> 
>  drivers/thunderbolt/acpi.c       | 40 ++++++------------------
>  drivers/usb/core/usb-acpi.c      | 52 ++++++++++++++++++++++++++++++++
>  drivers/usb/host/xhci-ext-caps.h |  5 +++
>  drivers/usb/host/xhci-hub.c      | 29 ++++++++++++++++++
>  drivers/usb/host/xhci.c          | 12 ++++++++
>  drivers/usb/host/xhci.h          |  1 +
>  include/linux/usb.h              |  2 ++
>  7 files changed, 111 insertions(+), 30 deletions(-)
> 
> -- 
> 2.25.1

