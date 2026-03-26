Return-Path: <linux-usb+bounces-35488-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEwhMvXjxGmR4wQAu9opvQ
	(envelope-from <linux-usb+bounces-35488-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 08:44:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E860E33095E
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 08:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39D30303D667
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 07:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BBB3559E6;
	Thu, 26 Mar 2026 07:44:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06C6340A4D;
	Thu, 26 Mar 2026 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511041; cv=none; b=IbmcgyBRX0AbvxA3PnhV/eGKkjSUxv07cA80ElirRAGKnHaqgUv5qUJmoW3fk1/jHxvAXIKwh3sHj+EHLHuYdE5uNs18FZ28tRhO5EjK5bjD13NkG5e8SIUKOpHBgzNZYes8+CJSbGjbw21eP5b+6duIXaWupxBXfFc8ZLCEVKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511041; c=relaxed/simple;
	bh=8vQf2XpumdKYL6RjH6P9UfBQywWH10KQ0V4TK6VIe/w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DRSDxaipLrVajnX2HNOMII53mPoWrYhAGBmob/BqgRmwprc/20Z9qLAYWEr4Wv/gsOvGtwtKdUNCriT7Ntj48AjFr03sNMpE5Ee6xdxyYrXPuvA2F9tngr2axNm6vgbExe2cUzR7JBIHF706BOKv7ELERnlnhmi4ZTb3hWIcvWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 872808cc28e711f1a21c59e7364eecb8-20260326
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:6fadd06a-3d81-4995-81ed-82af430ba47a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:142bb7b69ee90ca6917af1bd1d7363f7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 872808cc28e711f1a21c59e7364eecb8-20260326
X-User: cuiyudong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <cuiyudong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 794868314; Thu, 26 Mar 2026 15:43:49 +0800
From: cuiyudong <cuiyudong@kylinos.cn>
To: Andrey Konovalov <andreyknvl@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <kees@kernel.org>,
	Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: raw_gadget: fix double free in raw_release
Date: Thu, 26 Mar 2026 15:43:32 +0800
Message-Id: <20260326074332.34305-1-cuiyudong@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35488-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[kylinos.cn];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[cuiyudong@kylinos.cn,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,appspotmail.com:email,kylinos.cn:email,kylinos.cn:mid]
X-Rspamd-Queue-Id: E860E33095E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

raw_release() had duplicate kref_put() which caused KASAN double-free.
The extra put inside the unregister block is removed to balance refcount.

BUG: KASAN: double-free in dev_free+0x424/0x740
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Tested-by: syzbot+25612fe5ab3dcafc3aab@syzkaller.appspotmail.com
Reported-by: syzbot+25612fe5ab3dcafc3aab@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/69c401ad.a70a0220.23629d.0000.GAE@google.com/
Signed-off-by: cuiyudong <cuiyudong@kylinos.cn>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7ca..a1fd3fdf1323 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -465,12 +465,10 @@ static int raw_release(struct inode *inode, struct file *fd)
 			dev_err(dev->dev,
 				"usb_gadget_unregister_driver() failed with %d\n",
 				ret);
-		/* Matches kref_get() in raw_ioctl_run(). */
-		kref_put(&dev->count, dev_free);
 	}
 
 out_put:
-	/* Matches dev_new() in raw_open(). */
+	/* Matches dev_new() in raw_open() and kref_get() in raw_ioctl_run(). */
 	kref_put(&dev->count, dev_free);
 	return ret;
 }
-- 
2.25.1


