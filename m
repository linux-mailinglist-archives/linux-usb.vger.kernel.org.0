Return-Path: <linux-usb+bounces-27469-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAAAB400A1
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 14:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE9633A56B8
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 12:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6961F2C0266;
	Tue,  2 Sep 2025 12:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDBcOynS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D5246BB4
	for <linux-usb@vger.kernel.org>; Tue,  2 Sep 2025 12:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816009; cv=none; b=sRhkZqdPuC8zbzvmnDoVfemyTkHFScONAG6DrGvdNgUMny3u1io9cyNPG6axXBmHxhTHnHyq3aI8Xy86JYDVlGK56NEU52Ulu94SbilWP3nURr7GEIQCNMWP1GMurCjDp7Y/rTrPBUYSxy/bR8pAijDmnenCQJHGkTxuz+1UjIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816009; c=relaxed/simple;
	bh=OyC1Nbd1YPqVRkGG71rBmFB24au3devhB/+Z25AecIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2MoWtpWlHM2pF96cBh7HU7ZTkvhIhEgq/ryWfduFmHvLe0xmfw2W1rKwgTVocsI40Z9szeS1KIVaG5UHnMZOX15/aFs3yxM/ygWfrRnuzKSqdyI+0NT+Fl0I7YzMiiupNQ2dOurRxtOKD9OPVEv/zCm2CDiRdpy9Yj5Gc2mNZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDBcOynS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756816008; x=1788352008;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OyC1Nbd1YPqVRkGG71rBmFB24au3devhB/+Z25AecIA=;
  b=MDBcOynSC9301IQN61Hof2MX0t4x07nSNKVzdA7sNlyGpclfVQrzChyn
   oni42CcJgdI8Oz0A07tHx7NgZ97bKAeQ6cGfQ/uSsIirzLTcR72BJmeiv
   wpCxIseh104/30K7j6uBymrofRv7/ehZbhejuVOYGyPmnzEwc7ZGUIbEW
   5CKOaEjECB0FSUGsGaUsKwC7IinN8m22CWi+LD7WIKAytmm68/95mGafE
   LJT3hGcrC7COkFuWtA42KdPmviQcBHXNLpmNpVp02LX8hXAtaCUqmgMq1
   pJ36P2Ju26h71AqiF1hEyFcUmTKGEeabQSe+YoQsT/Wx1ppyOv3mJifVk
   w==;
X-CSE-ConnectionGUID: 1lj881xBRP68DrEN1ZSZCA==
X-CSE-MsgGUID: qZU/JQNqQCOWlaYz4nqlpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70467655"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="70467655"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:26:47 -0700
X-CSE-ConnectionGUID: frv3VFzXTySxcU2oRDO8Kw==
X-CSE-MsgGUID: R6VoU3TJT1mhNw1TC+Ecag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175399726"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.120.28]) ([10.245.120.28])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:26:46 -0700
Message-ID: <5d2fbba0-63f3-444a-adfc-b0773bf20774@linux.intel.com>
Date: Tue, 2 Sep 2025 15:26:13 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: xhci: improve TR Dequeue Pointer mask
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
References: <20250826130656.277633-1-niklas.neronin@linux.intel.com>
 <20250828101207.49aea3b5.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250828101207.49aea3b5.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 28/08/2025 11.12, Michał Pecio wrote:
> On Tue, 26 Aug 2025 15:06:56 +0200, Niklas Neronin wrote:
>> Address the naming and usage of the TR Dequeue Pointer mask in the xhci
>> driver. The Endpoint Context Field at offset 0x08 is defined as follows:
>>  Bit 0		Dequeue Cycle State (DCS)
>>  Bits 3:1	RsvdZ (Reserved and Zero)
>>  Bits 63:4	TR Dequeue Pointer
>>
>> When extracting the TR Dequeue Pointer for an Endpoint without Streams,
>> in xhci_handle_cmd_set_deq(), the inverted Dequeue Cycle State mask
>> (~EP_CTX_CYCLE_MASK) is used, inadvertently including the Reserved bits.
>> Although bits 3:1 are typically zero, using the incorrect mask could cause
>> issues.
>>
>> The existing mask, named "SCTX_DEQ_MASK," is misleading because "SCTX"
>> implies exclusivity to Stream Contexts, whereas the TR Dequeue Pointer is
>> applicable to both Stream and non-Stream Contexts.
>>
>> Rename the mask to "TR_DEQ_PTR_MASK", utilize GENMASK_ULL() macro and use
>> the mask when handling the TR Dequeue Pointer field.
>>
>> Function xhci_get_hw_deq() returns the Endpoint Context Field 0x08, either
>> directly from the Endpoint context or a Stream.
>>
>> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
>> ---
...
> 
>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
>> index a20f4e7cd43a..59ff84ba2d4a 100644
>> --- a/drivers/usb/host/xhci.h
>> +++ b/drivers/usb/host/xhci.h
>> @@ -500,7 +500,8 @@ struct xhci_ep_ctx {
>>  
>>  /* deq bitmasks */
>>  #define EP_CTX_CYCLE_MASK		(1 << 0)
>> -#define SCTX_DEQ_MASK			(~0xfL)
>> +/* bits 63:4 - TR Dequeue Pointer */
>> +#define TR_DEQ_PTR_MASK			GENMASK_ULL(63, 4)
> 
> I don't care much about this rename, but I can't help but notice that
> naming is not consistent with the related EP_CTX_CYCLE_MASK above and
> that it too applies to both types of contexts.
> 
> If I wanted to fix this, I would just drop the 'EP_' and 'S' prefixes.

I have an Endpoint Context patch series in progress that will address all
Endpoint Context macro naming, comments, and related issues.

Because, this patch set is quite old, v1 sent in February this year, all
my current patches are built and tested on top of it, so this is why I
am sending it first.

Best Regards,
Niklas



