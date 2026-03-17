Return-Path: <linux-usb+bounces-34931-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJg1OpZPuWnj/wEAu9opvQ
	(envelope-from <linux-usb+bounces-34931-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 13:56:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAF92AA408
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 13:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C36D3063067
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 12:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BB63C6A20;
	Tue, 17 Mar 2026 12:56:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE9C3C6617
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752195; cv=none; b=EQvtMFPHehrJ2+qkPdhl44x29H+CynVpLD2AU/C5lIwlcFdPoKA3wlXOA6YHd84/hHotddTrSWRC875AExMHtuG7lhyfEU758lTaW5d2tUlSKl1sf49vwO9cvmC+aFipbDlDG5N4vZ80I8gKLILnj9YmsAvOLoh9UoOaZ2FBtpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752195; c=relaxed/simple;
	bh=JWggV038qNZoZ+I5yCUze21qBahrSF6wBCnAX06yxcM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Sn1Qx8RqUv7BEo7YVdEroJOVJbxVetEy+4RDuSoW+zzCmoAsZbfX4tR342JBzfHBmc1/aVtQzNhOewD1dAasH0jRZGomeMyQAQFWhFfNtNvZ5s6He7ypj6Q5iajgLiuOQARIYopSlUvH04J2QnaYFy5AgWJQmG3kw0dAkWFqkgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b6189ad6220011f1a21c59e7364eecb8-20260317
X-CID-CACHE: Type:Local,Time:202603172046+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:5f2c0374-2307-4730-a92e-6d25309d01bf,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:2a56c87a134b30f417d614ef4e4257f0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b6189ad6220011f1a21c59e7364eecb8-20260317
X-User: shitao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <shitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 37075564; Tue, 17 Mar 2026 20:56:27 +0800
From: shitao <shitao@kylinos.cn>
To: zaitcev@redhat.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	shitao <shitao@kylinos.cn>
Subject: [PATH v2] usb: usblp: add the reset_resume function interface
Date: Tue, 17 Mar 2026 20:56:14 +0800
Message-Id: <20260317125614.3215254-1-shitao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-0.925];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[kylinos.cn];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kylinos.cn:email,kylinos.cn:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shitao@kylinos.cn,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-34931-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4]
X-Rspamd-Queue-Id: 8AAF92AA408
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add reset_resume callback to prevent premature device unbinding during
S4 (hibernation) thaw phase, which would otherwise cause usblp to require
a re-probe — a process that is slow and trigger error -517, and even
has a high probability of causing use-after-free bugs and kernel panics.

Problem:
When a USB printer(CH340S USB-to-parallel adapter ID 1a86:7584)
is connected during S4 hibernation,the following sequence occurs:

1. During thaw phase, USB core sets udev->reset_resume = 1
2. usb_resume_interface() checks for driver->reset_resume callback
3. If not implemented, interface is marked as needs_binding=1
4. usb_resume() calls unbind_marked_interfaces()
5. This forces disconnect via usb_forced_unbind_intf()
6. usblp_disconnect() immediately frees usblp structure if !usblp->used
7. However, PM subsystem still has references (usage_count > 0)
8. Subsequent PM callbacks access freed memory (0x6b6b6b6b SLAB poison)
9. Result: kernel panic in pm_op() with use-after-free

The bug manifests as:
Unable to handle kernel paging request at virtual address 006b6b6b6b6b6b93
pc : pm_op+0x50/0x80
Call trace:
pm_op+0x50/0x80
dpm_resume+0xdc/0x200
hibernation_snapshot+0x234/0x3d8

Signed-off-by: shitao <shitao@kylinos.cn>
---
 drivers/usb/class/usblp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index 669b9e6879bf..d0e286fe7108 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -1473,6 +1473,7 @@ static struct usb_driver usblp_driver = {
 	.disconnect =	usblp_disconnect,
 	.suspend =	usblp_suspend,
 	.resume =	usblp_resume,
+	.reset_resume =	usblp_resume,
 	.id_table =	usblp_ids,
 	.dev_groups =	usblp_groups,
 	.supports_autosuspend =	1,
-- 
2.25.1


