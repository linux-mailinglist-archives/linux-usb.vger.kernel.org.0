Return-Path: <linux-usb+bounces-26844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 685F4B266C2
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 15:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9883A189C9F9
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 13:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8FA265284;
	Thu, 14 Aug 2025 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZowA7Ua5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87512FD1DD
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755177375; cv=none; b=YpW2A0CoqQbCaZDqUTLW/Z3pD0eS0mp7NMAJYYV7BjBpZ8vC1XCLSOdFm1I00kRPT97aKXPzCrQkmbUyBO64AFmLJxysb0rANQ1yXbiCmiFHXATLHVSYn24f9fr0qYz6AcoOn1aECP77t6JJVlGPvgzwTzh3o7orlVfgZ2rg6cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755177375; c=relaxed/simple;
	bh=vDgLCKeM9Rm47mvfPdZQO1ayaJxXfRnOciQ3IniGbOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WuJkhpzUFs3g7TsdNlS+lIm0ZiexfTHS+kRxIq5hmEdb/EKC2F5ta1RAro5acCej6V8V8LW6GM7woPW8Sj4clRqOg+OEyVwPrDS28qO40GZjiQ5JNqCYPiFuUcdfb8I8zBorYO5z0+un9INqzTorr9KmGXx57Ut2lCgTP7ARnAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZowA7Ua5; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-71d60504bf8so9457887b3.2
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 06:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755177373; x=1755782173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9Jgb4LzWojXG+ANRiQlMnzmPA1OevpTwzc0rGly+PU=;
        b=ZowA7Ua5EtGIN3BU6K0zoFTBFnOivKBI49knpuJTAw8RnDTRlQGRBLqJ8GZb6rZ6y/
         e4LeGCLIRoA1xgs/g+mQNq9JwNT69QZmL0WtWfdqxLXlF8YRgqJb+Q4uOggvdu6zn4j7
         ZThtW93QCNc9iYhjrFaXi1tbkD1S8ueCjG3v/ac00auAmWGzEykvuT6J+NIgDhNATWCR
         0LU5xFBUXNJ4O3SWpaNoTS/dsOOACNYG9ThUKBV5Ej/asHz+086o3hO9/5inOeZz0TcV
         r3MgLmnzcwPscWje+Z4/dmjys0jpvhn/OcKJbcnRIyxrTRuyGKuU/RDg7N73k+MB/qEn
         9t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755177373; x=1755782173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9Jgb4LzWojXG+ANRiQlMnzmPA1OevpTwzc0rGly+PU=;
        b=KYOBEFkKTZmdJA6vrU9vrjO8oNSMgKJN2puixC4nI3XqxLbhkmvj6bScCiK2AQISE2
         Y/qTvozCqja2CfldnvhDNWHK+1sn2hLO/JXVXbn3eOb3er599bhTVUCTMJIgBOCLvOP1
         WqzV005RDIhgLAtPISlQoCZJBXGqNnBWOr4kXdxM7sNSLpWB+MZTS4FjXr7JyupB8zXT
         Oun0P4B+Pd9CwNgsAFemW3lI0uamdGHemRwOZJDlQof0JCUwm3JfRCZkgV+n73PmqMjo
         dp5xUjdqGofAbqPPSIiPbXg7a39quLecFvHXzuYe287fDXnSMSmNg+8HrcshwBuzDc7C
         nAGg==
X-Gm-Message-State: AOJu0Yy8ClE3flyMaO28SApc/aHTh9LZnygXBFZf5KwmsNtCW1+cJsG3
	v3bFptmd6Qd4ZN3JmEF43SX1OsLHjZ88eHYZtGTmiLs7zzUn0prhCrIY
X-Gm-Gg: ASbGncvDN9X+gcgeIpxyjrlIuaopXhswjyJPyNekd3toL4KGN694RsW4kJ8cM5tGCGj
	eB+37ceWAhXvHClZeGZbpV1oMbsoDmmPs/4dnTkp+6Xni2inYhyjFQiPVRLpVV8dQOo+BrWvw/Z
	7NgOyRbRTL2g2Srue5NnL5k4HU5xsFehYj3wg1FOggpFwYlnnqjYY2PTSG5HDLzXnxoLP+H0mdA
	G1B/8zdNgDbunECdLr2ReTiNQC9fryjQIx9kwNsedvZxlqSpPo5OoxMKUzgOaEQDcPq/o+CE7uk
	gekW2XdoaxFT6cfRu91URWev1VAH0M2Kl7kIZII/jIZUhjZeWudzpynoo0/nIhWR7hfh8f1DK7g
	cIGE9Ya2nQ1pR54BihASzmFWIRN5EyLkS/LZ7XMyi6f1OqCrsR3T4Z7qrPihUGLmAI7FEXB01v5
	NFu7sH4XvUqT68ji8=
X-Google-Smtp-Source: AGHT+IFHaQLrohfwWciNYh0bgIFdtlztuV1dcBZ66XAwOspA+7lBMViadrEJG4pQ4E/pFWm4tcLt8A==
X-Received: by 2002:a05:690c:6002:b0:71b:f19a:8864 with SMTP id 00721157ae682-71d6363a792mr38868837b3.41.1755177372443;
        Thu, 14 Aug 2025 06:16:12 -0700 (PDT)
Received: from KAG-86297.KAGWERKS.LOCAL (static-108-44-230-106.clppva.fios.verizon.net. [108.44.230.106])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71d60d5ff2bsm5948217b3.5.2025.08.14.06.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:16:11 -0700 (PDT)
From: raub camaioni <raubcameo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Raub <raubcameo@gmail.com>
Subject: [PATCH] usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
Date: Thu, 14 Aug 2025 09:16:09 -0400
Message-ID: <20250814131609.593641-1-raubcameo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Raub <raubcameo@gmail.com>

This fix is already present in f_ecm.c and was never propagated to f_ncm.c

When creating multiple NCM ethernet devices on a composite usb gadget device
each MAC address on the HOST side will be identical.
Having the same MAC on different network interfaces is bad.

This fix updates the MAC address inside the ncm_strings_defs global during the ncm_bind call.
This ensures each device has a unique MAC.
In f_ecm.c ecm_string_defs is updated in the same way.

The defunct MAC assignment in ncm_alloc has been removed.

Signed-off-by: raub camaioni <raubcameo@gmail.com>
---
 drivers/usb/gadget/function/f_ncm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 58b0dd575af3..3164e75caa3b 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1463,6 +1463,8 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 
 	ncm_opts->bound = true;
 
+	ncm_string_defs[1].s = ecm->ethaddr;
+	
 	us = usb_gstrings_attach(cdev, ncm_strings,
 				 ARRAY_SIZE(ncm_string_defs));
 	if (IS_ERR(us)) {
@@ -1771,7 +1773,6 @@ static struct usb_function *ncm_alloc(struct usb_function_instance *fi)
 		mutex_unlock(&opts->lock);
 		return ERR_PTR(-EINVAL);
 	}
-	ncm_string_defs[STRING_MAC_IDX].s = ncm->ethaddr;
 
 	spin_lock_init(&ncm->lock);
 	ncm_reset_values(ncm);
-- 
2.34.1


