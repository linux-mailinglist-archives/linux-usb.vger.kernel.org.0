Return-Path: <linux-usb+bounces-14955-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2376297552F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 16:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1549286CA5
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 14:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8203119E965;
	Wed, 11 Sep 2024 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlcC/2HS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DE55A117
	for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726064587; cv=none; b=mJdVQHGVI26HP1Cjrfbm6gE7bYJ7RG5QrjJ5OVnW7BIMaU/rLP1y9qihyNsA8J64E4/arJj8Buizj9+WddisfIToD5AFr2MmVBl7CtP0ZD7Odh8XEgpnvgBghU76QbLN/Bnc+Xc2KAosaJDP81FzHVNhqJ9gnyhUFCCaZLQuBnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726064587; c=relaxed/simple;
	bh=m0CUtJjEYcjOXp1qXCkWE49t81l97uUMQAubYVTkWjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMAavveD2t1ozHDRicEO9M86HBqspK2UsirkM9rwtoR5gTW8SrKtOgDblJc7UfbqRVPg/xNzvJJy/ppu8f9MhSvTIP+Or6ECTah9r65+dcmg/JanQXb3ndzpsF5mhF8dUT3ksFmji7pKc09uhD6ZAc6RlG+lllWPNL8ybkmiJoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlcC/2HS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726064586; x=1757600586;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=m0CUtJjEYcjOXp1qXCkWE49t81l97uUMQAubYVTkWjs=;
  b=IlcC/2HStFbuS1RzwNN+sGj++qZ5nu3QPjER1Qf2t5ivMD/GS8Pxmitb
   UeSTvUQzcnqrB7LSNg+iQ24sq5RQ501tZ9hOhYS2/6z1A/hki2YGvo1pj
   A5p+QCmoUbrQIw0+TAyt/rkRhLuY2ZYID7w2E+buMPsrcVPd1ALgx0pgL
   WOeza3GAGj9RrQRVKeXS2J+Oxr+Rw1cs3eBJd/NgupYOGU4NWDMC+oHiR
   Jb691WZsNMnjYE5jp+Jvvl5chShRZNO6at4GZpN7Kf3A+QDClpIWJ4iy2
   NG9KPidyKsMDi16x+IrSZ+XxKH2oOskpd5c16101oJXj6DVmKsb622KX4
   Q==;
X-CSE-ConnectionGUID: IvgmTTUMQ6ir4R7+DcCjuQ==
X-CSE-MsgGUID: i5/k2xOLRtu3AAy3IdFsNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35462133"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="35462133"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:23:05 -0700
X-CSE-ConnectionGUID: 7WJ3bpLETrS/zFNpLp1GfQ==
X-CSE-MsgGUID: Ixik+BKvQoi2uUm3T1zmRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="71977157"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa004.fm.intel.com with ESMTP; 11 Sep 2024 07:23:03 -0700
Message-ID: <54229f03-8fa3-41aa-b576-59ec5a07848e@linux.intel.com>
Date: Wed, 11 Sep 2024 17:25:10 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange issues with UAS URB cancellation
To: Marc SCHAEFER <schaefer@alphanet.ch>
Cc: Micha?? Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
References: <ZtcVXoI6jNM9Lqbl@alphanet.ch> <20240903174535.6e5e581b@foxbook>
 <ZtdmOiKN6hb2Y82I@alphanet.ch>
 <71c073de-8af5-4457-88eb-91a709c2d941@linux.intel.com>
 <ZtiMp39CWrI0e+GB@alphanet.ch>
 <e16c21cd-41f3-4191-9957-6e61ddfefd24@linux.intel.com>
 <ZtnHs8udyl6bfGdF@alphanet.ch> <ZtnI57FYnoz1xKxF@alphanet.ch>
 <ZtnpOfv2qXCUy5/i@alphanet.ch>
 <ecc97ef6-ae0f-44e3-ad6e-60a8df0b54a6@linux.intel.com>
 <Zt8gkkRGMdgaEOXX@alphanet.ch>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <Zt8gkkRGMdgaEOXX@alphanet.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> Can I ask you to add some select traces on top of the patch?
>> They should show content of endpoint context:
>>
>> as root:
> 
> I did that, however, even when mounting to /sys/kernel/debug/tracing, most of
> the pseudo-files were actually at /sys/kernel/tracing and I had to fix the
> path of the commands.

Sorry about that,

Ftrace control files used to be part of debugfs, located at
/sys/kernel/debug/tracing when mounting debugfs

> 
>            <idle>-0       [005] d.h2.  1809.524165: xhci_handle_command: CMD: Stop Ring Command: slot 9 sp 0 ep 11 flags C
>            <idle>-0       [005] dNH2.  1809.524235: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 0000000001219f22 stream 5 slot 9 ep 11 flags C
>            <idle>-0       [005] dNH2.  1809.524236: xhci_handle_cmd_set_deq: RS 00021 super-speed plus Ctx Entries 15 MEL 0 us Port# 1/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 9 State configured
>            <idle>-0       [005] dNH2.  1809.524237: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 3 LSA interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN HIDburst 15 maxp 1024 deq 00000000d9933400 avg trb len 0

I can't find anything wrong in the endpoint context after the failed 'Set TR Deq' command.
MaxPStreams is 3, so endpoint supports 16 streams (2^(maxPstreams + 1)), stream ID was 5 is in range.
LSA flag is set so endpoint uses Linear Stream Addressing, which matches the SCT value of 1.

Only reason left why 'Set TR Deq' would fail is if the stream context TR deq pointer
field is zero, see xhci spec 4.12.2.1 'Stream Array Bounds Checking'

xhci driver doesn't yet have tracing for stream contexts, I started writing those but
didn't finish them yet.

Thanks
Mathias

