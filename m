Return-Path: <linux-usb+bounces-8149-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF208869A9
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 10:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D84C1C2200A
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 09:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD7821370;
	Fri, 22 Mar 2024 09:49:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A329417566
	for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 09:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711100966; cv=none; b=vDN/Fx+VYvFjwDQew23raxk+k5t3nxnjs/G+hUj897TBeWxDx2oGK9SshFDhZkc/M/tITaDPTpW1MOtmXy9owhFovF1zmxceh0tkW5i83zCu0RhZQHC8NDM6dgwcWiMwQgPgYdmF6KwxGVBlYOqUOIz/LBYLhShdu0p0xX162n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711100966; c=relaxed/simple;
	bh=3buljDP7ISVdORoHtzVZqpf3iccEzwTtOkvVUiftLNk=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=snvjBxwTyDmeRMupG6FP1uXCVEpYhxHky5BWYvy3BR3S1D3CR4dbesXyL+RL8N/UyXJc9IYnwKBPe7Yb7IuLdF3ltmKMJ7azjuFFFebR5S2hmHRvez+TskgN5FkIYZP7Fp1cCOoVD5TGLlDavU0xU6R5motXZnRnlMa+STqthBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.73.112) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 22 Mar
 2024 12:49:11 +0300
Subject: Re: [PATCH] usb: storage: isd200: fix sloppy typing in
 isd200_scsi_to_ata()
To: Alan Stern <stern@rowland.harvard.edu>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<linux-usb@vger.kernel.org>, <usb-storage@lists.one-eyed-alien.net>,
	<lvc-project@linuxtesting.org>
References: <e8c20e3c-3cbe-b5c1-f673-0a7f22566879@omp.ru>
 <4e13319d-30a8-4274-bfa0-36d915b1e1ec@rowland.harvard.edu>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <5ccbb639-10fd-ae7f-1c59-3c6f642275e9@omp.ru>
Date: Fri, 22 Mar 2024 12:49:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <4e13319d-30a8-4274-bfa0-36d915b1e1ec@rowland.harvard.edu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 03/22/2024 09:25:02
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 184345 [Mar 22 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 11 0.3.11
 5ecf9895443a5066245fcb91e8430edf92b1b594
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.73.112 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.73.112
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 03/22/2024 09:29:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 3/22/2024 6:00:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 3/22/24 3:57 AM, Alan Stern wrote:
[...]

>> When isd200_scsi_to_ata() emulates the SCSI READ CAPACITY command, the
>> capacity local variable is needlessly typed as *unsigned long* -- which
>> is 32-bit type on the 32-bit arches and 64-bit type on the 64-bit arches;
>> this variable's value should always fit into 32 bits for both the ATA and
>> the SCSI capacity data...
>>
>> While at it, arrange the local variable declarations in the reverse Xmas
>> tree order...
>>
>> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
>> analysis tool.
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> ---
>>  drivers/usb/storage/isd200.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Index: usb/drivers/usb/storage/isd200.c
>> ===================================================================
>> --- usb.orig/drivers/usb/storage/isd200.c
>> +++ usb/drivers/usb/storage/isd200.c
>> @@ -1283,8 +1283,8 @@ static int isd200_scsi_to_ata(struct scs
>>  
>>  	case READ_CAPACITY:
>>  	{
>> -		unsigned long capacity;
>>  		struct read_capacity_data readCapacityData;
>> +		u32 capacity;
> 
> This is a bit peculiar.  Why bother to change the type of the capacity 
> variable without also changing the types of lba and blockCount at the 
> start of the routine?

   The resason is simple: Svace didn't complain about those. I'll fix
them up in v2 if you;re not opposed to this patch...

> Alan Stern

MBR, Sergey

