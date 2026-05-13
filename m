Return-Path: <linux-usb+bounces-37426-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ClOHssFBWpRRgIAu9opvQ
	(envelope-from <linux-usb+bounces-37426-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 01:14:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4C753BD66
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 01:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E9DA30CC4EC
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 23:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1413655F5;
	Wed, 13 May 2026 23:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgVg3lJp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB083C13F0
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 23:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778713851; cv=none; b=Oxvq2/JaTgSeHmO8LMwHgDjtt5PbBPng94nVMFd8H6vHgu/XCDfFVkf63x9B0B0k9szMhj5nUl7urXn1WpYODOSh0KtNPDep2T6QmL+66vgzbtwZXZ5aJjU35uuSJKo1eXi+IsLGLfnmR5SSPGxG39NenrM9+YeV/pfiebSvOLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778713851; c=relaxed/simple;
	bh=W9yeG+3Ka2cA0xHkYcdXnWyiOeXCVFl/QwdWlrW/2F4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O5pWiipKevdfIJY/jpzkK3YINHbBUXrFbEg32+BUYczTd2wicxx26X53YlAj4TysKXimpXh7M58YZJrC0v9PIs3oFmx4TbPHBc+1Ur84rfYMzCWe1vZvFTE7YOl0Ab3LIYK+rE+ZisFzKPOy+WME2FqCuInFsJx0WR+5tg2YDcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgVg3lJp; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1332772f6b3so5839188c88.1
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 16:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778713850; x=1779318650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qim8OJlV4e6gO+wndPww4vOZ3ay7Pc4+ciEhjYKer88=;
        b=JgVg3lJpEB3dXwiw2aAmVtOfaoRQ3GhWoPtX/E//rDoyjShf7xfo0Xr4nYTysB44xw
         j4OfdhuSEkmk2ll80KO0vieLo9NQY6YJHh6bVYyydIGFd3+3Y13r4bREg90zcEhrm83D
         kiuXDW84Qki5THEkaPypJB5KXR0J2kmyKmu9GfY/Ezj4k1SdJb796f/YbpHPwPXds/6C
         W8xY7wQtoNcBgFoFrcs9Ksx1cKmdHojCYfj+Q7g8OeynphGTU9sD9CpAFJ0G0hRyC8Dm
         vRVIHfLSiaT4jyzth08YQ4rKMmJqAIT63qxbnTWJTXnEmAopZXCTks47TJSvTulkybyF
         ssuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778713850; x=1779318650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qim8OJlV4e6gO+wndPww4vOZ3ay7Pc4+ciEhjYKer88=;
        b=MFIJ773hf5+FCqq+vvoTfhgWmD9/jCTyf8q0YsHr2QNv3PlNsAWUmnPMFf2u5ep1eo
         ic4HG0fnkWuIM48ldK7SSpUMiI6o50IVAhptgNch2PKj/aMVfujUT96ynBxuG9Myviox
         IyNkpOyTbW0OOLiar1ap2D7ebc9b2b9EkmG3jIQj3gYgD8NtZrHVj9Z3CHFiMCM4KflT
         KKMnTWBema5Fwp0/zkYCmZkI5hQlwJzDIdzGg7sPi8ESEZMEE8/G5TtzpfR8ujkcptSB
         xUElg8fEeyCfSPiMSg4zjRaAA/jiPu8q5wSrt8EDeHdaycoBZkrXiYeHU0iTmpj30Q8p
         OqDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9S4L1ScRIztJtuK5uha9HrV1tj/6atBqc1XBscEiqychE3Ny+Znw7dOLNmdt1hg7EWwDiymbLggW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoy5jDoWmx9zyh+gV06SObbRCsyG4VayCn7+ls9hww/mRpI5rr
	XG5kq9fQndXnawbZddqH5A9g565f0Xb8Dgklf8l+OQqfj1YwuVwIPVYM
X-Gm-Gg: Acq92OFMHytrrElvH2N8dgv/gNlbGI09aX/zHdFvx5VcXybb5EKh3uBBZU7s7jrvU96
	FbVeh8ufKdWv8BZBZWn1Bs3GD54SQ4g7qCuzp/jo71zxQxisMaI21t41tLLtRpEV087sATVM3+s
	n1L3Wi41k9xWRZq6VQfOIXnTLR/w+oY6C9UtlxhVJqsf+KeG6c17lvO33QPTRQQTN/EiiMTtIP/
	4E/k9zTvM17xHk/iAUR54ygC4sEMx5b9Z26hCYnpUHbkArla8a5GH99Qx3X2MsJRR4DXFJ3gtqp
	xRTfYLhrnur0Ocwc4ik7Yq4RjIeMCbIG6AnGOIzyhtJ9ocVvmqwDWJgwrvxOOLIyTfnGeat1n80
	ffRAL4XOGvEZFNYoNDWzQvSpzW8zhdSJfleu4AwViEp04m37+6Jvis+ziDECZuXG35dikCexL6/
	H42cB6R7QXHk3P4LHPbH5RDuP/2VOa2kRQh85jiPJq6HwDDt/Rt42PAKUC5VXUGWPjqEH9LcndP
	w==
X-Received: by 2002:a05:7022:b8d:b0:12d:de3f:d84b with SMTP id a92af1059eb24-13436baee2amr3317677c88.36.1778713849690;
        Wed, 13 May 2026 16:10:49 -0700 (PDT)
Received: from gio.tailc60d82.ts.net (209-147-138-114.nat.asu.edu. [209.147.138.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e686sm1046968eec.5.2026.05.13.16.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 16:10:49 -0700 (PDT)
From: Giorgi Kobakhia <mrkobush@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Giorgi Kobakhia <mrkobush@gmail.com>
Subject: [PATCH usb v4] usb: gadget: f_fs: fix NULL dereference in ffs_dmabuf_detach()
Date: Wed, 13 May 2026 16:10:41 -0700
Message-ID: <20260513231041.77176-1-mrkobush@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EC4C753BD66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37426-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mrkobush@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

ffs_dmabuf_detach() dereferences ffs->gadget->dev.parent without
checking whether the FunctionFS instance is still bound to UDC.

This can be triggered by mounting FunctionFS, binding it to UDC
instance. Then unbind would make ffs->gadget = NULL. Calling
ffs_epfile_ioctl with code FUNCTIONFS_DMABUF_DETACH ends up in
ffs_dmabuf_detach, dereferencing ffs->gadget.

Crash Log:
Oops: general protection fault
KASAN: null-ptr-deref in range [0x00000000000000b0-0x00000000000000b7]
RIP: 0010:ffs_epfile_ioctl+0x3f1/0x25d0

Fix this by checking ffs->gadget under ffs->mutex, taking a reference
to the parent device before dropping the lock, and returning -ENODEV
if the gadget has already been removed.

Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
Signed-off-by: Giorgi Kobakhia <mrkobush@gmail.com>
---
 drivers/usb/gadget/function/f_fs.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 002c3441bea3..67c8e65a5aa6 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1553,14 +1553,27 @@ static int ffs_dmabuf_detach(struct file *file, int fd)
 {
 	struct ffs_epfile *epfile = file->private_data;
 	struct ffs_data *ffs = epfile->ffs;
-	struct device *dev = ffs->gadget->dev.parent;
+	struct device *dev;
 	struct ffs_dmabuf_priv *priv, *tmp;
 	struct dma_buf *dmabuf;
 	int ret = -EPERM;
 
+	mutex_lock(&ffs->mutex);
+	if (!ffs->gadget) {
+		mutex_unlock(&ffs->mutex);
+		return -ENODEV;
+	}
+	dev = get_device(ffs->gadget->dev.parent);
+	mutex_unlock(&ffs->mutex);
+
+	if (!dev)
+		return -ENODEV;
+
 	dmabuf = dma_buf_get(fd);
-	if (IS_ERR(dmabuf))
-		return PTR_ERR(dmabuf);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto out_put_dev;
+	}
 
 	mutex_lock(&epfile->dmabufs_mutex);
 
@@ -1585,6 +1598,8 @@ static int ffs_dmabuf_detach(struct file *file, int fd)
 	mutex_unlock(&epfile->dmabufs_mutex);
 	dma_buf_put(dmabuf);
 
+out_put_dev:
+	put_device(dev);
 	return ret;
 }
 
-- 
2.43.0


