Return-Path: <linux-usb+bounces-31124-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D00C9E073
	for <lists+linux-usb@lfdr.de>; Wed, 03 Dec 2025 08:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9189C34AA7A
	for <lists+linux-usb@lfdr.de>; Wed,  3 Dec 2025 07:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF4B29D29F;
	Wed,  3 Dec 2025 07:17:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A5429B217;
	Wed,  3 Dec 2025 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764746220; cv=none; b=iFy5zPXWCpswfRmef4kFXaHaFgO9K9rDr0kGj4ZSh7qusrNJ8vnuYYz5M5I1ax3Y2jFO44gr/vp6p+iX3eaaofYoW9lDw8LEJoSWdDXwkCo+uAWeFjgRXmzPHG8AATLPC3Pk1x7o2UMk8enKUmYTtgZg+JufCJ8ha6IgNbsKaUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764746220; c=relaxed/simple;
	bh=07MeRoeHEzTXH+5WRLFEi0pUTbuy6UJQpDOEHqgT3Jc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E5iBT1l1dXmwSn6BsQOqZVOE4H1CYsxxkn3NMY6YXvcvzgaJc/BgL2lwDyeAEQr4tbgIvI0OWlQpMRhfpvzrY1m2CNib7TpoCDlCxZMPm6Hl7JiUzPnqv5Wi4K84p7RL739OinCJ1TfqW0yZ442nE2SR/H9Ca0AJ9FrTYGpi1V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 079b3f2ad01811f0a38c85956e01ac42-20251203
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:6a2d5b30-28de-42dd-bfd8-13664d20717a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:19b5817c2686cdcb81b57fc8d05533c2,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 079b3f2ad01811f0a38c85956e01ac42-20251203
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 615030204; Wed, 03 Dec 2025 15:16:47 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: stern@rowland.harvard.edu,
	benjamin.tissoires@redhat.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH v4] usb: usb-storage: No additional quirks need to be added to the EL-R12 optical drive.
Date: Wed,  3 Dec 2025 15:16:43 +0800
Message-Id: <20251203071643.57058-1-chenchangcheng@kylinos.cn>
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

base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.25.1


