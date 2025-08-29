Return-Path: <linux-usb+bounces-27377-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD67B3C1EB
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 19:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 574D9A65EBE
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 17:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39ED342CA5;
	Fri, 29 Aug 2025 17:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XQpGV7oa"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718C632039E
	for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 17:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756489050; cv=none; b=JeZHFBbeGMogUnqlFOiVuFKDkR4d4qJsl1TNAtnTb0tVhapWQYjUQDWDa32e4Arc/bBvuC8H5QSmAbqfDd2xrWyOGJy1F/l2VTCrTgFcHdaqYUo3dRW2tepW849gff7WOpRx0suqvuiOveJN5Ex9Hsf0F+sTClpoKDVCH0mgQI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756489050; c=relaxed/simple;
	bh=M/hExav9Xf8wlFlLlJR3qGS+Zsw4qlq2yy3Q39AMSKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YnEl6asGg+kVGfdMVQmiX0+H8QRkYfQ0+CnDMMuHafP1u/2SVwHuM3XHznYSFEtl+gjSXRGzMKMhilBBcJJkCNBftzzK+/Y8vTc415u7cTJFOJzffA+cMUbRvqJEy8M9ub6pFWt+V06HF9j7gXOA4GziD8dfZTeNjpWEQPrCmZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XQpGV7oa; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756489045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fQHgnqOU9CkWBF0G4dgcqMNTJNphTU7t7PVKAz+jZPE=;
	b=XQpGV7oaHrRy7WAW4Z2XHEp4cYENzpLyk90t2X/pWbtEq8biVo9vgG6k8o0vdmdtlfH17g
	btIRlhRE4sCOk8pDYVJ+ZUMhRb5m8UXd6EHgqvLcm535my9ZnivQsS4NIQGObIhtUUxtkx
	qlJS3ZbcCUWfrnwuWmVoL2PrGupscL0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Pete Zaitcev <zaitcev@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: usblp: Use min_t() to improve usblp_read()
Date: Fri, 29 Aug 2025 19:37:12 +0200
Message-ID: <20250829173713.56222-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use min_t() to improve usblp_read() and avoid calculating
'avail - usblp->readcount' twice. Use min_t(ssize_t,,) instead of min()
to avoid a signedness error.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/usb/class/usblp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index acbefccbdb2a..a7a1d38b6bef 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -34,6 +34,7 @@
 
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/minmax.h>
 #include <linux/sched/signal.h>
 #include <linux/signal.h>
 #include <linux/poll.h>
@@ -871,7 +872,7 @@ static ssize_t usblp_read(struct file *file, char __user *buffer, size_t len, lo
 		goto done;
 	}
 
-	count = len < avail - usblp->readcount ? len : avail - usblp->readcount;
+	count = min_t(ssize_t, len, avail - usblp->readcount);
 	if (count != 0 &&
 	    copy_to_user(buffer, usblp->readbuf + usblp->readcount, count)) {
 		count = -EFAULT;
-- 
2.50.1


