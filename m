Return-Path: <linux-usb+bounces-14174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 086019608AE
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 13:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7A502825D3
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 11:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8523F19F49D;
	Tue, 27 Aug 2024 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aF7NX9S1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C3819EEB4
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758162; cv=none; b=kAwTlbZNutIdIVyx3piAc2J6ybJwXcB46uyiSJVi3eN21Qqur6Uq1GxoPqVdsHzTWm6WC+V9CuH1Nfd3v9Zq/0BFbQ3dt9b5NhsxNysptxQbLwK7K2BQOuNHiJCNetn87RDx5gsxqLdjzlnN0QHEJyYBnacZIWNvs6Kq5GsHe1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758162; c=relaxed/simple;
	bh=YJ21cPBRkcHgqnFp1+Vw3gWhDAVLPX4ovwIqyKNc4nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jOCcTWtUWY77cpzGJXadG95NeAqD6wbE0P3dtg9yIRqqOtud6MyIA3+wvM4O3t+MYEOHUIO085cuKJ9ZW3PSjL+h6fGHRBETqvlXl04KDMIG//p7HlLZtoOmCXk4oDW/1YiwmQj7gyXA7uPmyiuJbMNKkqjCyL+Mfw3odZo9e1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aF7NX9S1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724758160; x=1756294160;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YJ21cPBRkcHgqnFp1+Vw3gWhDAVLPX4ovwIqyKNc4nM=;
  b=aF7NX9S1U28LQNLlE8iQ141hNwgS3fmhJ3596fAtmtjMazuFoHpPGCw/
   FOQcUTUtdvzl+5OOSqTpZ0gORtlGKqbkFaWwZB6AKju6P6M1BKuxH7fv8
   /MCzh0GlYeDbTzwn/5jqwWyC3S3NHw3tuwzD1UtQop0d0Ag5WaG7qXdn0
   Gv1D0ot4+oYzqzkt60qq8+HidRwJJA+xpQ6TkxSLVQEgFZ38u6HTMYkph
   IMe1F/hemYeJZljclwk1RtMLuUWfxEgf03S0iIBeFt9/g2fSZF8FKXpU9
   xmuqbfeLnoMhjZdRP5DmnCqravadxaHZWMJ8mEf+OMgT5dlChjdsNdj5M
   g==;
X-CSE-ConnectionGUID: iHnWcgmmRM+OMi9/XSLoJQ==
X-CSE-MsgGUID: GqDGe97fQHas78Gun3Pijw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23108107"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="23108107"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 04:29:19 -0700
X-CSE-ConnectionGUID: VWABUOo4QOujnZr/HIk6Bw==
X-CSE-MsgGUID: ig6zKWuOQWazchHBKTXc/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="93578392"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa002.jf.intel.com with ESMTP; 27 Aug 2024 04:29:18 -0700
Message-ID: <744a35f4-ff3e-40d1-8f3e-6f3b28eef756@linux.intel.com>
Date: Tue, 27 Aug 2024 14:31:23 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
To: FPS <mista.tapas@gmx.net>, =?UTF-8?Q?Micha=C5=82_Pecio?=
 <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <20240820130158.339b4d87@foxbook>
 <bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
 <20240821150233.4f8f66ef@foxbook>
 <e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
 <2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net>
 <ffb0be5f-11f9-4f94-b292-f47885cfa26a@gmx.net>
 <20240825065831.0eaba5b2@foxbook>
 <67D20520-0374-4461-B626-5142F1D7B743@gmx.net>
 <eb8ea495-6854-4e2e-9474-6348a7a0bf69@gmx.net>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <eb8ea495-6854-4e2e-9474-6348a7a0bf69@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.8.2024 13.30, FPS wrote:
> On 8/25/24 9:46 AM, fps wrote:
>> I will try and do a little more "comparative tracing" for the capture/playback/full duplex cases on 1. the intel xhci and 2. the renesas xhci which seems to work perfectly.
> 
> Hi again!
> 
> I captured a trace from the xHCI from the Renesas and the Intel
> controllers and I noticed a couple of differences (this is for the
> playback case only). I didn't find info on what precisely these fields
> tell me.
> 
> I show here only partial traces from where it seems that regular
> playback has started. I also added a couple of new lines since I haven't
> yet found out how to stop thunderbird from line-wrapping :(
> 
> Intel:
> 
>            jackd-177754  [000] ....2 119172.988707:
> xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep1out
>   irq/125-xhci_hc-169     [003] b...3 119172.991808: xhci_handle_event:
> EVENT: TRB 000000010a3f2000 status 'Success' len 0 slot 3 ep 2 type
> 'Transfer Event' flags e:c
> 
>   irq/125-xhci_hc-169     [003] b...3 119172.991811:
> xhci_handle_transfer: ISOC: Buffer 000000011730a000 length 48 TD size 0
> intr 0 type 'Isoch' flags B:i:I:c:s:i:e:C
> 
>   irq/125-xhci_hc-169     [003] b...3 119172.991813: xhci_inc_deq: ISOC
> 000000001e4e95c7: enq 0x000000010a3f20f0(0x000000010a3f2000) deq
> 0x000000010a3f2010(0x000000010a3f2000) segs 2 stream 0 bounce 200 cycle 1
> 
>   irq/125-xhci_hc-169     [003] b...3 119172.991814: xhci_inc_deq: EVENT
> 000000001a8ce64f: enq 0x00000001095d4000(0x00000001095d4000) deq
> 0x00000001095d40c0(0x00000001095d4000) segs 2 stream 0 bounce 0 cycle 0
> 
> Renesas:
> 
>            jackd-683428  [003] ....2 564371.947885:
> xhci_ring_ep_doorbell: Ring doorbell for Slot 1 ep1out
>   irq/127-xhci_hc-173     [002] b...3 564371.948914: xhci_handle_event:
> EVENT: TRB 0000000115b2d000 status 'Success' len 0 slot 1 ep 2 type
> 'Transfer Event' flags e:C
> 
>   irq/127-xhci_hc-173     [002] b...3 564371.948916:
> xhci_handle_transfer: ISOC: Buffer 0000000153a6a800 length 48 TD size 0
> intr 0 type 'Isoch' flags B:i:I:c:s:i:e:C
> 
>   irq/127-xhci_hc-173     [002] b...3 564371.948920: xhci_inc_deq: ISOC
> 0000000059645549: enq 0x0000000115b2d0f0(0x0000000115b2d000) deq
> 0x0000000115b2d010(0x0000000115b2d000) segs 2 stream 0 bounce 200 cycle 1
> 
>   irq/127-xhci_hc-173     [002] b...3 564371.948921: xhci_inc_deq: EVENT
> 00000000ee8f0a5d: enq 0x000000010662e000(0x000000010662e000) deq
> 0x000000010662e470(0x000000010662e000) segs 1 stream 0 bounce 0 cycle 1
> 
> The first difference is that in the first line of the respective traces
> the 'Transfer Event' flags have a capital 'C' for the Renesas and a
> lower case 'c' for the Intel controller.
> 
> The second difference is that the fourth line has 'segs 2' for the
> Intel, but 'segs 1' for the Renesas controller.
> 
> A third difference is that the fourth line ends with 'cycle 0' in the
> Intel case and 'cycle 1' in the Renesas case.
> 
> I suppose these differences are mostly harmless?

Should be harmless, the cycle bit and capital 'C' changes each time the
ringbuffer wraps around.
This is how TRB consumers/producers keep track of where we are in the ring.

segs 1 vs 2 just tells that we have allocated 2 segments for *Intel host
event ringbuffer while only one for Renesas.

Thanks
Mathias


