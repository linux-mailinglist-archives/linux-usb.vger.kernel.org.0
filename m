Return-Path: <linux-usb+bounces-16530-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 111729AA2F1
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 15:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C63D728323B
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 13:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19A719DF99;
	Tue, 22 Oct 2024 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1DnARP5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D670A19ABD5
	for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2024 13:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729603358; cv=none; b=RYXOyGINLYEo/cXG1L7WddSCWqwboa55mWmnaZocj8Lf6Q08fAO4dirYuRK5/tYZYG2ZgGgke1P6rol6im6h1/5X1L28iQDlaNQyeclYzD3UORvmiAs5dA6EFtYsZwrZpGkMITAWxMUIJdF6Mm95zjNx/PTwIU9pfpGgsrdAmZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729603358; c=relaxed/simple;
	bh=BZ1mKlcBhj5UMlz4fUb+y0tTM8w89+UvgaBa1zIxA1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhFb94umijAiI6mKWVd3mMU0MhvBn1IEYMdtNQeLx7nqukZMAcb98ubSRhu3xIsHEAfPJaf3/Gx+5dhrgTd6eUaAqs1207pLsQCFNIcTObEopU7P7CrAhWqqeBIL0vNCVPdiKcve2gLRRPTyvOaDKphNMEypXg+IDl0HAkpgHg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g1DnARP5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729603357; x=1761139357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BZ1mKlcBhj5UMlz4fUb+y0tTM8w89+UvgaBa1zIxA1g=;
  b=g1DnARP5wfoZVNzpUM11lf54M73MEoAIJjPGxgAxK7fOJt4gRbpZmwCp
   q0KDuObPyhFlCXZvc41cI2AZ9Sddlh5rOL49nxEphrE0IvU1bawzX5X9Y
   UPkfbMlIO0i4kRNNXg1L6NiVgcXVqHz5/8FcAYl0zV+YOSjp9y4H0D9pi
   m2W/BZJvCpHjT9TuTxScfZHGDedeKS4JGADKDnb/C1CEA7J/mzzTJQwU6
   2Nd1fMoK9Iu+V9nOG1c2qNFTVVyNnVQoMOnbvl+IUPNUm3NmALuQGfyzt
   dofUHZwL3+0TfVgdAfIr+i7DI8nse5IXVoBhMqfkfvoFBqqGSD9riVrg9
   A==;
X-CSE-ConnectionGUID: bvSJxAe6SDOsE9eHdFoU2A==
X-CSE-MsgGUID: SdcWM7C3TDOWBmq9c8jZaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="31997313"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="31997313"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:22:36 -0700
X-CSE-ConnectionGUID: oaCgUW8rQf2u0SJmkUKMIA==
X-CSE-MsgGUID: I7fTtdS1TqmE0iaTdyWikw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="84479117"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 22 Oct 2024 06:22:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E3079301; Tue, 22 Oct 2024 16:22:32 +0300 (EEST)
Date: Tue, 22 Oct 2024 16:22:32 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH] usb: acpi: fix boot hang due to early incorrect
 'tunneled' USB3 device links
Message-ID: <20241022132232.GD275077@black.fi.intel.com>
References: <20241022123742.3045707-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022123742.3045707-1-mathias.nyman@linux.intel.com>

Hi,

On Tue, Oct 22, 2024 at 03:37:42PM +0300, Mathias Nyman wrote:
> Fix a boot hang issue triggered when a USB3 device is incorrectly assumed
> to be tunneled over USB4, thus attempting to create a device link between
> the USB3 "consumer" device and the USB4 "supplier" Host Interface before
> the USB4 side is properly bound to a driver.
> 
> This could happen if xhci isn't capable of detecting tunneled devices,
> but ACPI tables contain all info needed to assume device is tunneled.
> i.e. udev->tunnel_mode == USB_LINK_UNKNOWN.
> 
> If the USB4 host interface hasn't probed yet, then we know the USB3
> device is not in a tunnel created by the USB4 Host Interface driver, so
> don't try to create a device link in this case.
> 
> cc: Mario Limonciello <mario.limonciello@amd.com>
> Fixes: f1bfb4a6fed6 ("usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface")
> Tested-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/core/usb-acpi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 21585ed89ef8..9e1ec71881db 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -173,6 +173,17 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>  	if (IS_ERR(nhi_fwnode))
>  		return 0;
>  
> +	/*
> +	 * If USB4 Host interface driver isn't set up yet we can't be in a USB3
> +	 * tunnel created by it.
> +	 */
> +	if (!nhi_fwnode->dev || !device_is_bound(nhi_fwnode->dev)) {
> +		dev_info(&port_dev->dev, "%s probed before USB4 host interface\n",
> +			 dev_name(&port_dev->child->dev));
> +		udev->tunnel_mode = USB_LINK_NATIVE;
> +		return 0;
> +	}

I think this will not work if you boot with "thunderbolt.host_reset=0"
and the BIOS CM created the tunnels, and that Thunderbolt/USB4 driver is
bound after xHCI. Then it will mark this as USB_LINK_NATIVE and does not
setup the link so after Thunderbolt/USB4 is runtime suspended it might
not be there to re-create the tunnel before xHCI.

The test case would be something like this:

1. Add "thunderbolt.host_reset=0" in the kernel command line.
2. Boot with USB4 device connected (and so that it has USB 3.x device
   connected such as USB 3 memory stick).
3. Since there is no device link Thunderbolt/USB4 can runtime suspend
freely.
4. Once that happens the tunnels are gone, including the USB 3.x tunnel
   so the xHCI might see disconnect here.

Also on resume path it will not be recreating the tunnel before xHCI
because there is no device link. I can try this on my side too if you
like.

