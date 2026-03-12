Return-Path: <linux-usb+bounces-34667-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gARQFyiNsmkQNgAAu9opvQ
	(envelope-from <linux-usb+bounces-34667-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 10:53:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C911B26FE79
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 10:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAB8F3017F87
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CC73B8D70;
	Thu, 12 Mar 2026 09:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="JZKjGszJ";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="JZKjGszJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E693037DEAD
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 09:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773309220; cv=none; b=gNJJjD4dX8iwaMLHSWVqFmq3/TQz0ptWbYs8pNu0DQgrC3Gjru51tz4gLX5/Hq+I9EM4mIxX62sKcn+z6SttlpFgJekTPsvugML29C6vNcMnEEq3yxVqJ9FSdmcvBUefhQ3kWWnyPeETMMDYee2r8J5uZB+uLRxtNfyYaz9MoUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773309220; c=relaxed/simple;
	bh=uswVhGDhTSSHl6leEpxWYOWBzvizhl/rVejryGjJ1ok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uBBK4WiC2DvjWGKCKbIwN1V4j4/QgXQUgh6plFzxQeyDYUj9MLPpBCNNaXDqhPrdDCZw5DLKcKwH47+6E1G4fEnAG06gfcSjSd4j9Ef3xHflvL/mzfm5bnW/7oS0GxyANXU4TaXXtgUD+FsrkTiWbncVDYUmbaLFVx53+KjW1pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=JZKjGszJ; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=JZKjGszJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D9FD44D39A;
	Thu, 12 Mar 2026 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773309215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WYBa/cV7Anzl/xoU2yUYv0RbVMZ3TLvQn8X/uWvMm14=;
	b=JZKjGszJOeZdbGBrEJqWvPESyb+vDDT+6lhSF0N/xcuiWkWvpAEMIipUV/ZgHJtif4dFc2
	vHth0ZULZ0+TzPMVi9ABRZXklzENUt+SM3fRW3NXXEJuzKfR8ulQL/n/9LDuMtOdpDYEDW
	lyQfesA/jK+cCs/kygYuG3Z/yKhjeLU=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773309215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WYBa/cV7Anzl/xoU2yUYv0RbVMZ3TLvQn8X/uWvMm14=;
	b=JZKjGszJOeZdbGBrEJqWvPESyb+vDDT+6lhSF0N/xcuiWkWvpAEMIipUV/ZgHJtif4dFc2
	vHth0ZULZ0+TzPMVi9ABRZXklzENUt+SM3fRW3NXXEJuzKfR8ulQL/n/9LDuMtOdpDYEDW
	lyQfesA/jK+cCs/kygYuG3Z/yKhjeLU=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B4BD03FEE2;
	Thu, 12 Mar 2026 09:53:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TUhZKh+NsmnZRAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 12 Mar 2026 09:53:35 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] iowarrior: use normal memory in write path
Date: Thu, 12 Mar 2026 10:53:20 +0100
Message-ID: <20260312095328.1594015-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34667-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: C911B26FE79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is just no point in using coherent memory.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/iowarrior.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index 0b377204374f..54f1bb0f7123 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -233,8 +233,7 @@ static void iowarrior_write_callback(struct urb *urb)
 			"nonzero write bulk status received: %d\n", status);
 	}
 	/* free up our allocated buffer */
-	usb_free_coherent(urb->dev, urb->transfer_buffer_length,
-			  urb->transfer_buffer, urb->transfer_dma);
+	kfree(urb->transfer_buffer);
 	/* tell a waiting writer the interrupt-out-pipe is available again */
 	atomic_dec(&dev->write_busy);
 	wake_up_interruptible(&dev->write_wait);
@@ -439,8 +438,7 @@ static ssize_t iowarrior_write(struct file *file,
 			retval = -ENOMEM;
 			goto error_no_urb;
 		}
-		buf = usb_alloc_coherent(dev->udev, dev->report_size,
-					 GFP_KERNEL, &int_out_urb->transfer_dma);
+		buf = kmalloc(dev->report_size, GFP_KERNEL);
 		if (!buf) {
 			retval = -ENOMEM;
 			dev_dbg(&dev->interface->dev,
@@ -453,7 +451,6 @@ static ssize_t iowarrior_write(struct file *file,
 				 buf, dev->report_size,
 				 iowarrior_write_callback, dev,
 				 dev->int_out_endpoint->bInterval);
-		int_out_urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
 		if (copy_from_user(buf, user_buffer, count)) {
 			retval = -EFAULT;
 			goto error;
@@ -479,8 +476,7 @@ static ssize_t iowarrior_write(struct file *file,
 		goto exit;
 	}
 error:
-	usb_free_coherent(dev->udev, dev->report_size, buf,
-			  int_out_urb->transfer_dma);
+	kfree(buf);
 error_no_buffer:
 	usb_free_urb(int_out_urb);
 error_no_urb:
-- 
2.53.0


