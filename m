Return-Path: <linux-usb+bounces-25357-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C66AEF6AD
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 13:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 120C17ABA6C
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 11:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD312727E3;
	Tue,  1 Jul 2025 11:36:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B466C26FDA4
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 11:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369783; cv=none; b=OBkqZgin998OJSF1wqXz5cxC6XoL8f4pNkfoRCzR9RzCZP2Qtt0PuRZ3RUsxtWZ+X8xq4Wf/F/1L8Byt7ook64Pjg1tr/X+QfnTrUtlUA89XNQvMOB+S4Rkbw86UucCIW4zM73480AcBrhPTbJcCG0hgdhxjApmXylOmi/i1Xls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369783; c=relaxed/simple;
	bh=gQ4e2khnLccyu6h0U4orr2ovX04CwZuG6wEKucpEY1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iO4MJ/Xjj9cPBm+qiBF/ldMj3Teu09od6RegDQtdE9vR/5umOfecH5HXqi+MsEUOJghBN4uL8asZBFPbjzCnIV6dDzKbQJ2Hpz0kcguiMX7iQf15u031rklsCK/6GUvclfbtHBk3sdS4hcfrvDotXagnxfZs+d3io2/OZQr00r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id A1A2F4F9EC95;
	Tue,  1 Jul 2025 13:36:16 +0200 (CEST)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v2 1/1] usb: gadget: f_fs: Remove unnecessary spinlocks.
Date: Tue,  1 Jul 2025 13:36:02 +0200
Message-ID: <20250701113602.33402-2-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701113602.33402-1-ingo.rohloff@lauterbach.com>
References: <20250701113602.33402-1-ingo.rohloff@lauterbach.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1751369776707

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
 drivers/usb/gadget/function/f_fs.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 2dea9e42a0f..f4ca6c0b42d 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -854,7 +854,6 @@ static void ffs_user_copy_worker(struct work_struct *work)
 						   work);
 	int ret = io_data->status;
 	bool kiocb_has_eventfd = io_data->kiocb->ki_flags & IOCB_EVENTFD;
-	unsigned long flags;
 
 	if (io_data->read && ret > 0) {
 		kthread_use_mm(io_data->mm);
@@ -867,10 +866,7 @@ static void ffs_user_copy_worker(struct work_struct *work)
 	if (io_data->ffs->ffs_eventfd && !kiocb_has_eventfd)
 		eventfd_signal(io_data->ffs->ffs_eventfd);
 
-	spin_lock_irqsave(&io_data->ffs->eps_lock, flags);
 	usb_ep_free_request(io_data->ep, io_data->req);
-	io_data->req = NULL;
-	spin_unlock_irqrestore(&io_data->ffs->eps_lock, flags);
 
 	if (io_data->read)
 		kfree(io_data->to_free);
@@ -1211,19 +1207,13 @@ ffs_epfile_open(struct inode *inode, struct file *file)
 static int ffs_aio_cancel(struct kiocb *kiocb)
 {
 	struct ffs_io_data *io_data = kiocb->private;
-	struct ffs_epfile *epfile = kiocb->ki_filp->private_data;
-	unsigned long flags;
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


