Return-Path: <linux-usb+bounces-22218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 786C6A73076
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 12:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDFE63AA784
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 11:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E8E2135C7;
	Thu, 27 Mar 2025 11:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dsQJtQf1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AA81FF7C5
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075754; cv=none; b=tjVloVbCad3mHjJ3KF8nWt71hDp1EcW4C3Ojhqe9Hke7900xshCNwSYi48KgS9IWIWotm9n5JHisraH3+wLeTQkM7inVf/HZwru+VuXUNjOjUnUlRMaxvZPkpX71niBsUmgLMdlv7Ef/mYUV9cOu1X4Zi+2UR5Yq8JoEOOS+3C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075754; c=relaxed/simple;
	bh=KALfclt2c3dAW1AKyOrZ1tv8gBSfmDEQVOWa5sKhm4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I8OuaB+myuJ4vqrUb+yXSsowx8U5PNSafmIKGNPgsRJRueucG/Bcgwp+7JTCICG/Vs82uypgOpunS1bwrVdokz9btQQBEQqkXaHVlpfJAHWjhbGKfq5VpYelmDTDsCJnah2k/LdFJVwcPbnFhxZjan0WHaWdnd/yRTwq6bnAstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dsQJtQf1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223a7065ff8so28167875ad.0
        for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743075752; x=1743680552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lrPxuKonSwXBeNfuEkYWsadcWWgtM4GwjCPebsFmDtE=;
        b=dsQJtQf1hRShhsTtF5ahf/rbHtupLeZoiU8HW7uQAx3UBr+gTg2LvQvdR+JAAJXstn
         Nd9wb61XUaMqaJLXq20vGmmFSxSaGl8dsXuNp6hqheGEGdeiCNb+IOFUyeGdA129zpg3
         kBjf2iB6HeIESdRZP30weDLvweilB/1Nmv6K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075752; x=1743680552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrPxuKonSwXBeNfuEkYWsadcWWgtM4GwjCPebsFmDtE=;
        b=Uj1LcswVNDHz02Hy2F8IgYE90abErXTjcJzkunp1PvUc+FOxVp30PocjL41NuE1XtT
         g2agg+OJTZmY4FAOt/EYtYYz2O/fWCNnER5fC644uJ8tLWuOFReelqruUTKi+pA5aWJn
         ta8hFe1HtETkq545euOExXdh5SZRCVVn+2b+kPitWNdapxqT7NOcfa4AtwSCSY36xC5g
         dueOrtruhy72WhBwXFdFh90uVpasokPebO7ppRsB/abushhPiR6NMQv3ELpNXdwWRJAO
         tfmWvwKkYqw9Hr4TaAUW+SdVyFcHTQ4QtC8OR51j6peNB5+/JMZ3d+Q+WcdD2+m6Jdew
         i+Zg==
X-Gm-Message-State: AOJu0YyiUMwBRvIPEqwp/819PtIW/axZNnLkK+uLl/JldU2Qvbdw9V4C
	M8+lMvKb4JvJwOIbYKm0LrHcaKd79IYVj1AYjDRNWpJ0u/OajfA+LV+6SGI9TQ==
X-Gm-Gg: ASbGncvL52mrahvwKXWXExP0Uz/ZhayXRPcdFjITzuLYwaOvqiadQ0H3fPYGAHCs1aQ
	fgAqh5yd/Py/ijVaztytzLoveezlZhGvZ5cDGNwZGlnf1WjgELrFEoKFYIiLxql5h89JKOoBpBb
	f0m2RVX+j6hDbZ8pAxlRVim3YYUGEwRz8QnezglgKkLmO1s9NbahcM+Nymd9Y7BwJ5M30iVp3lW
	CGSEuYJ8qW8MQ83JP/BtJwV0NltpnIpYoQGANMc0W9F0akvSaEN4mPivn1pgvvhHI1t2ebwa+O0
	ahkCR3JPu8Re5x6+VWN+X0g7KRg03Bm2Nb10zh4OVXeOacptcuoTETzTbBUu6iGSVUHLGQ==
X-Google-Smtp-Source: AGHT+IHD4RukqotroNphP3/o3sXCpK8buz0Wp92d9oz/6cijSteH6HLjiZHwSaZwk29Uog5iWFoLHA==
X-Received: by 2002:a05:6a21:168d:b0:1f5:a3e8:64c8 with SMTP id adf61e73a8af0-1fea2f8094bmr6354759637.36.1743075751546;
        Thu, 27 Mar 2025 04:42:31 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:cd9c:961:27c5:9ceb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a479c1sm12652606a12.70.2025.03.27.04.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 04:42:30 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCHv2] thunderbolt: do not double dequeue a request
Date: Thu, 27 Mar 2025 20:41:21 +0900
Message-ID: <20250327114222.100293-1-senozhatsky@chromium.org>
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

 CPU: 6 PID: 91007 Comm: kworker/6:2 Tainted: G U W 6.6.65)
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

Another possibility can be tb_cfg_request_sync():

tb_cfg_request_sync()
 tb_cfg_request()
  schedule_work(&req->work) -> tb_cfg_request_dequeue()
 tb_cfg_request_cancel()
  schedule_work(&req->work) -> tb_cfg_request_dequeue()

To address the issue, do not dequeue requests that don't
have TB_CFG_REQUEST_ACTIVE bit set.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: stable@vger.kernel.org
---

v2: updated commit message, kept list_del()

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


