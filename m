Return-Path: <linux-usb+bounces-16822-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F1A9B4569
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 10:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62CD2B2173E
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 09:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F2620403A;
	Tue, 29 Oct 2024 09:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBJiSYNA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69975204035
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730193277; cv=none; b=jn9aicB18tCEoG9ZQVggMjU0eDuI/lfVmadfYmcCgQbLWa/yTJB5ncFpwaQIsoeaTH7JrjHCEJzoSK2NPC6pi4JhZ7tkrWdH/6w0C0OWTvGOu1nvDHDIwQA6Cb5VaqwldxDn2zROhlOhDPkJh87IQ9OvyzXnVq/erIjjFI8Bxfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730193277; c=relaxed/simple;
	bh=LgT4cYNMPjAv16tgO8MMUyx7MzDr0gyQKjfNKM1Vg70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PuYi0l6wJnSAKCGqketNyHb5vwYWn5dpDumSpRaFlJg5svNimZgbozGDpz13LUro6zP0BEX+uDpHhGcRaYNEvdQAf2uqky0D6/CA37l7I9eQS3aQOqCE8oyG01A941vl2cnAaJzhzFMhyb9URC1cZpU3GQB4iVW49irkj6o9xm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBJiSYNA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730193276; x=1761729276;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LgT4cYNMPjAv16tgO8MMUyx7MzDr0gyQKjfNKM1Vg70=;
  b=cBJiSYNAxTh4xPHgYKaU6FP9gQoVA016LueaVixsqcrs3Yof2um9Rg67
   mCTmqA6a/adRokiIT3u1NBUOmdcgYHeA8iY2BDQn4xkQVj5qlSDt5zKxw
   x/sUiy7HxRW38WWB1zkUMcA9uenkJ+LzDe5dyLlCUclyvxCjcvVsDpjOL
   LcZibgsz8U4w3jcJ8Nin8o3Vo4GCzsMbgnhLQqKygiM41/+l0D1nTnqyh
   lEqM1SZtAyRarjxnZHkPw7/2dNtJV7kzGTnrIcE+GhIXvxlSAEUTQArzN
   JZjAOrB1huAFYckrsVLLkHQdUossq09pE97z/yNk7zMKefF1cUul4zWpz
   Q==;
X-CSE-ConnectionGUID: 6ajqcCGxQuOUJKA4BBftsw==
X-CSE-MsgGUID: 5zB7OVluS7i7AMkw1pKySA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29596593"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29596593"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 02:14:35 -0700
X-CSE-ConnectionGUID: 8b4Fec+MSB+auNPx+QqQNg==
X-CSE-MsgGUID: K5A2hnaXTVCiK5SlJLVpEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="87028875"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 29 Oct 2024 02:14:34 -0700
Message-ID: <7c2abdd1-c209-4616-9d18-be5fc99fc527@linux.intel.com>
Date: Tue, 29 Oct 2024 11:16:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xhci: Fix the NEC stop bug workaround
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, "Neronin, Niklas" <niklas.neronin@intel.com>
References: <20241025121806.628e32c0@foxbook>
 <20241028083351.655d54cf@foxbook>
 <f6dcf205-e8eb-4ba8-91d9-24fa0f769739@intel.com>
 <20241029092800.32eccf3b@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241029092800.32eccf3b@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.10.2024 10.28, Michał Pecio wrote:
> 
> By the way, I think this race is already possible today, without my
> patches. There is no testing for SET_DEQ_PENDING in xhci_urb_dequeue()
> and no testing in handle_cmd_stop_ep(). If this happens in the middle
> of a Set TR Deq chain on a streams endpoint, nothing seems to stop the
> Stop EP handler from attempting invalidation under SET_DEQ_PENDING.
> 
> Maybe invalidate_cancelled_tds() should bail out if SET_DEQ_PENDING
> and later Set Deq completion handler should unconditionally call the
> invalidate/giveback combo before it exits.
> 

I think you are on to something.
If we add invalidate/givaback to Set TR deq completion handler, allowing
it to possible queue new Set TR Deq commands, then we can bail out in
xhci_urb_dequeue() if SET_DEQ_PENDING is set.

xhci_urb_dequeue() would not queue a extra stop endpoint command, only
set td->cancel_status to TD_DIRTY dirty, and Set TR Deq handler would
not ring the doorbell unnecessary.

Sounds like a plan to ne.

>> We could ring the doorbell before giving back the invalidated tds in
>> xhci_handle_cmd_stop_ep(), and possibly xhci_handle_cmd_set_deq().
>> This gives hardware a bit more time to start the endpoint.
> 
> This unfortunately doesn't buy much time, because giveback is a very
> cheap operation - it just adds the URBs to a queue and wakes a worker
> which runs all those callbacks. It finishes under 1us on my system.

Probably true, but change is simple and free so might be worth it.

Thanks
Mathias


