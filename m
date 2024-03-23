Return-Path: <linux-usb+bounces-8197-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 446AC887A3A
	for <lists+linux-usb@lfdr.de>; Sat, 23 Mar 2024 20:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64DD0281CA4
	for <lists+linux-usb@lfdr.de>; Sat, 23 Mar 2024 19:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B447A58AD2;
	Sat, 23 Mar 2024 19:56:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE8363D
	for <linux-usb@vger.kernel.org>; Sat, 23 Mar 2024 19:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711223761; cv=none; b=oT48mZfkzUw+bKo6A0o5iczMNPirEsgE6h84AtStvWKzehndz2kqjc/NLkU9Am9PczJk+iA/aXVDi+ZTBGsOFmN98PakJ9GfSYZ+gXt7RuUoohcpCvXvVCrVv/Xed7Lxn6UxDHZP1qCEX3tzKkyNMx9ox2vOZ36pX/4MgGnxHIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711223761; c=relaxed/simple;
	bh=IExXRiSPyxynzt3IO/TQX4mLcWI0/GJ2Z3HZfkCZexg=;
	h=From:Subject:To:CC:Message-ID:Date:MIME-Version:Content-Type; b=BLlbIR94mBs9yzHZPbFRZEKte4+4+M1jSw+nCNIwHdjq8I6Mv3Efpvh7DEDpcPiivLmsckqptGC/t+76trBOylzlWp7yGfWr98j0oxIU+totN4/UyK4IsAhUevzjQrLf727ws8a1KrZcFnvk9kq5nkQqAnuj1jFO35CYAKmZTNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.75.120) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Sat, 23 Mar
 2024 22:55:52 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2] usb: storage: isd200: fix sloppy typing in
 isd200_scsi_to_ata()
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<usb-storage@lists.one-eyed-alien.net>
CC: <lvc-project@linuxtesting.org>
Organization: Open Mobile Platform
Message-ID: <8d6beef7-5995-c831-a7b6-ff98d3887231@omp.ru>
Date: Sat, 23 Mar 2024 22:55:51 +0300
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
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 03/23/2024 19:05:56
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 184371 [Mar 23 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 11 0.3.11
 5ecf9895443a5066245fcb91e8430edf92b1b594
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.120
X-KSE-AntiSpam-Info: Rate: 0
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

When isd200_scsi_to_ata() emulates the SCSI READ/WRITE (10) commands,
the LBA is a 32-bit CDB field and the transfer length is a 16-bit CDB
field, so using *unsigned long* (which is 32-bit type on the 32-bit
arches and 64-bit type on the 64-bit arches) to declare the lba and
blockCount variables doesn't make much sense.  Also, when it emulates
the READ CAPACITY command, the returned LBA is a 32-bit parameter data
field and the ATA device CHS mode capacity fits into 32 bits as well,
so using *unsigned long* to declare the capacity variable doesn't make
much sense as well. Let's use the u16/u32 types for those variables...

Found by Linux Verification Center (linuxtesting.org) with the SVACE
static analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's usb.git repo...

Changes in version 2:
- fixed up the lba and blockCount variable declarations;
- removed the typecasts from the blockCount variable calculation;
- undid the reordering of the capacity variable declaration;
- completely rewrote the patch description.

 drivers/usb/storage/isd200.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

Index: usb/drivers/usb/storage/isd200.c
===================================================================
--- usb.orig/drivers/usb/storage/isd200.c
+++ usb/drivers/usb/storage/isd200.c
@@ -1232,8 +1232,8 @@ static int isd200_scsi_to_ata(struct scs
 	int sendToTransport = 1;
 	unsigned char sectnum, head;
 	unsigned short cylinder;
-	unsigned long lba;
-	unsigned long blockCount;
+	u32 lba;
+	u16 blockCount;
 	unsigned char senseData[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
 
 	memset(ataCdb, 0, sizeof(union ata_cdb));
@@ -1291,7 +1291,7 @@ static int isd200_scsi_to_ata(struct scs
 
 	case READ_CAPACITY:
 	{
-		unsigned long capacity;
+		u32 capacity;
 		struct read_capacity_data readCapacityData;
 
 		usb_stor_dbg(us, "   ATA OUT - SCSIOP_READ_CAPACITY\n");
@@ -1316,7 +1316,7 @@ static int isd200_scsi_to_ata(struct scs
 		usb_stor_dbg(us, "   ATA OUT - SCSIOP_READ\n");
 
 		lba = be32_to_cpu(*(__be32 *)&srb->cmnd[2]);
-		blockCount = (unsigned long)srb->cmnd[7]<<8 | (unsigned long)srb->cmnd[8];
+		blockCount = srb->cmnd[7] << 8 | srb->cmnd[8];
 
 		if (ata_id_has_lba(id)) {
 			sectnum = (unsigned char)(lba);
@@ -1348,7 +1348,7 @@ static int isd200_scsi_to_ata(struct scs
 		usb_stor_dbg(us, "   ATA OUT - SCSIOP_WRITE\n");
 
 		lba = be32_to_cpu(*(__be32 *)&srb->cmnd[2]);
-		blockCount = (unsigned long)srb->cmnd[7]<<8 | (unsigned long)srb->cmnd[8];
+		blockCount = srb->cmnd[7] << 8 | srb->cmnd[8];
 
 		if (ata_id_has_lba(id)) {
 			sectnum = (unsigned char)(lba);

