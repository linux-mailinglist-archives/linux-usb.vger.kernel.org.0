Return-Path: <linux-usb+bounces-12644-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E7B94159D
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 17:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D37DB254A6
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 15:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76991465A2;
	Tue, 30 Jul 2024 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkVGWAdC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB6C1FAA
	for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722354327; cv=none; b=CxldsARcagqcSDlHN1uVJeTuqYUkht2KQrndPkB35lv4L8lA3AmK/SeR2phLDB9/PTJG4lS1SfY+BcvREJ+eVhELRpl3+M4PVrJMLKblnO/NmbkbDw/d7PvlLSciq62ELai6ccMKr+ildttszOSBpU6PDYbx5MUbCU49qx1O6fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722354327; c=relaxed/simple;
	bh=MmLLQ8qKzkFk42bmTjUhz4I6qJMpmHJyQWpDtTFegpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MNotkadTQbjPjyIxU8frJm9dPfEVkuFG/WliWLiYBPoyxVGwAsPHqciLTX1Ovb+2/mXHvBk+uS1uQ4mpyjJifAKsTi6AB2yuCY1WdJZ+O7xGiz9TXeYFirB6+SyerzcqY2Owxm+/GiUiGjd3hI2lxHlV7oQcSlno2FsOwSffSJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkVGWAdC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722354326; x=1753890326;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MmLLQ8qKzkFk42bmTjUhz4I6qJMpmHJyQWpDtTFegpE=;
  b=jkVGWAdC4EdEK5oKkfyfh6l3YoGWggSPUwUqsizyfR9YJ4CoPPsq+ObJ
   5SrMHYJNS+0kd3zQy6bHyOgzgfk6M/8QLs+unnYeTBpepAYuAkOIGgA31
   IKmhgduCjwZA3t0biPOJoML0ErJkIwfsC4UVYNs5Z7TPZF0TD9GbgCBto
   fvp8ZNrVa5GoTacts1OaGgO2AGu8m9Wtbuw5NBxkOIhyVTJn8/d1w/Lr5
   6AjUl1I0YuZlA6m3siCPYAJxvxkDOhjqdKyKbCc7znbIL+t0NB3JM+3at
   4nRslegxLk/6/fV6VocKUQQOQvdxHnfaP47eTU3MDTHAdiSl1/9Q3bhfX
   g==;
X-CSE-ConnectionGUID: qIn3VxnoQ4mbl0hYnJCYRg==
X-CSE-MsgGUID: uf99QfoeTwu4U3tx/lFaZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23972467"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="23972467"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 08:45:25 -0700
X-CSE-ConnectionGUID: nDltzeVfTd+JbW1VHPbUhA==
X-CSE-MsgGUID: sjxYE7E9QumH0rxkM2iT4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="59180942"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 30 Jul 2024 08:45:23 -0700
Message-ID: <115eb4be-e336-4a29-84d2-bdafb84a0f9f@linux.intel.com>
Date: Tue, 30 Jul 2024 18:47:24 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xhci: dbc: fix handling ClearFeature Halt requests
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, linux-usb@vger.kernel.org
References: <20240725074857.623299-1-ukaszb@chromium.org>
 <121d85fe-976a-43c4-95d2-1a066234a758@linux.intel.com>
 <CALwA+Na218B0PK3QG20_XFovJMfB4ud7B9Z=4kX=xwu8bjAvHA@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CALwA+Na218B0PK3QG20_XFovJMfB4ud7B9Z=4kX=xwu8bjAvHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30.7.2024 3.17, Łukasz Bartosik wrote:
> On Mon, Jul 29, 2024 at 4:11 PM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
>>
>> Hi
>>
>> On 25.7.2024 10.48, Łukasz Bartosik wrote:
>>> DbC driver does not handle ClearFeature Halt requests correctly
>>> which in turn may lead to dropping packets on the receive path.
>>
>> Nice catch.
>> Looks like a halted endpoint is treated almost as a disconnect.
>>

...

>>
>> Hmm, I need to dig into this.
>>
>> I don't think we should push this problem up to the request completion handler.
>> Maybe we are flushing requests that should not be flushed?
>>
> 
> Section 7.6.4.3 "Halted DbC Endpoints" in Intel's xHCI specification
> says the endpoint can
> be halted by HW in case of error. Also it can be halted by software
> through HIT or HOT flags for DbC.
> I wonder how to recover properly from the Halted state caused by HW
> error ? Does it make sense to continue with
> the requests or just restart the endpoint (flush all requests) as this
> patch does ?

DbC should respond with STALL packets to host if HIT or HOT is set.
Host side should react to this by sending a ClearFeature(HALT) request to DbC,
which should clear the halted endpoint and HIT/HOT flags.

I think we may lose more data in DbC bulk-out stall cases (data from DbC to host)
when flushing the requests.
Data is copied from kfifo to the requests while queuing them, if we then flush them
we will never send that data to host.

> 
>> Do you have an easy way to reproduce the stall error case?
>>
> 
> Yes I can easily reproduce the case with the stall errors.
> Would you like me to run any specific scenarios ?

I pushed my thoughts to a "fix_dbc_halted_ep" branch, it compiles but is not complete.
It mostly focuses on getting the STALL case for bulk-in working which this report was
about.

I think the code itself best describes what I'm trying to do.

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_dbc_halted_ep
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=fix_dbc_halted_ep&id=8532b621314e93336535528d5d45e41974c75e01
  
If you can try it out it would be great.

Thanks
-Mathias


