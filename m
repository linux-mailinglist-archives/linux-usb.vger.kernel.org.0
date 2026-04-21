Return-Path: <linux-usb+bounces-36394-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICFnOdWF52m+9gEAu9opvQ
	(envelope-from <linux-usb+bounces-36394-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 16:12:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B94C43BD0D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 16:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 309AF30241AA
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 14:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280AB3D6CB8;
	Tue, 21 Apr 2026 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhcDVgzC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828F13D7D76
	for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776780621; cv=none; b=jADTVSjc0jsFLShD6mdGzF0x2x1ihcal/SImtipcc2hUFKtOtn5RmCOE3YrtsNdAeeINRyK+cwutIxVjumgAVY4zEZw5hf4xhFyMVeWcU4bS7Osa+qLBkAcNdFJV2Yh2zIC55Gl+HgKl/rhMqlW/hIJ0ayDM2mF5JhKBnKJDYT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776780621; c=relaxed/simple;
	bh=kIm5kH85UH7+YNKd5iqnnO1F9CcZhlSMdP4GNhN/Tck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KUP74w+X3yTpygz/H1AAI8VNIXGnvzL48ABMR5fqT8UarzHxURYmBxPkuJigDWo+UKR2ArhwTbYrEaXrEmstxX30zpHxJ/R6YzMYHnqxHBibhCONF265dDvllNCFVPQZL64xaknTc9hfD0B68BcGIgcWkuE0EMmrcAMfT6htvcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhcDVgzC; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c6df0b9bbso401104c88.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 07:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776780619; x=1777385419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qY87NJeBopBZl+AvWsat0W4p5pkhAeY8QFNi7OA2YE0=;
        b=YhcDVgzCYZ9mHwwA07q2HfXzqGm6Tfld5Hlt+8ux6yxRh2gL/43tYtShuSiZ35XxUG
         jRMV9Go/GF6JmNISgFfq28ZSEzTfZKfMwYcDCOIChpMkl0NlS58bpsX/l/Fq5rbiKrQq
         KLbKlMOpOWizjYaYUHaoBcnBfZMdb32HpN5lq/PHoKeFHC/TaMHZg+Dv3jBjrGKVZW3o
         4n1BZ+bO/4x8+OwJT9nbEDdVK5kDRfyi2EfOIiyMOCCVfVTP2S4/5LnIqPVsute6DimE
         hdfZ7HVGoxDt36h2Zx71+fa23TO8qBD4BSkr/p7bT+E6dyJd3nxuy40CmlgmivYL9G3u
         /zfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776780619; x=1777385419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qY87NJeBopBZl+AvWsat0W4p5pkhAeY8QFNi7OA2YE0=;
        b=f8/ik2nCa+WTSodPoYgRYp6l8BHnJth2O0ltAvadzVJ5I/p2LbYIONF/Fw6fzNE8zP
         6txpcl97jYHpojfBJYlttMgtgU2cwWPDWu/k1MiTj85IMfrmad6kBEBammtVnvVUob8C
         aCGG7watP4mRSLb5aEM6NzIuTrR9ZYVXL8Supg+dHVib9C6he598wKwsZ9b5VqDXquE9
         Cm+Vt8EJMc/jI4pz2jBoc08vV4tpp0xEPxlix5PeQef2bzsfT1iRRm+S93zWUhgrHfkY
         /PRhJ71Cb0fbX8447rCcdplx7IYF2c1O3fY72Re+8JvSh0iLDxosQt6+DzMzftmzChCb
         CEog==
X-Gm-Message-State: AOJu0Yz6Xn5xmNiThCnZaR+Qfat6iKGWxh5pebICw3ZkAeukAd7XZxi9
	b4kYBH8zsojIN3et0eZZSBF50xOLyluwUbxGoGUQQGlKFED0i1b6NoN4
X-Gm-Gg: AeBDieu5pW1U7Q6ry0jCo7NmlPZNEC98tFvPc4y5DDkeK4Z9mVwsRM4UylckXl1cSuZ
	/O6p9+z+S3rqb0DhCyz9zeJLXBLiUyAtLV0fPB3STjQqSUKlsqfwVgDdwLoddKy3C/kxS5KJASF
	mLiH0BtZcTOiHvFeOK7fVLenUK7zGQ+pLWrNaUUUMkdajRaKg1NHEGaekLw6z/ZIIy6FBaYjZSA
	4ZCysFypjy0hF69HXI2WC9dMwun9/qVGTufN32mjvTEuifeJ7N9vL2AS6Um9tG8kJj4CyxNIuAu
	XcuSgv+Fd+/ns9Q2wpvtnIgogt2XwxA0scACtMLknDw5TBaYt0DfI9hAP47vHz2Z3GsCSjvwGkn
	mjk0NxmnU6hhkjYu3Kp58kPyMA2qVCWYkKsktm0selX9xjXIdfhlNGw6WrQKFJITTQJVnVOjQXW
	w2ZtNxHx55zmd0DZhtcmAl4WF1rEdXcG7A+VRnW49YTxKdJvmAY8awOmTMxLFROuHAjPJntCsGN
	QKeqdB9
X-Received: by 2002:a05:7022:6988:b0:128:bae0:e03c with SMTP id a92af1059eb24-12c73fac23bmr9805997c88.30.1776780619321;
        Tue, 21 Apr 2026 07:10:19 -0700 (PDT)
Received: from localhost.localdomain ([159.54.180.171])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c831d5b29sm17997432c88.8.2026.04.21.07.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 07:10:18 -0700 (PDT)
From: Bingquan Chen <patzilla007@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	security@kernel.org,
	Bingquan Chen <patzilla007@gmail.com>
Subject: [PATCH] usb: gadget: configfs: fix 1-byte OOB read in ext_prop_data_show()
Date: Tue, 21 Apr 2026 22:10:10 +0800
Message-ID: <20260421141010.5607-1-patzilla007@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36394-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patzilla007@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B94C43BD0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In ext_prop_data_store(), for unicode property types, the data buffer
is allocated via kmemdup() with size 'len', but data_len is inflated
to len*2+2 to account for the UTF-16 encoding and a 2-byte null
terminator. The null terminator is not actually stored in the data
buffer.

When ext_prop_data_show() reads the data back, it computes the read
length as data_len >> 1 = len+1, then does memcpy(page, data, len+1),
reading 1 byte past the allocated buffer. This is a slab-out-of-bounds
read that leaks 1 byte of adjacent heap data to userspace via configfs.

KASAN report (5.10.252):

  BUG: KASAN: slab-out-of-bounds in ext_prop_data_show+0x4a/0x60
  Read of size 9 at addr ffff888005546008 by task poc/62

  Allocated by task 62:
   kmemdup+0x17/0x40
   ext_prop_data_store+0x52/0x130
   configfs_write_file+0x168/0x200

  The buggy address belongs to the object at ffff888005546008
   which belongs to the cache kmalloc-8 of size 8

Fix by allocating len+1 bytes and null-terminating the buffer, so the
extra byte read in show() returns a known-zero byte instead of
adjacent slab data.

Fixes: 7419485f197c ("usb: gadget: configfs: OS Extended Properties descriptors support")
Cc: stable@vger.kernel.org
Signed-off-by: Bingquan Chen <patzilla007@gmail.com>
---
 drivers/usb/gadget/configfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 183a25f65ac8..a1b2c3d4e5f6 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1352,8 +1352,11 @@ static ssize_t ext_prop_data_store(struct config_item *item,

 	if (page[len - 1] == '\n' || page[len - 1] == '\0')
 		--len;
-	new_data = kmemdup(page, len, GFP_KERNEL);
+	new_data = kmalloc(len + 1, GFP_KERNEL);
 	if (!new_data)
 		return -ENOMEM;
+	memcpy(new_data, page, len);
+	new_data[len] = '\0';

 	if (desc->opts_mutex)
--
2.43.0

