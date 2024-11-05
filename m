Return-Path: <linux-usb+bounces-17114-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCFE9BCB30
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 12:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CF26B21C0E
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 11:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827A41D362B;
	Tue,  5 Nov 2024 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIZLOD2Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FAE1CB53F
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730804587; cv=none; b=r00VLfxiG6k4GPGjzg4rHZuYSiuM5VOThFe6cOLO5jeCdFgXtv+uikOQcrXicAOKJ2KYd/zrzTfzQhB540wcv/XbsG9jouiMCTvHn/ESJX9KWF9A6rlOdIUU7zrC0ilRJ0e3Sy88o8ABSrgJhHrtf/YLkMn/IEzXpkTklbkxjTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730804587; c=relaxed/simple;
	bh=VS35txvxUWOMo8HjId6Dx0AdFUt6qgecfHlTW5nlWDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4Z9WUI34LkUhtyumDQlztx64MJmByUiTG9zIdcWKebRDsuA+zYiwdvj5S9DLAT7UMcWNudirTKDhlc5u3I2XQFNyHc/wZQZhrHZqHi++x5kRHPEy6TSqCIpo7OMQheaDyKkyTWPLsM7DAlIdhg5BjefDfD8LWZB4Kg1C9z2lkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIZLOD2Y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730804585; x=1762340585;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VS35txvxUWOMo8HjId6Dx0AdFUt6qgecfHlTW5nlWDY=;
  b=gIZLOD2YKQEKoK/UiZq1hEdcTqEN+4lJKVlc7wDOb4k8Uvc4XNIxuBXC
   BK9G+u8TdJUafXMvb1SeIONX/eDZLcajvSyqUopoAut2abb/qSEHaOieP
   WjrnStxla3F92kL/16bhoK7K3ApcqYKdAmQNBrmKRFxaDVH0EL9wYb+qw
   OvQJZqN+aaw71opwotvsJmt35rgKeVudLPg8spKrI2MFNo6oFjSDYc1iS
   RC1Iq3u86d09ON2hRRpQKW0iC06NLDP11v7Rqf3xLDQIA+4wi57fSLDqi
   yGCcoF8b6QgcdqyxBS1d5yt28+UYd/LJbUo8kYsGj+7es47icYxSDickU
   g==;
X-CSE-ConnectionGUID: G2HbK2I8RqyZR0YiEMh3Dw==
X-CSE-MsgGUID: Sz0K23DuQ6GNhuY5tJ/eQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41941552"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="41941552"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 03:03:05 -0800
X-CSE-ConnectionGUID: 0G1kwJWVRAGkksE5tZiSeA==
X-CSE-MsgGUID: g14cN0nwTuyqwYhONj1H2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="84787470"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 05 Nov 2024 03:03:04 -0800
Message-ID: <25bf5ad8-e0fd-4d4b-8288-021321f54d30@linux.intel.com>
Date: Tue, 5 Nov 2024 13:05:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] xhci: Fix Stop Endpoint problems
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
References: <20241104103200.533fe1fb@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241104103200.533fe1fb@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4.11.2024 11.32, Michal Pecio wrote:
> v4 of the attempt to sort out Stop Endpoint retries and related issues.
> 
> General design:
> 
> 1/3 guarantee no infinite retries under any failure conditions, ever.
> 2/3 fix bugs and make Set TR Dequeue handler call invalidate/giveback.
> 3/3 eliminate cases of pointless Stop EP commands, depends on 2/3.
> 
> Changes since v3:
> 
> 2/3 no longer tries to add code cleanups (and bugs, as it turned out)
>      to a bugfix patch, and became much shorter as a result.
> 3/3 dropped a desperate attempt at detecting a halt/unlink race, which
>      I was unable to reproduce because it seems impossible - EP_HALTED
>      or SET_DEQ_PENDING remains set until after the halted URB is given
>      back to USB core, so we would never queue a pointless Stop command.
> 
> Also some commit message and comment cleanups in all three.
> And I documented another bug which 2/3 appears to (partly) fix.
> 
> 
> The state of other chips:
> 
> VIA VL805 and Etron EJ168A don't seem to have the "latent restart" bug
> so they don't care about this code, unless it causes pointless retries
> on an already stopped endpoint for 100ms, if it's enabled for them.
> 
> ASM1042 and ASM3142 have the bug, although not as common as on NEC. It
> seems to be particularly triggered by multiple endpoints cancelling at
> the same time, so for example, both loops below simultaneously:
> 
> while true; do timeout .3 yavta -c /dev/video0; done
> while true; do timeout .1 cat /dev/ttyUSB0 >/dev/null; done
> 
> On ASM3142 this triggers the bug about once per minute, and prints:
> 
> WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
> 
> The "mitigation" patch seems to be helping, because reverting it adds:
> 
> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 6 comp_code 13
> Looking for event-dma 0000000003715ec0 trb-start 0000000003715ed0 trb-end 0000000003715ed0 seg-start 0000000003715000 seg-end 0000000003715ff0
> 
> Enabling the NEC workaround for this chip appears to fix the problem
> entirely and so far it only took one retry each time:
> 
> Stop ep completion ctx error, ctx_state 3
> 
> I have left this running overninght and nothing unexpected was logged
> in dmesg. IOW, no undesirable side effects known so far. But I haven't
> done much tests with bad cables yet, and ASMedia chips appear to be
> quite buggy and prone to strange internal race conditions. Examples:
> 
> - the ugly ifconfig up/down lockup issue on 3142 (not tried 1042 yet)
> - a pair of "stopped" events out of order preceding the above lockup
> - on 1042 Set Deq on streams seems to be no-op (streams are disabled)
> - Soft Retry preceding a Set Deq seems to undo the Set Deq's effect
> - Stop Endpoint *success* and then a spontaneous restart (1042 only)
> - spontaneous restart causes a halt, but transfer event is missing
> - TRB 15 (Stop EP) on the event ring (seen only once on 1042)
> 
> ASM1042 still not tested for compatilibity with the workaround at all.

Thanks for all the work you put into this series.
I added all patches to my for-usb-next branch and will send them to Greg shortly.

I think this code won't be NEC specific for very long as other vendors
have these similar issues.

Out of curiosity, what was the longest needed 'stop endpoint' retry time
you saw which still had a successful outcome?

Thanks
Mathias


