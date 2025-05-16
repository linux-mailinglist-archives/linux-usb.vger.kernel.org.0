Return-Path: <linux-usb+bounces-24035-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDFBAB9B8F
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 13:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27F1E17E9DC
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 11:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEF5238C1D;
	Fri, 16 May 2025 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ud2vaArg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30DB3E47B
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747396702; cv=none; b=aCXBHwrEP2kIYcYnfunHStHtf/HfI3KUgMAr/fs/Ei4xtwdCIQUeZOiGh2Q5RxSSszDHq68iCZkmS5V6864liy8AIwe3UzxrwCazhGpn/THNSN5WHHsnDKInal/v6DwMiUGxJPLtO9wpGwZuzXSJqXERyLi2pw2eT+cmPd1FYJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747396702; c=relaxed/simple;
	bh=Neh+uMNi+yOO9rj8h84eRErh6/JqTnZ7kZ6nHL/6jv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twiTYN90rvZ7VG/a9szKM7H/ZGr3Qd00AHv9aXWepsyv1U7ZyCLeJrQOAnZVy4evsWP9FGfh9YiG3xlKcvUhsm/AtmV34IOx6nVfBKPM4vbRVThV8u6MzZXwPqmX6tGi9zRSL8NLjZdkV2GhqR1s8CsjMeKvFZ32tsttkaGy4Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ud2vaArg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747396701; x=1778932701;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Neh+uMNi+yOO9rj8h84eRErh6/JqTnZ7kZ6nHL/6jv0=;
  b=Ud2vaArg9BphjMy8Z9drmMtF+jUHMT2njV948YcRHfLdIT0q0mm3D9Uu
   uZgrIxM2m8v72SZEYVyOXl1lp3jcqbVFCFgRkeoFrhjDKNyjvAubbgZQx
   4yKyAiXtBvRgzuoes5J2lFv+Nojt5fRzKDuIPHRIqi8kXSDDUfXvYK28A
   4bQL5NaLuMs6FkgUito0twE6InZ4p+Vl8amQkZU2UYtH824nx1yB3Qsw6
   0deqlebYrjNcy66QXTVADvZv6PoIdEe61Pd6QWoMZrZJyUbcpNuUiOLAl
   khQorL9OHGXNZj+cZO7SyJVAhwQ0a8V6oBFsSM/2hcJNeYOTCVzroRlLJ
   w==;
X-CSE-ConnectionGUID: LVqnI50xRbSfnzRhlRN+GQ==
X-CSE-MsgGUID: mYHdjaGUTWaFjRoRZdf7RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60707888"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="60707888"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 04:58:20 -0700
X-CSE-ConnectionGUID: KWZ43zP3TPSkicD8ZYStJw==
X-CSE-MsgGUID: jnh2gF+7RUak5LvQ/W7s7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138590247"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa006.fm.intel.com with ESMTP; 16 May 2025 04:58:19 -0700
Message-ID: <3c1ed781-2c65-422f-957d-51f37d576090@linux.intel.com>
Date: Fri, 16 May 2025 14:58:18 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/24] xhci: Add host support for eUSB2 double isochronous
 bandwidth devices
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Amardeep Rai <amardeep.rai@intel.com>, Kannappan R <r.kannappan@intel.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
 <20250515135621.335595-25-mathias.nyman@linux.intel.com>
 <20250516002700.cags7zapbshy7ri7@synopsys.com>
 <20250516004008.lzd7yhsagz63oxmf@synopsys.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250516004008.lzd7yhsagz63oxmf@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.5.2025 3.40, Thinh Nguyen wrote:
