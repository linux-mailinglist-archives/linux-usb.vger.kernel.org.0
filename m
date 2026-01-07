Return-Path: <linux-usb+bounces-32026-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC55D00527
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 23:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFDFE302515D
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 22:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861F52E62B3;
	Wed,  7 Jan 2026 22:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUFQ031O"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A6A272E6A;
	Wed,  7 Jan 2026 22:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767825024; cv=none; b=Ru/3bTNw1lWcjcVpgwaG0H9w0fKY0vfi6coSB/ew6K/sgyFt+6dSLnTXuAcupWLZ7vE8MGiYh8zBJG/BTp46LyfAYUWciJ36RfiJqZVoX8LWXhubHPydDtuIIMf8fGBJL5cev9fIT+3utCU3GACLxTZtVR7JYS0Dh3oDHVFx3i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767825024; c=relaxed/simple;
	bh=dAkL02zScBnfhvBN0iyFjLy5tFVm0EOYNgAKlrJBcqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fX0l0LfP/tT3PSm/zg2MPDM1ukX9Dq7myF4xmr3oPzk1vwwJU3kxJT/xlO7hd40DWKdpMvH45TbGZ9Yn2yeX4JAHjUMquVGHEWIqHOJ0h9ixawBSkSyEW4mNtI3amQnFtpUGGQgTjsBf0YuG/JbOB/KgcaAC7FLfu4fs3zNnMIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUFQ031O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC70AC19422;
	Wed,  7 Jan 2026 22:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767825023;
	bh=dAkL02zScBnfhvBN0iyFjLy5tFVm0EOYNgAKlrJBcqA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mUFQ031OIDdHVpiPJgURqQqcD72V0AJ08IkvAc1oayCIClXqRSNUBO8+oN1bCqRRg
	 RioOvsbwQlUwRV+y9n63IrkS2ewo4qbdF9T27R2NM7hEc0+SpdgjEdNMERMJp0fj41
	 Nuc5EhScswf4PDPhnQE8qybp4q49cnIwtahgpiBtQIkZeficCzslJxepolvJ/P6+7e
	 6XElQvhfFRXEZjJpeEPgQt496/qzN2jbcJMqP3m3yVRdbMB3bdGRk6BMkpBAgU12jU
	 vL+zxupenhp8DSXsMZCVh2Df9e+nHq0ng43nKBg37zlaK1frvLW5nrJVMFbEyGL7U0
	 pu46pYprky02g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A031BD0D178;
	Wed,  7 Jan 2026 22:30:23 +0000 (UTC)
From: Sam Day via B4 Relay <devnull+me.samcday.com@kernel.org>
Date: Thu, 08 Jan 2026 08:30:21 +1000
Subject: [PATCH 2/2] usb: gadget: f_fs: fix DMA-BUF OUT queues
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-ffs-dmabuf-ioctl-fix-v1-2-e51633891a81@samcday.com>
References: <20260108-ffs-dmabuf-ioctl-fix-v1-0-e51633891a81@samcday.com>
In-Reply-To: <20260108-ffs-dmabuf-ioctl-fix-v1-0-e51633891a81@samcday.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767825022; l=2158;
 i=me@samcday.com; s=20240502; h=from:subject:message-id;
 bh=azguOzfXRNk8xkQSYbcIA+Axl0/kG7ysuSZ9qR/g6jg=;
 b=hauXppLXpTgJQeqrpzIRTyDFVd8M4vidOI0TYfgI3z8TBGtDvEGdl04J5eSKScUJ6Mwd/f3NI
 EvgVUJWO5PoCe8/PodkUd4mGnMQCn3ZubQtm/SkP7V7wZslejsbi2GN
X-Developer-Key: i=me@samcday.com; a=ed25519;
 pk=bzyS0akxWMqr9+AXzgBRIp28KKpEOs+GjYMc2yf+aeU=
X-Endpoint-Received: by B4 Relay for me@samcday.com/20240502 with
 auth_id=595
X-Original-From: Sam Day <me@samcday.com>
Reply-To: me@samcday.com

From: Sam Day <me@samcday.com>

Currently, DMA_FROM_DEVICE is used when attaching DMABUFs to IN
endpoints and DMA_TO_DEVICE for OUT endpoints. This is inverted from
how it should be.

The result is IOMMU read-only mappings placed on OUT queues,
triggering arm-smmu write faults.

Put differently, OUT endpoints flow data from host -> gadget, meaning
the UDC peripheral needs to have write access to the buffer to fill it
with the incoming data.

This commit flips the directions and updates the implicit-sync helpers
so IN endpoints act as readers and OUT endpoints as writers.

Signed-off-by: Sam Day <me@samcday.com>
Tested-by: David Heidelberg <david@ixit.cz>  # OnePlus 6T on sdm845-next-20251119
---
 drivers/usb/gadget/function/f_fs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 9ea1445bec97531f9c2bed678268bd6f76199bfb..a738d835f61e3d6b31363ccb6dda563336996b0e 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1513,7 +1513,7 @@ static int ffs_dmabuf_attach(struct file *file, int fd)
 		goto err_dmabuf_detach;
 	}
 
-	dir = epfile->in ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+	dir = epfile->in ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
 
 	err = ffs_dma_resv_lock(dmabuf, nonblock);
 	if (err)
@@ -1643,7 +1643,7 @@ static int ffs_dmabuf_transfer(struct file *file,
 	/* Make sure we don't have writers */
 	timeout = nonblock ? 0 : msecs_to_jiffies(DMABUF_ENQUEUE_TIMEOUT_MS);
 	retl = dma_resv_wait_timeout(dmabuf->resv,
-				     dma_resv_usage_rw(epfile->in),
+				     dma_resv_usage_rw(!epfile->in),
 				     true, timeout);
 	if (retl == 0)
 		retl = -EBUSY;
@@ -1688,7 +1688,7 @@ static int ffs_dmabuf_transfer(struct file *file,
 	dma_fence_init(&fence->base, &ffs_dmabuf_fence_ops,
 		       &priv->lock, priv->context, seqno);
 
-	resv_dir = epfile->in ? DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ;
+	resv_dir = epfile->in ? DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE;
 
 	dma_resv_add_fence(dmabuf->resv, &fence->base, resv_dir);
 	dma_resv_unlock(dmabuf->resv);

-- 
2.52.0



