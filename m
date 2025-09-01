Return-Path: <linux-usb+bounces-27423-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C518EB3F01B
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 22:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E24E17FF2B
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 20:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133052737E5;
	Mon,  1 Sep 2025 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0Okr67q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6283EEC0
	for <linux-usb@vger.kernel.org>; Mon,  1 Sep 2025 20:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756759976; cv=none; b=jfuhtDcdEAslqsUzqAFBkWNcD7uFbkWYZSTtHvSZk8qhuvVanyYECtEZA72Fmyq0AjRb6266GBqLXZrfRX6GkzFE+JSsU3qrKdjDvqNRlUoU1w0cku4Majw40RnvI0CPLiQOk6RKzXeFPpFG5mZMkJean8NtBT1Rtf4re7koU0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756759976; c=relaxed/simple;
	bh=ytlWATWjcBQWrzRAGj8X4KZBLKKh5rsUh+peglojg9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYi4j9lBoLGNreRZEUmp78sEmDo2mXfha5y6Jen+VwZrpmaLvCUhbzKuCMj3LwFoOXbNe5+8MCq2VHfGYRnrGe7fb4owswHJFSNfRpvbD3cz/7tfkmiZZlIkMbrHn6TFf/9StV4F7k/xbPh02FTriyGNo0SvfZ7CeKrB8TAuw4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0Okr67q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756759975; x=1788295975;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ytlWATWjcBQWrzRAGj8X4KZBLKKh5rsUh+peglojg9k=;
  b=m0Okr67qS3k4mBtnVhIO0/VKr6hFImthkCit3XLgIldUnRRVfQcKN7AM
   d9nZhpmnqLUjJH65w544KaGblABQUR4TBnCZ7W4ljUZPtPb8p6VVcXmTh
   bd+a4UDm/v8bSLSV6gsN5eeHkzOlTk8Oj4hM4AxbDXP/B79JdQyqz9+g6
   dXtFjfHXa1VEJHop4qAZJjNkhKKmKLI6kIIExV6Y4n5uPU9+X2xk4Fu1W
   AOvun1UYMzTbkJqndq6rVZbMf4B5CbO08TAzTxp/WrjLXn1fnuOFe4X+k
   Ir90Z0fTlBAbAUl3IaiCfs4NMkcz7LDYl0W6Jd6pNv3eQzfnY3gC7rUvt
   Q==;
X-CSE-ConnectionGUID: rhItqPd+QcaRu0BmdfacsA==
X-CSE-MsgGUID: mh3UByomSkaZFFb4uuc5yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59160968"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59160968"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 13:52:54 -0700
X-CSE-ConnectionGUID: ul9j6b0aRt+/Vppyy7oDIg==
X-CSE-MsgGUID: XnwJyJlWTrCnx8TWLP7WRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170367195"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.170]) ([10.245.244.170])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2025 13:52:53 -0700
Message-ID: <c7b57073-bd8c-4646-b93a-266ae6f3d557@linux.intel.com>
Date: Mon, 1 Sep 2025 23:52:51 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] usb: xhci: Drop the TD_CLEARING_CACHE_DEFERRED
 cancel
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
References: <20250901084642.2b42c0e7.michal.pecio@gmail.com>
 <20250901084858.27f91ab7.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250901084858.27f91ab7.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1.9.2025 9.48, Michal Pecio wrote:
> The last remaining use is inside xhci_invalidate_cancelled_tds() for
> destroying deferred TDs under certain failure conditions.
> 
> Instead of violating the spec by crudely erasing those deferred TDs,
> we may give them one last chance to get their Set TR Dequeue. Maybe
> the prior failure was caused by some corruption of one stream's ring
> and other streams are fine, maybe it was a transient -ENOMEM.
> 
> Or maybe we want to cover this obscure case with less extra code.
> 
> Remove the search for TD_CLEARING_CACHE_DEFERRED TDs, nuke the one
> cached TD we tried and failed to skip, and jump back to the main
> loop to handle any TDs still in TD_DIRTY or TD_HALTED state. These
> are our deferred TDs - all other dirty TDs have been given back.
> 
> If we fail again, the deferred TD will be nuked and so on, until we
> run out of TDs. We are under the lock so nobody can keep submitting
> and cancelling them forever.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Looks good to me.

Gives every stream ring a chance to move past the cancelled TD, unlike
the current code that bails out all stream rings on first set TR Deq failure.

Thanks
Mathias



