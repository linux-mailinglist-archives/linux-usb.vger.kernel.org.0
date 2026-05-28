Return-Path: <linux-usb+bounces-38125-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJTpAaf9F2oTYQgAu9opvQ
	(envelope-from <linux-usb+bounces-38125-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 10:32:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A17E5EEA05
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 10:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEDC830BB5DE
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 08:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4633793DE;
	Thu, 28 May 2026 08:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZuI9t41"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6A23783B5
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956879; cv=none; b=B+TUA4bEb8CaNaMIOiSx4RdvgJxpaR4X/GQiu+qZ9ICK8jCdR7NLFcxAmljvfraBeRr3Exl0SxS0qF50y1Q9oQpbBwyv/hbUjfWlD72laBdQXw8BHHkr0n9nlWEU+uyzJzzdbvidVvHAZAxuOA3mbvAbjHst6zVlDnKJQg2Od5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956879; c=relaxed/simple;
	bh=9lzfWbEtfKy7yDDPQwvEs6SwC+ACFHPxG5KOg5RBgKc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VhPT2sBrprlrOMdCQv3gXTtzX5pNedPLZle4RJUJeRfsimObq2uM+fQuQMVI8BGtNGrOLUaIDvmS752jhaWhVmWikbkWwtnKKXGDuenwbeHsX2vAMYyHd0ppcRRu8sHDzSWT1lSKajfP2pZVaBTjXiOL9qQSjxigVHi3357Rzmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZuI9t41; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso5790940b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 01:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779956876; x=1780561676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iE1V6ZSM8goQIoTUw/VcFHWcLJtCjNGG+PWVULPfe6g=;
        b=PZuI9t41Fc4TiMnhpRnPzADPu+z39ZTZ6fSJZa/r5b+uP5QegxOEIgMNrIY8nEUyDj
         AF1VM/hOqnDOT26cZKpUg/JC37OWXjYWcgvkg3SC5vJdcJcENHeND89SLcNqfTHVnBEO
         ZHiDExDsV24nonqN3mNpCX8W6hX1Dy+Gd2WNvD3QnObbKntxXK0D7I21i8Ffx9vANUXL
         YiPNMf8v2RvLa+CLZXvcvl1MxDCHiVX4tlfcfH1919jdcGWzNi+XQOIvobIXJMPxeYUP
         PykxKFnF6+yUeAEtsNnjJcBf6CE/D34SLh2DHlAMw6tNtE9ma+DB85p3/L3sq32mNBQ1
         +izQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779956876; x=1780561676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iE1V6ZSM8goQIoTUw/VcFHWcLJtCjNGG+PWVULPfe6g=;
        b=An0nW5lNcm/DvIolhgHbavsfak2Fgv9w+5CrJfBcSY5+sF159gSOfR56rrY1gUHOkU
         WvqsZI53HNiEA9P/AE1eAro57tohnMZQjLIKAGrZgQVPJpRwfFrG44cqsJoliJcvvp3G
         QrqezgkIVYEAlbo24elW/ypDk4pZqDdYdDhLHmYD9baSLzoj8HTe2LIpzQpvjMZgdohH
         fYIl0bg+BKfBb1KH3KBTcorigYvfVieHzr6EU37L5eIx6zfsT8Vw3xEqFX9D8e2F5INY
         /j/BCHvAEI7KGOjTb+uTM17D+34EnxduQ6su/IAKo81icrBIinhVSy1hD4z4DSvaO2mG
         JzsA==
X-Gm-Message-State: AOJu0YzOVkuzb+dasvhZqt17V9/q8lxaYFnq+Pup6W9bMbMv3tgyAgP7
	Rlts9GsNkbpvEK0KRVDn6blJdR0HF/eQEHr3698JnGXmZq1UkpPMR2+jCKq59g==
X-Gm-Gg: Acq92OFKCws6boLQxqfLgflDrUfIyMimquIhiEYwMxB730Ilb89WxZ1e0CbM94GxtKv
	vA7ahRq5+rwlSiBcT7mSBKj84bb6nWspndNMw+S7h47ZzV/naxoo2vAy8sRcICe6JvGKA7zv9LS
	ue0XHm5myIil6C5uCrZMLX3cJnQC23zWLVi8RsM1HsGIRAeHbJfVvHdw1KWgkJMi04IsWr2s7n0
	7BBKcLFgo0YNDb3F38JuaZTUiTw2JYIARv/hC/jM7BEOqmA7L74Gl8me2cZXX6/53bPJS0IVyBR
	0LnKYKHEDA/OqI61db7U/WHEKTFoB8BIgTx3NEsnw6wtkmKrYHtJ6USxCwADFpmAdlUnEWiVx38
	oEzt9SydwQpyDlpxjZPdX1rNNGbPGomATGLvu0hRxiN4cbPuSqFiZDZuNd0AQZ+GILvgLjsPFdc
	4oTjZVDQ6YKeHMNXDCp2Rcn9HNS9++Q6RtNK36Rg==
X-Received: by 2002:a05:6a00:189e:b0:82f:316:3206 with SMTP id d2e1a72fcca58-8415f54464cmr25889213b3a.34.1779956875704;
        Thu, 28 May 2026 01:27:55 -0700 (PDT)
Received: from cqian-s3.. ([175.159.214.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d730b6c0sm4198156b3a.61.2026.05.28.01.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 01:27:55 -0700 (PDT)
From: Junzhe Li <ginger.jzllee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: misc: yurex: fix ordering of usb_deregister_dev() and usb_set_intfdata()
Date: Thu, 28 May 2026 16:27:51 +0800
Message-Id: <20260528082751.204898-1-ginger.jzllee@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38125-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gingerjzllee@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7A17E5EEA05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In yurex_disconnect(), usb_set_intfdata(interface, NULL) was called 
before usb_deregister_dev(interface, &yurex_class).
This opens a race window with usb_open() in the USB core:

  T0 (yurex_disconnect)               T1 (usb_open)
  --------------------------           -------------------------
  usb_set_intfdata(iface, NULL) [t0]
                                       fops = usb_minors[minor]  [t1]
                                       /* fops still valid here */
  usb_deregister_dev()
    usb_minors[minor] = NULL   [t2]
                                       file->f_op->open(inode, file)
                                         yurex_open()
                                           dev = usb_get_intfdata() [t3]
                                           /* dev is NULL! */

Because t0 precedes t1 precedes t2 precedes t3, T1 can obtain the
file_operations pointer for the device (t1, while the minor is still
registered), then continue into yurex_open() where it calls
usb_get_intfdata() and gets NULL back, leading to a NULL dereference.

Fix the race by calling usb_deregister_dev() first, which removes the
device from usb_minors[] before the interface data pointer is cleared.
Any concurrent usb_open() that arrives after usb_deregister_dev()
returns will fail to look up the fops and will never reach yurex_open().

Reported-by: Junzhe Li <ginger.jzllee@gmail.com>
Closes: https://lore.kernel.org/linux-usb/2026042718-unwieldy-dicing-626f@gregkh
Signed-off-by: Junzhe Li <ginger.jzllee@gmail.com>
---
 drivers/usb/misc/yurex.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/yurex.c b/drivers/usb/misc/yurex.c
index 7a482cdee1e9..136272ac24ba 100644
--- a/drivers/usb/misc/yurex.c
+++ b/drivers/usb/misc/yurex.c
@@ -310,11 +310,12 @@ static void yurex_disconnect(struct usb_interface *interface)
 	int minor = interface->minor;
 
 	dev = usb_get_intfdata(interface);
-	usb_set_intfdata(interface, NULL);
 
 	/* give back our minor */
 	usb_deregister_dev(interface, &yurex_class);
 
+	usb_set_intfdata(interface, NULL);
+
 	/* prevent more I/O from starting */
 	usb_poison_urb(dev->urb);
 	usb_poison_urb(dev->cntl_urb);
-- 
2.34.1


