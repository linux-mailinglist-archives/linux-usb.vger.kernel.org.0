Return-Path: <linux-usb+bounces-31206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 192F2CA809D
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 15:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1DAD3088A3E
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 14:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C0F336EF2;
	Fri,  5 Dec 2025 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESUoXs0e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604EC335551;
	Fri,  5 Dec 2025 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764946682; cv=none; b=e+V3j07ANLCsIYZKnTRZcKgSuObMHjEnIOj3pVnBedzzBHPuj6wxvtLXDc302LxSWob52LyvPj+8GquSP9yUo5zCobcUlPtTlHD/IVbMm+AxKrF8XzL4TD1hYRAa/Z/RB/mgDmPwt5phwp1s+fQJZyfsyokQT9iQj96ncgd4uOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764946682; c=relaxed/simple;
	bh=nLhQ+6puMkQt1v1zxy7NeuDc0Bm0+2SoBcV2k6IPUns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPQlmF/BUNcNdcl127r0IDxtZu9zJ/5P0FqNSl/o0cv1bQDMYjIH/gSn6YP4IFb+j6LMpNIEdtw9V+DVV7Ef0C6ansI2lrmLzahnBEjgwPfXIPmDq44565EH0EV6PMVR9KYbBx0J/TKpAJdDHIBCTnqTyazbO464w20f3fBNIWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESUoXs0e; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764946678; x=1796482678;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nLhQ+6puMkQt1v1zxy7NeuDc0Bm0+2SoBcV2k6IPUns=;
  b=ESUoXs0eqS9U3UTYLv0wEzsGicGHENm+IHkfaS9s9PuWka3z5+HKuU8o
   tVBIBPD8b52s8m7CCY241xQLwiCvKN2IzFAs7/XgSuArnY4YNx/nWnFzS
   y7yK9KtHB+LqmOxX3yhEfhAsMFlmnb81sJSjXs2kqpK2UdIXCzKKeTY7X
   ithgRSxWtIUNoK+WOUwcXYDiRytFA6cBX+chWLdlUpslDztzeWCYs1xn5
   pD+jfA5Dn5D4OWOQpTVJf3xgNB1spdcr8NJCWuA0clMGh9gDHR1/JSdEd
   tJ4PKEommLgb88vYt34MFrJAlNzMvSqJaJgviI1vQ+Jnrxvf9zo9+M/k2
   w==;
X-CSE-ConnectionGUID: 2tZ6VmXIRY+/3P0r0331sQ==
X-CSE-MsgGUID: fjiBo7s0SFigL40+UTyI4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67056155"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="67056155"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 06:57:55 -0800
X-CSE-ConnectionGUID: IlvSvx9PQQGL3wjLdvECjQ==
X-CSE-MsgGUID: ZF8nmjC9RbiuHY8YTnpetg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="195130953"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.111]) ([10.245.244.111])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 06:57:52 -0800
Message-ID: <7a6dfc17-12cc-4972-88d8-acf86e4fca45@linux.intel.com>
Date: Fri, 5 Dec 2025 16:57:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after
 running adb
To: Forest <forestix@gaga.casa>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net>
 <cc788286-c327-4b1f-adb4-8494c0145d74@linux.intel.com>
 <bu3vhk5i8pttoi6t8fan58lpe7l2eb12ib@sonic.net>
 <f8ee4a2f-6b95-4f91-9ffc-b7df45464d46@linux.intel.com>
 <fod4jk1tp199qsvqqlspl45nf29i5k3c0i@sonic.net>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <fod4jk1tp199qsvqqlspl45nf29i5k3c0i@sonic.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/25 03:56, Forest wrote:
> On Thu, 4 Dec 2025 01:41:37 +0200, Mathias Nyman wrote:
> 
>> If possible, could you try with the same usb debugging enabled as last time,
>> and add HUNG_TASK debugging entries in kernel config:
>>
>> CONFIG_DETECT_HUNG_TASK=y
>> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=30
>> CONFIG_DETECT_HUNG_TASK_BLOCKER=y
>>
>> And add the following patch to hub driver:
> 
> That patch failed to apply, due to tab/space differences. I guess Thunderbird
> might have taken liberties when you sent it. It was easy enough to make those
> edits by hand, though.
> 
> The result was again bursts of dmesg output roughly once per second, this time
> 107 lines each. I compared the last three bursts that made it to my redirected
> output file, and they were again the same except for timestamps and a few lines
> being reordered.
> 
> A screen photo once again shows newer timestamps than the file. I did not
> read every line in the photo to compare it with the log file, but the last
> dozen lines look the same. I suppose I can send you the photo if you like.
> 

Yes please, small differences, ordering, and timing matter in this case

Thanks
Mathias

