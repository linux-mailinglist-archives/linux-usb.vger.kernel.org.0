Return-Path: <linux-usb+bounces-16902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA989B7CA4
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 15:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7E54282984
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 14:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FDA19AD8D;
	Thu, 31 Oct 2024 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jH69cnlw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73EE84A52
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 14:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730384405; cv=none; b=N1MIQUGA7LNGf/E3a5CPkjYLm4OSz2rcomk/d2pJcuXcPoUutMcn2wjP1tK2N213ksV+swqBxHyS/vtOlzvlkn8QCkdGzBXYDpfvzQqe4jmsvZwe8+FsuCncrPULEsm+m9p2IhC5hxSM+JA7KKC+cwdZ6pHAN0LnoOCYwyiu/2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730384405; c=relaxed/simple;
	bh=8eUt7knGaRsJk5F8kAb0QladafcyNoIySjcKP0rtgJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fOZnpRW3FSoJq82GvO05Dp38qGOYGYQpatqnpgsTj2ay3tsXTNUw2UZ0fl9GFVHeoK6eCztd0cztP/JPGT/i86Xf4IMAw8iHUyF2xCStIPARuqw2TZrqp8nea/fNK7nDxKIhN6MH6oigKmqalYP72nUPa1VYK7UrP8XPybQa9sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jH69cnlw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730384404; x=1761920404;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8eUt7knGaRsJk5F8kAb0QladafcyNoIySjcKP0rtgJg=;
  b=jH69cnlwyIIy1D1ZZDRcSTIddFItl16XtWBdR5hEiWdi8oeUPz/S4w68
   8Id8LmtDxw0N20ztM6TWcpXQKVBFZHtig2uKo5PN4VbAA04CPLD8RXWRz
   UxVxDNJNRiTY5DailgMGWMEccSzKBI1mpnw6e6yONtxLPi0jNl2Zv4Q7C
   TA50xf62ENVXKGKQZeYM7uRZTcrPwyeHOwFXclfQvXvYNqrVtqMONMcXH
   qkPtEWLLWH5yNnNCdLpo9Zt8v5Z7xB04nfMm6LwuelmzidqjRh7SDHoO7
   M9X5ti4jAUC8L6Nn4w9/x6P4BeXFu6ypO0iDmAOfwa+duwzqEV/GIeOf6
   A==;
X-CSE-ConnectionGUID: P/nXvhEFTqKp+NAZwXLI7g==
X-CSE-MsgGUID: fNoW6toVThSyRTNMCUvKNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47581617"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47581617"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 07:20:04 -0700
X-CSE-ConnectionGUID: JQHIKAoYTGmbCC1nln3hww==
X-CSE-MsgGUID: FrDKkPq7SbC4DAVr1s3m7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87232639"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2024 07:20:00 -0700
Message-ID: <c7199fd8-243c-4fe9-8f7e-323ff4c67765@linux.intel.com>
Date: Thu, 31 Oct 2024 16:22:14 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xhci: Fix the NEC stop bug workaround
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 "Neronin, Niklas" <niklas.neronin@intel.com>
References: <20241025121806.628e32c0@foxbook>
 <20241028083351.655d54cf@foxbook>
 <f6dcf205-e8eb-4ba8-91d9-24fa0f769739@intel.com>
 <20241029092800.32eccf3b@foxbook>
 <7c2abdd1-c209-4616-9d18-be5fc99fc527@linux.intel.com>
 <35fdb2a4-8514-4b4d-9332-127d6ed07908@linux.intel.com>
 <20241031091347.29b6ffdd@foxbook> <20241031114926.22ac4359@foxbook>
 <20241031121724.5a259d6b@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241031121724.5a259d6b@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31.10.2024 13.17, Michał Pecio wrote:
> Update:
> 
>> Your patch prints one dev_dbg() each time, mine spams many of them for
>> 100ms each time. I will remove this one retry limit from your patch to
>> see if starts spinning infinitely, but I strongly suspect it will.
> 
> Yes, that's exactly what happens.
> 
> This time I have killed the ifconfig loop, unplugged the NIC and
> started 'rmmod xhci_pci', which is still hanging 10 minutes later.
> 
> So business as usual when these things go wrong.
> 
>> One retry is not enough. This is what I got on the first try with a
>> random UVC webcam:
>> [...]

Ok, good to know, then using flag is not enough.

Using a retry timeout for failed stop endpoint commands also sounds good
to me.
It has a slight downside of a possible 100ms aggressive 'Stop Endpoint'
retry loop in cases where endpoint was stopped earlier for some other reason.

Not sure if that is a problem, if it is then we can add the flag and only
retry for 100ms if flag is set (only clear flag in handle_tx_event())

Another reason for the flag is the additional note in xhci 4.8.3 [1], we might
need to track the state better in software.

[1] xhci 4.8.3 Endpoint Context state

"There are several cases where the EP State field in the Output Endpoint Context
may not reflect the current state of an endpoint. The xHC should attempt to
keep EP State as current as possible, however it may defer these updates to
perform higher priority references to memory, e.g. Isoch data transfers, etc.
Software should maintain an internal variable that tracks the state of an
endpoint and not depend on EP State to represent the instantaneous state of
an endpoint.
For example, when a Command that affects EP State is issued, the value of EP
State may be updated anytime between when software rings the Command
Ring doorbell for a command and when the associated Command Completion
Event is placed on the Event Ring by the xHC. The update of EP State may also
be delayed relative to a Doorbell ring or error condition (e.g. TRB Error, STALL,
or USB Transaction Error) that causes an EP State change not generated by a
command.

Software should maintain an accurate value for EP State, by tracking it with an
internal variable that is driven by Events and Doorbell accesses associated with
an endpoint using the following method:

• When a command is issued to an endpoint that affects its state, software
should use the Command Completion Event to update its image of EP State
to the appropriate state.
• When a Transfer Event reports a TRB Error, software should update its image
of EP State to Error.
• When a Transfer Event reports a Stall Error or USB Transaction Error,
software should update its image of EP State to Halted.
• When software rings the Doorbell of an endpoint to transition it from the
Stopped to Running state, it should update its image of EP State to Running."

Thanks
-Mathias

