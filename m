Return-Path: <linux-usb+bounces-30883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1DEC8364F
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 06:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7A51834C26B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 05:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3A820FA81;
	Tue, 25 Nov 2025 05:32:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F5619E839;
	Tue, 25 Nov 2025 05:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764048734; cv=none; b=OBh6evvBDnTsI18h7OEliBLoRRcIAiYs5qwKakTWIl/GoSq1W1vU7WER0RNVcTj3TqAnEDnbGbgiGgnvYFD9MJAIf4QuIU+bvpV30FtCl1RL0uGk9pjd5Fi5yrs0OnhuszeYo4eavk0hxjqaU1JRH7Hki6T1Gow3MgcBEgM1b/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764048734; c=relaxed/simple;
	bh=qw8/uYRMptxs0uwQ83diseB8FzQ4VdZ+FopeAmroTv0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JCfFysv49yf5rfG7plMHkaGzPm26pFdfLslDmrBXsUfeuNhcqQqBYNfMqF2EYyDFgnaBu6bw+KGJZKWnsicAVlyZGEl8e0k4e/2ltXAbZQxUXVjwLQoYiJAdqelcpWo5AKt5e5c7QuYaHpqKhU3eZ++5qq2hQFn7bsk3J1X+FGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 14566bbcc9c011f0a38c85956e01ac42-20251125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:c276c7eb-facb-4905-b06d-14fcaa596025,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:c1720402816d83c615beab25c3c543c1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 14566bbcc9c011f0a38c85956e01ac42-20251125
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1266607559; Tue, 25 Nov 2025 13:32:06 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: stern@rowland.harvard.edu,
	benjamin.tissoires@redhat.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH v4] usb: usb-storage: No additional quirks need to be added to the EL-R12 optical drive.
Date: Tue, 25 Nov 2025 13:32:01 +0800
Message-Id: <20251125053201.31955-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The optical drive of EL-R12 has the same vid and pid as INIC-3069,
as follows:
T:  Bus=02 Lev=02 Prnt=02 Port=01 Cnt=01 Dev#=  3 Spd=5000 MxCh= 0
D:  Ver= 3.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
P:  Vendor=13fd ProdID=3940 Rev= 3.10
S:  Manufacturer=HL-DT-ST
S:  Product= DVD+-RW GT80N
S:  SerialNumber=423349524E4E38303338323439202020
C:* #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=144mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=02 Prot=50 Driver=usb-storage
E:  Ad=83(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=0a(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms

This will result in the optical drive device also adding
the quirks of US_FL_NO_ATA_1X. When performing an erase operation,
it will fail, and the reason for the failure is as follows:
[  388.967742] sr 5:0:0:0: [sr0] tag#0 Send: scmd 0x00000000d20c33a7
[  388.967742] sr 5:0:0:0: [sr0] tag#0 CDB: ATA command pass through(12)/Blank a1 11 00 00 00 00 00 00 00 00 00 00
[  388.967773] sr 5:0:0:0: [sr0] tag#0 Done: SUCCESS Result: hostbyte=DID_TARGET_FAILURE driverbyte=DRIVER_OK cmd_age=0s
[  388.967773] sr 5:0:0:0: [sr0] tag#0 CDB: ATA command pass through(12)/Blank a1 11 00 00 00 00 00 00 00 00 00 00
[  388.967803] sr 5:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current]
[  388.967803] sr 5:0:0:0: [sr0] tag#0 Add. Sense: Invalid field in cdb
[  388.967803] sr 5:0:0:0: [sr0] tag#0 scsi host busy 1 failed 0
[  388.967803] sr 5:0:0:0: Notifying upper driver of completion (result 8100002)
[  388.967834] sr 5:0:0:0: [sr0] tag#0 0 sectors total, 0 bytes done.

For the EL-R12 standard optical drive, all operational commands
and usage scenarios were tested without adding the IGNORE_RESIDUE quirks,
and no issues were encountered. It can be reasonably concluded
that removing the IGNORE_RESIDUE quirks has no impact.

Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
---
 drivers/usb/storage/unusual_uas.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index 1477e31d7763..939a98c2d3f7 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -98,7 +98,7 @@ UNUSUAL_DEV(0x125f, 0xa94a, 0x0160, 0x0160,
 		US_FL_NO_ATA_1X),
 
 /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
-UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
+UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x0309,
 		"Initio Corporation",
 		"INIC-3069",
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,

base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
-- 
2.25.1