> On Thu, May 15, 2025, Thinh Nguyen wrote:
>> On Thu, May 15, 2025, Mathias Nyman wrote:
>>> From: Amardeep Rai <amardeep.rai@intel.com>
>>>
>>> Detect eUSB2 double isoc bw capable hosts and devices, and set the proper
>>> xhci endpoint context values such as 'Mult', 'Max Burst Size', and 'Max
>>> ESIT Payload' to enable the double isochronous bandwidth endpoints.
>>>
>>> Intel xHC uses the endpoint context 'Mult' field for eUSB2 isoc
>>> endpoints even if hosts supporting Large ESIT Payload Capability should
>>> normally ignore the mult field.
>>>
>>> Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
>>> Co-developed-by: Kannappan R <r.kannappan@intel.com>
>>> Signed-off-by: Kannappan R <r.kannappan@intel.com>
>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>> ---
>>>   drivers/usb/host/xhci-caps.h |  2 ++
>>>   drivers/usb/host/xhci-mem.c  | 62 ++++++++++++++++++++++++++++--------
>>>   drivers/usb/host/xhci-ring.c |  6 ++--
>>>   drivers/usb/host/xhci.c      | 17 +++++++++-
>>>   drivers/usb/host/xhci.h      | 19 +++++++++++
>>>   5 files changed, 89 insertions(+), 17 deletions(-)
>>>
>>
>>
>> <snip>
>>
>>
>>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
>>> index 49887a303e43..e0c5238c9327 100644
>>> --- a/drivers/usb/host/xhci.h
>>> +++ b/drivers/usb/host/xhci.h
>>> @@ -1735,6 +1735,23 @@ static inline bool xhci_has_one_roothub(struct xhci_hcd *xhci)
>>>   	       (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports);
>>>   }
>>>   
>>> +/*
>>> + * USB 2.0 specification, chapter 5.6.4 Isochronous Transfer Bus Access
>>> + * Constraint. A high speed endpoint can move up to 3072 bytes per microframe
>>> + * (or 192Mb/s).
>>> + */
>>> +#define MAX_ISOC_XFER_SIZE_HS  3072
>>> +
>>> +static inline bool xhci_eusb2_is_isoc_bw_double(struct usb_device *udev,
>>> +						struct usb_host_endpoint *ep)
>>> +{
>>> +	return le16_to_cpu(udev->descriptor.bcdUSB) == 0x220 &&
>>> +		usb_endpoint_xfer_isoc(&ep->desc) &&
>>> +		le16_to_cpu(ep->desc.wMaxPacketSize) == 0 &&
>>> +		le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval) >
>>> +		MAX_ISOC_XFER_SIZE_HS;
>>
>> Shouldn't this check for isoc IN direction only?

Probably not needed as only Isoc IN endpoints can have the additional isoc
endpoint  companion descriptor. So only the IN endpoint would fulfill the
desc.wMaxPacketSize == 0 and ep->eusb2_isoc_ep_comp.dwBytesPerInterval > 3072
check.
  
>>
>> Do we need to check for connected speed?

Good question.

The bcdUSB == 0x220 tells it's a "directly connected inbox native eUSB2 device",
so both host and device should support and enumerate at High-speed.

If the device for some reason supports enumerating as Full-speed after reset,
then I doubt it would share config, interface and endpoint descriptors intended
for High-speed and eUSB2 double isoc bw.

But I'm not 100% sure about this, need to double check it.

>>
>> Also, why are we checking eusb2_isoc_ep_comp.dwBytesPerInterval >
>> MAX_ISOC_XFER_SIZE_HS to determine if it's double isoc?
>>
>> In xhci_get_max_esit_payload, you use this check to determine whether to
>> use dwBytesPerInterval:
>>
>> 	/* High speed eusb2 double isoc bw with over 3072 bytes per esit */
>> 	if (xhci_eusb2_is_isoc_bw_double(udev, ep))
>> 		return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
>>
>> Shouldn't we just use the dwBytesPerInterval if it is valid? Otherwise
>> there can be a case where dwBytesPerInterval is set below the
>> MAX_ISOC_XFER_SIZE_HS and break this check.
>>
> 
> Actually spec indicates the dwBytesPerInterval value must be between
> 3073 and 6144 for eusb2 double isoc. For eUSB2v2, this value can be
> less.

This patch only adds support for double isoc bandwidth eusb2 devices,
i.e. with BytesPerInterval 3073-6144. eUSB2V2 with bcdUSB 0x230 are not
yet supported

Thanks
Mathias



