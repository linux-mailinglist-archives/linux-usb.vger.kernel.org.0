Return-Path: <linux-usb+bounces-30517-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 093DAC5D0BE
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 13:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A94E3357310
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 12:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0B4136358;
	Fri, 14 Nov 2025 12:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ay29SyVT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36795BA3D;
	Fri, 14 Nov 2025 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763122531; cv=none; b=oR9yvv7fuV18LBLFY73DY1OnS9sLdm6I1uY9oKK/Sw3d8zYGqedWXuImsI/CDkAHJPOmECk8dIHwW1b/214OuqYwRjrE4X9fYJ7dMLf/BffRCUJ5JhJ2F//WIn+X891rVZEo3XEzr59kaC3Db9qFR8yZEKcrOTb3bVDP9yra8/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763122531; c=relaxed/simple;
	bh=hxGopahQLPiiJ+FE6ytRpcYJk1p24GgpEwrPDK1BrLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEQY/qS4m/s/h1HVJ6LrUWxC3wMZrdmwlopVKm/YN7ABGtZqCrZ5nMQYiRagXrERlyTAkL9uJrLXpkaH3EMVDfiEXylRq1EhMMO8Aq39gnVbgBPgmTkn5S2Hl8C1dOT8CoRDVbj6LPK29FxzUiBxp/x5jWsaRMFh9MCALL4ndao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ay29SyVT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763122529; x=1794658529;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hxGopahQLPiiJ+FE6ytRpcYJk1p24GgpEwrPDK1BrLI=;
  b=Ay29SyVTtVPB9qeFqTDpNQVhCbfXQERCeTUCJh7RqAACQQwyo8ElpwRn
   UCR7k1q1BptW5s4iRTLHMB/fWihnrRDENkQibygvLZqd83g1lBguXDH2g
   z+5D+u9pgqsd2x4G5A4sv9XHP3V4w4mp+k9aTmskHJL8jFM1YdJSl+e2V
   7jM0UfF2ukneglR2XVzT359J3s8cQmfg0JmUmXPd5k/opl8dKxb/2ZT0i
   Oc+81gCbJqgNVGowVOft/yYMrRCRCaXrVP9Hp9+DSrIKgn9faXS/87DgB
   P84Sbqxq+spnpeyAYH48e4QzTsLpnVb2brE+Xq51k6gVJmXtrQX9kerc0
   A==;
X-CSE-ConnectionGUID: UX89BkK+QkGfVkr3UJYkmw==
X-CSE-MsgGUID: e+ZBysjPQr6QrRqWGZqT/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65147016"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65147016"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 04:15:29 -0800
X-CSE-ConnectionGUID: ETA3P/WkQvC03tyk07tgVA==
X-CSE-MsgGUID: ff9lDAHdSx+aWBZBzp/E/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="190009115"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.8]) ([10.245.244.8])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 04:15:27 -0800
Message-ID: <ce9f5ad9-bbcc-4dd0-a7bc-8398bb7cdb67@linux.intel.com>
Date: Fri, 14 Nov 2025 14:15:24 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Don't unchain link TRBs on quirky HCs
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251107110837.7b7d686b.michal.pecio@gmail.com>
 <f1259e37-5671-43ca-85f5-a37b68d5507a@linux.intel.com>
 <20251114123232.0b96bfa5.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20251114123232.0b96bfa5.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/25 13:32, Michal Pecio wrote:
> On Tue, 11 Nov 2025 18:19:38 +0200, Mathias Nyman wrote:
>> On 11/7/25 12:08, Michal Pecio wrote:
>>> +static void td_to_noop(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
>>> +			struct xhci_td *td, bool flip_cycle)
>>
>> we could avoid passing xhci pointer to td_to_noop() and just grab it from
>> the xhci_virt_ep structure instead. i.e. ep->xhci
> 
> I can do a v2 if you want.
> 
> But OTOH, I didn't expect such pointer to exist (though I'm sure I must
> have seen it many times) because it doesn't seem strictly necessary.
> 
> Maybe do the reverse and get rid of ep->xhci, or stop adding new users
> and clean up existing ones along the way?
> 
> Main users are invalidate_cancelled_tds()/giveback_invalidated_tds(),
> their callers all have xhci and could easily supply it to them. And we
> even discussed removing the latter completely, but I got sidetracked by
> issues with URB_ZERO_PACKET.

Ok, I'll take this v1 now as it is.
It prevents a potential issue, and it's tested by you.

We can then later figure out how we want to clean up and refactor things.

Thanks
Mathias


