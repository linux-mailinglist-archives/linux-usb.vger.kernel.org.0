Return-Path: <linux-usb+bounces-32175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1355ED1181B
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 10:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9B193042FFB
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 09:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8BE267B92;
	Mon, 12 Jan 2026 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRHaP/J7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ED72459E5;
	Mon, 12 Jan 2026 09:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210226; cv=none; b=fQ1FtBvu8OUjagLzwNh1nPmUoC/BNjV/HWr+MgmLC5Y0VSP4zo8zhmKrX5oRX7IZWX1rFXIHdtg/WEreK9eoZplWRTEqg+QhXbw50Y1QGp4UP1nsgpbMXShIvfCvse2WngHHUo38B85xIitM9AUfIxlyhYM30A9+GDTSLF+6w9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210226; c=relaxed/simple;
	bh=JteT7bp9NnM+L+L0MSMVp8v+mVwyolKCIRgfWYYyYCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwmtrFp0WjKO26x0tkSKvIAD6+YTJquXV1cpL2GtdxSwLYlxyrGVlSYPMlIDGULXHyhNhztkGIznqm7mmvsCvaQRqXD80FRdnYJhNuXLwpiBMUsGcuYuElRkJ3oSByooCIz3jkE/aocPYjeoqp7RWlGWRlqMTsShLQIy6edaBLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRHaP/J7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768210225; x=1799746225;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JteT7bp9NnM+L+L0MSMVp8v+mVwyolKCIRgfWYYyYCo=;
  b=WRHaP/J7zyebqVJ93dQiKFc1ggYo9bHIC5bjA3SFL7yz6IuaBejiYZCZ
   xk0JgOsSRzOYhfaRS4k/y3XOF3u1gNS6DX7oLhLXxnAZFaRmLWwqcMGFM
   JQ09Xlj6keTCx3VVxV18IcaFODzl+lrtzSISit74GtaJeeAJjlfgmT1fL
   mzyZVGN5E41QJTxkZITD2WDKBY1e4L6d7jQ5oqYqWThNpSfXYP2gK1gIa
   ZQ7we7w+33CvN326L3ePyYE7hSaOZ1jucUfPZUOLT3c2WWy9Pml0F+vu3
   tlcf4Lm1BfgHGmw077H9ALx12jf3DwPKnwG6lQx371uJpQKPNwcH0SAdy
   g==;
X-CSE-ConnectionGUID: rZztDY2GTNifZHt7ie6E9g==
X-CSE-MsgGUID: JSd/5iY8RUej1y2fnxa03w==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80846712"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80846712"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:30:19 -0800
X-CSE-ConnectionGUID: os+Au4G7SmWdMyNXOCZ6IQ==
X-CSE-MsgGUID: E55cIAtxTcGFvy6W0GIEpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204326040"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.56]) ([10.245.245.56])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:30:17 -0800
Message-ID: <4d714043-bf6c-46f2-b7c5-a41b37d4e0ba@linux.intel.com>
Date: Mon, 12 Jan 2026 11:30:10 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: fix potential divide-by-zero in
 xhci_urb_enqueue()
To: Alan Stern <stern@rowland.harvard.edu>, pip-izony <eeodqql09@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
 Reyad Attiyat <reyad.attiyat@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260110183421.23758-1-eeodqql09@gmail.com>
 <1d014d1c-66f1-42cd-8890-0cce7e3963c2@rowland.harvard.edu>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <1d014d1c-66f1-42cd-8890-0cce7e3963c2@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/26 00:08, Alan Stern wrote:
> On Sat, Jan 10, 2026 at 01:34:21PM -0500, pip-izony wrote:
>> From: Seungjin Bae <eeodqql09@gmail.com>
>>
>> The `xhci_urb_enqueue()` validates Bulk OUT transfers by checking if the
>> buffer length is a multiple of the packet size. However, it doesn't check
>> whether the endpoint's `wMaxPacketSize` is zero before using it as a
>> divisor in a modulo operation.
>>
>> If a malicious USB device sends a descriptor with `wMaxPacketSize` set to
>> 0, it triggers a divide-by-zero exception (kernel panic). This allows an
>> attacker with physical access to crash the system, leading to a Denial of
>> Service.
> 
> How did you become aware of this problem?
> 
>> Fix this by adding a check to ensure `wMaxPacketSize` is greater than 0
>> before performing the modulo operation.
> 
> Not necessary.  This can never happen, because transfers to or from
> endpoints with wMaxPacketSize set to 0 are rejected in usb_submit_urb()
> with error code -EMSGSIZE.
> 

Only special embedded high-speed eUSB double isoch bandwidth devices can have
isoch endpoints with wMaxPacketSize set to zero.

This divide by zero case is only an issue for Bulk OUT endpoints, which as Alan
said, will be rejected by usb_submit_urb()

Thanks
Mathias

