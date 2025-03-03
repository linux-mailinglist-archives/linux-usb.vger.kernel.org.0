Return-Path: <linux-usb+bounces-21266-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A11A4BF3F
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 12:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F29DF3A6DBA
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 11:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA53205AAA;
	Mon,  3 Mar 2025 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="crC4VRyr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38392205506
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 11:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002340; cv=none; b=UoTOR5us2HL21Mu9EkfCyyUy38JzRy35ugFSoJSWBbLoJflBRtR1RMXj2T9oLjLOqIM6ULjyWs5jtpHumcGoJiJAnSY9FcM6lp+Ea+vI/wBJiRgJEneb+rIkwzMWOK8w4k7Xn71foknP87oJ4ba0LKYGugxJU4qsQtaFlex3YK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002340; c=relaxed/simple;
	bh=go19A7bZGBAMw+9839eqkISnLwX/LKuy4HK0iw0XQwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smvj1n7C9OHLKE0J3vqPRv3YKr/Vx2ba4Trtly1UMkMOx9aeMzwjtN04vCWmRmmzDzpvpMH5BRHxkWkQF1UOMcTgrqZAgS+IG98DvUzyCkcHYYuvEuQsp8EWbmwFE8w8jEe1OMj//wWmbjUBXJ/dRd4vHRZY+FBE5zkPzUOrwJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=crC4VRyr; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.189] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z5xp95rwzz4st7;
	Mon,  3 Mar 2025 06:45:37 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741002338; bh=go19A7bZGBAMw+9839eqkISnLwX/LKuy4HK0iw0XQwM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=crC4VRyrInOAC1CoH5YwIkMIlfQI3jVG8Z27EQiVGe+obcBtIvOuvCEyydbN91e6t
	 aTatiaAZ7V3+7vhgB4yoxcm9pctvqmh3NT8hxUtd9SXDsB+Uz1XhTSAO161S8qZzBG
	 hXR1Oi8fCS+nva/scxNQX6/v3GNV9x9FHkrKoFfU=
Message-ID: <e557db09-2fe8-4a85-8d0a-4493aaa4f198@panix.com>
Date: Mon, 3 Mar 2025 03:45:36 -0800
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
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/3/25 03:38, Kenneth Crudup wrote:

> It'll have to be more pstore dumps, as resume doesn't (usually) complete 
> with d6d458d42e1.

I should clarify this to read "... as resume doesn't usually complete 
with d6d... if an external USB-C DP tunneled monitor is connected."

And suspend/hibernate resumes work flawlessly on my machine with Linus' 
unchanged master if I have no NVMe adaptors connected at suspend, and/or 
if I have no USB-C DP tunneled monitors connected at resume.

-K

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


