Return-Path: <linux-usb+bounces-8198-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 118EA887A3C
	for <lists+linux-usb@lfdr.de>; Sat, 23 Mar 2024 20:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEFC1281D98
	for <lists+linux-usb@lfdr.de>; Sat, 23 Mar 2024 19:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6112959149;
	Sat, 23 Mar 2024 19:59:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6A82E410
	for <linux-usb@vger.kernel.org>; Sat, 23 Mar 2024 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711223988; cv=none; b=PDVN4Ar9At6at8T2xN3MhmqVhUwJfoMGMM/G4m1N9sUQzre1oITZBQ77q/7vr1g3AMcJDWcLRPryt5zMSyauSR7l8ie2xLKIqdM6E5BYtFMOSrF9UBhlBgEjMX09kFCLQ5q6q5YszZs+S6lIMxOzNe0d8X/U57kSC/c1VEhH9x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711223988; c=relaxed/simple;
	bh=r/L6gYZV9/pgvew1Sb4isd9818FCSoKccu1n89RKSks=;
	h=Subject:From:To:CC:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YeFlJtlv+0qkNMvK7ZD6A6+ZQ7UnWshMbOqkx7pkA7FFQE/TyscPUDZMMGbkK5szUBA5RKARDYEdnwvgYJsUdlkYqBfLrRujgQeEvgXo6jemvR5ei4FpdYoYOOdLMqnuSGdQF5nhNPu4lSmAHJGntzuVaJbJ+3c8w3kNwxaAbZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.75.120) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Sat, 23 Mar
 2024 22:59:36 +0300
Subject: Re: [PATCH v2] usb: storage: isd200: fix sloppy typing in
 isd200_scsi_to_ata()
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<usb-storage@lists.one-eyed-alien.net>
CC: <lvc-project@linuxtesting.org>
References: <8d6beef7-5995-c831-a7b6-ff98d3887231@omp.ru>
Organization: Open Mobile Platform
Message-ID: <6b2428d3-294e-6f5a-2106-0833746df3d1@omp.ru>
Date: Sat, 23 Mar 2024 22:59:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8d6beef7-5995-c831-a7b6-ff98d3887231@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 03/23/2024 19:05:56
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 184371 [Mar 23 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 11 0.3.11
 5ecf9895443a5066245fcb91e8430edf92b1b594
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.120
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 03/23/2024 19:10:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 3/23/2024 4:01:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 3/23/24 10:55 PM, Sergey Shtylyov wrote:

> When isd200_scsi_to_ata() emulates the SCSI READ/WRITE (10) commands,
> the LBA is a 32-bit CDB field and the transfer length is a 16-bit CDB
> field, so using *unsigned long* (which is 32-bit type on the 32-bit
> arches and 64-bit type on the 64-bit arches) to declare the lba and
> blockCount variables doesn't make much sense.  Also, when it emulates
> the READ CAPACITY command, the returned LBA is a 32-bit parameter data
> field and the ATA device CHS mode capacity fits into 32 bits as well,

   Oops, it should have been s/CHS mode//... :-/

> so using *unsigned long* to declare the capacity variable doesn't make
> much sense as well. Let's use the u16/u32 types for those variables...
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE
> static analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey


