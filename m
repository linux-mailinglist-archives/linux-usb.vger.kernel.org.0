Return-Path: <linux-usb+bounces-21333-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD6FA4DE5C
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 13:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C29B7A2959
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 12:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664D0202996;
	Tue,  4 Mar 2025 12:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="IJb1/Fa0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CD378F33
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741092749; cv=none; b=uKju39XMMTZUT4z6RZOq7CjVVFhJVWy+arHZ/mduDOUInbM2+YUMugxq4zNTKF0TL2Wc7I+Fhyy+9iJzqv7dd0fpujWzRREDQer+uXl1q2Qoua8Ovgeshm/1VouCS5PuktRsQO/uwVQPkkn3XWVr7ThzF70ceq1RhC0u7PKdo5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741092749; c=relaxed/simple;
	bh=wKQ05ObrWkXsatBufh17Vu9B98vi+WI8OCfLEQ5bDRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZz6Tkr6j8W44pwITQ6fbGSRImzfYjLLxUnjfxQmrrMWYcSSLRUoXQUcEcz8nJiI/IopwqFYtg26B63r/6g6+wXP7TYa8FduL7BpWCy7+laRlf4jQEUZIlO2zQshAdyDPH6oFxQESs6VPtbwXTtUiDwEjLOTWGKodAB/ERmPImk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=IJb1/Fa0; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.122] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z6bDh0q6xz40GJ;
	Tue,  4 Mar 2025 07:52:20 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741092740; bh=wKQ05ObrWkXsatBufh17Vu9B98vi+WI8OCfLEQ5bDRo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IJb1/Fa0wXvS2UM1ZRQwdwzNTNDulvudv9SwDrIBkdo4PlCDaYhNLz1STD8sxWKG9
	 PNpH22oCECkcXJJv1nf2bejFRKOoz9midQuXPxCCAXxaILklBgZ3Gv6DZEGlAXxYpj
	 xWMRNn5sDP6mzeoaV0RDuSEWSK8URYb8HSR0KcI8=
Message-ID: <14351945-fcde-4088-b7b3-542c6e4b7d0e@panix.com>
Date: Tue, 4 Mar 2025 04:52:19 -0800
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
References: <20250303132327.GW3713119@black.fi.intel.com>
 <20250303134618.GX3713119@black.fi.intel.com>
 <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>
 <20250303140156.GY3713119@black.fi.intel.com>
 <567725a5-f984-4ea1-bd38-8815825c1211@panix.com>
 <20250303142058.GA3713119@black.fi.intel.com>
 <402bcee8-030a-45bf-834b-ea4baf5eed3c@panix.com>
 <20250303175818.GB3713119@black.fi.intel.com>
 <007b005f-a6d1-44a2-9795-036c8f397274@panix.com>
 <48ef4c14-55d5-4baa-b862-f9e7368ed950@panix.com>
 <20250304082731.GF3713119@black.fi.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20250304082731.GF3713119@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/4/25 00:27, Mika Westerberg wrote:

> If possible add "thunderbolt.dyndbg=+p" now to your kernel command line so
> if this happens again, we hopefully have full dmesg to investigate.

I've not seen any further instances of weird behavior, but I've added 
that to the command line going further.

But I have been doing a fair amount of testing of the kernel with your 
patch and Lucas' NVMe adaptor (etc.) patch and am concerned that you're 
still seeing his issue, as it (at least as of now) hasn't occurred here 
since applying it.

In any case, on the next reboot it'll be applied.

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


