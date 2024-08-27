Return-Path: <linux-usb+bounces-14179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE06960C7E
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 15:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C302D1C22B6F
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 13:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F0F1BA295;
	Tue, 27 Aug 2024 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaDZehtn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E7D1C0DC2
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724766449; cv=none; b=Cf/cnk488Om98VF4HQroixLC1NTCpS57HbwYpYbl6L2I3BBP6nXvEqaHpee+TvrxW9E4SPsoSXAXg9toJqaBbY3XK382rFbw6Gwt4MkhrD44n9WzFj6WisDBYLKGCfGFYgXBYtFXNGoJFc3907CA6bvZL4nC5fjClsgYWEEg0mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724766449; c=relaxed/simple;
	bh=O3pewUi7cuu5NaOFTnaFgLCy3XgoLhiFdhdXGlqYE9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUtyZy0Z3nVSo95l0huMhdMDdyLDUvQn53XrDfN/GoS7v82kHg3ssraMHhdKP+CTZhvhc0WEeO8+dUK8aBAyNBTObPjvFOCXFpQ4keNA+rk2+jYybgJdY5LDgyMY4XdMpQKwqY/2Xihj8HKGc74MpU4duqDGcvEAHPcSOUECWqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaDZehtn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724766447; x=1756302447;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=O3pewUi7cuu5NaOFTnaFgLCy3XgoLhiFdhdXGlqYE9I=;
  b=iaDZehtnh7YnpNELyRPFk6p+djxcvLxP0j/9e0uw6GEaWXjNaGbulod8
   ko4rI02oi6UHYVTTcc0991vTDP6TtvOpG+ZZ/O2rbxIgn33MYYI+lw+KB
   gq/pnwuyP0i3h+koGRTdmSLibfHlC230Nkx/cDirkthSMo/To9rwdKKbe
   ia9bA1avFR3PdWcqPZJAZiBWv4RcAzQEBSexgwanP6bMrItwdeXGrXHPH
   6tHkwqCpwxSn+4UxjuN2cChLZo0ppFK1mY37iIdENOEOTXM1ISXPleCLx
   DMD8O/iqW0D1+kwNICgiO13wX5Sx0zgVWpVNyAVLS0i+YItMABwBABVAE
   g==;
X-CSE-ConnectionGUID: 1+A5kVLYSa2vH2ol/6BScw==
X-CSE-MsgGUID: Z6koJutPRFeh3OyFqsx96g==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34619243"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="34619243"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 06:47:27 -0700
X-CSE-ConnectionGUID: MSN0CVhKQPurmaxep/0zFg==
X-CSE-MsgGUID: mB5dHxyDSYOWHBxi4///SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="67211764"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2024 06:47:25 -0700
Message-ID: <5f8cb14c-0cfd-4807-a1fe-e35e41d676d6@linux.intel.com>
Date: Tue, 27 Aug 2024 16:49:29 +0300
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
 <744a35f4-ff3e-40d1-8f3e-6f3b28eef756@linux.intel.com>
 <4e78b499-c1a5-4ab1-8bb4-26908d2cc75f@gmx.net>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <4e78b499-c1a5-4ab1-8bb4-26908d2cc75f@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.8.2024 15.18, FPS wrote:
> 
> 
> On 8/27/24 1:31 PM, Mathias Nyman wrote:
>> Should be harmless, the cycle bit and capital 'C' changes each time the
>> ringbuffer wraps around.
>> This is how TRB consumers/producers keep track of where we are in the ring.
>>
>> segs 1 vs 2 just tells that we have allocated 2 segments for *Intel host
>> event ringbuffer while only one for Renesas.
> 
> OK, thanks for that explanation. I uploaded the full Intel controller
> trace here (curl'able link):
> 
> https://uni-bielefeld.sciebo.de/s/0O4XIzW529sKYQM/download
> 
> And here is the Renesas trace:
> 
> https://uni-bielefeld.sciebo.de/s/jB4qqFL0okPlYwN/download
> 
> Another difference which I find maybe more interesting then. If you
> scroll down to where the steady state has been reached, e.g. timestamp
> 119173.008004 for the Intel trace and timestamp 564371.959089 for the
> Renesas trace, then there are always 8 xhci_handle_transfer calls for
> TDs of size 48 and 8 queue_trb calls between doorbell rings for the
> Renesas controller, but for the Intel controller it looks different:
> There are also always 8 xhci_queue_trb calls, but either 7 or 9
> xhci_handle_transfer calls. This is quite odd, no?

The 9th event means that xHC hardware managed to handle one more isoc transfer
before the xhci interrupt handler was called and started handling events.

xhci interrupt handler handles all pending events on the event ring, but an
actual interrupt is generated only on last (8th) TD.

xHC completes 1st TD of URB X, writes event on event ring
   125us passes
xHC completes 2nd TD of URB X, writes event on event ring
   ... (same for all TDs 3-7)
xHC completes 8th TD (last in URB X), writes event on event ring, triggers interrupt.
   125us passes
xHC completes 1st TD of URB Y, writes event on event ring.
xhci interrupt handler is finally running, processing all 9 pending transfers,
it will give back URB X after processing its last (8th) event, but continue
processing the first TD of URB Y

So there is an at least 125us delay between xHC completing 8th TD, triggering
an interrupt and interrupt handler actually running, finishing processing events.

Thanks
Mathias

