Return-Path: <linux-usb+bounces-24626-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0EAD216B
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 16:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A17A03A280D
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 14:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CD718FDAF;
	Mon,  9 Jun 2025 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShyRZ2wF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6AA1E505
	for <linux-usb@vger.kernel.org>; Mon,  9 Jun 2025 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480753; cv=none; b=dRNiWSSZffnSQ+uTeT9rSwSaPPBL2h5Ngm0+tEBpWM1ycih7uddrUrPlYUHewfycGRsMFV13gWPFjetRStEXoLQWX6nvFbUAz1ifZq46JfMBC4QXw1xpcTF5GZNYThmnVHv9gOoBOsxuy4zRPYSK92KWaL/4pSVSQ7GsxsFOnf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480753; c=relaxed/simple;
	bh=uwMfSkOStJvIxOEMWI0q4sAOo3X//MEikdjky1qV1j8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDue7+y2tXlnH9wSJvtjqFFFXJqm1G0LVUfr6rj5tdwR1zn5Mrb5lzOo8jxqQlzrWFo9SOocmrFiQCyOoJJjMHZsFlYA20HKOg6bkA87KqO5AzuBzWBlDiHcxg8KHsXny0o3yeAeAU0hh83wXIjNRpsgYJ01C31bIE1LFyu4bpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShyRZ2wF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749480751; x=1781016751;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uwMfSkOStJvIxOEMWI0q4sAOo3X//MEikdjky1qV1j8=;
  b=ShyRZ2wFgnDuTrvEiPxqw3ImVGaf0PBGd9GyXqZej47YF0HtRl6ealWl
   ZL78v2rrO3fJvatFGv0PPzm5sS4rQLhZa2KSoUxf5EJy65Woc1HD/SQFO
   CCbgaouUvG4j0KNKUEYpnuis0TP4sQS4Jsy+FooUKpRw5IDYzMvqU3EI6
   nZmmiO44eHX4dHCZ04qsuAXZ0arE7+EU7yX8kNa5qkNEjznZ9NtloeWGs
   wCmW6ohAPheVmZhRlPSTQjaXozDmGHwyfVT2+ibK59uYu7qPpo3dVrBPs
   R3yM6Fnh8S41DGhkHbY+8/qlKVFTz3sF9p6OmzaHs/sp5fW3OCvVz8Li1
   w==;
X-CSE-ConnectionGUID: mMfNIfiBTDu9I0sqIcwioQ==
X-CSE-MsgGUID: /EDL0lzNRhuq2v78BeS/Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="50785635"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="50785635"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 07:52:31 -0700
X-CSE-ConnectionGUID: FCcsKT4VRQ2v0TeUEWZiTw==
X-CSE-MsgGUID: 0YloRCNPRD2O+BjC+hSW/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146892126"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa008.fm.intel.com with ESMTP; 09 Jun 2025 07:52:29 -0700
Message-ID: <8cbe501d-1194-42b6-b29d-e3c81301a9f7@linux.intel.com>
Date: Mon, 9 Jun 2025 17:52:28 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] usb: xhci: Avoid showing errors during surprise
 removal
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
References: <20250609020223.269407-1-superm1@kernel.org>
 <20250609020223.269407-4-superm1@kernel.org>
 <12a8fd39-e910-4558-8fec-d41d2eecfd15@linux.intel.com>
 <af65c710-8dcf-47e5-ab97-f23839f6278e@kernel.org>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <af65c710-8dcf-47e5-ab97-f23839f6278e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9.6.2025 16.07, Mario Limonciello wrote:
> On 6/9/2025 7:42 AM, Mathias Nyman wrote:
>> On 9.6.2025 4.58, Mario Limonciello wrote:
>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> When a USB4 dock is unplugged from a system it won't respond to ring
>>> events. The PCI core handles the surprise removal event and notifies
>>> all PCI drivers. The XHCI PCI driver sets a flag that the device is
>>> being removed as well.
>>>
>>> When that flag is set don't show messages in the cleanup path for
>>> marking the controller dead.
>>>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>
> 
> Thanks for the acks Mathias!
> 
> All 4 patches were sent together because of the relation but they really don't have a dependency to need to be committed together.
> 
> Would you mind picking up the patches for 3 and 4 to USB tree and I'll keep discussing 1 and 2 with linux-pci M/L.

I can do that yes.
Added patches 3/4 and 4/4 to my for-usb-next branch

Thanks
Mathias

