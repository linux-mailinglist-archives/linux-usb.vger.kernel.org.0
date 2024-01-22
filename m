Return-Path: <linux-usb+bounces-5380-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C8783714A
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 19:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 122821C29D78
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 18:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1234D597;
	Mon, 22 Jan 2024 18:27:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD12E3FB3B
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 18:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705948022; cv=none; b=YH6V4rkuIeKwYwqGLX+ETFE5SdrIDxOgKZKVTCUiSuFwOC+WuDgX6UHp9nfZhDdezt8+wCcF/Ag3p5iLNrewSV+UKbv60dGDf8cHpq9he0pjeNBwSohqnyZsOcOBE8lfiZlnBCijfMhTkgLNPY++2vKY/4kkFWlx4ebC9xYk/+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705948022; c=relaxed/simple;
	bh=bNFBVFToKumMFw+2LP5xx1n7dIHH9I74ABaQyUKVh/c=;
	h=Subject:From:To:CC:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=BKIWzfKN/5poUFBzvurHshtSqH4M5ilz+E4Cr8R1NNLk/0Be15BA9YEs1+Yljet/eSrnvvWMhyAZSOBDq8/EFW0397jXI+chjKKNzd/2nsSHRsPHT5sp/Tz565vx/gYHRTBt0Hf9l6ICQqHpf3KZBzFgv/ITEC93UygEPyP92eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (31.173.84.58) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 22 Jan
 2024 21:26:52 +0300
Subject: Re: [PATCH] usb: storage: freecom: drop useless assignment in
 init_freecom()
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Alan Stern <stern@rowland.harvard.edu>, <linux-usb@vger.kernel.org>,
	<usb-storage@lists.one-eyed-alien.net>
References: <4d3fb70f-bf2f-96cc-a8fb-1ef658a24920@omp.ru>
 <2023120412-observing-affluent-9432@gregkh>
 <b96dc0cc-86da-425b-86b8-39566f594d83@omp.ru>
Organization: Open Mobile Platform
Message-ID: <cc7434e0-804c-82d6-3f57-dcceef8b461e@omp.ru>
Date: Mon, 22 Jan 2024 21:26:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <b96dc0cc-86da-425b-86b8-39566f594d83@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 01/22/2024 18:08:31
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 182837 [Jan 22 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.84.58
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 01/22/2024 18:14:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 1/22/2024 4:27:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 12/7/23 7:16 PM, Sergey Shtylyov wrote:

[...]
>>> In init_freecom(), the results of usb_stor_control_msg() calls are stored
>>> in the local variable and then printed out by usb_stor_dbg() (if enabled),
>>> except for the 1st call, the result of which is completely ignored.  Drop
>>> the useless assignment.
>>
>> Instead, you should check the return value and handle it properly, don't
>> just drop the checking entirely, that's not good.
> 
>    Hmm... I wonder if you'd actually read the patch...
>    I'm not dropping any checking because there's none, even at the further
> call sites of usb_stor_control_msg() -- the most init_freecom() currently
> is doing is printing out the result of the calls...

   Alan, haven't heard your opinion on this patch... What do you think?

[...]

MBR, Sergey

