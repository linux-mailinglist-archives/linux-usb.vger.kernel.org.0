Return-Path: <linux-usb+bounces-15013-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7BA976D9D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 17:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED59D288AAE
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 15:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768B519C554;
	Thu, 12 Sep 2024 15:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKAKw7s6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BD7126BE2
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726154425; cv=none; b=IV3r+VC/PUf91gjmVbxdVu+uGSkdM0MfDUoddkfUta18zqBHh4PEhjsdzat0jFABY5e2rA0UWmWiWy7OlpryAmkQrK63XSQkCm4Im1LoqxJghk6wq/xo5J4YU1SZEF/kKCkunUos7kw3WQKn9G0XHnIBkHPI1POqXSpjPVihSj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726154425; c=relaxed/simple;
	bh=7kv0EG9PtIBQlSrdpQXP3nA9MyHPwvDC5zvjc0SWOIQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=otZVfSmsMQ1yX5oT85I8dpt0M4J+vgguU8VKq7Mz5Mb9oYsXhmqyI1Ucb7AFFrW+OlvYa+VwoQk3JEZ5D6COr56A6Kuv1Df4VlKenY5mK7eLedf/uhHKwtcT3nPac+syjM5YmPe4hwS2HtLT0MOn/S2Ly1ktq0iXzxd5laU11f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKAKw7s6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726154423; x=1757690423;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=7kv0EG9PtIBQlSrdpQXP3nA9MyHPwvDC5zvjc0SWOIQ=;
  b=fKAKw7s6MsIJBEH5Bm3Pbno8yp/3ezBodyvLLDUuIjxAtIdiOIKj0i1D
   a23oButTPf+cXorS/8MwwZpJpPgddVpsrdZEvgn9U+agf0BnOCJdBA94m
   Tmho4OJQzY9emDag7giOtG+qz15jyZ3ibtcPlQi1CUjsqQqt7ahpu0oCG
   WU1/2xq69foAyqpUKY8uggVF8K0o2ZxBH+zrmvXUlea+SuFRBGRdDr3Hr
   LRMbWJMlN+bwAjEavDJQeDHg5JcDVhA7JBgxN2VTMA1IR5Bb0W+aZD74z
   Y+1hP/UWOsw4D5/mDJGBt/4enihxirFfk6eiBKQrj6Z172jy2WnFJJh8F
   w==;
X-CSE-ConnectionGUID: NOtG34lmTuaUQfYmw08g2w==
X-CSE-MsgGUID: dCeHlfVwTOewFISr/lnoIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25145836"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="25145836"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 08:20:23 -0700
X-CSE-ConnectionGUID: 4M7cynU3QwCVDvg5VskzMQ==
X-CSE-MsgGUID: E+UUybr0TMSQe8q0o9AFTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="90987575"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 12 Sep 2024 08:20:20 -0700
Message-ID: <8dae1527-24a3-401e-b968-a874808e6f46@linux.intel.com>
Date: Thu, 12 Sep 2024 18:22:27 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange issues with UAS URB cancellation
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: Marc SCHAEFER <schaefer@alphanet.ch>
Cc: Micha?? Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
References: <ZtcVXoI6jNM9Lqbl@alphanet.ch> <20240903174535.6e5e581b@foxbook>
 <ZtdmOiKN6hb2Y82I@alphanet.ch>
 <71c073de-8af5-4457-88eb-91a709c2d941@linux.intel.com>
 <ZtiMp39CWrI0e+GB@alphanet.ch>
 <e16c21cd-41f3-4191-9957-6e61ddfefd24@linux.intel.com>
 <ZtnHs8udyl6bfGdF@alphanet.ch> <ZtnI57FYnoz1xKxF@alphanet.ch>
 <ZtnpOfv2qXCUy5/i@alphanet.ch>
 <ecc97ef6-ae0f-44e3-ad6e-60a8df0b54a6@linux.intel.com>
 <Zt8gkkRGMdgaEOXX@alphanet.ch>
 <54229f03-8fa3-41aa-b576-59ec5a07848e@linux.intel.com>
Content-Language: en-US
In-Reply-To: <54229f03-8fa3-41aa-b576-59ec5a07848e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.9.2024 17.25, Mathias Nyman wrote:

> xhci driver doesn't yet have tracing for stream contexts, I started writing those but
> didn't finish them yet.

A set of tracing and debugging patches for this is now available in my
fix_uas_babble_error branch

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_uas_babble_error
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_uas_babble_error

Much appreciated if you have the time to try them out.
This time I think we should enable _all_ xhci traces.
The trace file might grow fast but it would be good to get traces starting
before the uas device is connected.

Updated steps:

mount -t tracefs none /sys/kernel/tracing/
echo 81920 > /sys/kernel/tracing/buffer_size_kb
echo 1 > /sys/kernel/tracing/events/xhci-hcd/enable
echo 1 > /sys/kernel/tracing/tracing_on
<connect uas device>
<trigger issue>
send content of /sys/kernel/tracing/trace and dmesg to me

Thanks
Mathias

