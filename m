Return-Path: <linux-usb+bounces-33694-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJkOJn3inmmCXgQAu9opvQ
	(envelope-from <linux-usb+bounces-33694-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 12:52:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC05196E67
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 12:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4A1E301BC01
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 11:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51B5396D24;
	Wed, 25 Feb 2026 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtQMfdW6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457CC2FD69F
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772020344; cv=none; b=BRUsSeQspN2MgASlOL7RMeqrYXCoBJC03qz0yvCLNqvXNs88j/J1rbumo+bL+ayOI7lWmzEklPNpevbBL9nhuGI0GiCaRrnfiCQIm1qM1Fkr1G9rAgzIZsD1vG13qp8lvgNe/+QQpQ8TV46q6z/4Zpq0HioGH5Ae/oFWd9ARZKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772020344; c=relaxed/simple;
	bh=aKpOtpB4MUuIsRLJHs1bLmZOtkzJaYfoJt/dGxVgNXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1SgzZjBYB1x35+ZJJAPZwovJPLnyQ3fP4sBCzJziQJMdEGToH4Fu1w3QHOfYkRUxE7h6i+MlZmc7m/Pkbguj0QfS3dSzcv8fSNF2DE5ql/2nAvPZvy0+hijJujQD6XZUTmqk+YpHscKJQHu0azSWGoqfCtg1KdGpP9zA3i59YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtQMfdW6; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8cb3dfb3461so677497685a.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 03:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772020342; x=1772625142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9N+5cRmg/VWwiWUJBlfDW4hUkqu3+KAj+K2RmGyc8Yk=;
        b=KtQMfdW65SZW3Xkc7wdm3JA+Tb0dydMdnMjtsZOnQoBCCzAV6fd1mYbFFBT/GIikTj
         AdaRbMauj1MLPuRAewSkQ+zH9osPX7MIoS3lOLnOyGPxxwmJWX1AlQ8Vhk1SVndTJdSL
         CYCz8HVN/whtXiZXZ/rvjhYjwRfyU3HBKbouKsGianwMBRuNO6/1anTrdRVn81MRogNx
         ait3eW0C28mg7EazOb78aVYnVGmyWeDWK7RtgJhQAlKlWRDl0aYtivgDpYPi+gZgWHyq
         dS94ITRC+I5WBgS+vZFFn9boPyYuU/A6FUCT6fqOxZtkut+Ea1S49lYOGDiYOSfJWMLe
         PjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772020342; x=1772625142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N+5cRmg/VWwiWUJBlfDW4hUkqu3+KAj+K2RmGyc8Yk=;
        b=JNHKPbTzUcbjZJuqiDEnbpVxRRdTe3bkP2V4KW88ThBy32b0t0MXdwXgPaxn8vFJIa
         iyphNBnkIJuaThoBj+bUZwHVWu03tWhce4FeFUxbY715nW9+s1pTHQ8cOvvxyi/pRCbm
         eBD7820jBGwtJP5PfTtCM7Lc4OM9i+TbOgv+8ffMIsdnqQA7VYiDbWIVgX5IOn18Yw5B
         rkJXtl+vQZ0W8IVI4UeQkzzIDWQi1lvOzk8GjM2YL7G6Gvc01iv5A751C60Tgo6OyY6W
         GEPwYaDcmk9uOxz1tzQ80ypycfxKkth17wI1ContZXxqrGnLVyoP/gVxDRIFHuuBRTMy
         ADUA==
X-Forwarded-Encrypted: i=1; AJvYcCX5jjVWYa5cSf8xX45t4UJvV7jsFN0JZ/Gv3uhjgV4JMspX61TUXfHZyynWlifyhHTRfYZkdodOvE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuNDteNa5RNdPt9ZZquhM3MYuw2/hi+75TDjs+TZbA2ZbJ4gYw
	FLLScaAbfcrwgERMKeC905dgNZFRjCHzdduGD1g1oJhm+quCJox7cOaR
X-Gm-Gg: ATEYQzwdpUGWenK01o49mLTZdwbs64dmLSqgP+3cwvpERxTPOB0XQbkphls273Q8jq3
	10zBQs6JZ3Qtdh9H7iR9vsxYRD38JhvMpl0M2RgOm/a3RoSQjUfbTzIgKNKyHa8NTb/v+1ng4XI
	H2OrroLOyDXn+ovSSW5Z8yficrfXIdVOJkpox5oPctjC0Z+ExF/8D4B8eXYGppkmlsb94SILMRj
	9WQs7pbXGyWsXl2Stt9X3WcfDY90hwjqyf0TYsifoQBigDx5bAeRpMCEf4ILOziwijSMWhwn30g
	b7TfFiNAZ+KjZY+KSRufWhjRoRZpiO3m8RPumxaF1OStviLybPXk/tzwQeSlW/FxyGi03pS8nZz
	UwYW2OrXG048O7EGE91j5/mP8anonIo+Uc0SvQZLnDWSV0PVmD806CzBHABQ3Z+Fu+T+jnSmiYG
	SicHbprHWwyaGU5vyC0910wy9iApzyi4BFjMG+WJ+cXWSV1WWOr6SCy1pnrmnokLHiQNBzAp1kh
	2gLBd5JNCkR
X-Received: by 2002:a05:620a:2a02:b0:8aa:36b9:8056 with SMTP id af79cd13be357-8cb8ca65113mr1864782185a.41.1772020341937;
        Wed, 25 Feb 2026 03:52:21 -0800 (PST)
Received: from mango-teamkim.. ([129.170.197.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d0ec694sm1251681485a.29.2026.02.25.03.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:52:21 -0800 (PST)
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
Subject: [PATCH] usb: gadget: f_mass_storage: Fix potential integer overflow in check_command_size_in_blocks()
Date: Wed, 25 Feb 2026 06:49:58 -0500
Message-ID: <20260225114957.1094146-2-eeodqql09@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,dartmouth.edu,wanadoo.fr,kernel.org,csr.com,ti.com,mina86.com,rowland.harvard.edu,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33694-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eeodqql09@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: EBC05196E67
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

Fix this by ensuring that `common->data_size_from_cmnd` is not greater
than `(U32_MAX >> common->curlun->blkbits)` before performing the shift.

Fixes: 144974e7f9e3 ("usb: gadget: mass_storage: support multi-luns with different logic block size")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 drivers/usb/gadget/function/f_mass_storage.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 6af96e2b44eb..12e7ef2e074e 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -1853,8 +1853,18 @@ static int check_command_size_in_blocks(struct fsg_common *common,
 		int cmnd_size, enum data_direction data_dir,
 		unsigned int mask, int needs_medium, const char *name)
 {
-	if (common->curlun)
-		common->data_size_from_cmnd <<= common->curlun->blkbits;
+	unsigned int blkbits;
+
+	if (common->curlun) {
+		blkbits = common->curlun->blkbits;
+		if (cmnd_size > 10 &&
+			common->data_size_from_cmnd > (U32_MAX >> blkbits)) {
+			common->phase_error = 1;
+			return -EINVAL;
+		}
+		common->data_size_from_cmnd <<= blkbits;
+	}
+
 	return check_command(common, cmnd_size, data_dir,
 			mask, needs_medium, name);
 }
-- 
2.43.0

