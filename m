Return-Path: <linux-usb+bounces-31075-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9704FC990D2
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 21:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 15B31345A91
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 20:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E68281520;
	Mon,  1 Dec 2025 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpzPzgO3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5B827FD5A
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 20:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621451; cv=none; b=IYDM6UHXvWrQM8Xc0NBxu9FQtDukczjbuCuF/CIvrw/sHZqxr3vwadwX/O3JCF5w6wXvZhT43MsFyi0fsezjWMM8N9HJpXseyrByt63ZngOGIHamZUhFSj6k8WcvCw4JSZ+aPi58ImzAgCFj1DU77+AllYQjyi/Z4++q1U+WN1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621451; c=relaxed/simple;
	bh=t1stNn2JIg8QY9Rz687/0JNAKdfT4fwmYs5nGW+tfxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4V/pLv1Ok13j6pjvR2ffpN4mD+Q6nJiasAA3yyhI1i+bNESkSj+RJRQQvC84z+lrsxlIONasptubb+rWIF9xdOwGada9jzHcpID2uJXqijijkXhFOtoPne4vjc1vmGAE7r2xmC3yefLKwlwS/rKbtpN83l71FLQULD7/wZsnC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpzPzgO3; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aad4823079so4085797b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 12:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621449; x=1765226249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5EvZHP/L8HTDXW6Wdjo3Us9Wv7cX8ga9zfOaw1spm8=;
        b=JpzPzgO3CZObe/+R0MKlILckrCZorCZVB5t/nzxFytD5fqZSvb0S61frgTFg71EGWk
         7A02xSSnKcY3OSF5oIW79fnOHeWmx2BuDydxYGLLcs94du9TX1TnKypBDmg16kffhzDu
         Pvyka8/5RqbKQJFV1rh0THcX6nBzfQ1RlUOF9n7CiZg9qg7paLIIGzziHzhvKvjrghPL
         olWzGEFErrSFP3ewKEYdEOtlT4RGXLf68VnPXDNWh3kqbHGT+oFQnrmkdUPUqaXjxWZO
         ymvKGXyTKgCGgYueTDGYSSlbg9F0HX9JtO7D0BBdvGHHR38mgpqoRTm62tI6l3JkfOlw
         FwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621449; x=1765226249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5EvZHP/L8HTDXW6Wdjo3Us9Wv7cX8ga9zfOaw1spm8=;
        b=VP6xLQHuR1RXW5vtmP/rf5vjLyF0/PtqrwI7CE5iug9v8rX4kAfXjswEFyzu3WeC6P
         E6BF6O8lhIMRW0fZtybTrYNrcIDvZIstiuiCW568g1ohI3RUWIsGMhAu4eWtwT7EbOff
         1hlTNILWGD2zb6XCG+FeoE4PyUm1QuSoHQlvUkxoFxqiAgo9tdr1Ee6X/RHuHJLzoPrr
         TVJD1uoO4dQFEdCDqn/jDk8c1zQmaR1EVEcUBOqX6r5yvyNYrJZvbE2N831/1zeJAcUh
         MEo+XUH0IXMWP7ruy0uSqAKiQ/MC/d0y2sXlgSue+KNyTa52QnXbkwXbrmv7R44L34+g
         AoBA==
X-Gm-Message-State: AOJu0Yz/D59jb2puIew86CbSdtF44dAccU/OewQipv36b/ysU8EgsHdF
	ocIKj/23n+srU1vYuJV9MOdN6swtAUTUiOn6Z2leJ/j3b9XhZgcV1vP9
X-Gm-Gg: ASbGnctlj/9o6RcqlC+EIvcRRyMAgWy+I1XFjg6z+PsTgZQ29qm9FpJzLcJprR0eq9m
	VkFXijQ4Z7dEmOSCDvDWVOlZoKWFhKwBEbLtxMUOJ5l+P9fc+JUS2hav9W0GvE8NrZRtzTlMgir
	E3yg1PaHaOZ5ZAbvwddMrhdKHY9UsR4x7JOSz2jRgDMxFtTxzEi+gPSZgnmyhV29z/wwrtB2Vhy
	5EGCRBpWDsXgv9J5ejarIoKdLsTUP73gN8aObngLe0QFc8hRAlgjsVYAJVz4DvcOcPLb6EQFKpc
	O6JcVB+tNLoToin3VoCiJfCAN7QJvaSpfLrGDcbkfpifK0tQ2T9bpaVHE6JDIPz3v0ICT/9QESz
	ik4NNgb9fMikUmBdKsJCxzqyZlBVB7O8+ZmBfntxPaQjg9eKhhd0czeASraAxXy/geexMUAjgQW
	+BdHLp/B/6egcwaZmjajvDgszsCPgWMdEwj3M=
X-Google-Smtp-Source: AGHT+IGGWkNqfxSsX6EGB7T9IHuppSj4Hv0wTpEGLyZpu3BctLYgLyzqhlB5dEqW3K2Y4RA3M15dJg==
X-Received: by 2002:a05:6a20:a126:b0:350:55e0:5522 with SMTP id adf61e73a8af0-36150ef925dmr45927393637.37.1764621449336;
        Mon, 01 Dec 2025 12:37:29 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:29 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH v2 1/6] usb: gadget: dummy_hcd: replace symbolic permissions (S_IRUGO) with octal (0444)
Date: Tue,  2 Dec 2025 02:07:10 +0530
Message-ID: <20251201203715.17768-2-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201203715.17768-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace existing symbolic permissions S_IRUGO (Read-only) with octal
permission 0444. This makes it much easier to read and and is consistent
with the kernel coding style.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 1cefca660..fadd3d0c6 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -73,11 +73,11 @@ static struct dummy_hcd_module_parameters mod_data = {
 	.is_high_speed = true,
 	.num = 1,
 };
-module_param_named(is_super_speed, mod_data.is_super_speed, bool, S_IRUGO);
+module_param_named(is_super_speed, mod_data.is_super_speed, bool, 0444);
 MODULE_PARM_DESC(is_super_speed, "true to simulate SuperSpeed connection");
-module_param_named(is_high_speed, mod_data.is_high_speed, bool, S_IRUGO);
+module_param_named(is_high_speed, mod_data.is_high_speed, bool, 0444);
 MODULE_PARM_DESC(is_high_speed, "true to simulate HighSpeed connection");
-module_param_named(num, mod_data.num, uint, S_IRUGO);
+module_param_named(num, mod_data.num, uint, 0444);
 MODULE_PARM_DESC(num, "number of emulated controllers");
 /*-------------------------------------------------------------------------*/
 
-- 
2.43.0


