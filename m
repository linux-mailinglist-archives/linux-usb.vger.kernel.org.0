Return-Path: <linux-usb+bounces-5221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CAA831AD8
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 14:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 238CE1C2264D
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 13:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4402560F;
	Thu, 18 Jan 2024 13:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iU/9viVW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075FF25603
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705586009; cv=none; b=OlqdfgqIIRCzuHN5XFW1CQnFwU81O0TtdM5YUz6EIMMnH16PEihC4NBqeGo7bDld91M7QlnhlekDIcZ8JmPOIz5/Yqr/qLmhhbeQGjT3KDzW7dkPPB6z2lNHd5at/+dn88jXmPqMBjFqXPx4s8cEdd6GJ/wjR8KTppNkugVyT78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705586009; c=relaxed/simple;
	bh=0IBU4zGZnYF1zeYc0kCHfKwqxqbcSd6t4RxCP4Aex9M=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=T+5Stwd5k3r5aOmeDAQMyCG+e8rbNHtML3UpK2y/WZcFkF/vOy82dCZ+5Ea0HXK+Sr+VabbyRGKWZ1jE5QnpNQwUWaoTaWeygSw7B+niVIhp+QUS3iFUE+0X3HtefvuXNMevrdFRF3in+MIADHGYMnWMfoXpY1Rd86jt19jd6ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iU/9viVW; arc=none smtp.client-ip=192.55.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705586008; x=1737122008;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=0IBU4zGZnYF1zeYc0kCHfKwqxqbcSd6t4RxCP4Aex9M=;
  b=iU/9viVWvyK6AIakQwAGAiflWQm32AmagyE0ZMMiGPPfe6hmS3iKYYS7
   GcqUDltBj0O2s1FrUuSG5FCmu1qet5sbudP+mtq7Etrkr9xc/YrEsKbrG
   9VErWh5D8ICpRaNEi2czepu/pN8WBVB/v2GNqcSO1iBeHiLbJP6FuI5TM
   nOIXFJGSCjNoaEsolhUsxrV0xMWqwgtV5bRre83/Jk5GX8iWQQoTG0rH8
   IlNIWPOGzy2njSWA+no+VD/JRbJGhWBRI+1eXqhuoGoS6JJmG/B6iM+g6
   lu9vOACZb7TtzPcpwSEQHqYm3MXkPokWyPiFOOMX5VJbAlptC+/hGsHqN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="486600939"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="486600939"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 05:53:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1115967274"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="1115967274"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jan 2024 05:53:25 -0800
Message-ID: <d9a72d01-0c8c-9dab-f405-268a66f47505@linux.intel.com>
Date: Thu, 18 Jan 2024 15:54:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <20240115172709.0b6f2bba@foxbook>
 <20240116153618.2527463-1-mathias.nyman@linux.intel.com>
 <20240116232045.76da750b@foxbook>
 <f6542354-d6d1-be22-82ed-5dfa57aa8337@linux.intel.com>
 <20240117184905.1800b1cc@foxbook> <20240118120027.5bc498b5@foxbook>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: Isochronous error handling bug on VIA VL805
In-Reply-To: <20240118120027.5bc498b5@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.1.2024 13.00, Michał Pecio wrote:
> I concurrently executed plan B for dealing with my NEC issues, which is
> to simply order a host controller with other chip (VIA), and now I have
> two controllers and three problems.
> 
> One is that it sometimes "dies" and requires a reboot, probably nothing
> Linux can do about it.
> 
> The other is that it reports successful completion of the final TRB and
> the driver overwrites frame->status set by prior errors. This seems to
> only affect isochronous again, though I'm not 100% sure.
> 
> 
> This change on top of yours takes care of it for transaction errors.
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index d2fe1f073e38..fce67493dfdf 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2375,6 +2375,12 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
>   	/* handle completion code */
>   	switch (trb_comp_code) {
>   	case COMP_SUCCESS:
> +		/* Check for earlier errors; see xHCI 4.9.1 */
> +		if (td->error_mid_td) {
> +			xhci_info(xhci, "Got SUCCESS after mid TD error\n");
> +			/* don't overwrite previously assigned status */
> +			break;
> +		}
>   		if (remaining) {
>   			frame->status = short_framestatus;
>   			if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
> 
> 
> Interesting questions arise:
> 
> 1. Should this be a separate patch?

Added this to the original patch.

> 
> 2. Are there any errors that may need error_mid_td treatment on NEC?
> Maybe BABBLE or others, unfortunately it isn't easy for me to produce
> them and see what happens.

Need to go through these, Isoc transfers should have as many error options as other types.

> 
> 3. Are there any errors that may need "not success" treatment on VIA?
> Any chance that these error sets aren't equal and I can't get away with
> reusing your error_mid_td flag here?
> 

Need to look at this as well after getting the first patch done.

I did play with the "error on last TD case",  patch for that is in a temp branch:

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_missing_td_event
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=fix_missing_td_event&id=681415c02f95f6615a4d497df4b202a4f1fb0cc1

But it might just add more code without any real world benefit so I
think I won't send it upstream.

Thanks
Mathias


