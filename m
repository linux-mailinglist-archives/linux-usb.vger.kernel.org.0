Return-Path: <linux-usb+bounces-8136-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 765818861D6
	for <lists+linux-usb@lfdr.de>; Thu, 21 Mar 2024 21:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1589E1F232AD
	for <lists+linux-usb@lfdr.de>; Thu, 21 Mar 2024 20:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F416C1353E0;
	Thu, 21 Mar 2024 20:43:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EB312CD89
	for <linux-usb@vger.kernel.org>; Thu, 21 Mar 2024 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711053824; cv=none; b=MRgf0ExdmmLjrH3yl6CggLL8QZo3mdyQbYK9vhHe72U9vKt72+0uE09B1fTraC6UPJVGxthwt/EQJJWDtA6Zi1Ts1itxu0WE2cAw6M+wrMt+9jUCEs/MhWjV2c5NY6pVDyo/6tn4E7dmPHH0UsWH6sOWz9DnjyhZcxQxDxNFxUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711053824; c=relaxed/simple;
	bh=tErsr9IkwRGjgR4SciABiD+yMYq7YpBaeE57q1US3l4=;
	h=From:Subject:To:CC:Message-ID:Date:MIME-Version:Content-Type; b=Rpb/VY266d/fab1TmzhL5St7GUxrl0fNtG02vVMUQGDMUBuzN2/qguGF9Um+FLim2eXGWO4RgOhWPtd0Yysz2fKLgFZ9mzsH6UlsJcdfAI7x27BXWkFHn60AN6GLyTJn+4LseqHfWmvmm2L8WIUyiE0lL+nRDJMqopPnP4/X5YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (31.173.84.168) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 21 Mar
 2024 23:43:38 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: storage: isd200: fix sloppy typing in
 isd200_scsi_to_ata()
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<usb-storage@lists.one-eyed-alien.net>
CC: <lvc-project@linuxtesting.org>
Organization: Open Mobile Platform
Message-ID: <e8c20e3c-3cbe-b5c1-f673-0a7f22566879@omp.ru>
Date: Thu, 21 Mar 2024 23:43:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 03/21/2024 20:27:00
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 184337 [Mar 21 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 11 0.3.11
 5ecf9895443a5066245fcb91e8430edf92b1b594
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.84.168
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 03/21/2024 20:32:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 3/21/2024 6:05:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

When isd200_scsi_to_ata() emulates the SCSI READ CAPACITY command, the
capacity local variable is needlessly typed as *unsigned long* -- which
is 32-bit type on the 32-bit arches and 64-bit type on the 64-bit arches;
this variable's value should always fit into 32 bits for both the ATA and
the SCSI capacity data...

While at it, arrange the local variable declarations in the reverse Xmas
tree order...

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
 drivers/usb/storage/isd200.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: usb/drivers/usb/storage/isd200.c
===================================================================
--- usb.orig/drivers/usb/storage/isd200.c
+++ usb/drivers/usb/storage/isd200.c
@@ -1283,8 +1283,8 @@ static int isd200_scsi_to_ata(struct scs
 
 	case READ_CAPACITY:
 	{
-		unsigned long capacity;
 		struct read_capacity_data readCapacityData;
+		u32 capacity;
 
 		usb_stor_dbg(us, "   ATA OUT - SCSIOP_READ_CAPACITY\n");
 

