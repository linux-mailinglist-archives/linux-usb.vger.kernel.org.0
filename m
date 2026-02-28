Return-Path: <linux-usb+bounces-33812-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC5ZLCjHommy5QQAu9opvQ
	(envelope-from <linux-usb+bounces-33812-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 11:44:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A491C238B
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 11:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC62630B991E
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 10:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FFD42317A;
	Sat, 28 Feb 2026 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5eJIxIx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C276423141
	for <linux-usb@vger.kernel.org>; Sat, 28 Feb 2026 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772275438; cv=none; b=XKcxy9UHpoNCWsMGPEptjRsTKWZqWo1KOHjMNgxbutmKMYKfEwHmTaLNhNlVhH19eaK8B2ZGHsrA45oNz59Ce6UyIjad5oL3JrsNfGNb0BG4trLJb6rqfMCfbDAaxbxvV+FJHaHnEVntS3RwBqLTcuLkxmUaujdldFeJjMeVS/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772275438; c=relaxed/simple;
	bh=cXbM+r1jdt3qIyz9wQEclOpaKchbvUM5I9CvV/gU4Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d7D3qGa8jnuDrpHmTXO0my+6O1UohonsVqxz8BjROTyWeK8KI2aa0Yj3RfK04f+c5uyus6I+uc2qwJjeHh2jZFEAaRwaHg5GKKiE0yLbjDYhkgwMySUKicaYO5E1zRFRcTxS7ONSRM08PFiDmi8hDhtjrb5+j/Kz1rt7iiuRgxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5eJIxIx; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-899a5789b5bso46396326d6.1
        for <linux-usb@vger.kernel.org>; Sat, 28 Feb 2026 02:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772275436; x=1772880236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NX7u2ldwvgfJCDAj1vquvDSf6UvKmhrTmDKBT54Jyi8=;
        b=P5eJIxIxZd+Cvtl2weTR/WViTwGYtaP+zMykt4PSJhxmYHb3QPl2fly9SjLy4g14sO
         ALv3lZIKhNVa7FDKyWwGTJcX5RxuECjSO9ZRANp7XGiM7nL4hcBnS9RtYi4EWhgULkQc
         t/7H0MpwuR2pRFa65FUv8j6DFpcV5mwRM87g2F0j3cdZQdiLsMtkECQM1+hx0zzT8AUh
         9NffljpW8dJ/skYhugj1DzREPdGRCOMM/4W2uNpKeKmbHcozsNPDl5EDNJffsM1lKwMU
         th6/si1fFb7pwJOEWewlzih0pc/VZrs5wTxr+GqmmxM5pk7hrrBj8RHlmJThtRHXmnMU
         rr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772275436; x=1772880236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX7u2ldwvgfJCDAj1vquvDSf6UvKmhrTmDKBT54Jyi8=;
        b=FnAgVbHvl2B8NYOMvv3aoAl4iQAAsH4F7IhmoebhtIK+fEINta0E1BNegzKefpYOhz
         6wOx4BfAUHsNyykQ6F0JIdfFeWmIchOUbxbTRbq39pfMhumoHBC23FWvINq0VDMrd/fb
         2yYh/X32LVKbXf7pOXWxODfgBerezbnOWg+BZ47Ij6I/OLiLsyYoJKhrfG8AstjKiqHN
         vwvT+bphtgQ+M2tzlczcrNvVZRPboBWJ4Vvz7safEY0QFNtzcO/9VDNRMbKUhRQuj9MF
         GjyOQO6etWgu1KXIqc6k6lZnvXHrcmuV0Dj4AyAqlxuUdpUZoSho/Idle5tKWbHN+ElL
         r5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVIbstcnac86U35JiiFQMnANwlIfzjFb7rZO62e/PidETKWmpg+stsm0LEeb+93QWkvqr58T/jz83A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR4uXKXynloNJMDi2TVqlVpAfbVUG9NU8j77LZmiQP4D9mUy6r
	i0b1Dy4vQMwnYNMzU6Hz1nct0P0Yc9QRqUtbosoumiWQ9TnntVeR+ncp
X-Gm-Gg: ATEYQzyzr4vhOj6dLXj/wC0T0FOJv/JuGtgQav7CtxyBwCGtRsxDWfCzld7t5K9wweh
	8WRTawsXBFnDN1ROXFe0h4KUAkG2vrg2YgAtDc8uOja/M5hLd0sWDa/bljmSZ/w4UGexF9rL5Me
	oTtxPpRlIG5dR+zahZdDLmIJJXouRhs4IzTylwUOH0kJIo/F8VctJA2xghXHOt54ygHgL4+i8MO
	Rtr1hmYQ8GqfKW5qPHxFRlKuBn4xUmEhJ0nFZqf48ZIlOGy4YhDWFU929C+ZI/Ru6xxJlX6u0OM
	tPbM6vgaeGsn/MIEr64Ir57259LJPqUIsU2DaM3pMn7ryoiSMdQVXhQbqAhiQ1rAnutWnr00IfS
	wDZH1kywyS+cT1BaN3uk4vdGXtq4a54CwO19hSQx5+jQqeKgN2TLADzzkvo4JXzFbDuP6v3751k
	jtEvtuiXRsfh9QCSPrx39oUIMCy84nbtuZtaTsyGt+4BgN4ksji/gTU30Ezc9PSSmxqdEMG2OGk
	dWaFCw2ILQZ
X-Received: by 2002:a05:6214:2248:b0:899:ecd9:22be with SMTP id 6a1803df08f44-899ecd92322mr37766d6.67.1772275436216;
        Sat, 28 Feb 2026 02:43:56 -0800 (PST)
Received: from mango-teamkim.. ([129.170.197.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e608cfc6sm7226726d6.14.2026.02.28.02.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 02:43:55 -0800 (PST)
From: pip-izony <eeodqql09@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <kees@kernel.org>,
	Yuping Luo <Yuping.Luo@csr.com>,
	Felipe Balbi <balbi@ti.com>,
	Michal Nazarewicz <mina86@mina86.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Barry Song <baohua@kernel.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3] usb: gadget: f_mass_storage: Fix potential integer overflow in check_command_size_in_blocks()
Date: Sat, 28 Feb 2026 05:43:25 -0500
Message-ID: <20260228104324.1696455-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,dartmouth.edu,wanadoo.fr,kernel.org,csr.com,ti.com,mina86.com,rowland.harvard.edu,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33812-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eeodqql09@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 17A491C238B
X-Rspamd-Action: no action

From: Seungjin Bae <eeodqql09@gmail.com>

The `check_command_size_in_blocks()` function calculates the data size
in bytes by left shifting `common->data_size_from_cmnd` by the block
size (`common->curlun->blkbits`). However, it does not validate whether
this shift operation will cause an integer overflow.

Initially, the block size is set up in `fsg_lun_open()` , and the
`common->data_size_from_cmnd` is set up in `do_scsi_command()`. During
initialization, there is no integer overflow check for the interaction
between two variables.

So if a malicious USB host sends a SCSI READ or WRITE command
requesting a large amount of data (`common->data_size_from_cmnd`), the
left shift operation can wrap around. This results in a truncated data
size, which can bypass boundary checks and potentially lead to memory
corruption or out-of-bounds accesses.

Fix this by using the check_shl_overflow() macro to safely perform the
shift and catch any overflows.

Fixes: 144974e7f9e3 ("usb: gadget: mass_storage: support multi-luns with different logic block size")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v1 -> v2: Removed cmnd_size check and applied check_shl_overflow() macro
 v2 -> v3: Fix indentation of continuation line and drop local variable

 drivers/usb/gadget/function/f_mass_storage.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 6af96e2b44eb..b7b06cb79ff5 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -180,6 +180,7 @@
 #include <linux/kthread.h>
 #include <linux/sched/signal.h>
 #include <linux/limits.h>
+#include <linux/overflow.h>
 #include <linux/pagemap.h>
 #include <linux/rwsem.h>
 #include <linux/slab.h>
@@ -1853,8 +1854,15 @@ static int check_command_size_in_blocks(struct fsg_common *common,
 		int cmnd_size, enum data_direction data_dir,
 		unsigned int mask, int needs_medium, const char *name)
 {
-	if (common->curlun)
-		common->data_size_from_cmnd <<= common->curlun->blkbits;
+	if (common->curlun) {
+		if (check_shl_overflow(common->data_size_from_cmnd,
+				       common->curlun->blkbits,
+				       &common->data_size_from_cmnd)) {
+			common->phase_error = 1;
+			return -EINVAL;
+		}
+	}
+
 	return check_command(common, cmnd_size, data_dir,
 			mask, needs_medium, name);
 }
-- 
2.43.0


