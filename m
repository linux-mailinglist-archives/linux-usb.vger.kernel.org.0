Return-Path: <linux-usb+bounces-22240-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3C7A73550
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 16:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0124F3B4364
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 15:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5782C14D2B7;
	Thu, 27 Mar 2025 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kbF/Fw9M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A93C146D6A
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087858; cv=none; b=X5iecNTMbJU/MYqnqOFk4+vfZVc8Fc8aLRr+eExN4WTK4Rwaar8whFNH1aIRgfAYTrTIQMYbFWPgw/N61uS1WJ606XMz33uN/jbOPJ5+P2YR+sgeJfLTcgot8LuhJX6bPedtLLuGnKgiBATmn3wJ7QZnAZoumRe0NIozWRbRl4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087858; c=relaxed/simple;
	bh=hTh/cfVgLHrPOGu6GYfIXW4bOU+Eq28EHmrYsiW2aWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnDOhhyYDzac9ZHky5KQTb6Ms1bOpWoQx718IjtT4iApSitMx0s0vMBsQmpVu8hwbgkqj91CwH8TZmyvPpGAVO+eSPGRKy741mk9oCfunA6Tz7Y8/JhCFAY+SgX/uktdQmi0sQ82PEqlI6lXigTcjLFGgosuSruNLPhiFkZVcSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kbF/Fw9M; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224171d6826so29177205ad.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743087857; x=1743692657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dzn/q3DwJwUQakeNgiZfS0yjXlYy1cHDyYLgM2hgUc=;
        b=kbF/Fw9MBisX2Nd+N1XCOWW4BNOdcPuWdY/X1h4czHDt63O1ELouX1qamvPp7ZmqY/
         P9QL4FSdWBbeQrmTo2rTG8o/RQ+2AnW8Cy6RuIR9vumG4dN4PlvDb9P3ub3BnG+YBp7R
         obrEjGz2Sj7Ux5o+3km31lHIumfwOFwGI5t7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743087857; x=1743692657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dzn/q3DwJwUQakeNgiZfS0yjXlYy1cHDyYLgM2hgUc=;
        b=JFFdiW8S/M2leJ9nvVAj3sd2I5Ejob4xesaNHkGcSWKZ73FSfdVDdiKUwwEm9z6wdO
         iP+Ek6eeJo45Lnp1CV1ND4DOhXuKnvfuOO2B6xJE0kKQ+owl/45e6BA50U1Zr3qkWXse
         eY9gb+Qz/yJ9f9Oz/A4RHQZJ2J4zFrl2+N+931MdSS9K2OoylRtFuNsQlHQzoMKMjmCA
         nd6tzZLW74ImhiJBwF4gbnwKBeNjOAUbF1YG8t7VUioD9d6OzMfjsTyF1FGlkZA8CUuH
         F0wDapkgfsJnT0w4vPFuE0Ig8QL3PQ1CJFNrI8nieGlGePG9UKr68wI1TSE8BrXE8klK
         Uj3A==
X-Gm-Message-State: AOJu0YyJuAGWaxmLe04EdYKg/NJFIhQyx0DdBrWxzeCTufHUUnv87spv
	+a0dFrlslRY2wO0pd24klrO2e8Xc/ag0lqfnQf0ZKjdFRlpBJLj2XOMXRrS5LHIUkqnaiMmKWc8
	XXQ==
X-Gm-Gg: ASbGncv2Ncma0keioEf/xzz1oFuemoj/HT9ZF0T9ufVqSB7e6dPtaP3TrP6S0I2rEop
	9V2xlSeRbnTaYkP63SERN7deC0SksPnoEJb7Z1/shE6gtoP3nwHJlDqt0M1njMl1aJRUqoaac3+
	OkF0Bt8jpPHPqDVaJfksy6dZNIjZCT5GY2IokDF1Zr8Ev0USfHSPLSjUPozookGtGg/bMLVS3bQ
	7/+M6kR2iXZoGBIfrPjan7NiZjwFIBUztqQNf8eO3CwEmL0NP268NZ7c954n8bstTzpq0Oe4aqc
	JZIJh6ZTLd5Z1u6MQmzGB53I8/mBxsa3zn4x2cv5FpRUB5W5sjDlrZFqDNsNGIExSVP+Cg==
X-Google-Smtp-Source: AGHT+IEVqGTm9SnJQYYYVq75N+ryfrvO/8a+zp+Bo8G0CL6FxM48RSgxG269/Ff2pGWCEpMLTxoWGQ==
X-Received: by 2002:a17:902:ef4d:b0:224:1ef:1e00 with SMTP id d9443c01a7336-2280485782emr63449195ad.19.1743087856578;
        Thu, 27 Mar 2025 08:04:16 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:cd9c:961:27c5:9ceb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0bafsm619715ad.90.2025.03.27.08.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:04:15 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCHv3] thunderbolt: do not double dequeue a request
Date: Fri, 28 Mar 2025 00:03:50 +0900
Message-ID: <20250327150406.138736-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of our devices crash in tb_cfg_request_dequeue():

 general protection fault, probably for non-canonical address 0xdead000000000122

 CPU: 6 PID: 91007 Comm: kworker/6:2 Tainted: G U W 6.6.65
 RIP: 0010:tb_cfg_request_dequeue+0x2d/0xa0
 Call Trace:
 <TASK>
 ? tb_cfg_request_dequeue+0x2d/0xa0
 tb_cfg_request_work+0x33/0x80
 worker_thread+0x386/0x8f0
 kthread+0xed/0x110
 ret_from_fork+0x38/0x50
 ret_from_fork_asm+0x1b/0x30

The circumstances are unclear, however, the theory is that
tb_cfg_request_work() can be scheduled twice for a request:
first time via frame.callback from ring_work() and second
time from tb_cfg_request().  Both times kworkers will execute
tb_cfg_request_dequeue(), which results in double list_del()
from the ctl->request_queue (the list poison deference hints
at it: 0xdead000000000122).

Do not dequeue requests that don't have TB_CFG_REQUEST_ACTIVE
bit set.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: stable@vger.kernel.org
---

v3: tweaked commit message

 drivers/thunderbolt/ctl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index cd15e84c47f4..1db2e951b53f 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -151,6 +151,11 @@ static void tb_cfg_request_dequeue(struct tb_cfg_request *req)
 	struct tb_ctl *ctl = req->ctl;
 
 	mutex_lock(&ctl->request_queue_lock);
+	if (!test_bit(TB_CFG_REQUEST_ACTIVE, &req->flags)) {
+		mutex_unlock(&ctl->request_queue_lock);
+		return;
+	}
+
 	list_del(&req->list);
 	clear_bit(TB_CFG_REQUEST_ACTIVE, &req->flags);
 	if (test_bit(TB_CFG_REQUEST_CANCELED, &req->flags))
-- 
2.49.0.395.g12beb8f557-goog


