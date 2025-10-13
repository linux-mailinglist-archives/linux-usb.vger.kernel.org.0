Return-Path: <linux-usb+bounces-29206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DE8BD1FBF
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 10:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A3061898D1E
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 08:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E962F2902;
	Mon, 13 Oct 2025 08:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qyi9N7IP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFFC2F28F4
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 08:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760343535; cv=none; b=Gfz5tBsRy7EjzdlBPIxPH0V37MbyYsR02aWaxfMJ2m+8JFw5cVSvOaLVwYUIrS6v2sbDBdU8jx2X/EKaSBsgRki0svWXEcV5JBFAwCo1vMHH+CVcgndFUZUDoOuobE3z+lyzKGdjaZHth2XEgaQBaTztcvIgZW1Si9iDIA1p28s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760343535; c=relaxed/simple;
	bh=imbI448U2WS8ofB/CdmmtyBPOW4eQYXnmAXqTLAYnYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvUVuGXJdjAWyCKGrQMdE///euSwboJu/4Deo3Z0o8OpKuLuSai5/iRWz2Jkc1htw4SdLbWFzD0BZHvOBXAGIx/qZs6pl4r24WvBepCmAeGM/YIXEnRrw2xDTWlQqbCmII+OC625ncbJmXYlbxRxuAlsCqJFvA4V5WkOMudrPeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qyi9N7IP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760343533; x=1791879533;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=imbI448U2WS8ofB/CdmmtyBPOW4eQYXnmAXqTLAYnYA=;
  b=Qyi9N7IPs5v1dW1m/9ppqKHJWa+qsrYPQ653/fKGADVFV6+iiq2BQOv+
   RCKqclXw3zZbXPLJg8lyp1PC4+5KyT0jVYZdz94yuWtkvT7lmc2yCg0aJ
   NeaVGkGVhaHA4tso/V1xrzndTg8vA56sA+zBE5IwyOjiWewBc3cVelC40
   rl+Cf1ihG2RSOOWkox9As1B93krlgc71eP9SImpidctoiARl5NtWVlxPQ
   rLponrdXUMFzDTYEWvCrrLiXfTAukQcmFqsJvGclmvF3Rh2BnId0DNpRO
   Foxr0CYnDfsgwIvBvkT+PdHdL1iyIu+TSwjc3DLalfZOkuVkerlIvGBpB
   w==;
X-CSE-ConnectionGUID: 9yno30WDRTiz33AjvLifKQ==
X-CSE-MsgGUID: w8mW2x43RTmspSTm9wHMXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="73823002"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="73823002"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 01:18:52 -0700
X-CSE-ConnectionGUID: +k1Pn/BjS8KB5Svg+IQC8A==
X-CSE-MsgGUID: ++yIOowZQb+jmaWSTh8gUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="186829861"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.60]) ([10.245.244.60])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 01:18:51 -0700
Message-ID: <74c8bb50-d941-486d-9513-5fd40f68c515@linux.intel.com>
Date: Mon, 13 Oct 2025 11:18:49 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xhci: dbc: prepare to expose strings through sysfs
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <20251007213902.2231670-1-ukaszb@google.com>
 <20251007213902.2231670-2-ukaszb@google.com>
 <fffa3476-c800-4257-a3c6-057c4c8cde28@intel.com>
 <CALwA+NZ=B2BbzUZUqKCzP28wDkPcd-PczcCwa6Mb2YjbNM8j3w@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CALwA+NZ=B2BbzUZUqKCzP28wDkPcd-PczcCwa6Mb2YjbNM8j3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/25 14:22, Łukasz Bartosik wrote:
> On Fri, Oct 10, 2025 at 1:09 PM Mathias Nyman <mathias.nyman@intel.com> wrote:
>>
>> On 10/8/25 00:38, Łukasz Bartosik wrote:
>>> From: Łukasz Bartosik <ukaszb@chromium.org>
>>>

>>> +static int xhci_dbc_populate_str_desc(char *desc, const char *src)
>>> +{
>>> +     struct usb_string_descriptor    *s_desc;
>>> +     int                             utf16_len;
>>> +
>>> +     s_desc = (struct usb_string_descriptor *)desc;
>>> +     utf16_len = utf8s_to_utf16s(src, strlen(src), UTF16_LITTLE_ENDIAN,
>>> +                                 (wchar_t *)s_desc->wData, USB_MAX_STRING_LEN);
>>
>> The "utf16_len" got me confused.
>> It's not wrong, but I first assumed it is bytes this utf16 formatted text
>> takes, when it turns out to be number of u16 entries in the text.
>>
> 
> Do you have a suggestion how to rename it to be more self commenting ?
> Or maybe I will rename it to len and add a comment that it holds a number
> of u16 entries ? WDYT ?

I don't have a good suggestion. Naming is hard.
'len' with a comment sounds good.

Thanks
Mathias

