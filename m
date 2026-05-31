Return-Path: <linux-usb+bounces-38205-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BfDMLmiHGrtQwkAu9opvQ
	(envelope-from <linux-usb+bounces-38205-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 23:06:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EF7617F59
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 23:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AECA7300E270
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 21:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EB736C0AC;
	Sun, 31 May 2026 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSxhA4hE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2EA34B1B0;
	Sun, 31 May 2026 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780261553; cv=none; b=kgGBwWVkhSo7akiiYj4Gl6bK4WFTOGpFPJkeWrr0a5cWqvrdroAWBL7smndOFKUwCINvOD7llfpFCYPenA8fnoAISCUJ3wsy/GljxCG36Gu6EZvXVYNrRCk/+IlPh05kafedfF4iHqugmQk4jA96mDW8miwSOw1X+FUnSCfpRDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780261553; c=relaxed/simple;
	bh=i6wVPsKwuCpGC/ZVYlaGjJ3RExM3Y7x8ptFNTiMS+Ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAR4a3rq2QaVrv3bIOeorxnysCNNW7lpZHi7IQg7CHP35CKc2X9pBk6fCaiWuL04zFQLMiT+vfFeW1Ot7w10W02Yp2G5qMrdtLIicAlEl4FA+Rhs//eUrX5jZc7rUKFFrmpIy65uNeuF8QNUjKUeVMLLU76eQqfSz2EU7eTjCCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSxhA4hE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04B3DC2BCC6;
	Sun, 31 May 2026 21:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780261553;
	bh=i6wVPsKwuCpGC/ZVYlaGjJ3RExM3Y7x8ptFNTiMS+Ss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HSxhA4hEigVunz5sofuTK2vqXtlrxsy9mE1MlfHl8zGze6zwxbE/BxOza51Tx2AaH
	 UW0Z30wdafl80bY2etggWlgurMjP3gEyZPKh9Xp/HR56gI69kkcPcPtgc8i/3Wg/5U
	 dR+xPY4JeVlLm0y8V6tmHZMrtZ6A12YPJuci/3Vh/qlVktUlu7Yqe1Kxlnm8fT1l5O
	 FG/UoLx7pXeBl0rfDUXcMrNDTAcHM6GguVUJ0CqFE8OJlR93Ipra2Bdmckfds7S9KX
	 +tjAb+GvnMb4ZWNjMt0Dz3rVl6PeqT+IXr8YG1XNO2ns/6AE96NgNHr7SXRzpTv7fr
	 P6vEkSI6xK4kg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD66CD6E5F;
	Sun, 31 May 2026 21:05:52 +0000 (UTC)
From: Gabriel Prostitis via B4 Relay <devnull+prostitisgabriel.gmail.com@kernel.org>
Date: Sun, 31 May 2026 23:04:41 +0200
Subject: [PATCH 2/2] USB: gadget: inode: fix mm lifetime handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-mm-uaf-fix-v1-2-91571cc6ca46@gmail.com>
References: <20260531-mm-uaf-fix-v1-0-91571cc6ca46@gmail.com>
In-Reply-To: <20260531-mm-uaf-fix-v1-0-91571cc6ca46@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabriel Prostitis <prostitisgabriel@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780261550; l=2138;
 i=prostitisgabriel@gmail.com; s=20260530; h=from:subject:message-id;
 bh=vEsZ4QwqvYlH70rsOhB9QVTgchod8aGQd1KQsxPk2MY=;
 b=CBMq6EY2jYW4/qQuk4vuyeWMbY/35Da4Bx0LXIeCPcDKA4uhhbwz2m2t2EByNaQw3putwapkH
 cfOA3ye99+DB0OWBbu0xy8d5KHCejS5yQQp21HaO4GpBjo0xSlsf4lI
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38205-lists,linux-usb=lfdr.de,prostitisgabriel.gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[prostitisgabriel@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.621];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 42EF7617F59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Gabriel Prostitis <prostitisgabriel@gmail.com>

priv stores a pointer to the submitting task's mm_struct,
but does not currently hold a reference to it while async
requests are pending.

This can result in a use-after-free if the task exits before
completion handling finishes.

Take a reference with mmgrab() when queuing the read request
and release it with mmdrop() on request completion.

Signed-off-by: Gabriel Prostitis <prostitisgabriel@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51510..f9b7199afc9e 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -471,11 +471,17 @@ static void ep_user_copy_worker(struct work_struct *work)
 	struct kiocb *iocb = priv->iocb;
 	size_t ret;
 
-	kthread_use_mm(mm);
-	ret = copy_to_iter(priv->buf, priv->actual, &priv->to);
-	kthread_unuse_mm(mm);
-	if (!ret)
+	if (mmget_not_zero(mm)) {
+		kthread_use_mm(mm);
+		ret = copy_to_iter(priv->buf, priv->actual, &priv->to);
+		kthread_unuse_mm(mm);
+		mmput(mm);
+		if (!ret)
+			ret = -EFAULT;
+	} else {
 		ret = -EFAULT;
+	}
+	mmdrop(mm);
 
 	/* completing the iocb can drop the ctx and mm, don't touch mm after */
 	iocb->ki_complete(iocb, ret);
@@ -501,6 +507,7 @@ static void ep_aio_complete(struct usb_ep *ep, struct usb_request *req)
 	 * complete the aio request immediately.
 	 */
 	if (priv->to_free == NULL || unlikely(req->actual == 0)) {
+		mmdrop(priv->mm);
 		kfree(req->buf);
 		kfree(priv->to_free);
 		kfree(priv);
@@ -540,6 +547,7 @@ static ssize_t ep_aio(struct kiocb *iocb,
 	get_ep(epdata);
 	priv->epdata = epdata;
 	priv->actual = 0;
+	mmgrab(priv->mm);
 	priv->mm = current->mm; /* mm teardown waits for iocbs in exit_aio() */
 
 	/* each kiocb is coupled to one usb_request, but we can't
@@ -570,6 +578,7 @@ static ssize_t ep_aio(struct kiocb *iocb,
 
 fail:
 	spin_unlock_irq(&epdata->dev->lock);
+	mmdrop(priv->mm);
 	kfree(priv->to_free);
 	kfree(priv);
 	put_ep(epdata);

-- 
2.54.0



