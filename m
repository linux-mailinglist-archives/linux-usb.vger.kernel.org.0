Return-Path: <linux-usb+bounces-33479-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEDZEyo/l2lXwAIAu9opvQ
	(envelope-from <linux-usb+bounces-33479-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 17:49:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E60A1160C90
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 17:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B510C3011369
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 16:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABAE340275;
	Thu, 19 Feb 2026 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rnta4fBr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E742029B8D0
	for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771519781; cv=none; b=Svq5+kJbSsbHQTu51dhRDhrnbNvUSqUIrMeFPYQKv5RDmxcjEaQXEJzfyRgCrrDPT9POK4Q8HyTrqCfJ9Mc4paHrl3G+lv1o1ans8y76CdJWhfrpUU7beVXlhgwrcNiQFkPPxKZ6zMAjwAreRACmA9m7W8NT0Eqr7epUk6dRcCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771519781; c=relaxed/simple;
	bh=wu2y8qvxPJrj1LSskci9LnDc9TnGft8OMozPu33vaqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WUM9kO4RG68eUlBxm+SGFVNJZtxmPY/tzQqAbRWFq737+bFyCtV1AX+vQYIcxYk7f2vneCet/oR9mXH7K0ynLr9ekMBcA7ZtD0EP8Ize48TCFy6AfARR1MgzrLHP/J0eRrRI80TeAEdZjirKKBvwbNFNDJfkXgiLQ1gvOYxi+9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rnta4fBr; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cb40030be5so111135985a.3
        for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 08:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771519778; x=1772124578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajlAwJMA89dha7k1qNPLRhkfyEO6+wm2NkkH+CjGbYs=;
        b=Rnta4fBrb9AWEkQpoK/BUod3GzsRr008+5q/09vvbphFY5kpf7Jd88WdflKGriDxbd
         bLzkgSqo6aewvxi38dVHUJGfobSCCqyW60VEPYF7vM2L6fEg4/3rEJJ6i4/G4TSwzzcY
         X6G0rEfAVmNvBP6jDOVnuqRZDuc9L4fvIWyKmKPyE7SwJRgbec9qAZE+TKVhqpjgUZ28
         PaqrsCyCdYWjXq/DdsxpeZJCbp0fp1Kp2f4dN0/84qgtcCdj5RdXPEer4sfUZy9qS7c9
         vbdyt2a9ZFZApD9eOhDH4LEr1GGNRrldqVQOzUCWqDlG1NZYMguZbXZVxYJGLw9kecCe
         oYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771519778; x=1772124578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajlAwJMA89dha7k1qNPLRhkfyEO6+wm2NkkH+CjGbYs=;
        b=sMZp541RDZyykg28Iewb4Zz0cvSzN7Xy0+i0nl4z2294i5nK0dhy06oXLtUB1UqR/X
         uK6VgavEiX4uv1BOH/gxJ/SRWL67mNLQ3XFtENvClZs8b8gNpgjcewLzZBltzDlAMLzw
         qHzITj1sBzFRrYjPnOCT79rU/hbfpCSWcmqY+D7dsfWlYAwOaEkdDj8O9yQey4HWiHB1
         T2eN6ZZxV1oDUzZuOKiEMtk6q9C4YRFJ65A6jk6sXp6w14AFJW1yCH3DiPop+6XQQKsI
         IZDuRWXpqI97QXxWGD+uLv1EJMZBJG72Gn6B6/RemenFp3w+ZBFm8i83Ulz9EYpSeC06
         yXrw==
X-Gm-Message-State: AOJu0YwHpWNDjjyMljMsrRv8JOoH7FB/3GzGzAfOoHy1cStviU2vTUIJ
	d8vCAuHB2dwV8R5N8w0nW/YK4HRI7anIAP4bMnz16yTnUlzOmT3hXv++liaHZQ==
X-Gm-Gg: AZuq6aIb/hrmGcHaoHM/Z0H/1pSGkrRQIOBeRYTRgK31ZGJtfTKYuqrZDwMS4xhmLcb
	OVmAsTU4dnJAv2Y39t9fPaq7kaknTOD1w4/qqRxvmHVMmc2C9ieamuBCPM4BWOUFQQ/Fr6mzNDN
	AtABcq9BJjALSCi4NwgTxNBvZe2/4FbxuCBjVfJ1ZxZj4yo4pYESbPb9W1UuqUdRkja6tT+UpIK
	xiXtq80I/TRMxRlewlcwJBHI8Bzlemzgd/RSN0T4lLhVbWZiW5ko9KpUq7z8qVK964D6Hto7Asw
	lXZL2+WHprbpeUL8AwF236wjbe2CAC/NwRzPDRxiXhdYpe7faX6HTiXRhsyUa3A+42Zyb9CvRnV
	vcBWuCvcHxdccN4ABhErDerMbJ5RNemZV/avB4boklTGTm6+jvcyBWdiE15VieMN6gjZbFpvakW
	zuWhgP5Nr4wQKCNAaVYYvGKOL250yjIxCZ0+LM4EftZzrN5r8XzirzmFxQCgXrvoe1kG81AUQrL
	vHKfq/yD1WfzE0NZp5Epiju+aXoJgs=
X-Received: by 2002:a05:620a:1a9a:b0:8ca:2e36:18b1 with SMTP id af79cd13be357-8cb741036a8mr722239785a.85.1771519778362;
        Thu, 19 Feb 2026 08:49:38 -0800 (PST)
Received: from localhost.localdomain ([129.170.197.104])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0ce73fsm2259615685a.11.2026.02.19.08.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:49:37 -0800 (PST)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: [PATCH 0/2] usb: typec: ucsi: fix input validation in UCSI core
Date: Thu, 19 Feb 2026 11:49:22 -0500
Message-ID: <20260219164925.3249-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33479-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E60A1160C90
X-Rspamd-Action: no action

Two input validation fixes for the UCSI core driver:

Patch 1 adds a bounds check on the connector number in
ucsi_connector_change(). The connector number is extracted from the CCI
register (7-bit field, range 1-127) but is used to index the connector
array without validation. A malicious or malfunctioning PPM could cause
an out-of-bounds access.

Patch 2 clamps the return value of ucsi_run_command() to the caller's
buffer size. The current code returns UCSI_CCI_LENGTH() directly from
the CCI register, which may exceed the buffer provided by the caller,
leading to out-of-bounds reads in callers like ucsi_register_altmodes().

Both issues were found via static analysis and confirmed with
libFuzzer and AddressSanitizer.

Nathan Rebello (2):
  usb: typec: ucsi: validate connector number in ucsi_connector_change()
  usb: typec: ucsi: clamp returned length in ucsi_run_command()

 drivers/usb/typec/ucsi/ucsi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.43.0.windows.1


