Return-Path: <linux-usb+bounces-8176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB85C886F90
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 16:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7034EB239A0
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 15:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCD94D5A5;
	Fri, 22 Mar 2024 15:12:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29124644E
	for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 15:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711120375; cv=none; b=BF0ncdiO0dlPkMqK8mta2GP3K4Hj/lX4+7OnB1I0a378B0SSA5GgvanhDTmIl+wkTOMzVQ+ShO/E3ckczVmWEasjgd/3ZXieHp2013Mf1RIdk43p3WVOC0kjphCvCUYlVjhPGZzSG7r0SMtxXrRQK3grjcj4ULptNP4uUAtqhUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711120375; c=relaxed/simple;
	bh=OVaYD82hujmNUVFXhxbWGwQG520Ru2DlD4qoPhjDKYI=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=XR1sndYzx/3V7tEj0yttRjhI4n15zPI+B1OGt67jJW09Qs6Yq/XDeTiM/S0lMVzxNH0E45adqBkz33RxH9OczURdDHf1p1GopnegjnqkEV/3sWUO+qfQQS5f8B+ZBxeHYX1Z8bkniv39dx/dr3apMWuII0JlY3j5tKLD+EC4MAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (31.173.81.221) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 22 Mar
 2024 18:12:35 +0300
Subject: Re: [PATCH] usb: storage: isd200: fix sloppy typing in
 isd200_scsi_to_ata()
To: Alan Stern <stern@rowland.harvard.edu>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<linux-usb@vger.kernel.org>, <usb-storage@lists.one-eyed-alien.net>,
	<lvc-project@linuxtesting.org>
References: <e8c20e3c-3cbe-b5c1-f673-0a7f22566879@omp.ru>
 <4e13319d-30a8-4274-bfa0-36d915b1e1ec@rowland.harvard.edu>
 <6425997a-669b-919d-af44-880a7ce28ffc@omp.ru>
 <26d483d0-a89c-4c33-99f2-455f0f13e6e5@rowland.harvard.edu>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <43618519-0608-9306-35cc-87ebe47ea9c2@omp.ru>
Date: Fri, 22 Mar 2024 18:12:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <26d483d0-a89c-4c33-99f2-455f0f13e6e5@rowland.harvard.edu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 03/22/2024 14:50:40
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 184363 [Mar 22 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 11 0.3.11
 5ecf9895443a5066245fcb91e8430edf92b1b594
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.81.221 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.81.221
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 03/22/2024 14:55:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 3/22/2024 12:08:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 3/22/24 5:38 PM, Alan Stern wrote:
[...]

>>>> When isd200_scsi_to_ata() emulates the SCSI READ CAPACITY command, the
>>>> capacity local variable is needlessly typed as *unsigned long* -- which
>>>> is 32-bit type on the 32-bit arches and 64-bit type on the 64-bit arches;
>>>> this variable's value should always fit into 32 bits for both the ATA and
>>>> the SCSI capacity data...
>>>>
>>>> While at it, arrange the local variable declarations in the reverse Xmas
>>>> tree order...
>>>>
>>>> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
>>>> analysis tool.
>>>>
>>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>>>
>>>> ---
>>>>  drivers/usb/storage/isd200.c |    2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> Index: usb/drivers/usb/storage/isd200.c
>>>> ===================================================================
>>>> --- usb.orig/drivers/usb/storage/isd200.c
>>>> +++ usb/drivers/usb/storage/isd200.c
>>>> @@ -1283,8 +1283,8 @@ static int isd200_scsi_to_ata(struct scs
>>>>  
>>>>  	case READ_CAPACITY:
>>>>  	{
>>>> -		unsigned long capacity;
>>>>  		struct read_capacity_data readCapacityData;
>>>> +		u32 capacity;
>>>
>>> This is a bit peculiar.  Why bother to change the type of the capacity 
>>> variable without also changing the types of lba and blockCount at the 
>>> start of the routine?
>>
>>    The reason is simple: Svace didn't complain about those.
> 
> You shouldn't trust automated code checkers too far.  Always verify 

   I never do. In this case, Svace suggested a cast to 64-bit type to
avoid what it suspected to be an overflow. :-)

> their reports, and look around the vicinity to see if they missed 
> something obvious.

   Yeah, I forgot to do that. :-)

>>  I'll fix
>> them up in v2 if you're not opposed to this patch...
> 
> Sure, go ahead.

   OK! :-)

> Alan Stern

MBR. Sergey

