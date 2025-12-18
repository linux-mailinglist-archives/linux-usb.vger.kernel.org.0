Return-Path: <linux-usb+bounces-31561-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D37C8CC9F8A
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 02:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5189301CE44
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 01:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7623D246781;
	Thu, 18 Dec 2025 01:23:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797C417993;
	Thu, 18 Dec 2025 01:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766021019; cv=none; b=XK0h7oUF5yiUmiNsUz8dYIB713At1xwJBvhLXddrffD2p8SVYe8NYfM34X/nLdvSpMvltIDPDFKiVIXNP2NiTINlSjTRRhYH5fHryAayXnsPsR7l8f1ey197d+esl5JLW/8bWNsezfQ5qQ4utRCMsySIO5vIhW64n4dJoVGpkpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766021019; c=relaxed/simple;
	bh=owTcddv7RF9Y0LfNuJ6MwkOqRGjwjeA6qDX3nRSBX2E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b6xgU7KvOpbdFuJmrGDcR9BJFdRHycBNy4eSbTtUUVvy3+4n8PjTOxJHEipl8if1CgGtxuNmeqy/H8mq1mQLkTNWMPljiFlI30Ix9H5mB+nesCncqzyOmI+K76dV5KBZ6+R98eXOd7OzswNA2R7+gYleEXXs2T4nIv8c8ohLFck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 26851a0cdbb011f0a38c85956e01ac42-20251218
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:ae838289-0e07-430a-b776-d16e64193318,IP:0,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:a9d874c,CLOUDID:efd1571e05068cb2657850fa52ef3274,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 26851a0cdbb011f0a38c85956e01ac42-20251218
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 695676132; Thu, 18 Dec 2025 09:23:25 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: stern@rowland.harvard.edu,
	benjamin.tissoires@redhat.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH] usb: usb-storage: Maintain minimal modifications to the bcdDevice range.
Date: Thu, 18 Dec 2025 09:23:18 +0800
Message-Id: <20251218012318.15978-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We cannot determine which models require the NO_ATA_1X and
IGNORE_RESIDUE quirks aside from the EL-R12 optical drive device.

Fixes: 955a48a5353f ("usb: usb-storage: No additional quirks need to be added to the EL-R12 optical drive.")
Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
---
 drivers/usb/storage/unusual_uas.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index b695f5ba9a40..939a98c2d3f7 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -98,7 +98,7 @@ UNUSUAL_DEV(0x125f, 0xa94a, 0x0160, 0x0160,
 		US_FL_NO_ATA_1X),
 
 /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
-UNUSUAL_DEV(0x13fd, 0x3940, 0x0309, 0x0309,
+UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x0309,
 		"Initio Corporation",
 		"INIC-3069",
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.25.1


