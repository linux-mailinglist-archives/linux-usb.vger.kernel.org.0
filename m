Return-Path: <linux-usb+bounces-25354-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE24AEF69A
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 13:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA6C74A4F02
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 11:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794CE272E47;
	Tue,  1 Jul 2025 11:32:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1435D235346
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 11:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369530; cv=none; b=aIq0oLXxPUxpvqYfV11uEfnQTr+0h3TrwRyr4b86F4ABlS0a5vbfXHjWUJ9bic8e1yx9kpEYpnSVslAl1kzIkarIw9cr0gz7D4efG4FdqM9tWzfjnIxOaKWTnqajbnkCb/SKi3YVsih0B7Efr62N6FZeIUUMpjKwXZFJqZG8pdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369530; c=relaxed/simple;
	bh=kXP0FYMPdUyxS1WOqt2Bx0D+msT86T3evOVTjWTI+Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pAKxB01zmi+vmFyA/BuG1LHbRQPb4eE+yJBb8565LGLg2/bRmOhz/PsbACXY39PCMt8KiB7E1fUjznYmQiSxVMAGuPYGmDytlKzuNdaFSp5pf4RUPfp3FSDPAzRgifWnBuVVjq7NrL5+h5YHvaklZajLlBJF2rGI61bYmV8dRck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 2A439402CD82;
	Tue,  1 Jul 2025 13:24:26 +0200 (CEST)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH] usb: gadget: f_fs: Remove unnecessary spinlocks.
Date: Tue,  1 Jul 2025 13:24:13 +0200
Message-ID: <20250701112413.27680-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1751369066178

Commit 24729b307eefc ("usb: gadget: f_fs: Fix race between aio_cancel()
and AIO request complete") moved the call to usb_ep_free_request() from
ffs_epfile_async_io_complete() to ffs_user_copy_worker().

In ffs_user_copy_worker(), ki_complete() is called before
usb_ep_free_request().  Once ki_complete() returns, ffs_aio_cancel() can
no longer be invoked for the completed kiocb, as ki_complete() removes it
from the &ctx->active_reqs list in aio.c.  ffs_aio_cancel() only applies
to kiocb instances still present on this list.

The potential race between ki_complete() and ffs_aio_cancel() is already
guarded by the &ctx->ctx_lock spinlock in aio.c.

As a result, there is no race condition between the usb_ep_dequeue() call
in ffs_aio_cancel() and the usb_ep_free_request() call in
ffs_user_copy_worker().  Consequently, the spin lock/unlock operations on
&io_data->ffs->eps_lock are no longer necessary.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/gadget/function/f_fs.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 2dea9e42a0f..48c190c61b1 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -867,10 +867,7 @@ static void ffs_user_copy_worker(struct work_struct *work)
 	if (io_data->ffs->ffs_eventfd && !kiocb_has_eventfd)
 		eventfd_signal(io_data->ffs->ffs_eventfd);
 
-	spin_lock_irqsave(&io_data->ffs->eps_lock, flags);
 	usb_ep_free_request(io_data->ep, io_data->req);
-	io_data->req = NULL;
-	spin_unlock_irqrestore(&io_data->ffs->eps_lock, flags);
 
 	if (io_data->read)
 		kfree(io_data->to_free);
@@ -1215,15 +1212,11 @@ static int ffs_aio_cancel(struct kiocb *kiocb)
 	unsigned long flags;
 	int value;
 
-	spin_lock_irqsave(&epfile->ffs->eps_lock, flags);
-
 	if (io_data && io_data->ep && io_data->req)
 		value = usb_ep_dequeue(io_data->ep, io_data->req);
 	else
 		value = -EINVAL;
 
-	spin_unlock_irqrestore(&epfile->ffs->eps_lock, flags);
-
 	return value;
 }
 
-- 
2.50.0


