Return-Path: <linux-usb+bounces-29205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC5BD1F3A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 10:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C75F1898BB1
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 08:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7532EC0AF;
	Mon, 13 Oct 2025 08:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RN6dYSBE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8262EC08A
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760343138; cv=none; b=aBZdK+I1tEb4XG3QmGAwwlvKvJVJlIXU5tCD0sHXdvU2g0UvM9O9fPBfrpK+qeUlYp6x66zB1Hp3YUP1d1eOjrGC/S/yBLhqAvpJW+9Meb8loBR58ER8glbOhCeAnNXfaBG0EZc5JTO3DqXVskRtX4IDu8veWwS2I3jyiX5wvu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760343138; c=relaxed/simple;
	bh=TEi9NibItjzHHONJp161dfIFv/Dt/lqQI1fCCQQYMsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Glx+dNXS+8wEdauwAucFY4ipWGbcmkTspE03O12yXQBB/VTPp5ERTCEz+KJHVQyL2AJQzckt1hHPZhCjCyZ9tblXUIjTY92TY+f180lfDEyux2TvvUkWI766L+TQ4JNY+VlJwyZUoWBwK7r7ElVBs6bA8BcrK9IjldM+/IsXtHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RN6dYSBE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760343136; x=1791879136;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TEi9NibItjzHHONJp161dfIFv/Dt/lqQI1fCCQQYMsw=;
  b=RN6dYSBEJY3Gpca8VvYzNcE3cec6Gj1ElODDlH0HIZOoeZsfaGuhJnjV
   ZP6z4QEItAjH8s792RK37G6F0O1rK9ScKYqBZUbxnPWvx40XmTRHw/I5n
   BdRyJLsf9UiRPAxJw9R3sG89bRqn5eCHaWGp5HlIPrtr2UD9lMlqvqB1Y
   tBjG4blu0TU2MsigRI7NAhpzd+VX0GAVQWE5+4OpnQvp6l/msKdumBsk+
   DJQv4QWfV8GMjTvQq+lo19p/hSqol8vTafEoj9bkKSkXTsqnB2bAyNwlp
   nMwkJDJz9FTkeGtH1hhcJi2LF5Sl4RAxXJIKYzvisZr2Oh5ReSB4qA+Dl
   Q==;
X-CSE-ConnectionGUID: iZGDvi66SaGKrhQY94BQDQ==
X-CSE-MsgGUID: yZJj1H0wRQG5Z/h/OiA8Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62391532"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62391532"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 01:12:15 -0700
X-CSE-ConnectionGUID: UDVUZ/HhRKK1zLs3Mu5klQ==
X-CSE-MsgGUID: GlMDBKoVQiaimc8I76EiYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="181494241"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.60]) ([10.245.244.60])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 01:12:14 -0700
Message-ID: <bd6cfa6e-2ddb-4252-9b66-b9893481f9ac@linux.intel.com>
Date: Mon, 13 Oct 2025 11:12:11 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xhci: dbc: prepare to expose strings through sysfs
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <20251007213902.2231670-1-ukaszb@google.com>
 <20251007213902.2231670-2-ukaszb@google.com>
 <fffa3476-c800-4257-a3c6-057c4c8cde28@intel.com>
 <CALwA+NZ=B2BbzUZUqKCzP28wDkPcd-PczcCwa6Mb2YjbNM8j3w@mail.gmail.com>
 <6e9f3b8e-2605-4eda-911f-b11f900f8292@rowland.harvard.edu>
 <CALwA+NbvqWD5Kz=RM9qR3Q4dta617=mWO+xOXU9VRApwuaRftQ@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CALwA+NbvqWD5Kz=RM9qR3Q4dta617=mWO+xOXU9VRApwuaRftQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/25 18:57, Łukasz Bartosik wrote:
> On Sat, Oct 11, 2025 at 7:13 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>>
>> On Sat, Oct 11, 2025 at 01:22:45PM +0200, Łukasz Bartosik wrote:
>>>>> @@ -63,11 +62,19 @@ struct dbc_info_context {
>>>>>    #define DBC_PORTSC_LINK_CHANGE              BIT(22)
>>>>>    #define DBC_PORTSC_CONFIG_CHANGE    BIT(23)
>>>>>
>>>>> +#define USB_MAX_STRING_DESC_LEN              (USB_MAX_STRING_LEN + 2)
>>>>
>>>> This looks like somthing that would be defined in ch9.h or usb.h.
>>>>
>>>
>>> Unfortunately I can see only USB_MAX_STRING_LEN but no definition
>>> for a maximum USB string descriptor size.
>>
>> The maximum length of a string descriptor is 255, because the bLength
>> field in the descriptor is __u8.  In practice the maximum length is 254,
>> because a string descriptor consists of a 2-byte header followed by a
>> bunch of UTF-16LE characters (so 2 bytes each).  This allows for only
>> 126 characters (or rather, code points) max in the string, which is
>> where USB_MAX_STRING_LEN comes from.
>>
> 
> Thank you Alan for pointing out USB_MAX_STRING_LEN is maximum length
> in utf16 code points ;).
> 
>>>> Maybe a more local name like DBC_MAX_STRING_DESC_LEN
>>>>
>>>
>>> I will rename it and also remove magic number:
>>> #define USB_MAX_STRING_DESC_LEN              (USB_MAX_STRING_LEN +
>>> sizeof(struct usb_string_descriptor))
>>
>> You might as well just set this to 254.
>>
> 
> Mathias, do you have a preference here?
> I mean whether to use
> #define USB_MAX_STRING_DESC_LEN             254
> or
> #define USB_MAX_STRING_DESC_LEN              (2*USB_MAX_STRING_LEN +
> sizeof(struct usb_string_descriptor))
> 
> No matter which one is chosen I will add a comment with Alan's explanation.

Setting it to 254 with a comment based on Alan's explanations sounds good to me.

Thanks
Mathias



