Return-Path: <linux-usb+bounces-21725-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9081CA5F8C0
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 15:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D496E168ADC
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 14:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50789267F4E;
	Thu, 13 Mar 2025 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQ/3X+BS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E83235371
	for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 14:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741876972; cv=none; b=axM1ReQt2oF0as05Aonh/9B+H9i5kFWlfgyFS1qnz5GG+OMdBLWMxeJ0HZrOfOizfTQ/hy8Jjiy5EOewuPx2lSWzLDQ6TP3UBQ5vXnVNWhM4wjJYr0JWB7TzVaTg9h+o+sdHn8x8Tz3DaLz2I17gSfgMRS0yKKBkVTX09dpt1X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741876972; c=relaxed/simple;
	bh=qbHOMN6yF2TUBtsSgIYiniIn+Wpziem2WsAVzTVaa1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Alx03HEoMSbLQp2N3o9ISgX8tQg/3opjILjObtZlJcyTiewbWeQrOT6dp4y8m0cEvICA6qi/HPnc/2kuD2eTW/z9USe42T/aYfyrcFPra9yqKaIXpcL36QM+kVgN/aS4BgvlWaz9t+ciMV/86PGXqloEEP+dEznUBhlGF6hLlJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQ/3X+BS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741876971; x=1773412971;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qbHOMN6yF2TUBtsSgIYiniIn+Wpziem2WsAVzTVaa1I=;
  b=PQ/3X+BSz4uFl+V+vhLmd7lIclIOWksVCuoHz0+AxMFBaklCfnUr7Mjn
   OVxcr+9GNZzQQGDu4WGIwO+73yikR1DDpXX4He56cJcUsuBr03jiADAtc
   jz0Sxzl/7Ao7eKN8vPG9X4G6dhkWlT9oa+czCPFfwyWlpr/wZrK65K/pP
   BCJ4zyaUr78ecEgr1zVN2/0pe7bF5NdETJKnKaczeyofG9u/ZvKIwDWFg
   b6DXgnznJWIeo6DNQfxkM1CCSWypuBTcDwh9tydESo/qDwHJYJeBHYmiq
   Dyf16gpyPY8tzZiOnbiUF2VIyx8MoQxisUilDa1aXxVrHyfuStHwYeQh9
   A==;
X-CSE-ConnectionGUID: FPo71KMbTyKGCqfes9xjDQ==
X-CSE-MsgGUID: pmaRHpoOS8im4nUrPd3dfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53649243"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="53649243"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 07:42:50 -0700
X-CSE-ConnectionGUID: oIIzTC8vS2ml8wA2gJ9IdQ==
X-CSE-MsgGUID: 4RIwXr1nT0ak5TMw0QPkEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="121189904"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa008.fm.intel.com with ESMTP; 13 Mar 2025 07:42:49 -0700
Message-ID: <5665ed67-f842-490f-aa9d-e05d0f9e3a39@linux.intel.com>
Date: Thu, 13 Mar 2025 16:43:54 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: My transfer ring grew to 740 segments
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, niklas.neronin@linux.intel.com
References: <20250311234139.0e73e138@foxbook>
 <20250313094632.037db6b3@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250313094632.037db6b3@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13.3.2025 10.46, Michał Pecio wrote:
> On Tue, 11 Mar 2025 23:41:39 +0100, Michał Pecio wrote:
>> [102711.994235] xhci_hcd 0000:02:00.0: Event dma 0x00000000ffef4a50 for ep 6 status 4 not part of TD at 00000000eb22b790 - 00000000eb22b790
>> [102711.994243] xhci_hcd 0000:02:00.0: Ring seg 0 dma 0x00000000ffef4000
>> [102711.994246] xhci_hcd 0000:02:00.0: Ring seg 1 dma 0x00000000ffeee000
>> [102711.994249] xhci_hcd 0000:02:00.0: Ring seg 2 dma 0x00000000ffc4e000
>>
>> [ ... 735 lines omitted for brevity ... ]
>>
>> [102711.995935] xhci_hcd 0000:02:00.0: Ring seg 738 dma 0x00000000eb2e2000
>> [102711.995937] xhci_hcd 0000:02:00.0: Ring seg 739 dma 0x00000000eb22b000
> 
> And what are your thoughts about this noise? It's absurd to print such
> long debug dumps under failure conditions (and hold a spinlock for 2ms
> to do so), and I would argue that it is pointless even normally:
> 
> 1. Almost always exactly two segments exist, and either
>    a. the event and the TD are in the same segment, so who cares where
>       the other segment is
>    b. they are in different segments, and you can deduce both segments
>       from dma pointers so the dump tells you absolutely nothing new
> 
> 2. With more segments, the dump can tell if there were other segments
>     between the event and the TD, but is it really important?
> 
> 3. It might help with finding out-of-ring events, but this is extremely
>     rare and should be done automatically (xhci_dma_to_trb() or similar).
> 
> 
> Bottom line, the driver never printed it and no one other than Niklas
> (Cc) seemed to really miss such a feature.
> 
> I would be inclined to submit a small patch which removes this segment
> dump, as I have already done so locally. Or at least make it xhci_dbg()
> if somebody can present a convincing case for having it around.

I don't object to that, we can get rid of it.

But to be fair, didn't it assist in detecting the ~700 segment ring expansion
you just found :)

Thanks
Mathias

