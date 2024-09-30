Return-Path: <linux-usb+bounces-15599-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FF398AFD0
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2024 00:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24AE22836FD
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 22:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1432518891E;
	Mon, 30 Sep 2024 22:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nub6gil8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9B9186E56
	for <linux-usb@vger.kernel.org>; Mon, 30 Sep 2024 22:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727735330; cv=none; b=nAZp/scycyjUi2uZIacOSo9dwZyuiErgwC4/j82W/DCopCIt4Tgl51GCFRozSqsHKo7B7p3uH7JB7Dr+lJRh0xgjJqVbqEsrtGIGbOy/jryRDL11AALZqmKKnDV8Mc4NYajtKe7LLGkmrUMUFqzExQURSXCl1t7u1IRm62X57oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727735330; c=relaxed/simple;
	bh=7NwUkH1tT98GV1cI9nMb4lF//erX/dOlelGNl3SbDX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SvbZHjHVB6jmWY8f4aZA4ifCnhtzf8dC7vpzW/UUXvd8HGGE9X/e+BnsKxVkEVeCmD4us26OwTetp8E1M0qbEP0Wr1oknsoCJcd9WI2gu4qTuHWQsnLf4cIePbJpynPDfa2Y3dXVAM/4DLaV0H6PmDS9+s58ZPlmxpDlu7ZOy08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nub6gil8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727735328; x=1759271328;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7NwUkH1tT98GV1cI9nMb4lF//erX/dOlelGNl3SbDX4=;
  b=nub6gil8oFbucHFeGgi0PJTg2UecHxXAnGvbHH5spDYgDxCIPcybS9rK
   bQMeRmVq3AivRMVUtFA+VqhKfOV3UVtNLmcWHhkcl23H4RV/6O4k/gmJf
   sdnG1PApBctDHmLXmiR1zpnfrQckT34OHdgZbdc02QCgyh6KokDEq6jIT
   baC09b99XRmWQMSIW2D05+NjOk4jMf9vyjSm0AjIZ9uhs6lQirMp5hZvm
   ORwbbga1BRT1ZKoc0z56MomVEtcMtMudrYoQ2HRkGfWeAGx1H+MD7GZQP
   rtWh2pfqG7rtYpx9Ta3JPR4Lftcc9Tm7uUf7y5TiaY4ZMZw9AB2pzFo/1
   g==;
X-CSE-ConnectionGUID: L2qUksVCRSe2NSGSok1MYA==
X-CSE-MsgGUID: hm8wiaxBQ92BCDGL+rib+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30734333"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="30734333"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 15:28:47 -0700
X-CSE-ConnectionGUID: oW+7MxraTB+SDSP+57Kb0Q==
X-CSE-MsgGUID: 4uM9wuABSkWOh9plUghnNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="73494550"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa009.jf.intel.com with ESMTP; 30 Sep 2024 15:28:46 -0700
Message-ID: <028c8515-3e7a-4862-9a8f-3885405511a0@linux.intel.com>
Date: Tue, 1 Oct 2024 01:30:54 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xhci: Change pm_runtime_forbid to pm_runtime_disable
To: Johan Hovold <johan@kernel.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>
References: <20240925161520.2736895-1-Basavaraj.Natikar@amd.com>
 <ZvqgINVgkYf_r6hY@hovoldconsulting.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <ZvqgINVgkYf_r6hY@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.9.2024 15.57, Johan Hovold wrote:
> On Wed, Sep 25, 2024 at 09:45:20PM +0530, Basavaraj Natikar wrote:
>> Change pm_runtime_forbid to pm_runtime_disable to disable RPM on
>> platforms that don't support runtime D3, as re-enabling it through sysfs
>> auto power control may cause the controller to malfunction. This can lead
>> to issues such as hotplug devices not being detected due to failed
>> interrupt generation.
>>
>> Fixes: a5d6264b638e ("xhci: Enable RPM on controllers that support low-power states")
>> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>   drivers/usb/host/xhci-pci.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
>> index dc1e345ab67e..39ab32fed3f4 100644
>> --- a/drivers/usb/host/xhci-pci.c
>> +++ b/drivers/usb/host/xhci-pci.c
>> @@ -635,7 +635,7 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>   	pm_runtime_put_noidle(&dev->dev);
>>   
>>   	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
>> -		pm_runtime_forbid(&dev->dev);
>> +		pm_runtime_disable(&dev->dev);
> 
> This looks broken. Runtime PM enable/disable should always be balanced,
> and unlike forbid(), disable() doesn't make sure that the device is
> actually active.
> 
> If you want to prevent the device from runtime suspending you can just
> increment the usage counter here in probe() and drop it in remove().

Good point.
Adding a pm_runtime_get() here, and pm_runtime_put() in remove sounds much better
The PCI code should have set it active and enabled it already.

Dropping this

Thanks
Mathias

