Return-Path: <linux-usb+bounces-35492-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNvPEvvsxGm+5AQAu9opvQ
	(envelope-from <linux-usb+bounces-35492-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 09:23:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA5A3313D4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 09:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34059300C38D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 08:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B8B38C2DB;
	Thu, 26 Mar 2026 08:23:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF90634D3A5;
	Thu, 26 Mar 2026 08:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513389; cv=none; b=bEBaDWWRnx3jI7J+S5Ri8s+q1rCXGNcQG+fihFn6enV+RFhKsnlzGKHfkMjsqW2IpDJiOGTU1zMLqdy/+KZjQ/0h4L2mS5qnpquhH24gnohQ/I50Glz5Mj1M8eeLL7vK2AnAWotO7GqmjeAsNedXAExYhWAiIv+FggtmoET/1F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513389; c=relaxed/simple;
	bh=qEG9vdVahhvIuwcyP+tsgzm0OFe9nueSPkN7PwT9zNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iH7lAcESLb2R3RJY1tHo1XNuwlJDQwWAoDzo3Ym6GtPd4c7vfIWC7Akb0qlfl27/d3Ck5GcQt1EcjyUE3NuTCKXL36sjLhlxMBlWDU4gst9nNYQ+SQcOqQJ+t9+LnM04+zH2WJoNhCL2bpwtQdeTazeTMfBvQHQINBrqD4K1UK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: fe23452228ec11f1a21c59e7364eecb8-20260326
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:b596755d-891a-4166-bd95-e322802c5790,IP:20,
	URL:0,TC:0,Content:0,EDM:-20,RT:0,SF:5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-INFO: VERSION:1.3.11,REQID:b596755d-891a-4166-bd95-e322802c5790,IP:20,UR
	L:0,TC:0,Content:0,EDM:-20,RT:0,SF:5,FILE:0,BULK:0,RULE:EDM_GE969F26,ACTIO
	N:release,TS:5
X-CID-META: VersionHash:89c9d04,CLOUDID:dfbf92b15722b387ba97234406aead83,BulkI
	D:260326162258MEO55VSQ,BulkQuantity:0,Recheck:0,SF:19|38|66|72|78|102|127|
	850|898,TC:nil,Content:0|15|50,EDM:1,IP:-2,URL:99|1,File:nil,RT:nil,Bulk:n
	il,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BR
	E:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_AEC,TF_CID_SPAM_FSD,TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fe23452228ec11f1a21c59e7364eecb8-20260326
X-User: cuiyudong@kylinos.cn
Received: from localhost.localdomain [(183.242.174.21)] by mailgw.kylinos.cn
	(envelope-from <cuiyudong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1836722074; Thu, 26 Mar 2026 16:22:56 +0800
From: cuiyudong <cuiyudong@kylinos.cn>
To: Andrey Konovalov <andreyknvl@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <kees@kernel.org>,
	Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: gadget: raw_gadget: fix double free in raw_release
Date: Thu, 26 Mar 2026 16:22:45 +0800
Message-Id: <20260326082245.39394-1-cuiyudong@kylinos.cn>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35492-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[kylinos.cn];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[cuiyudong@kylinos.cn,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kylinos.cn:email,kylinos.cn:mid]
X-Rspamd-Queue-Id: 4EA5A3313D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In raw_release(), when unregister == true, there are two kref_put() calls:
1. Inside the unregister block (extra)
2. At out_put label

The refcount increments are:
- 1 ref from dev_new() in raw_open()
- 1 ref from kref_get() in raw_ioctl_run()

Total: 2 references.

The original code performed 3 kref_put() operations, which causes the refcount
to drop below zero and leads to a double free in dev_free().

Remove the extra kref_put() inside the unregister block to balance the
reference counter correctly.

Since the extra kref_put() triggers an immediate use-after-free condition
on the dev structure, KASAN reports a double-free instead of a refcount warning.

BUG: KASAN: double-free in dev_free+0x424/0x740
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
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


