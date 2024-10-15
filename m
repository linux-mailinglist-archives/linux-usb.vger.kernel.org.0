Return-Path: <linux-usb+bounces-16232-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8794C99E99F
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 14:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9B4A1C21889
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 12:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9D11EBA1E;
	Tue, 15 Oct 2024 12:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3pmeaIf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3504A16EC0E
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994876; cv=none; b=DzD/3qkgYBNJVo+EOYOqwoDTVC1d+farD2l5ARpEMOARQmHWQpqT2Y+0rDeGSxoK9+a+2fpB/65H7O+hAfMFEWGFKBlt/noyuJKnt0TVNfigX4/QxO8ai16gEARjRkFshHoaebwXCuxJNFCjNnsuF0aQA3B+xkr3BmyMpytW6IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994876; c=relaxed/simple;
	bh=wXiAiTSS/Obb0BefZEEUWKr0v43/BD/fgV1tBRzJyDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESOSV+t1x3Qj+X7PHNIlCnqdgfsj750DoWECjTU9t1aD0uD5DONvGE+8fxqCKqRjSHQkUZ3NIkOa37cFxpZOKGuMGiedkzAuS9uDwLd+tXi9GtiPbf+yiTPcSf5rVTs497EELdzh+cq6vkXz0WyAAhL0eBMZtVozRPOCOIFDdPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3pmeaIf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728994875; x=1760530875;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wXiAiTSS/Obb0BefZEEUWKr0v43/BD/fgV1tBRzJyDY=;
  b=k3pmeaIf7ZuvaneKgGw7gjV57tUD6I1aeefly4XbTr9ryVkXtuQC48Dv
   /N4UIREpAd95/WQ7Zj/PQuYzYrT51N6qt5sdmKPcGwt/Dpn2jcvyKXcuf
   1jzzC1lbmvTMwLL8iKtZ0K1fjFATwJyN815XWwRxzJiL0dGtcjQ411guD
   oPc23wbtZa6dxpyUBPtw8KlfGAvJIgytYLqW/eztx6UuNvWB+m6hIQKBL
   /DPK+DRmZJLWdLKU1WvDAB7FtN6IV6VH7hYY+6/k48uwdyijpqrDnkXpc
   zjiyDlt21pnn8958OnOYba5HQVKh5YNTn2ZqdTp1l+siIVyk41tZJfrkH
   Q==;
X-CSE-ConnectionGUID: qmLIQjWySi2MeO2jqV7Cdw==
X-CSE-MsgGUID: 3OM8qcC6SbyB/hGkRRtm3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28336969"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28336969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 05:21:14 -0700
X-CSE-ConnectionGUID: QswSxGRvT8GeZ2dRbGfuTw==
X-CSE-MsgGUID: ljE4PGpcTPSTWgAIRcjOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="82668153"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 15 Oct 2024 05:21:13 -0700
Message-ID: <e3f8e58d-d132-430f-875f-283d8055b6c0@linux.intel.com>
Date: Tue, 15 Oct 2024 15:23:23 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix the NEC stop bug workaround
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
References: <20241014210840.5941d336@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241014210840.5941d336@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.10.2024 22.08, Michal Pecio wrote:
> Hi,
> 
> I found an unfortunate problem with my workaround for this hardware bug.
> 
> To recap, Stop Endpoint sometimes fails, the Endpoint Context says the
> EP is Stopped, but cancelled TRBs are still executed. I found this bug
> earlier this year and submitted a workaround, which retries the command
> (sometimes a few times) and all is good.
> 
> This works fine for common cases, but what if the endpoint is really
> stopped? Then Stop Endpoint is supposed to fail and fail it does. The
> workaround code doesn't know that it happened and retries infinitely.
> 
> I have never seen it in normal use, but I devised a reliable repro.
> The effect isn't pretty - no URBs can be cancelled, device gets stuck,
> if unplugged it locks up connections/disconnections on the whole bus.
> 
> With some experimentation I found that the bug is a variant of the old
> "stop after restart" issue - the doorbell ring is internally reordered
> after the subsequent command. By busy-waiting I confirmed that EP state
> which is initially seen as Stopped becomes Running some time later.
> 

Seems host controllers aren't designed to stop, move dequeue, and restart
an endpoint in quick succession.

In addition to fixing this NEC case we could think about avoiding these
cases, some could be avoided by adding a new ".flush_endpoint()" callback to
the USB host side API. Usb core itself has a usb_hcd_flush_endpoint() function
that calls .urb_dequeue() in a loop for each queued URB, causing host to
issue the stop, move deq and ring doorbell for every URB.

If usbcore knows all URBs will be cancelled it could let host do it in one go.
i.e. stop endpoint once.

Thanks
Mathias

