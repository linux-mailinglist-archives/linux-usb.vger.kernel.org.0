Return-Path: <linux-usb+bounces-21270-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21961A4C079
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 13:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38B53188B75E
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 12:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A92A20370A;
	Mon,  3 Mar 2025 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="LQEWFeZo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B64200BB7
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741005568; cv=none; b=nNFbtSU6ptTZqJcTxsW7CIuUSMFdsB0Ghbm3VZOsdrME7Y+pUN/JeESvX28gbGdenh6nsIEv/uE2y2ExuIKyRYYmxydYTroXux2dj0qscC75THBqjc39xdkbqS/4P9r3NdF0mbpqiS/mrfZV8uJ3Y++EbfNApXQSRNy47D3hr9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741005568; c=relaxed/simple;
	bh=nIEaVIY+mrGjIAE5IPQHmPXZwlEwAfaec6yFMQlTNyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQGPneE4gbLEMHYE11ZV0eK0dKCkE0xBzpSTuaTpP5InRFN7YTbJS8U7nFVCoNtWPbdcQcTwkOAui1RTNi2Lv6YeNtUBV0ktjD8ijitP6NEe6waLKP+v+G5azfyJRstDMuqR3pXQmXCSCdcXFYIPB348sLCFmUv+vbBGPgSgi60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=LQEWFeZo; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.189] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z5z0D5Qr9z4vpM;
	Mon,  3 Mar 2025 07:39:24 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741005565; bh=nIEaVIY+mrGjIAE5IPQHmPXZwlEwAfaec6yFMQlTNyM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LQEWFeZoakvTqu9FfBPrV+1SGum7Zn2gF3lD9sDCImQrzWgto/zYt07DUVQ1Tkmt7
	 Ea6p/wkaAcDGjsO26HeYX8pkEl7HJbSPIYNF5VfCBi5V4l4zijhX+YiBxoeAisl2G5
	 g/avmP7tgdTQhcoCpyNH72o9VX58QSG0aWtddZGU=
Message-ID: <6193f04f-d878-49db-9038-005d4f7bb04d@panix.com>
Date: Mon, 3 Mar 2025 04:39:23 -0800
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
References: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
 <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
 <992dba2a-4919-4f76-ac48-986792d5843c@panix.com>
 <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>
 <20250303104618.GP3713119@black.fi.intel.com>
 <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
 <20250303112149.GS3713119@black.fi.intel.com>
 <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
 <e557db09-2fe8-4a85-8d0a-4493aaa4f198@panix.com>
 <20250303115557.GU3713119@black.fi.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20250303115557.GU3713119@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/3/25 03:55, Mika Westerberg wrote:

>> I should clarify this to read "... as resume doesn't usually complete with
>> d6d... if an external USB-C DP tunneled monitor is connected."
> 
> Okay and this "external USB-C DP tunneled" monitor you have it connected to
> the TBT dock during the suspend? So you don't unplug plug or anything like
> that, just suspend the system and then resume?

While figuring it out, the issue only manifested itself if a USB-C DP 
monitor was connected on resume; it didn't matter if it were connected 
on suspend or not (nor which monitor).

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


