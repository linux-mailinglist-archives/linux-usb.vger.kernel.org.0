Return-Path: <linux-usb+bounces-38206-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAGpM7WiHGrjQwkAu9opvQ
	(envelope-from <linux-usb+bounces-38206-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 23:05:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 690D1617F49
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 23:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB4CF30054CC
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 21:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29D436C9EB;
	Sun, 31 May 2026 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKdrk9W6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A37A34B404;
	Sun, 31 May 2026 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780261553; cv=none; b=PQjebcubnGUW2G+fEUQjSinkMw6/BJOClVOH/woSffeFSOVN1jhg/ZF7If0DfSx02I7ZoptEaS2sm4AEx7qQxJcgEZ1vhA+e5EbO7DDUV23R6UOL7axDl//PzHROazxv4Wp2DgBKcM60lVOsBBaHD3qjbaYSwbBJnGCCfI+kH6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780261553; c=relaxed/simple;
	bh=+gtme44HgV3+0cY0fNPZva52Dkwj7je2hlaTW5P9DVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7FJ5ms3mmHmoM4w2rHG0LEgWwN2WUuwbgjCmxwiJ4vIj8K+ecStETkmBtZy4FVTde2uupLj841Oo/Bm6WfyvV7e7yXUKmlMXC1Jai6ProHU0v4WomH+lO8OjBzPLrli36oqgk2xy+NeIgg6XQUueQwWKsuPVhZfTIOUWWVX9NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKdrk9W6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0B52C2BCF4;
	Sun, 31 May 2026 21:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780261553;
	bh=+gtme44HgV3+0cY0fNPZva52Dkwj7je2hlaTW5P9DVU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IKdrk9W6L4eUJwNKBbYFpzoklAoF/W++dIAcDOEcBPOuTXRB7U2adGKVhYwGZPqpZ
	 FArn5mj2m6oXN5aY44bhkcwjc4amQh7ObrYvOwuaxIgEPxbKLQ5bPmSJ5MGUhDmajI
	 6KavCjLR8e/2kwXqLdIR4Y+JYuiG4vl1fbvGYCczN5YNY424iOFva1dMXLEr3RHXpO
	 rkRRBdcwqrZ1QWm2Vbf6n2qfV7NoBuddduYTtwXYdvxx4z1ukWv0dQdRzXt7Za881c
	 Hh8O6a57RtWzpKFGo/QSWOk/CtEDDQTvETkgA4oK1B7gPIjGohBnSA4nVeB7pGBjyt
	 yhY9i6NaH0Q4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD37CCD6E56;
	Sun, 31 May 2026 21:05:52 +0000 (UTC)
From: Gabriel Prostitis via B4 Relay <devnull+prostitisgabriel.gmail.com@kernel.org>
Date: Sun, 31 May 2026 23:04:40 +0200
Subject: [PATCH 1/2] USB: gadget: ffs: fix mm lifetime handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-mm-uaf-fix-v1-1-91571cc6ca46@gmail.com>
References: <20260531-mm-uaf-fix-v1-0-91571cc6ca46@gmail.com>
In-Reply-To: <20260531-mm-uaf-fix-v1-0-91571cc6ca46@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabriel Prostitis <prostitisgabriel@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780261550; l=2293;
 i=prostitisgabriel@gmail.com; s=20260530; h=from:subject:message-id;
 bh=la8smGq95XcSDzHNQL1zzeelJ5kGKb2oaQaJ/J86UgM=;
 b=bWD7quM1JesXEp+CJMNyh3twqqiiU88cfzLM0iyn8a96yeZe3ocz+jYu/9YcFi5h+Bt91fSDv
 ZuxZfjf8IzsB+A5i7SsBINrfyb1BOE9uHNsl8f/ZQ2QwMuLIf9Zmk00
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38206-lists,linux-usb=lfdr.de,prostitisgabriel.gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[prostitisgabriel@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.614];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 690D1617F49
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



