Return-Path: <linux-usb+bounces-29255-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08403BD69CA
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 00:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70EF618A1DE8
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 22:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7088B2FE04D;
	Mon, 13 Oct 2025 22:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsscBWja"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACBD2D5938
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 22:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760394431; cv=none; b=HSqow8dVNSiD7DrOCtraKQGfFPT18aa7slxAemhtvE7keK64Jwmjz3ea1KF4+qprBd67i1l1TJo8oPNyUpRCF8njZUH725klRFmR0oSUG97shTH1UZ2/4WI48VofFt+VRSDAQ3zPoz/P6+AuN4gY6PfLDuvq3t0Bm9MfATdmQYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760394431; c=relaxed/simple;
	bh=YvIYW+uVE3J2fSWRgxDlWSBZyMiX/gbBOP69Z4lTnmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKgs+ePvmHDnMiPgXQbbq0celZuzeCqKfyk0zupS9ZqZA1LzU72gAtw6mDX70NCQBorJ9sYQJwKdyUQUZbLhocN+osH+LmV023UpUFjimM0p1hr7RRHNINT3/Vkd7fLlIlr0EncskXVugtjQp7BYB4gsCoKl/7J3qaCsBb8uF1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsscBWja; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760394429; x=1791930429;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YvIYW+uVE3J2fSWRgxDlWSBZyMiX/gbBOP69Z4lTnmo=;
  b=QsscBWjaMk7aUrG19pk8KhldnE+NnfA6Iyt1UKSmX1UKtMerQcgKFHro
   HXWeieHzoB9G+m69ZFysaLMDcM2RzbLerHJnnLQAgLpeLlTlUpzurKZZZ
   dmi0ojtytWE7CT5oJdHvyIOGwGxv8lkLm/DWTCk3CmET+IFvv+I52f+Hk
   /lklfixtV8myrG9YMiAffCgypVkpxErGoK7jHugN5mEjUfHxMG2saZbZN
   V7WSPMxtF82vIh9cNMmY0dnMj/SrSLhq+xNBnqTdnQfhMeJKQx1qqMT3z
   QZ0WZWqB8zuOML/h7NsTc8P211lMXi9c4WyE9ArgIAr4i0DQnDhdDBUZG
   A==;
X-CSE-ConnectionGUID: hMeTPZ9rQkmFAITWCsZZ0A==
X-CSE-MsgGUID: hB07YzG0SLaYJiNdoSNu3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61585428"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="61585428"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 15:27:08 -0700
X-CSE-ConnectionGUID: 1oVDIeplSa6US4IMx0xB+g==
X-CSE-MsgGUID: +nuIuLDXRqyT1084VN6D/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="218833445"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.60]) ([10.245.244.60])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 15:27:08 -0700
Message-ID: <92353f39-d5c2-4b6b-9530-fd0c8424950e@linux.intel.com>
Date: Tue, 14 Oct 2025 01:27:04 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xhci: dbc: allow to set product name through sysfs
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <20251007213902.2231670-1-ukaszb@google.com>
 <20251007213902.2231670-4-ukaszb@google.com>
 <e73344be-0434-436b-be9b-e86f62d377a3@linux.intel.com>
 <CALwA+NYqUtNMVH74z=ALSBw1HUNzH1_-7UC-8dqeRfVdFCP4Jw@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CALwA+NYqUtNMVH74z=ALSBw1HUNzH1_-7UC-8dqeRfVdFCP4Jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/25 01:19, Łukasz Bartosik wrote:
> On Mon, Oct 13, 2025 at 11:01 AM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
>>
>> On 10/8/25 00:39, Łukasz Bartosik wrote:
>>> From: Łukasz Bartosik <ukaszb@chromium.org>
>>>
>>> Add code which allows to set product name of a DbC
>>> device through sysfs.
>>>
>>> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
>>> ---
>>> @@ -1321,6 +1355,7 @@ static DEVICE_ATTR_RW(dbc);
>>>    static DEVICE_ATTR_RW(dbc_idVendor);
>>>    static DEVICE_ATTR_RW(dbc_idProduct);
>>>    static DEVICE_ATTR_RW(dbc_bcdDevice);
>>> +static DEVICE_ATTR_RW(dbc_iProduct);
>>>    static DEVICE_ATTR_RW(dbc_iSerial);
>>>    static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
>>>    static DEVICE_ATTR_RW(dbc_poll_interval_ms);
>>> @@ -1330,6 +1365,7 @@ static struct attribute *dbc_dev_attrs[] = {
>>>        &dev_attr_dbc_idVendor.attr,
>>>        &dev_attr_dbc_idProduct.attr,
>>>        &dev_attr_dbc_bcdDevice.attr,
>>> +     &dev_attr_dbc_iProduct.attr,
>>
>> Small naming thing again.
>>
>> "dbc_idProduct" and dbc_iProduct" are a bit too similar.
>>
>> Usb core uses "product" and "manufacturer" sysfs entries to show these strings.
>> I think dbc should use similar "dbc_product" and "dbc_manufacturer" naming.
>>
> 
> I will rename it in patchset v3.
> 
>> the "iProduct" is a byte in device descriptor telling the index of the product string
>> descriptor.
>>
> 
> The same applies to iSerial then. Should I rename it to "dbc_serial" as well ?

I think that would work better yes

Thanks
Mathias



