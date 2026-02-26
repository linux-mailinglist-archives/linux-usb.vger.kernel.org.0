Return-Path: <linux-usb+bounces-33748-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB9KMB5voGkHjwQAu9opvQ
	(envelope-from <linux-usb+bounces-33748-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 17:04:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 467811A9873
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 17:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE9773072BC9
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 15:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA6C42B74A;
	Thu, 26 Feb 2026 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcCDeBlE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D151742848D
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772121413; cv=none; b=aLFtBjrIdOgjkRBuuJAOT6UO+tIV6JNZsHwbllPHo2tEjbvw5+I3fyRZyQDgCgil+LQ1G3y/4PdR3GA/6tNk3FD7SYzn2wkL2yBtCSMS0hKLaaFo39Sk4TI5U8oYFh2Gebl/Kum7WUKoR5/JkieffufcaXdTkjOMoDWiqzyOnBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772121413; c=relaxed/simple;
	bh=xpnKYnxImm3cXiPRzsABXtVlImxWrpvKLqO5wGqSTA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4eYBIp7SiJ0MQxe26cCKRGJJ9buk19ipD0ddlV/fEek9dZBqeIaPN8vDYt1hqYOaw571BpCpCBWrSAF7QN3yOAlUGO3YiUqdwZo6aiAOPNNS0uy1tVvhduQrEmfcT8S/PPSFLifiH3jWMxPNiVD3kJ17UxyroRXZuEFjWuvZr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcCDeBlE; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8cb38e6d164so127234785a.3
        for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 07:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772121402; x=1772726202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YSwT4GFMAF5kbJlcm7VfyD0/S31XUAdEz16Znxu5LYM=;
        b=fcCDeBlEpA5jSo0b+iDI5h2qDcGzwDFhAnU3BK0wM/SwKUVUNk5y7vu51rb1BaupBC
         RlttsPE0hWKdyIPLgOP7GDcCDdheLM9YsBCSySJUaGzN+eUNTmcQYGMjqQol4cbwJtQ2
         Ptvu5Ce1kgNJ8gENxO1/0mAF+9WqKgh1AvrNDqDYYfZf52uIeqjbsKIgUznF2XQoikFN
         nBns4qPqnsfTlQmZ8EbC3Ag98g+Y+91ahT+SBoJG070MLZw3LRQnuE/Y8cWqhJQO490c
         IHXNGKA4MAEBKEpMEySDqGzVqv+gHG1f8t7Ghzh/bZ92Sw0DjmmGVHT7Kxi51ycjAQEi
         sWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772121402; x=1772726202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSwT4GFMAF5kbJlcm7VfyD0/S31XUAdEz16Znxu5LYM=;
        b=kvfaWpSr8j5j9gtDSeiFKXzAyqXx6xVKSVHl4EgBMfa/jWLCqqmK4dYufH6SYSbP3j
         ceh94uQGVpY9wKskXrcG5q9UvXKWvskGTaaQtVGCNV5QX+LDiR0LFMjCGFWmgEabSh4A
         UWIfhzyTGgFupbY/vImbbZmtQ/mfb789Ffrhw0+lT86WJRs7wYylQmmC0JTlcMTxPszr
         y6bk78SFrymdG3TAtZ8jNmJsTPu+uqI8hKW4kVgKsN906wxxAOqtc3xOY8dY/dtXpESK
         EjWN7yrcWA6tAfruQoen/ecsAarbzVhPoB8IW3EjupnV39NwwBdt9xj/Xb6gjnYVcx6C
         ol1w==
X-Forwarded-Encrypted: i=1; AJvYcCUOdLpeUTyXOeS/87GXBrvzolugNvHrJvOLukc1EJUc0GEM5paH3TixSTA2jpr+K5j56vjR0eifpig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg0ojycn47JGWpS2y3jdFyVvQOlvvDb3YmjHoCciKLTSwIdtqZ
	OoyuingKTjCEqTgTOBkicXFfAwdNK6SrKJB7YM9g+4z1RrXCE6D0R59w
X-Gm-Gg: ATEYQzykr15hLK9JZubuX59p1WUAy5gcL1tSqoHNVJG0Gyrg6QMkPF9I0ezW1VG6YPJ
	E81Fna3nLN8T7HLOldSn1GYtjEdZTnzLWkzav9Ni+PEVC/5PQZpSnOai1LlJSaJdTQ9bB12s24G
	mjXPtHWe4meEGHT2AEZvvKKD1OQL+mf5BEr7RIGBMorxmukJf+K3gIWJuCWBfLDCLA8MyMobfWq
	Uk0JzHvf8UwvRRdPTbUyVKvm0VafI7wWYqur0ieyx+v6BHHVQChAEpgBznndCBxPcsBu43dVhOo
	BEBQOhtB6DEnhCCPdfk0IDrATgmFbYJVh8cypLjgmQD58pGzaNMmcYg1KidSy1wCeq4Kgaou5PL
	AcXlVndqLNWrvpudSh9YZcPUVhmvK/IfXTKOUw3CmgMuMVv1hPy+D8RLfc892uO8SDkFri3bLMJ
	aB/KXIVRiOsH/R9tySckw5OHufD7xHwrTLOPn3PyPqOBiWOwiGA0J8kgoO5cK3UNCHKW1IIQFCB
	eKgd/GRw30jjEN2OXiv4Pc=
X-Received: by 2002:a05:620a:4412:b0:8c7:16fb:ed49 with SMTP id af79cd13be357-8cbbd04f0b5mr654374085a.63.1772121401417;
        Thu, 26 Feb 2026 07:56:41 -0800 (PST)
Received: from mango-teamkim.. ([129.170.197.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6fb519sm233646485a.29.2026.02.26.07.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:56:40 -0800 (PST)
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
Subject: [PATCH v2] usb: gadget: f_mass_storage: Fix potential integer overflow in check_command_size_in_blocks()
Date: Thu, 26 Feb 2026 10:55:58 -0500
Message-ID: <20260226155556.1439672-3-eeodqql09@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-33748-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.7.a.0.0.1.0.0.e.9.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	FREEMAIL_CC(0.00)[gmail.com,dartmouth.edu,wanadoo.fr,kernel.org,csr.com,ti.com,mina86.com,rowland.harvard.edu,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[eeodqql09@gmail.com,linux-usb@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 467811A9873
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
 v1 -> v2: Removed the cmnd_size check and applied the check_shl_overflow() macro

 drivers/usb/gadget/function/f_mass_storage.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 6af96e2b44eb..cb885153a31e 100644
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
@@ -1853,8 +1854,17 @@ static int check_command_size_in_blocks(struct fsg_common *common,
 		int cmnd_size, enum data_direction data_dir,
 		unsigned int mask, int needs_medium, const char *name)
 {
-	if (common->curlun)
-		common->data_size_from_cmnd <<= common->curlun->blkbits;
+	unsigned int blkbits;
+
+	if (common->curlun) {
+		blkbits = common->curlun->blkbits;
+		if (check_shl_overflow(common->data_size_from_cmnd, blkbits,
+							   &common->data_size_from_cmnd)) {
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


