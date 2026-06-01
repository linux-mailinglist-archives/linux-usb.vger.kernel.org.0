Return-Path: <linux-usb+bounces-38226-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J8aIfo6HWoqWQkAu9opvQ
	(envelope-from <linux-usb+bounces-38226-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 09:55:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DF361B24C
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 09:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F8D730072BA
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 07:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3511A388862;
	Mon,  1 Jun 2026 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4uS1KXL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF44C38330A
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300530; cv=none; b=EdRF1+VjwSTFv89IC1tlNj51eW5Y7DoY2IrpLfXBuxQ1Zs1OhfRP8LXXQOrjG8Il6ceywq9fgwZ+4SDahHLtzbRiijkoKz3V9M54WVruu4S9DxDw5qzxlAXfyq+L+qhtRrrvlGrAk5wvU0g9aLS2J4KKxPCvuAyZ2wbaeui1YEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300530; c=relaxed/simple;
	bh=0IslXOkofAKfz4e0OXDdA68UVi5mSLtbVRFg41+Tqjk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y/FmcZWEPX5fq1XHIdp4mY+5AsKB0L6cF44gKUX/dWAIqdkwmMweI7DtYPpeuPdSaPyYa9WjxTrZBlhaPqwqOsZptY7/q9x+pX7S8Jpslqg/fJOKL8euC3J8mtAiBTjCiG6H2MaJxj97oj7Ich43XBH7l6eg+jxNp9YSrGdjdpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4uS1KXL; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36d8b644473so1153783a91.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 00:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780300529; x=1780905329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+PZCoJ6z1oXSIYEy37SNDGWhvgM6lnLCN/3cMCQFDE=;
        b=E4uS1KXLKIT4hJUyVHZywZjjbLSLAAnJxU//xKW6TWDHnqy1kd8jd49LzhZqAopdLs
         avNLuGQaz7WnEZstoQtxVW7tGPwC1DcfOKXDI07dfF8C/uRBHXPHUBxJoA/ptaB1TcML
         +kx25d38byhd9Lnm8qF8pL2pYdHOHz8JN2GBtf8FNdvKxsqEadRViNhUrHGC9m4cRkRe
         u2ZCdcn68Ib3t2zFLyFb7BppEufqV49sc3/tLdnrzI9dJuKn09i+JxjnssDftDG52n4V
         DnbQqJr5YU5HchnPAoIT4KS5xY1UYDRBVsPtQOHf6tqd9ShUP6l1XOx5hVg4wobFVmCk
         ZGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780300529; x=1780905329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+PZCoJ6z1oXSIYEy37SNDGWhvgM6lnLCN/3cMCQFDE=;
        b=A/xklFMJUJUTdbwD9bbJXnxgyQVtbbzpRih6FP/ewA/miTzVsIVXROnA4lgDy9n1LZ
         i5U6tXUShD/wLCJ76CbtazCpVY5VkQdnWR4nj33b3e7tSWmCamlZiqrXiIjLDiKNA1Oi
         shbIlp6EK+nAAN1V5ZV808wbkkQKENPti+Fw8+oOn9hyooy5cKrr5DUGofybqVN41l4W
         BofHIvyuQwW6tjJ3w6WJwwgK+dIkjBEe7pVAhgO0RzPuC2AB7L2cRCeFyxD7qV44uCnb
         99LNwr4/zq9zL2Rl1lwnA+OZwkcCRttYb4dvX0+8Rv3P7RkjU4NbCUHVuUmMLh3gmFTF
         0jpQ==
X-Gm-Message-State: AOJu0Yx2V7Rn8MNoqK8hS+h/q51NgfjAfdS+uYTobAtvq2nv/cUxwBZe
	PnOzE907OehEio7CD07dti10teizQ+tZqgLeEoPRfCOvQgQV07i7cF8jzgxEwA==
X-Gm-Gg: Acq92OFbVVSkG7NM11eyNRVfHuuDRtklkejiN8Y0wbSmw4cH/Z3eyOyfD/07yjMsjEH
	HdzNezJ6Obzyjf4r+U8nwWzA2vY0ubiPGScU3wOwIt7t/r/2XHp1XGj1NQH8/EqZ6wRgR4W0F6X
	611NFDMUu2mwt0GWmfnX5S7cS3HFglWAD6PFsnw4/5wVMf/Z8v2ntVz5+4BdLd7JtQfmuZqMtH+
	rzHbDVZVGOEn2x0qDTBxYxU7Ax6e1E2PGblNKsJrY2oRwOfTMG+VhVvHxJ8tx+YOScILKAkc015
	qBTc0zv01f5RjU7OMDU8w8LHmmxwvBCjlqeZQk3GlkYNFOodTjZHJwYvMM65/HXDBnAAH+N4bdT
	PyVH30g7099ZIA64pmjSTJxkWH3ydQ+KuaWSYWkCZSQRhjcV/evNyIrP0IIL2GjyMaGz0ds4Iwf
	UwBUCAxjlIosh4jTjToWRK4i+gs2UOAvktV1r/LA==
X-Received: by 2002:a17:90b:3f88:b0:36b:ba97:419d with SMTP id 98e67ed59e1d1-36c501cdd5dmr9518631a91.13.1780300528909;
        Mon, 01 Jun 2026 00:55:28 -0700 (PDT)
Received: from cqian-s3.. ([175.159.214.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e8059sm93792055ad.9.2026.06.01.00.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 00:55:28 -0700 (PDT)
From: Junzhe Li <ginger.jzllee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: misc: ldusb: fix ordering of usb_deregister_dev() and usb_set_intfdata()
Date: Mon,  1 Jun 2026 15:55:24 +0800
Message-Id: <20260601075524.136957-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-38226-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gingerjzllee@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 87DF361B24C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In ld_usb_disconnect(), usb_set_intfdata(interface, NULL) was called before
usb_deregister_dev(interface, &ld_usb_class).
This opens a race window with usb_open() in the USB core:

  T0 (ld_usb_disconnect)               T1 (usb_open)
  --------------------------           -------------------------
                                       fops = usb_minors[minor]  [t0]
                                       /* fops still valid here */
                                       file->f_op->open(inode, file)
                                         ld_usb_open()
                                           dev = usb_get_intfdata() [t1]
                                           if (!dev)
                                             return -ENODEV;
  usb_set_intfdata(iface, NULL) [t2]
                                           access dev->mutex [t3]
                                           /* dev is NULL! */
  usb_deregister_dev()
    usb_minors[minor] = NULL   [t4]

Because t0 precedes t1 precedes t2 precedes t3 precedes t4, T1 can obtain
the file_operations pointer for the device (t0, while the minor is still
registered), then continue into ld_usb_open() where it calls
usb_get_intfdata() and gets NULL back, leading to a NULL dereference.

The intuition is that the global exposure to the 'usb_minors' should be 
disabled first, so that subsequent nullification of the interface data 
pointer can be regarded as a local cleanup.

Fix the race by calling usb_deregister_dev() first, which removes the
device from usb_minors[] before the interface data pointer is cleared.
Any concurrent usb_open() that arrives after usb_deregister_dev()
returns will fail to look up the fops and will never reach ld_usb_open().

Reported-by: Junzhe Li <ginger.jzllee@gmail.com>
Closes: https://lore.kernel.org/linux-usb/2026060157-pettiness-corporal-05eb@gregkh/
Signed-off-by: Junzhe Li <ginger.jzllee@gmail.com>
---
 drivers/usb/misc/ldusb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/ldusb.c b/drivers/usb/misc/ldusb.c
index c74f142f6637..ba65de2d4808 100644
--- a/drivers/usb/misc/ldusb.c
+++ b/drivers/usb/misc/ldusb.c
@@ -756,13 +756,14 @@ static void ld_usb_disconnect(struct usb_interface *intf)
 	int minor;
 
 	dev = usb_get_intfdata(intf);
-	usb_set_intfdata(intf, NULL);
 
 	minor = intf->minor;
 
 	/* give back our minor */
 	usb_deregister_dev(intf, &ld_usb_class);
 
+	usb_set_intfdata(intf, NULL);
+
 	usb_poison_urb(dev->interrupt_in_urb);
 	usb_poison_urb(dev->interrupt_out_urb);
 
-- 
2.34.1


