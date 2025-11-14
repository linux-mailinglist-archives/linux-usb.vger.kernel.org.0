Return-Path: <linux-usb+bounces-30514-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F91C5C120
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 09:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9596035A971
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 08:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E404E3002A5;
	Fri, 14 Nov 2025 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KhwnSAEf"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F962FF664;
	Fri, 14 Nov 2025 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763109880; cv=none; b=fEUIADN1LmJp08Fw10agc26/JXMl2zd+QR4xR/U9e2mwBpdV+J1wtchLWgeb/hjV8Wsd3b4LkvctyV45vQkT0KXoHqU/ZHU8pmdCfAN29pdnZXHG+kIdgleVHds3e9V0X93kbCGfYvT/dK+MCUg+w6M1jR1WlkvxMMpgQsJAkpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763109880; c=relaxed/simple;
	bh=5hOs8hrq1T2N0jXZHV40N3n1KIHED4J0AbIKED+BapQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JdoysxzJm6oSR5vtkrWugvYCTn6ZpFCMIK+QwDAMXkDrsQ7GNl8MomQreTmgoWZXKeb6QtE/ZZ7Ds1r9j0REONPTBkKJH2FcVHeWewQspET/0xu4/B/69pM9vJ8jL2ZHREAEzKjQa9NWAjBLuKHAxqx/BmpZgXcvXNsDDw8tF2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KhwnSAEf; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wK
	ltRgeV5f8ijxMXtGur4wvTlRKdhRq8sGGWEwDL3nI=; b=KhwnSAEfe+tTdTnqNs
	O9cDVDBnKPIhm4E8eR/w/GYUQ0hW8nkPTJt46TxhQpoVQxZu1CefwLF1Z6EOJqGL
	wO2p9I7+ovKKIR33cnCxgm92Dtdgcl4le7VUgcqV+4QOx7hhVvkWPIK6uTh1Y+kB
	pagWrIfHCcT1E37TK6XOMi0gY=
Received: from hello.company.local (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBXQ9qT6xZpDvUzEA--.28676S2;
	Fri, 14 Nov 2025 16:43:00 +0800 (CST)
From: Liang Jie <buaajxlj@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Chen Ni <nichen@iscas.ac.cn>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Akash M <akash.m5@samsung.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Owen Gu <guhuinan@xiaomi.com>,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: liangjie@lixiang.com,
	fanggeng@lixiang.com,
	yangchen11@lixiang.com
Subject: [PATCH] usb: gadget: functionfs: use dma_buf_unmap_attachment_unlocked() helper
Date: Fri, 14 Nov 2025 16:42:44 +0800
Message-Id: <20251114084246.2064845-1-buaajxlj@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgBXQ9qT6xZpDvUzEA--.28676S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw15Gw47Jr4UuryrJr1DJrb_yoW8JFWrpr
	43WrWUCr15trWqva48AwnYvFWrAwsxWFW8AFZrX398ZFn8Wr92vr18tw1S9w13Gry8AanY
	v3Wj9r1FvFy7CFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URCJQUUUUU=
X-CM-SenderInfo: pexdtyx0omqiywtou0bp/1tbiNgQGIGkW5dV7SAABsp

From: Liang Jie <liangjie@lixiang.com>

Replace the open-coded dma_resv_lock()/dma_resv_unlock() around
dma_buf_unmap_attachment() in ffs_dmabuf_release() with the
dma_buf_unmap_attachment_unlocked() helper.

This aligns FunctionFS DMABUF unmap handling with the standard
DMA-BUF API, avoids duplicating locking logic and eases future
maintenance. No functional change.

Reviewed-by: fanggeng <fanggeng@lixiang.com>
Signed-off-by: Liang Jie <liangjie@lixiang.com>
---
 drivers/usb/gadget/function/f_fs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 47cfbe41fdff..7f8e566b1c57 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1306,9 +1306,7 @@ static void ffs_dmabuf_release(struct kref *ref)
 	struct dma_buf *dmabuf = attach->dmabuf;
 
 	pr_vdebug("FFS DMABUF release\n");
-	dma_resv_lock(dmabuf->resv, NULL);
-	dma_buf_unmap_attachment(attach, priv->sgt, priv->dir);
-	dma_resv_unlock(dmabuf->resv);
+	dma_buf_unmap_attachment_unlocked(attach, priv->sgt, priv->dir);
 
 	dma_buf_detach(attach->dmabuf, attach);
 	dma_buf_put(dmabuf);
-- 
2.25.1


