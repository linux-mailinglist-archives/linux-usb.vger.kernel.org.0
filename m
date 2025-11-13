Return-Path: <linux-usb+bounces-30476-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 85524C56E62
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 11:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8873E4E3BFB
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 10:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB72332EBE;
	Thu, 13 Nov 2025 10:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ky57wUyc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDB9330306
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 10:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030176; cv=none; b=JjoW/vDsOlAlXHGiWyDDofA/hbWlzl9PIFJbG+wtQJqFmpAYLF6AZ5gWS1j6O8NpAR47fS10/C/Tyr58l/hB16/o+D8crJIn1NyjWJx2+NsRczFmF7AG4BAvGMg6yO2GevZKAfY2u1DIvOhp3Uk6tTNEw/OgYuus0P6nQuclA3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030176; c=relaxed/simple;
	bh=ViFEpBqG4JuLJw7FtRNYniIlz2/9DpG6DSyfosyNKQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qy0O9j0NR/g4Um8FpMxkBW0zKC8aUMerCRSj6lzqcHxsC3BsLjSAWwRF00AdcpFqrweqK8JgN2f7FitstjxO0dbXq9H1IIBGhKEuh4jbpCB1Td1bSzZ4IYr70tFcCieKSnKlCph2HmLMR0FwYii0zFZZpMNdxpZh/SGNndB27gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ky57wUyc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763030174; x=1794566174;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ViFEpBqG4JuLJw7FtRNYniIlz2/9DpG6DSyfosyNKQ8=;
  b=ky57wUycOhYQ0Jwmm6P+Ef0fba9T7Q+kUEvNkmtAPgB4akpivd0adMjR
   K8E0nXxo6uuvbUJaI7MH4n5i4LgciVGugzKbtN++GVv7+MRPg9Vqo+ELZ
   5LRwFcjEzCO7dq2maJl8R4lyBGQQPCHDIykeV8LgdsB+Ny45s+JyaJ2oq
   3GkAzkxVuxJrJNYkzfDgnbiISd9P2hsEGwOAqcc9fvBnjTQAc9Z6KoXAt
   tgj6Vi2IOuTiK1r/6JedqXkJEKrMHPXzhTdQh/xnn9CsVFU4K25g0vw+K
   MRSmim5EpURfb1xjbpml7TKLcqWHcZaody4jFieaXzSy0V+9ANoU6jP7p
   Q==;
X-CSE-ConnectionGUID: Gx9GMbw4RxycavkPkgpceA==
X-CSE-MsgGUID: BCRtGSTTRA+RIMlFT0W0YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64813928"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="64813928"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 02:36:11 -0800
X-CSE-ConnectionGUID: 7WtUIiahTPWTdyap7+7JQg==
X-CSE-MsgGUID: T4YQ4tRLQyy5EjPHhd82AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="193722400"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.137]) ([10.245.245.137])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 02:34:54 -0800
Message-ID: <85314aeb-605e-4887-99d3-dc505b2a2e1a@linux.intel.com>
Date: Thu, 13 Nov 2025 12:34:53 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] usb: xhci: standardize single bit-field macros
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org, "Rai, Amardeep" <amardeep.rai@intel.com>
References: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
 <20251110151450.635410-12-niklas.neronin@linux.intel.com>
 <aRL5HQw2-a94FPpA@kekkonen.localdomain>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <aRL5HQw2-a94FPpA@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/25 10:51, Sakari Ailus wrote:
