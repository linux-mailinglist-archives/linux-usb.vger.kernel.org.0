Return-Path: <linux-usb+bounces-32025-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A74AD00524
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 23:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 400BB30A425A
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 22:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D8A2DC792;
	Wed,  7 Jan 2026 22:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UeENLN6p"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0298122F77B;
	Wed,  7 Jan 2026 22:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767825024; cv=none; b=tKc2OSc+3yDsVzob3PowiVYM+otyUjQTIccui2yJomzBrZeIuOeXv3NgoAjeOB19t8Qr6gDTBnOu3nGP/7OFcX8a682tcDCTNWBSfnOOY3rMrczk1ZYTWy64+CL9uhYlzJ4/88faTj7Z4vtCtRATdOC7O9jLFp21WLE2RRefzEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767825024; c=relaxed/simple;
	bh=mSX8X0nDOjeXe2Q25Toz3gwqs42fskhILG5gKtDs/g4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E4sJan3XpgwZ3+NgidNu83VtxIPyAWQYq5GOLG8/QVDbg4FV1t5mIyduznaS3zgQyb8znAFrurQtVM4fMX+ld2geXToSdtfMGioc9OWJWgaiVNu2oo8SfSi//mFFDCPh6gxdVVqtjwYtTvTvvvxVgpG6N2i4KiAdyzpaMmyyNzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UeENLN6p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F900C19421;
	Wed,  7 Jan 2026 22:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767825023;
	bh=mSX8X0nDOjeXe2Q25Toz3gwqs42fskhILG5gKtDs/g4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UeENLN6plgK/uWOPeY0OsPpbvLY45ZxAcPtErmHVQtXjXH3/rkowcGWm0ZAY1LOT8
	 5mbH0yEttvTdpdZXRqnE4enkakD2LKI0nEfaBmH/j6Byw2bhVAd3sd/t430K6wFzcr
	 IzgQk2FJw+eyFsW8nb5MMZ4639hm4IFcugk7U/judQsnjU0Lojbe4whMWLdTFA9Rmg
	 oyfPbp099ex482wQx7eiu2rWC0RFMfX4vC/HctI0uPInyX5JGyhx/nfqZTN2qqjln5
	 pF1AThxjMGtfJjN+us1b7kQDPaSDBdRCAkJOnVMtv06NRk/BuZsPlCRSq1nfWeX/3j
	 9bhxassDo2ryA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EE2D0D179;
	Wed,  7 Jan 2026 22:30:23 +0000 (UTC)
From: Sam Day via B4 Relay <devnull+me.samcday.com@kernel.org>
Date: Thu, 08 Jan 2026 08:30:20 +1000
Subject: [PATCH 1/2] usb: gadget: f_fs: Fix ioctl error handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-ffs-dmabuf-ioctl-fix-v1-1-e51633891a81@samcday.com>
References: <20260108-ffs-dmabuf-ioctl-fix-v1-0-e51633891a81@samcday.com>
In-Reply-To: <20260108-ffs-dmabuf-ioctl-fix-v1-0-e51633891a81@samcday.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767825022; l=2103;
 i=me@samcday.com; s=20240502; h=from:subject:message-id;
 bh=+sgu2dykusg1HSD/3fjxdCUcleWQtBrEsLL9Ec/cHXA=;
 b=oxwqyO9NTmbV96vpdsjWeB2S8TLav+HWSi6CkMSB8muMROJLX7+wolOhFlwfATRY0GQnQ+GwX
 2Mu5iFkTnyxDgJk6rVTDN+Bsye/msuDhmY3wVaR2KxW30ORHnnl+JH9
X-Developer-Key: i=me@samcday.com; a=ed25519;
 pk=bzyS0akxWMqr9+AXzgBRIp28KKpEOs+GjYMc2yf+aeU=
X-Endpoint-Received: by B4 Relay for me@samcday.com/20240502 with
 auth_id=595
X-Original-From: Sam Day <me@samcday.com>
Reply-To: me@samcday.com

From: Sam Day <me@samcday.com>

When ffs_epfile_ioctl handles FUNCTIONFS_DMABUF_* ioctls, it's currently
falling through when copy_from_user fails.

However, this fallthrough isn't being checked properly, so the handler
continues executing further than it should. It then tries the secondary
dispatch where it ultimately gives up and returns -ENOTTY.

The end result is invalid ioctl invocations will yield a -ENOTTY rather
than an -EFAULT.

It's a common pattern elsewhere in the kernel code to directly return
-EFAULT when copy_from_user fails. So we update ffs_epfile_ioctl to do
the same and fix this issue.

Signed-off-by: Sam Day <me@samcday.com>
---
 drivers/usb/gadget/function/f_fs.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 05c6750702b609565d7a4adc1ebae16ba3ffeeb7..9ea1445bec97531f9c2bed678268bd6f76199bfb 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1748,10 +1748,8 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 	{
 		int fd;
 
-		if (copy_from_user(&fd, (void __user *)value, sizeof(fd))) {
-			ret = -EFAULT;
-			break;
-		}
+		if (copy_from_user(&fd, (void __user *)value, sizeof(fd)))
+			return -EFAULT;
 
 		return ffs_dmabuf_attach(file, fd);
 	}
@@ -1759,10 +1757,8 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 	{
 		int fd;
 
-		if (copy_from_user(&fd, (void __user *)value, sizeof(fd))) {
-			ret = -EFAULT;
-			break;
-		}
+		if (copy_from_user(&fd, (void __user *)value, sizeof(fd)))
+			return -EFAULT;
 
 		return ffs_dmabuf_detach(file, fd);
 	}
@@ -1770,10 +1766,8 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 	{
 		struct usb_ffs_dmabuf_transfer_req req;
 
-		if (copy_from_user(&req, (void __user *)value, sizeof(req))) {
-			ret = -EFAULT;
-			break;
-		}
+		if (copy_from_user(&req, (void __user *)value, sizeof(req)))
+			return -EFAULT;
 
 		return ffs_dmabuf_transfer(file, &req);
 	}

-- 
2.52.0



