Return-Path: <linux-usb+bounces-5264-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CE4832826
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 11:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EE871F2130D
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 10:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0723B4CE1D;
	Fri, 19 Jan 2024 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3mVpkyD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDE24C61B
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705661297; cv=none; b=NwBb8JTJQJ5QuzvqCAIIZYfCQ+eEmVJunO4h8NblZQr6ESfnDhGWG9mKET00iVsjeyWjAJSZQZkydz6VbOig4IUMnCIoJj5L5XyDibrIn5k+9Y7cgYQrcb/S7Ys/AbdTB1o9HsDxF1T/9QVKwBfBC+BzfhJQgZUnqKfIcnSmG8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705661297; c=relaxed/simple;
	bh=IYUeq0OEQgAk3AEcwv5YVWYXGhDnp6oY6jaNg5WWtWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Li4XEdDXaYKi0bEqTjN0mjSGf4KPV9347JH2dOEWKnTo0ZUi71d3KBDyFK18zTkd7ebvxrpxb+tJTOYfYDnaPfR/VOBvB/mfn6B9AYPse90Ynihu8ofRAtXZSGtWShsllUXZBoisGjqouCv9MiCwNlKgzYhZa1O+OAuXOzBf39A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3mVpkyD; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705661295; x=1737197295;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IYUeq0OEQgAk3AEcwv5YVWYXGhDnp6oY6jaNg5WWtWs=;
  b=N3mVpkyDzPzT5a9UCfqezX/wiMQ1JcmupPL4Hucf1vpSlHwXkQujT4AF
   ccHzAU/yLXxkO/bxVsfyXJelJNa5Kz7qPt5MxW+pTR2xs1HQBW7ngdhiA
   22avNQSXcggpZkyjxyyrmEvGXFTKC7QggZve5KKNuNmn8h+fiqW4Uy3nS
   vrt8MQUPVZql06PM60oLpBPLGUU0I8HWm65TkMudWHWIHmx3wbC6BppUZ
   /XRW5W8O/ogeD+PRX7oke+zmgYlVCT2WKhBhFBUwNwg4Dc21Zoe/nt3MI
   YTeKmXelBW2r020mJ5VTCn6E5HR01bPxxeCy0bkIo4OncgJrAcVy2iZPI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="467093253"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="467093253"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 02:48:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="785041289"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="785041289"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 19 Jan 2024 02:48:14 -0800
Message-ID: <2c2d8711-3d2b-e943-a2a0-75637e725dc3@linux.intel.com>
Date: Fri, 19 Jan 2024 12:49:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [RFT PATCH v2] xhci: process isoc TD properly when there was an
 error mid TD.
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <d9a72d01-0c8c-9dab-f405-268a66f47505@linux.intel.com>
 <20240118135652.2629101-1-mathias.nyman@linux.intel.com>
 <20240118231638.46c2fe1a@foxbook>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20240118231638.46c2fe1a@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19.1.2024 0.16, Michał Pecio wrote:
> My usual set of tests passes:
> - no spam on disconnection from NEC
> - no stream lockup on random errors on NEC
> - no spam on disconnection from VIA
> - finish_td called with right frame->status on VIA
>    (checked by means of extra printks)
> 
>> +		/* Error mid TD, don't give TD back yet */
>> +		td->error_mid_td = true;
>> +		td->urb_length_set = true;
>> +
>> +		frame->actual_length = sum_trb_lengths(xhci, ep->ring, ep_trb) +
>> +			ep_trb_len - remaining;
> Not a problem with this patch, but I noticed that every single use of
> this function ends up adding ep_trb_len, maybe it could be inclusive.
> 
>> +		td->urb->actual_length += frame->actual_length;
> In your first email you mentioned hosts responding to every single TRB,
> perhaps with the same error code repeated each time?
> 
> I imagine it could be problematic here if such hosts really exist and
> if there are enough TRBs to execute this line twice. A check for the
> error_mid_td bit previously set could help, if this is a real risk.

Good point, refactored that code a bit and it now both looks nicer and should
solve this case.

One more patchround

Thanks
Mathias



