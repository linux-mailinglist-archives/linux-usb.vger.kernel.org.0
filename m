Return-Path: <linux-usb+bounces-21715-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ABCA5EFD7
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 10:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55620188B8BF
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 09:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F07B22F150;
	Thu, 13 Mar 2025 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDADD7m8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7994A01
	for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741859147; cv=none; b=pCfFe5A6hvmf0TVX4pL2laXK+rhMBRnrxOu59QYo4TpWRyey+8o8gPDk4tsx9/TZTbPdD4ViSwqPPZ1NTvbhq3ZGKHBOuhw4HKhAiVhrDvOENaqjmRWrj3LhG7mTKPTJ2SfCZpd6Tnqrpc1eyPs3a2EVXJ1epDxXFRlCYFYKYLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741859147; c=relaxed/simple;
	bh=SxXFWWiYuj5wAozQRb3gT2x435AhO4PjRFdtqpJKj/o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bPpsKX3oW/5pAXTZfLJDPRo5/I+ravGx/gP/kaiMqj3bpwrtJYym7yllqhotcx3iL20UDu8NyF7bewWibaFFCYh5nODycA5A6MAz4pIivDOtkFUMdCcGnJtscJF/TT4CYUxgcHVCDovv3OZblctIp7tCVURzbQsMq8br0cBNNYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDADD7m8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741859145; x=1773395145;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=SxXFWWiYuj5wAozQRb3gT2x435AhO4PjRFdtqpJKj/o=;
  b=bDADD7m8KKO4Va3BMPHrBo0yDxsEScbBQ8lc91HXzZhDEm/nrOTvHv/v
   LroKjS/ZxXd1qvyikBae4z8uijHSSmfYSnS6v/+tdHFT72rdDUtd8grpr
   6dvxLhQN02rZ+FEUDfxTMiyiEyiNFjLT3CUMvhaVcKS+JQNQdYvrb5bf4
   eQNV8mghANR2D9OyxoAqNu9EglEqhrU+Q6W0KVRCwJY6CifVcG0aqOhLP
   Z7153IbGdnmG5OAz2oU/3VX5aH0ZNiDpX7DqVfDspaQTgNEQXr/KIPV6a
   pOAYSRrA8qBMSCjkuIRXMjYGImj4vbnIw9uIMOOz72sx81EjOEpqqeozz
   A==;
X-CSE-ConnectionGUID: T/XdyVpKSc2M+ZSPOneOAQ==
X-CSE-MsgGUID: DRpJ+J82Qxi2BbuMbisVLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42136957"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="42136957"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 02:45:45 -0700
X-CSE-ConnectionGUID: 3/VR0gqCTMWukPngtjEe9g==
X-CSE-MsgGUID: ZTzxlUwYRJCXCRtzvGX+Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="120868826"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.80.116]) ([10.245.80.116])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 02:45:43 -0700
Message-ID: <f72545d9-a892-4101-9d06-c75979aecbe6@linux.intel.com>
Date: Thu, 13 Mar 2025 11:45:30 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Subject: Re: My transfer ring grew to 740 segments
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
References: <20250311234139.0e73e138@foxbook>
 <20250313094632.037db6b3@foxbook>
Content-Language: en-US
In-Reply-To: <20250313094632.037db6b3@foxbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 13/03/2025 10.46, Michał Pecio wrote:
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
>   a. the event and the TD are in the same segment, so who cares where
>      the other segment is
>   b. they are in different segments, and you can deduce both segments
>      from dma pointers so the dump tells you absolutely nothing new
> 
> 2. With more segments, the dump can tell if there were other segments
>    between the event and the TD, but is it really important?
> 
> 3. It might help with finding out-of-ring events, but this is extremely
>    rare and should be done automatically (xhci_dma_to_trb() or similar).
> 
> 
> Bottom line, the driver never printed it and no one other than Niklas
> (Cc) seemed to really miss such a feature. 

IMO the driver used to print a long and repetitive debug message,
which is why I changed it.
Admittedly, my design does not handle hundreds of segments well.

Before:
  For each segment or until the segment containing the TD end TRB:
	"Looking for event-dma %016llx trb-start %016llx trb-end %016llx seg-start %016llx seg-end %016llx"

After:
  "Event dma %pad for ep %d status %d not part of TD at %016llx - %016llx"
  For each segment:
	"Ring seg %u dma %pad"

Probably, would have been better to loop from TD start seg to end seg.

>
> I would be inclined to submit a small patch which removes this segment
> dump, as I have already done so locally. Or at least make it xhci_dbg()
> if somebody can present a convincing case for having it around.

My patch was only meant to move the debugging out of trb_in_td() and shorten it.
Before, trb_in_td() was called twice, once for its primary functionality and a
second time solely for debugging purposes. This was what I wanted to remove.

Otherwise, I don't object to modifying or removing the debugs.

Best Regards,
Niklas

> 
> Note that debugfs exists and provides this and much more information,
> at least so long as the class driver doesn't disable the endpoint.
> 


