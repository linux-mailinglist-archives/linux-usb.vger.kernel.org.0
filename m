Return-Path: <linux-usb+bounces-36408-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DT7Lto36GkbHAIAu9opvQ
	(envelope-from <linux-usb+bounces-36408-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 04:52:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61408441A02
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 04:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 310CB307B032
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 02:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA77391E7A;
	Wed, 22 Apr 2026 02:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZpQO593"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3310730C632
	for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2026 02:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776825580; cv=none; b=Hw3Yp/UoXZFSYLX/WkZKI7sTVaRZX1jEFqP7lfW7LbLMsEhUtNXCr7XMfdvUVCCwdCAgUXVoiGpyO9ddM/gkQ18napPBA9wrkk7Y9RWEghin4e8aqnvkJMDkO7HC6bT1KoE5XgW/gPpiVRwCMjpVLimoeyYazrGXrh95ThIz5tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776825580; c=relaxed/simple;
	bh=yGfvG2cBrEHidy4K2K9IqvK7y2YzIga4aXzMCqEx6Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e56Z9QR7RZtorXrMK945do891VtC4K8rH20O8NmlDUcti6KlfZxf8kOszRvpSgifJCaZkc7kZ/03XbQx0NowA10GGzteoeczrW9cLYhUqlVrMY0sSkD3botgb66M1siZGsx2gavosufsxddqlj9QWe+ZXz3SOSAvbVZBGVksh54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZpQO593; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ad21f437eeso31865585ad.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 19:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776825565; x=1777430365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIzrzYUxwj+eWN+y9Ww82vKCDAA7PiDEJITHsFxKlBM=;
        b=ZZpQO593G6+ys2LgqHXSldPqAnbOFvW0Wgd2EFBtXvxi5Oj+5lovD6gBdp+eOe08l6
         bm1W0KBMDntwkD6xtNTzBBYUXUrJcYX2uOQ6j6gLG1NDTHZr5PgteIrpbnpLC0tAfVC7
         a0tq8X05i3Dw9Xk7r3LIiRPNbM2oHmUsglB1uCw/ZXKWKTcFZBf6UQSXNUd67qDA2NX3
         DLAjSPWEYsNvpHR8mJdIlem7rWotgD7OdyJim6oJP6QVB4nQE/KyMvbCFPyv/dG3rwo6
         hKpa3FbYiviMqUgNoqwowaPZl1qYxAL2yKbsRXyRi3dQOD0QSOkoW5chCPh8tVhCIyGv
         iKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776825565; x=1777430365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIzrzYUxwj+eWN+y9Ww82vKCDAA7PiDEJITHsFxKlBM=;
        b=Sl7fzBfkrOTJcl/+W+a6SCvTI0MQkhPv0nVWSCV8gMSWvTpVdJGK2sU1GquCHFnr2o
         3+8ZGP7telIvSA+PtbTyhq0V/dhM0068BY3vuBjX7o5TW40COF28yxvj6jdvpiH9hhSa
         tM98b+gLKtt9DOa5HnFTUOid+CFVR+XBsmNX8URBSpMDjQJiW3YwNLk8hSuyT5c199L9
         WZzrVQ4x+KpZQHbeTtTxsetvlyPhqUg26v3Fb3Ac1lPhP6FYprDgVlK4sjmFN2gSuN5q
         Uw7YZcGjK7cPEZgE8IUHEvjT5iTahsB3U6HLac31aN6Zkj30XlD10a5nZIayNmS68gA4
         kyZw==
X-Gm-Message-State: AOJu0YyKd24FEz0EVB6wAOU7dk924fAWFhZO5EUiE1Cibe4WqViNkEH8
	MNuTwgrJB7JUtdei3gR0BwAd8Aq/9jX9KXKHLLEIp8zpczDUveeTDjvI
X-Gm-Gg: AeBDieuqtinxPSW3Bum0GLJx2d5Pm1+0cNXnb/+h0YJNTV5xOMT5EcwO9IWhPLtBQx+
	pfzhTaRTAvgWtuAw/kcULNyCv9hPdRjZbqSNYWRBItZdgRb0Y9t4IWkatVVC+vdVueq5W81PCu5
	uPrhj5qa5fWIfhjxzWRCxLmo+vJ1mT87JpCSfz+lnfOmQyY/P3F9VeVDsMfpgspwKcpGIDfYn1J
	/JBOAf3QJxD3YnP/tPnX8u5eSq1U+R1zQ57XqW7paOHLMd3eHJ3Bs3P5/x7cr13kV0rXfVI2xY6
	/K3ncMT8W2tldUGrl09P1xpAtSzoaqcBzmbbO1BhA907XbU43CFwd1J9BfzlnEXtoYo5NA1e+Fz
	BXGz5mcn9gdTPytf2fQjsLJQ4vZAj4zxGDHmHabXLAYtdgK4qFynUNcOceYjBCZrnxkN3PuvJRS
	+7Zaq9bcSV2sCoUDa7gfEks1Czh7+tzQ/z+4IfxB30Ky9tFmhWbPQMgqIdPEKeIFwWnaTPPpoDy
	YmpwiYRba54LoZ4
X-Received: by 2002:a17:902:db11:b0:2b2:5070:8b with SMTP id d9443c01a7336-2b5f9da50b3mr187447215ad.1.1776825565303;
        Tue, 21 Apr 2026 19:39:25 -0700 (PDT)
Received: from localhost.localdomain ([156.59.4.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab28e35sm147548145ad.64.2026.04.21.19.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 19:39:24 -0700 (PDT)
From: Bingquan Chen <patzilla007@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	security@kernel.org,
	Bingquan Chen <patzilla007@gmail.com>
Subject: [PATCH v2] usb: gadget: configfs: fix OOB read in ext_prop_data_show()
Date: Wed, 22 Apr 2026 10:39:19 +0800
Message-ID: <20260422023919.37588-1-patzilla007@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36408-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patzilla007@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 61408441A02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In ext_prop_data_store(), for unicode property types, the data buffer
is allocated via kmemdup() with size 'len', but data_len is set to
len*2+2 to account for the UTF-16 encoding and a 2-byte null
terminator, as required by the Microsoft OS Extended Properties
Descriptor specification (dwPropertyDataLength must include the
terminator).

However, the null terminator is never actually stored in the data
buffer. When ext_prop_data_show() reads the data back, it computes the
read length as data_len >> 1 = len+1, then does memcpy(page, data,
len+1), reading 1 byte past the allocated buffer. This is a
slab-out-of-bounds read that leaks 1 byte of adjacent heap data to
userspace via configfs.

KASAN report (5.10.252):

  BUG: KASAN: slab-out-of-bounds in ext_prop_data_show+0x4a/0x60
  Read of size 9 at addr ffff888005546008 by task poc/62

  Allocated by task 62:
   kmemdup+0x17/0x40
   ext_prop_data_store+0x52/0x130
   configfs_write_file+0x168/0x200

  The buggy address belongs to the object at ffff888005546008
   which belongs to the cache kmalloc-8 of size 8

Fix by allocating len+2 bytes and explicitly zero-terminating with a
full 2-byte UTF-16 null terminator. This ensures the buffer fully
matches the dwPropertyDataLength semantics (len*2+2) while eliminating
the OOB read.

Fixes: 7419485f197c ("usb: gadget: configfs: OS Extended Properties descriptors support")
Cc: stable@vger.kernel.org
Signed-off-by: Bingquan Chen <patzilla007@gmail.com>
---
 drivers/usb/gadget/configfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 183a25f65ac8..b2c3d4e5f6a7 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1352,8 +1352,12 @@ static ssize_t ext_prop_data_store(struct config_item *item,

 	if (page[len - 1] == '\n' || page[len - 1] == '\0')
 		--len;
-	new_data = kmemdup(page, len, GFP_KERNEL);
+	new_data = kmalloc(len + 2, GFP_KERNEL);
 	if (!new_data)
 		return -ENOMEM;
+	memcpy(new_data, page, len);
+	new_data[len]     = '\0';
+	new_data[len + 1] = '\0';

 	if (desc->opts_mutex)
--
2.43.0

