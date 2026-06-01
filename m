Return-Path: <linux-usb+bounces-38220-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD96GVgqHWozWAkAu9opvQ
	(envelope-from <linux-usb+bounces-38220-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 08:44:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCF161A4FC
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 08:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B85B3013720
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 06:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6997C377EC3;
	Mon,  1 Jun 2026 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAS52JzZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DCB372073;
	Mon,  1 Jun 2026 06:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296266; cv=none; b=F4PWsnuSwtncIDASK8bj6KdQyS/nWibaDsL0wu7ZGSBoDRx2RkBRuY16AaKjfhrchWzqilgqxNGd2kLs3i23Lh+7YL01hHyveb6EjW8x3TB4htVADUyXeupIem0SibsBlOUFSveYTEoTYrskBO7RQaUhLDjTLfw3jyxWaY4tN+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296266; c=relaxed/simple;
	bh=WCbOLxFUV0QLywWJhTzGFRg5X3sxPSaFz6qNgPK6iRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L4dQY8SbjSz5HcshYssbSdoRvjjS5nSxp8vnBkdadMY2LWd4BQwbjy1nGN6Oqenr/cZpCOlHWalBxFE42e07mBbIuaDEtVeVZUBGTHaf4owyQvJXmZXZIwOGJstrE2pizX2/MKF4O0g3U3RENysitxVpAO01wRg555sr1uKjwJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAS52JzZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4880C2BCB8;
	Mon,  1 Jun 2026 06:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780296265;
	bh=WCbOLxFUV0QLywWJhTzGFRg5X3sxPSaFz6qNgPK6iRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TAS52JzZXqUK9HzKR35G1RVWxxWq2oqRCoqW8jxxaFVY4Mc9Ex/wqHeAfEm9c8nji
	 eteW08Prpi6GOWtcpDRRy/vVQUo0xprsk/o7yAeYp2pM124kUpU5Xy/6VEkEbaqZV5
	 La7dJyARilrCOXA/NuidKzUqNZbwzYSGLUcnga44dUJ0uSW0kXqsMEDIW6WragT/VD
	 NfZwVXOhRxFrHulWloIGBPp3lRl4P5mcQZUtLoxs51hoEfLxmeitllq4VDblGGpxgd
	 gAEip0z8ThTj+6iYjn0pbJ1R/T1b3Fn1K5RYNpTO/Lu5xl2Dx/FhKrQgybY93ho/Lb
	 lUm3m1QQ2FegQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90859CD6E4C;
	Mon,  1 Jun 2026 06:44:25 +0000 (UTC)
From: Gabriel Prostitis via B4 Relay <devnull+prostitisgabriel.gmail.com@kernel.org>
Date: Mon, 01 Jun 2026 08:44:10 +0200
Subject: [PATCH v2 1/2] USB: gadget: ffs: fix mm lifetime handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-mm-uaf-fix-v2-1-3c942a707bce@gmail.com>
References: <20260601-mm-uaf-fix-v2-0-3c942a707bce@gmail.com>
In-Reply-To: <20260601-mm-uaf-fix-v2-0-3c942a707bce@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780296264; l=2354;
 i=prostitisgabriel@gmail.com; s=20260530; h=from:subject:message-id;
 bh=kDFgF/tmW6e4B/A/2GNFzOidvQvMfaHIaYLNjoEdlzI=;
 b=7DMWgLVyYoO8yOpjk1Y8GF/8nh1t2Wta0nagKVo+eB2LD7B/b41KWSyQ+uMWVoYfn/C42mcB4
 No/eeVm75OzBEvB2qmykffoMh56oLtoV00lkKOgOq4ZZD96A7gr083b
X-Developer-Key: i=prostitisgabriel@gmail.com; a=ed25519;
 pk=FwuU+O6ZnvvnFVA45nfqkGlhSmC1P64HLtxRgBebOuY=
X-Endpoint-Received: by B4 Relay for prostitisgabriel@gmail.com/20260530
 with auth_id=800
X-Original-From: Gabriel Prostitis <prostitisgabriel@gmail.com>
Reply-To: prostitisgabriel@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38220-lists,linux-usb=lfdr.de,prostitisgabriel.gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.588];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	HAS_REPLYTO(0.00)[prostitisgabriel@gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3CCF161A4FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Gabriel Prostitis <prostitisgabriel@gmail.com>

io_data stores a pointer to the submitting task's mm_struct,
but does not currently hold a reference to it while async
requests are pending.

This can result in a use-after-free if the task exits before
completion handling finishes.

Take a reference with mmgrab() when queuing the read request
and release it with mmdrop() on request completion.

Reported-by: Gabriel Prostitis <prostitisgabriel@gmail.com>
Signed-off-by: Gabriel Prostitis <prostitisgabriel@gmail.com>
---
 drivers/usb/gadget/function/f_fs.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 002c3441bea3..674f2fd5450f 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -864,9 +864,15 @@ static void ffs_user_copy_worker(struct work_struct *work)
 	bool kiocb_has_eventfd = io_data->kiocb->ki_flags & IOCB_EVENTFD;
 
 	if (io_data->read && ret > 0) {
-		kthread_use_mm(io_data->mm);
-		ret = ffs_copy_to_iter(io_data->buf, ret, &io_data->data);
-		kthread_unuse_mm(io_data->mm);
+		if (mmget_not_zero(io_data->mm)) {
+			kthread_use_mm(io_data->mm);
+			ret = ffs_copy_to_iter(io_data->buf, ret, &io_data->data);
+			kthread_unuse_mm(io_data->mm);
+			mmput(io_data->mm);
+		} else {
+			ret = -EFAULT;
+		}
+		mmdrop(io_data->mm);
 	}
 
 	io_data->kiocb->ki_complete(io_data->kiocb, ret);
@@ -1261,16 +1267,20 @@ static ssize_t ffs_epfile_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 
 	kiocb->private = p;
 
-	if (p->aio)
+	if (p->aio) {
+		mmgrab(p->mm);
 		kiocb_set_cancel_fn(kiocb, ffs_aio_cancel);
+	}
 
 	res = ffs_epfile_io(kiocb->ki_filp, p);
 	if (res == -EIOCBQUEUED)
 		return res;
-	if (p->aio)
+	if (p->aio) {
+		mmdrop(p->mm);
 		kfree(p);
-	else
+	} else {
 		*from = p->data;
+	}
 	return res;
 }
 
@@ -1305,14 +1315,17 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 
 	kiocb->private = p;
 
-	if (p->aio)
+	if (p->aio) {
+		mmgrab(p->mm);
 		kiocb_set_cancel_fn(kiocb, ffs_aio_cancel);
+	}
 
 	res = ffs_epfile_io(kiocb->ki_filp, p);
 	if (res == -EIOCBQUEUED)
 		return res;
 
 	if (p->aio) {
+		mmdrop(p->mm);
 		kfree(p->to_free);
 		kfree(p);
 	} else {

-- 
2.54.0



