Return-Path: <linux-usb+bounces-26914-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2023BB285A9
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 20:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72C48A22FFA
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 18:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3874830DEC3;
	Fri, 15 Aug 2025 18:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b="RN9mvhe4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.valdk.tel (mail.valdk.tel [185.177.150.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2611F4CB7
	for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 18:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.177.150.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755281598; cv=none; b=PAi5wqdeYSXr/kiBlm1bupcAlmcCZpuXurGsnjNqpJj5xs5y9/Ro5uF4rxldHQX2JEyRpFCGWTE6U+XE3O+8NMezBESz0NiEBnXVNxzDdLRPSQf3fExXeveybOIqr9iDIzr+CwW6NTgnqP9iaty2piHOZXwwSSIBEkSdG5CaZWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755281598; c=relaxed/simple;
	bh=bgVAydOzKFTh+97R10ClKStn5SSdTxXkg+uvwFUGDZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTCsei+IMnM/HKBdCN1TAExRrowdhcRST+XU4xlykfypEQBbEfiGTzHmFob9C8zxu69VqoVL0y4rsH4vllti2rVFI2u6amYUHR/4Cj/ScA2FxTeAtz+HeDlOrO+VtwSkcdKSz1KPVYujCPbwlANHDUWPPezYzYrYdIB5eY3M158=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru; spf=pass smtp.mailfrom=valdikss.org.ru; dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b=RN9mvhe4; arc=none smtp.client-ip=185.177.150.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valdikss.org.ru
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 690E31BC553F;
	Fri, 15 Aug 2025 21:13:09 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
	s=msrv; t=1755281591;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=1Wz8KOpG2XcbiuHEdHXgfExG0fc6VgjPShAV0f+LBkA=;
	b=RN9mvhe4KMqSosqW2Mwuil3yLmm2v6eZrhCCJ7bvf7XP9/n5nzjXw916285m+0ZECIdAMK
	vfbV4eGLBdQyHY4+RBLoRpN/5aD6j+62t4jv1G8SAwSXXgtHPMPaEYSYwO5eVkpIg3flD3
	F3eMZSl1Ys2P2MFCOc5Mn+qsYQz+oBiHgjU+ZpmVzIqKb9AJw+Q09kzv9XJfRqLsHUMA0P
	Lfw37etTiDczQf8ZLx4ZI4CXE8ciCzSpwajirPMemQcwq8T3bTNY2Yh+Z/phSKdvuemjQC
	IvAyvAJrx91qigG/YwFOBPktsv8UCFu3sfVOQs04Z5F2BuPn81gskqHO9lhAZA==
Message-ID: <9013fce0-6764-49b1-9e54-68e915e12d7c@valdikss.org.ru>
Date: Fri, 15 Aug 2025 21:13:09 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB 1.1 Full Speed OHCI slow/high latency
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
References: <3fe845b9-1328-4b40-8b02-61a879bea6df@valdikss.org.ru>
 <6017298f-fc03-41c9-b0e3-a74180f4c9a1@rowland.harvard.edu>
 <f2c433ae-f9d0-4beb-a2c7-84d2fd68e02e@valdikss.org.ru>
 <d41d8488-9438-430a-88ab-f845df3655e1@rowland.harvard.edu>
 <2bf5c54e-7dac-4673-a696-e09eb8d459d5@valdikss.org.ru>
 <7bfaeea9-6eb1-4e49-af8a-77940fdb70fc@rowland.harvard.edu>
 <e5d73b85-9c7f-4c74-9a00-700b4b6e7d70@valdikss.org.ru>
 <da6326e4-9b47-4347-a044-879b4be58560@rowland.harvard.edu>
Content-Language: ru, en-US
From: ValdikSS <iam@valdikss.org.ru>
Autocrypt: addr=iam@valdikss.org.ru; keydata=
 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
 OEcVmRU/pw5/zoQyQg==
In-Reply-To: <da6326e4-9b47-4347-a044-879b4be58560@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 15.08.2025 8:07 PM, Alan Stern wrote:
>> However the printout is still not in full. Now the same picture prints about
>> 4/5 of the page, but still not 100% (previously it failed on 1/3).
>>
>> Would the .pcap of the printing process be useful?
> 
> I rather doubt it.  You might be able to figure something out by looking
> at the timing of the various transfers, particularly near the end when
> the underflow occurred.  But I don't even know what the printer's timing
> requirements are (and maybe you don't either).
> 
> Overall this probably isn't a battle worth fighting.  Either just attach
> the printer to a high-speed hub or get a better printer.

I *buy* these legacy devices to improve them in Linux :)

I'm making an open-source print server hardware for older printers, 
that's why for me this issue is worth researching, at least to document 
such hardware heisenbugs.
There've been different USB behavior and incompatibilities with scanners 
(fixed it in SANE) and printers (fixed by CUPS quirks file), but this is 
the first time I'm going down to USB HC level.

This printer (Canon LBP1120) does not have drivers for 64-bit Windows or 
recent macOS, that's why for many it's a paperweight device you can't 
use or sell, unless fixed by other means (usually a VM with 32-bit 
Windows, and now my print server as well).

You gave me directions where I should look for, because I didn't know 
how to start debugging without the logic analyzer.
Usbmon captures only USB communication packets and some of USB HUB 
controlling packets (such as TT related), but does not include 
device-controlling MMIO registers, which was the case here.

I'll add debug prints to everything related to MMIO and take a look what 
could be improved. Thanks!
If you have other ideas I could try right away, please share them!


