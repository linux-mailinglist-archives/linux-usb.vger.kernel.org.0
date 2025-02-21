Return-Path: <linux-usb+bounces-20918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECF3A3EF22
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 09:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF6747A556E
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 08:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3C520124E;
	Fri, 21 Feb 2025 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQNjrOE1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8033220103F
	for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127932; cv=none; b=Ma9ka7vMOCyqUcqsZUj8gZdVo0TJFzWvdU41qBD5qRFr7Xs2AEIRiE00jzGyPStGQ6kWkOVvph5Y2Eh27qe2IQvE8pz4POncQTXJruqOGjyUR4x1xWfh4HFUBIvGyQU/LNqrxU88N9NgG7xfd43zfvk+B9cahFS5lkiTHPGQsyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127932; c=relaxed/simple;
	bh=6bvVGaGnta9Tej9ZF83+g21NjrRB16+DjPTG5hUNtnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klZkMgwDNxbjaBkbPwcVpj4FvnfCQFtyEOVBd/pELfhUvIu7ETimMdKeiDsJIl5gzXf6vF9UrZRSQlVtqPnnJwnjNDtEabKMNdxnoqNTYvp9e2o4SGIDa99NyWLoOeLPMGVG6vf15zwjSTBt7deqV4spDIC6bboK533UtdlG3xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQNjrOE1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740127930; x=1771663930;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6bvVGaGnta9Tej9ZF83+g21NjrRB16+DjPTG5hUNtnE=;
  b=mQNjrOE1Z7zJGVrSZF/4EpH+/34SqM8W9zkoYLahuFccU4wBgYZJW2bI
   EEdLWbO20bpdH44bln7K/JuuplvWKtMfkLHCiDIkCQ9dkRrafMptuneB8
   bTo8Q9Mzu6JtlK+qWtonKveq+b0KkZJ25GWRkj25ghBkE4ay9AOZxVUcK
   A4NOUnQ2txocVO/9i1XmWWe9pHunXlMkKIPz8GiLa4WQd2A8EUHNhsn3y
   0H4igRB+1lmDQl3di3cDWJXHtG1+a4Q/rYk0qucDHoIgaIJQXW5bHgRg1
   by/CEG/tYDYVqZRsEyOiLsjIAwhz3XwM6gEsaUJdN4cViOU3R3RaBwSfN
   A==;
X-CSE-ConnectionGUID: 43wEPHGaRPWa1CULZEtn2w==
X-CSE-MsgGUID: Oo4hRxj+SbSbANGwLmsfgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41145863"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41145863"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 00:52:10 -0800
X-CSE-ConnectionGUID: bMHSOsHDTjGS0I1LxnaFlg==
X-CSE-MsgGUID: y2dVYvcIT3GzQqTJByr74g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="119932414"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 21 Feb 2025 00:52:08 -0800
Message-ID: <01300a1a-a2f1-4816-9341-933ef236e887@linux.intel.com>
Date: Fri, 21 Feb 2025 10:53:08 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: core: Add eUSB2 descriptor and parsing in USB core
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Kannappan R <r.kannappan@intel.com>,
 Amardeep Rai <amardeep.rai@intel.com>
References: <20250220141339.1939448-1-mathias.nyman@linux.intel.com>
 <2025022056-confess-unlovely-da5a@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2025022056-confess-unlovely-da5a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.2.2025 18.35, Greg KH wrote:
> On Thu, Feb 20, 2025 at 04:13:39PM +0200, Mathias Nyman wrote:
>> From: Kannappan R <r.kannappan@intel.com>
>> --->> @@ -64,9 +65,10 @@ struct ep_device;
>>    * descriptor within an active interface in a given USB configuration.
>>    */
>>   struct usb_host_endpoint {
>> -	struct usb_endpoint_descriptor		desc;
>> -	struct usb_ss_ep_comp_descriptor	ss_ep_comp;
>> -	struct usb_ssp_isoc_ep_comp_descriptor	ssp_isoc_ep_comp;
>> +	struct usb_endpoint_descriptor			desc;
>> +	struct usb_ss_ep_comp_descriptor		ss_ep_comp;
>> +	struct usb_ssp_isoc_ep_comp_descriptor		ssp_isoc_ep_comp;
>> +	struct usb_eusb2_isoc_ep_comp_descriptor	eusb2_isoc_ep_comp;
> 
> No real need to indent any of these, but oh well :)

It looked odd when adding one new variable off by a space compared to all the
other neatly tab-aligned variables. So I shifted them all right.

>> +/* USB_DT_EUSB2_ISOC_ENDPOINT_COMP: eUSB2 Isoch Endpoint Companion descriptor */
>> +struct usb_eusb2_isoc_ep_comp_descriptor {
>> +	__u8	bLength;
>> +	__u8	bDescriptorType;
>> +	__le16	wMaxPacketSize;
>> +	__le32	dwBytesPerInterval;
>> +} __attribute__ ((packed));
>> +
>> +#define USB_DT_EUSB2_ISOC_EP_COMP_SIZE	8
> 
> Can't we use a sizeof() for this as well?  I guess we don't do it for
> other structures, so maybe not.
> 
> Anyway, this looks fine, if you want to just send an update for the
> 0x0220 later on if you think it's needed, please do.

Thanks for looking at this.

We did consider defining 0x0220, but checked that usb core uses magic numbers
for bcdUSB in other places:

hcd.c:  if (le16_to_cpu(usb_dev->descriptor.bcdUSB) >= 0x0201) {
hub.c:                  (le16_to_cpu(udev->descriptor.bcdUSB) < 0x0300)) {
hub.c:  if (le16_to_cpu(udev->descriptor.bcdUSB) >= 0x0201) {
hub.c:          if (le16_to_cpu(udev->descriptor.bcdUSB) >= 0x0200
hub.h:          le16_to_cpu(hdev->descriptor.bcdUSB) >= 0x0310 &&

Makes sense to add a separate patch later on that define all these.

Thanks
Mathias

