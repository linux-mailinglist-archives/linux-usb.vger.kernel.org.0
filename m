Return-Path: <linux-usb+bounces-16601-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D92509AC9B4
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 14:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 066EF1C216CD
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 12:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065481AB6FA;
	Wed, 23 Oct 2024 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBhXIgve"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A5E1AB6CB
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729685414; cv=none; b=OH3Kw/yNIzpNoRmXs+Qty2ft0CzdiWB0pl7RMV0ytsE0RG8CVr2Y8Wo97t0j5MXiLz3olP8jfND6L0Kl5G3Y/d3eUGaEmwJhl301Pk/bEEBl2qR+JfS9yRMtNwnIhNBS4O8VNkXEnfSV2UVPe3MNvwZkP9gW1uTNb4MbwFUDk3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729685414; c=relaxed/simple;
	bh=GOwGENwm+/xWKBX8kkgxQLtB/cSkodpHeZEiGJWdrMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGhVQOMFC2h6DIL0rZ97Ls2PDqwTlspRSyDdNHFQCClYx9J/tjKOi3O6m32y1lL5kn+laJcpqynMkBmfFqYwS7vVfcBTpZD6qGUxVs8pL/yfcJCnqpuCG1gbVsukxDukUnpsouXA0i22clEVoBYTWxWrDsErnAkD/xJ9aFHv6FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBhXIgve; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729685413; x=1761221413;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GOwGENwm+/xWKBX8kkgxQLtB/cSkodpHeZEiGJWdrMs=;
  b=mBhXIgveTBU+J12wVTaGgjLGL8IAjsdcZdEp+CC8smw4O1QwSBsz5S8O
   wGru2qO/Iy98Y5z6TP70eBgEG+BVA3pQ4fRYYU8hop942wekM4G/rzE0r
   iCOK7dLDBmOwPS1zS/n/91e8bGptnSX88rlfX53kZsYKF4x3eI5ROPZC+
   /4C6UoGsSMHVgqFkYN2wrY18VlX9QIKXbreHZD1piAySToNKXS4zBBS62
   KpN2tuSJ30+ZYoLpt8U5JqeNAEsaA2zObdspvw37QG7Kl8W9O3O+r5Gft
   6TVvGMfD3WaPNuh60Kv9pThWXF+7X2YsUUsG35wCecDN8iV3IWzlaYgdh
   g==;
X-CSE-ConnectionGUID: Na5He6KsR2CTNeYLklbx+Q==
X-CSE-MsgGUID: FKw+rkdqSOWteptzKTOd1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="46752100"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="46752100"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 05:10:12 -0700
X-CSE-ConnectionGUID: ICF3SvYORF6dWFM5PTyG2g==
X-CSE-MsgGUID: MuaX4CrjQ5uc5p2OJOJTiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="79750761"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa006.fm.intel.com with ESMTP; 23 Oct 2024 05:10:11 -0700
Message-ID: <2b4708a0-d8b0-4e8b-9cf8-11552527eb14@linux.intel.com>
Date: Wed, 23 Oct 2024 15:12:23 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: acpi: fix boot hang due to early incorrect
 'tunneled' USB3 device links
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
References: <20241022123742.3045707-1-mathias.nyman@linux.intel.com>
 <20241022132232.GD275077@black.fi.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241022132232.GD275077@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.10.2024 16.22, Mika Westerberg wrote:
> Hi,
> 
> On Tue, Oct 22, 2024 at 03:37:42PM +0300, Mathias Nyman wrote:
>> Fix a boot hang issue triggered when a USB3 device is incorrectly assumed
>> to be tunneled over USB4, thus attempting to create a device link between
>> the USB3 "consumer" device and the USB4 "supplier" Host Interface before
>> the USB4 side is properly bound to a driver.
>>
>> This could happen if xhci isn't capable of detecting tunneled devices,
>> but ACPI tables contain all info needed to assume device is tunneled.
>> i.e. udev->tunnel_mode == USB_LINK_UNKNOWN.
>>
>> If the USB4 host interface hasn't probed yet, then we know the USB3
>> device is not in a tunnel created by the USB4 Host Interface driver, so
>> don't try to create a device link in this case.
>>
>> cc: Mario Limonciello <mario.limonciello@amd.com>
>> Fixes: f1bfb4a6fed6 ("usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface")
>> Tested-by: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>   drivers/usb/core/usb-acpi.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
>> index 21585ed89ef8..9e1ec71881db 100644
>> --- a/drivers/usb/core/usb-acpi.c
>> +++ b/drivers/usb/core/usb-acpi.c
>> @@ -173,6 +173,17 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>   	if (IS_ERR(nhi_fwnode))
>>   		return 0;
>>   
>> +	/*
>> +	 * If USB4 Host interface driver isn't set up yet we can't be in a USB3
>> +	 * tunnel created by it.
>> +	 */
>> +	if (!nhi_fwnode->dev || !device_is_bound(nhi_fwnode->dev)) {
>> +		dev_info(&port_dev->dev, "%s probed before USB4 host interface\n",
>> +			 dev_name(&port_dev->child->dev));
>> +		udev->tunnel_mode = USB_LINK_NATIVE;
>> +		return 0;
>> +	}
> 
> I think this will not work if you boot with "thunderbolt.host_reset=0"
> and the BIOS CM created the tunnels, and that Thunderbolt/USB4 driver is
> bound after xHCI. Then it will mark this as USB_LINK_NATIVE and does not
> setup the link so after Thunderbolt/USB4 is runtime suspended it might
> not be there to re-create the tunnel before xHCI.
> 
> The test case would be something like this:
> 
> 1. Add "thunderbolt.host_reset=0" in the kernel command line.
> 2. Boot with USB4 device connected (and so that it has USB 3.x device
>     connected such as USB 3 memory stick).
> 3. Since there is no device link Thunderbolt/USB4 can runtime suspend
> freely.
> 4. Once that happens the tunnels are gone, including the USB 3.x tunnel
>     so the xHCI might see disconnect here.
> 
> Also on resume path it will not be recreating the tunnel before xHCI
> because there is no device link. I can try this on my side too if you
> like.
> 

You are right, I was able to reproduce it.

Device link won't be created if BIOS created the tunnel, thunderbolt driver
probes after this usb device is created, and "thunderbolt.host_reset=0" is set.

Turning the device link "stateless" could possible help.
It removes driver presence dependency but keeps correct suspend/resume and
shutdown ordering.
It should also help with boot hang/probe issues seen on the AMD platforms.

Mario, Harry, does the following work for you?

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 21585ed89ef8..03c22114214b 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -170,11 +170,11 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
         struct fwnode_handle *nhi_fwnode __free(fwnode_handle) =
                 fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
  
-       if (IS_ERR(nhi_fwnode))
+       if (IS_ERR(nhi_fwnode) || !nhi_fwnode->dev)
                 return 0;
  
         link = device_link_add(&port_dev->child->dev, nhi_fwnode->dev,
-                              DL_FLAG_AUTOREMOVE_CONSUMER |
+                              DL_FLAG_STATELESS |
                                DL_FLAG_RPM_ACTIVE |
                                DL_FLAG_PM_RUNTIME);
         if (!link) {

Thanks
Mathias



