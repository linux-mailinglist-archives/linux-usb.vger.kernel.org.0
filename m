Return-Path: <linux-usb+bounces-12883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F786945B2F
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 11:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A0321F24C94
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 09:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1F41DAC71;
	Fri,  2 Aug 2024 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncVnlaKH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234551C2BD
	for <linux-usb@vger.kernel.org>; Fri,  2 Aug 2024 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722591597; cv=none; b=skNBLDEWhkMm2c3tu6qzQXiW7udtYQhrs6KaCl8EBy0XeVokgNsPNM0f3jQiEcJUoIroG2QQmp1YuuymVXkv3SPltJNPK5raY5oAww6gerAKvo9ZjiVAoNy+tky8NE8YnN0M+mHwYgUBN0hIO94R/SM9Hu3mPoryTsWvUmd9jHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722591597; c=relaxed/simple;
	bh=iQoOW70KbwIAph4VPlfmjvlXqPUWtP09oUJFlj4MgR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smNZeUEPxsT0MvtuXPRiufmNTaPwRuxaxcH4C6QujrY5eiig89zfsvDyCC5rQrHmCbiGSNKJoG0pyjc5gYChuFymsC2BYQT+i8a7HQ4e97xbpIpDXhalzfcMJSb7vyYapI/dBLmW/kvYgpLh1dcBmuuCGc2iV9Qe2G+ZVJ/YgvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncVnlaKH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722591597; x=1754127597;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iQoOW70KbwIAph4VPlfmjvlXqPUWtP09oUJFlj4MgR0=;
  b=ncVnlaKH/sH9v9TEDHIPmQ/tnCGb+tG1eXsDRq2Q6QsLP4Vcep0X8Rh1
   qcIaoLbs3KCh6iFrIDmkZG5DMjKI/7seec5Mhqk+Plv3GsuqbmC5sQ8r1
   PERPNtVgIoZdqGNG/NLSQNuH1KU7PnYZnhmmTR/GWEorVBoA2ScGU/nVn
   jvxwn9Fxcmw3+jhU0hi7QSfEFijwoCNcj3ufTtafi/lgTtPpj1aEOprYX
   U+wcEu4AIBP4WUJrkfGuSAIpPnQ1PRX9jOh1v4QXheqPxNIjvmRxu3Y13
   enrp9RERQNBChZEC9MI5upqeUFHAq2Ve7Re2qshtMK+DxlJp0jjvxYd+8
   Q==;
X-CSE-ConnectionGUID: SOJh4CJGRgKsSkM5GB5Q5w==
X-CSE-MsgGUID: J+ziv3feQL+uN0utlYgpSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31975327"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="31975327"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 02:39:56 -0700
X-CSE-ConnectionGUID: MQ7VKtRQSzyj8qvtl5PZWg==
X-CSE-MsgGUID: v8GfovzFSPOAtTN3cZQeGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="56116438"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.94.248.44]) ([10.94.248.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 02:39:54 -0700
Message-ID: <012e6c67-d7d7-46ac-82d6-1899f3cafc2a@linux.intel.com>
Date: Fri, 2 Aug 2024 12:39:51 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/21] usb: xhci: add 'goto' for halted endpoint check in
 handle_tx_event()
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org
References: <20240802112121.5a552f92@foxbook>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20240802112121.5a552f92@foxbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 02/08/2024 12.21, Michał Pecio wrote:
> Hi,
> 
> This commit has now landed in 6.11-r1 and it appears to have a side
> effect of performing the halted endpoint check after every handled
> event, which wasn't done before.
> 
>> +	/* update the urb's actual_length and give back to the core */
>> +	if (usb_endpoint_xfer_control(&td->urb->ep->desc))
>> +		process_ctrl_td(xhci, ep, ep_ring, td, ep_trb, event);
>> +	else if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
>> +		process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
>> +	else
>> +		process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
>> +
>> +check_endpoint_halted:
>> +	if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
>> +		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
>>
>> 	return 0;
> 
> Since stall handling is already present in functions like finish_td() or
> process_bulk_intr_td() called from the above snippet, and this change of
> behavior is not documented in the changelog, I doubt if it's intended?

Hi,

Thanks, this is indeed unintended.
There definitely should be a return before the goto.

Thanks,
Niklas

> 
> Regards,
> Michal
> 

