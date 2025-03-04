Return-Path: <linux-usb+bounces-21338-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAE4A4DF9B
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 14:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D8501893E42
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 13:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FBC2045A5;
	Tue,  4 Mar 2025 13:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="TxhFQGi3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C8F1E505
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 13:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096097; cv=none; b=UnThxTKrzNSFJAlV0qkNs4kOd/hSa4FDNqSXSY7ic+p0vhvu9QNL11Ayy445wqg4GwMps48v0pLhICh2X2Kw4iF1QoR9fIB1+uBa+z7oXAyKvedUS1wvr7X8lHgSiIdbzOjLhcfUFHeoBDOEel9Ag0Ftv+O0yqJP/8ed3GBaZlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096097; c=relaxed/simple;
	bh=0Yk4pCFL8+UObdd3jtQWXxRd4avobDXP8P93ZWAuPoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJ+srHuhOjXb1m6tmm8p98j4cDj6tpDPP06jSB6PXwuopOB+/CY2efcvqoPMftfyUHatrchL4XJY0P/XfT8qw9JnAJaYemO0AZ6+D8pk8eOhSAfdYunA1lBDY+VJ4cZcCNwoX6Cj/U7Nwc/MsGN5XKJpR2T1PJGxoNpYak/73xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=TxhFQGi3; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.122] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z6cT941zkz44kC;
	Tue,  4 Mar 2025 08:48:13 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741096093; bh=0Yk4pCFL8+UObdd3jtQWXxRd4avobDXP8P93ZWAuPoI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TxhFQGi3x4EyjCUepYLn0hxtIyTEf4bshGI5CsAcIoEoDb5rzLUoS4fzJfmeLcxO9
	 xeymgod5itG1wW4WpeTNptn+ccNRH0ZLpB/o2TrxJEGvRvJLzZzAlSPGtPquamkNKM
	 AsCVB4MeTnuv2nV/tDKnNy6mXBu/IUW8f3uHhVzI=
Message-ID: <7c5ec580-9b1c-40b7-9a8d-64bc95c41432@panix.com>
Date: Tue, 4 Mar 2025 05:48:12 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Me <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
References: <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>
 <20250303140156.GY3713119@black.fi.intel.com>
 <567725a5-f984-4ea1-bd38-8815825c1211@panix.com>
 <20250303142058.GA3713119@black.fi.intel.com>
 <402bcee8-030a-45bf-834b-ea4baf5eed3c@panix.com>
 <20250303175818.GB3713119@black.fi.intel.com>
 <007b005f-a6d1-44a2-9795-036c8f397274@panix.com>
 <48ef4c14-55d5-4baa-b862-f9e7368ed950@panix.com>
 <20250304082731.GF3713119@black.fi.intel.com>
 <14351945-fcde-4088-b7b3-542c6e4b7d0e@panix.com>
 <20250304134017.GL3713119@black.fi.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20250304134017.GL3713119@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/4/25 05:40, Mika Westerberg wrote:

> On Tue, Mar 04, 2025 at 04:52:19AM -0800, Kenneth Crudup wrote:

>> But I have been doing a fair amount of testing of the kernel with your patch
>> and Lucas' NVMe adaptor (etc.) patch and am concerned that you're still
>> seeing his issue, as it (at least as of now) hasn't occurred here since
>> applying it.

> It only happens if you have TBT dock and the NVMe connected and you
> disconnect them while the system is suspended. 
> I suggest trying that a couple times and see if that happens. For me it
> happened pretty much on first suspend cycle.

That's exactly the failure mode I was testing for, though ... I've run a 
few iterations with the fix (and about to do one more as I'm about to 
head to a clients' office) and so far, so good.

Is your patch from yesterday applied as well? It is here.

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


