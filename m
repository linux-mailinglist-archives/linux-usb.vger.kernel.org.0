Return-Path: <linux-usb+bounces-22205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 601E5A72A04
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 06:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D6501896E19
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 05:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5C91B81C1;
	Thu, 27 Mar 2025 05:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FoQODwgx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E71BC3C
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 05:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743054808; cv=none; b=P+kDoYPZtvLPlYRlPCMEjZLj6J+6LlKliK4U4HCZRPTcCTWpUTviWPM779a/0qtrwqXUwYz6dQT2SS6ZdsT7WAa3IqDN6ysByLZrlNzL1zHHZLdtEjNvAAQOS+6ua1JDesfTTYUOf5K3dz7T/5FrI7BjEZ4NLgHQMo/hAcZwyGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743054808; c=relaxed/simple;
	bh=rznbL18y9IMwzhAgZyFgFLaEm0xCxFnERqTOdx4jyqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t9dnWiR/6TuvD0+vGQn1mkpHnANOWfxEtn1Lbd+ySa1y9W8jC2X9iUNG0o6WFms7Lr2amdbAXMpsBWtPcOOr2CoXxb8Uw7dWDIrFm2E3MJpDMWg4CNH32vG9pm8EXeD0j+mYo4syVWBEKkgA/yb0HzB1/HIb2d+zGasryKGaPKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FoQODwgx; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2254e0b4b79so16479255ad.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 22:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743054804; x=1743659604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3UderlRrJePl4t1rg1R3vPXIXNH/vlUA1XtTo4Gz7Pw=;
        b=FoQODwgx4KzNE8GKrQKXIXPa5aGkwhXU9U87uDU60NC8wBRk7j4Lh+xQR4SCRrPz1/
         ndYICIaaQh7Gv5WmTsyiz16hxQkQp1N6XCZCK5KdDX6/zczLeq1gmnEOkwxP2PTkdm/J
         GCHHkurN/vB3czyDPInRTASs0d+zSEWnYSLHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743054804; x=1743659604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3UderlRrJePl4t1rg1R3vPXIXNH/vlUA1XtTo4Gz7Pw=;
        b=JCo1riVgTcIc6OMNmiuDpVkmu9ncc16Pn0K76J3jFostq1QM0/fCUUwvPXhBM13BLZ
         mhg8ksEJJPH+JSoYAhetfTGiRikPF9PGsGuCg82fIJKI7n+tABYe7JD8r7km9YXuwFZw
         BqNGBFOcUxMrsxlhEvWNTgbsuA9X8/x2oWDidR9iUn4obBKoAIB5Z757wSSHsf/fG956
         VqvpVP+VYwFIkIJDacMNke1CXk5v8o9i2bKJj+7MqyyRciaOZXMMizdCjm+FsUaiJIQq
         WjjKIe8v6VcCXAh+z/WI+DuWL5pAINPDBFPBl4rG7LTu6ex0M0f9nN7bOAJa06OdsmQx
         X90A==
X-Gm-Message-State: AOJu0Yx/fpufra+mZdUIhXRf6JsjIVjHzDHL+UWQPaSCfNv3aPMI03g9
	TxAX8KYqxx3z8n+KJ6poL72mpjVD30pBIqHm57n0jZoBuotwGxvuYncgM3dXlw==
X-Gm-Gg: ASbGnctUgORS1NZJ+uhGzB1TeOmkvYUB2tqkuXg39Rm6zgHHhP15BApO1QeVXwrH4im
	JOfAxIU54ItQTl0TFdbtFfOH5qwMPn2WG5DKCsvEvsFPS63T2Obh1/+wmgtiw8gGm7dJQFpd75H
	+/uQsdmy3e/7Hwrih+Sfur4EmaSGlQ8UGTDCbvnIFYoo4R2sHyejjUu0ZmGdUulkrxaYo/+aGkG
	drTuuTMnhQVKGG0ihCd7igRZEpNfpF/kftSMG4v0cZ40wz5BBu/B5lm9Xd50ruBWMrV5cKi5KPD
	9nplUqEs43sw7CuK0AFZzzrgQIobqckRa6DNJ8nztQyHFajMHbdPqSZjPYdZYbfJncL4mw==
X-Google-Smtp-Source: AGHT+IFpjNx2vf5Uw9iOk+GGsojnR+9RmcUUXRHFfAjLIxgQPIYbIRiQwhFBTqSYmMKbIAD9zM0Xlw==
X-Received: by 2002:a05:6a20:9193:b0:1f5:9431:46e7 with SMTP id adf61e73a8af0-1fea2f94eb7mr4396039637.42.1743054804386;
        Wed, 26 Mar 2025 22:53:24 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:cd9c:961:27c5:9ceb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a652a2sm12008359a12.76.2025.03.26.22.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 22:53:23 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC PATCH] thunderbolt: do not double dequeue a request
Date: Thu, 27 Mar 2025 14:52:54 +0900
Message-ID: <20250327055314.8679-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of our devices crash in tb_cfg_request_dequeue():

 general protection fault, probably for non-canonical address 0xdead000000000122: 0000 [#1] PREEMPT SMP NOPTI

 CPU: 6 PID: 91007 Comm: kworker/6:2 Tainted: G U W 6.6.65-06391-gbdec63d10750 #1 (HASH:cf42 1)
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
---
 drivers/thunderbolt/ctl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index cd15e84c47f4..3ad15febc7df 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -151,7 +151,12 @@ static void tb_cfg_request_dequeue(struct tb_cfg_request *req)
 	struct tb_ctl *ctl = req->ctl;
 
 	mutex_lock(&ctl->request_queue_lock);
-	list_del(&req->list);
+	if (!test_bit(TB_CFG_REQUEST_ACTIVE, &req->flags)) {
+		mutex_unlock(&ctl->request_queue_lock);
+		return;
+	}
+
+	list_del_init(&req->list);
 	clear_bit(TB_CFG_REQUEST_ACTIVE, &req->flags);
 	if (test_bit(TB_CFG_REQUEST_CANCELED, &req->flags))
 		wake_up(&tb_cfg_request_cancel_queue);
-- 
2.49.0.395.g12beb8f557-goog