> Hi Niklas,
> 
> Thanks for this!
> 
> On Mon, Nov 10, 2025 at 04:14:48PM +0100, Niklas Neronin wrote:
>> Convert single bit-field macros to simple masks. The change makes the
>> masks more universal. Multi bit-field macros are changed in the next
>> commit. After both changes, all masks in xhci-caps.h will follow the
>> same format. I plan to introduce this change to all xhci macros.
>>
>> Bit shift operations on a 32-bit signed can be problematic on some
>> architectures. Instead use BIT() macro, which returns a 64-bit unsigned
>> value. This ensures that the shift operation is performed on an unsigned
>> type, which is safer and more portable across different architectures.
>> Using unsigned integers for bit shifts avoids issues related to sign bits
>> and ensures consistent behavior.
>>
>> Switch from 32-bit to 64-bit?
>> As far as I am aware, this does not cause any issues.
>> Performing bitwise operations between 32 and 64 bit values, the smaller
>> operand is promoted to match the size of the larger one, resulting in a
>> 64-bit operation. This promotion extends the 32-bit value to 64 bits,
>> by zero-padding (for unsigned).
>>
>> Will the change to 64-bit slow down the xhci driver?
>> On a 64-bit architecture - No. On a 32-bit architecture, yes? but in my
>> opinion the performance decrease does not outweigh the readability and
>> other benefits of using BIT() macro.
>>
>> Why not use FIELD_GET() and FIELD_PREP()?
>> While they can be used for single bit macros, I prefer to use simple
>> bitwise operation directly. Because, it takes less space, is less overhead
>> and is as clear as if using FIELD_GET() and FIELD_PREP().
>>
>> Why not use test_bit() macro?
>> Same reason as with FIELD_GET() and FIELD_PREP().
>>
>> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> 
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
>> ---
>>   drivers/usb/host/xhci-caps.h    | 50 +++++++++++++++++----------------
>>   drivers/usb/host/xhci-debugfs.c |  2 +-
>>   drivers/usb/host/xhci-hub.c     |  6 ++--
>>   drivers/usb/host/xhci-mem.c     |  7 ++---
>>   drivers/usb/host/xhci-ring.c    |  8 +++---
>>   drivers/usb/host/xhci-trace.h   |  2 +-
>>   drivers/usb/host/xhci.c         |  2 +-
>>   7 files changed, 39 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
>> index 99557df89f88..89dd46767885 100644
>> --- a/drivers/usb/host/xhci-caps.h
>> +++ b/drivers/usb/host/xhci-caps.h
>> @@ -4,6 +4,8 @@
>>    * xHCI Specification Section 5.3, Revision 1.2.
>>    */
>>   
>> +#include <linux/bits.h>
>> +
>>   /* hc_capbase - bitmasks */
>>   /* bits 7:0 - Capability Registers Length */
>>   #define HC_LENGTH(p)		((p) & 0xff)
>> @@ -32,7 +34,7 @@
>>    * xHCI specification section 5.3.4.
>>    */
>>   #define HCS_IST_VALUE(p)	((p) & 0x7)
>> -#define HCS_IST_UNIT(p)		((p) & (1 << 3))
>> +#define HCS_IST_UNIT		BIT(3)
>>   /* bits 7:4 - Event Ring Segment Table Max, 2^(n) */
>>   #define HCS_ERST_MAX(p)		(((p) >> 4) & 0xf)
>>   /* bits 20:8 - Rsvd */
>> @@ -52,30 +54,30 @@
>>   
>>   /* HCCPARAMS1 - hcc_params - bitmasks */
>>   /* bit 0 - 64-bit Addressing Capability */
>> -#define HCC_64BIT_ADDR(p)	((p) & (1 << 0))
>> +#define HCC_64BIT_ADDR		BIT(0)
>>   /* bit 1 - BW Negotiation Capability */
>> -#define HCC_BANDWIDTH_NEG(p)	((p) & (1 << 1))
>> +#define HCC_BANDWIDTH_NEG	BIT(1)
>>   /* bit 2 - Context Size */
>> -#define HCC_64BYTE_CONTEXT(p)	((p) & (1 << 2))
>> -#define CTX_SIZE(_hcc)		(HCC_64BYTE_CONTEXT(_hcc) ? 64 : 32)
>> +#define HCC_64BYTE_CONTEXT	BIT(2)
>> +#define CTX_SIZE(_hcc)		(_hcc & HCC_64BYTE_CONTEXT ? 64 : 32)
>>   /* bit 3 - Port Power Control */
>> -#define HCC_PPC(p)		((p) & (1 << 3))
>> +#define HCC_PPC			BIT(3)
>>   /* bit 4 - Port Indicators */
>> -#define HCS_INDICATOR(p)	((p) & (1 << 4))
>> +#define HCS_INDICATOR		BIT(4)
>>   /* bit 5 - Light HC Reset Capability */
>> -#define HCC_LIGHT_RESET(p)	((p) & (1 << 5))
>> +#define HCC_LIGHT_RESET		BIT(5)
>>   /* bit 6 - Latency Tolerance Messaging Capability */
>> -#define HCC_LTC(p)		((p) & (1 << 6))
>> +#define HCC_LTC			BIT(6)
>>   /* bit 7 - No Secondary Stream ID Support */
>> -#define HCC_NSS(p)		((p) & (1 << 7))
>> +#define HCC_NSS			BIT(7)
>>   /* bit 8 - Parse All Event Data */
>>   /* bit 9 - Short Packet Capability */
>> -#define HCC_SPC(p)		((p) & (1 << 9))
>> +#define HCC_SPC			BIT(9)
>>   /* bit 10 - Stopped EDTLA Capability */
>>   /* bit 11 - Contiguous Frame ID Capability */
>> -#define HCC_CFC(p)		((p) & (1 << 11))
>> +#define HCC_CFC			BIT(11)
>>   /* bits 15:12 - Max size for Primary Stream Arrays, 2^(n+1) */
>> -#define HCC_MAX_PSA(p)		(1 << ((((p) >> 12) & 0xf) + 1))
>> +#define HCC_MAX_PSA(p)		BIT(((((p) >> 12) & 0xf) + 1))

The HCC_MAX_PSA(p) is a bit different, the bitshift here is a power of 2
calculation.

Primary stream array size is 2^(MaxPSASize + 1) where MaxPSASize is from
HCCPARAMS1 register bits 15:12

It's not pretty to begin with, and I don't think the BIT() macro makes it
any clearer.

Maybe leave it of from this series, possibly clean it up later

Thanks
Mathias

