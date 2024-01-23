Return-Path: <linux-usb+bounces-5409-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 436C38392BB
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 16:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFBC2293250
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 15:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB425FDD5;
	Tue, 23 Jan 2024 15:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vdksq8GH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4375FDB9
	for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 15:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706023860; cv=none; b=HnGARpyUIUjnNK8+vJDDkFKQcUlbikeGz/Rz4TlCXVLE4KKWgaWgnxfE53OEN+9tAiuP81dpkKt8sexdbbQk9pRxhQATfRYgwN5Ka+oWknDaRinMa/ui8D5dInFscC/ONYJkiRivVgqCpM75OMLskOC6ULGkP1dv1mCn3Fl4h5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706023860; c=relaxed/simple;
	bh=g6qgtJC1OaaImJw+3OEGDoUbVbj3k/0rh0P5vO6JAQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OqqQAjfP5reOy8uhF3GF18ZSDfdAGGWBmjW2vPIG9JrYA/iPXygI/DHarqLimMGeGeT7LRwypewdxXOo42CaMousitSKAblCh715AuoLkXE211bJAFbVXM2je/VNHosn+9wUy5DnSxIlbFQOdV/sGEhSuUWAiutjNhxaSRzvHPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vdksq8GH; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706023858; x=1737559858;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=g6qgtJC1OaaImJw+3OEGDoUbVbj3k/0rh0P5vO6JAQ0=;
  b=Vdksq8GH8h3iN7ePeezG1hMggluu0yHIpJEq7Lo9qLkYvFpTSj5z0n1Z
   LROVnlW+Q5GzhQz/qJOx8UsE0QgP/8SZOWyV+3kLQhdo3A/3EfeS1W3x7
   YAdr3py2+tcLSEThMkMc4mk+Om4LqsU2VmKu45LhZIVIfx5k5NeR3ro9k
   XV0LDB7+Mku0svG83MNBCZtvU/ihBp+gOs49H2i4hBcgaDlM694iKsVpz
   RfioSeZSZagJkUw8JY5fGXZZf1SmRT+eO/a4rrIK9awT3fa3QS6n1eFa5
   Xo0DWWvzgYfJDvnxszoIhk+dGNjqqYu3jHXE5y7u+sbBNVZE45kAlj/hx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="398706676"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="398706676"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 07:30:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1117286794"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="1117286794"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jan 2024 07:30:56 -0800
Message-ID: <6f24aac1-b20c-ffee-89e6-71c23e0c075f@linux.intel.com>
Date: Tue, 23 Jan 2024 17:32:28 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] xhci: handle isoc Babble and Buffer Overrun events
 properly
Content-Language: en-US
To: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
References: <20240123101049.4f76f43f@foxbook>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20240123101049.4f76f43f@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.1.2024 11.10, Michal Pecio wrote:
> xHCI 4.9 explicitly forbids assuming that the xHC has released its
> ownership of a multi-TRB TD when it reports an error on one of the
> early TRBs. Yet the driver makes such assumption and releases the TD,
> allowing the remaining TRBs to be freed or overwritten by new TDs.
> 
> The xHC should also report completion of the final TRB due to its IOC
> flag being set by us, regardless of prior errors. This event cannot
> be recognized if the TD has already been freed earlier, resulting in
> "Transfer event TRB DMA ptr not part of current TD" error message.
> 
> Fix this by reusing the logic for processing isoc Transaction Errors.
> This also handles hosts which fail to report the final completion.
> 
> Fix transfer length reporting on Babble errors. They may be caused by
> device malfunction, no guarantee that the buffer has been filled.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Thanks, adding to queue.

> ---
> 
> Question:
> 
> Will this become a game of whack-a-mole as new cases are reported?
> 
> Would it make sense to apply error_mid_td right away to more codes
> that plausibly lead to an abort of the current TD?
> 
> Or do it after the initial patches prove themselves in real world?

I'd send tested patches that solve real world issues first to the usb-linus
(6.8 kernel), with stable tags.

Then sort out if we need to add error_mid_td to other completion codes,
and send patches for those to usb-next (6.9 kernel)

-Mathias

