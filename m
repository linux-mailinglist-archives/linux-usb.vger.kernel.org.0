Return-Path: <linux-usb+bounces-37463-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP21MxO3BmrrnAIAu9opvQ
	(envelope-from <linux-usb+bounces-37463-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 08:02:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C70549D6A
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 08:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 382CD304707C
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 06:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F57133688E;
	Fri, 15 May 2026 06:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HIoD/zqW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7EB30E0EE
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 06:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778824969; cv=none; b=g2d3q6+S49ZiK+iVHJJvJeOob7gP3gqdEDzBUulkrKWmpO86dDvNX2dZGmpnUY8EazXXf0VhojVi9QgUNjTZEkfaInjpsm3ngAN2ABiUYa+oqx5oEGq5zqGMqt+if2fF4uSWkgXbqiJzAIsUinSQ44JBfLRld4+Eo+47cQOBL+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778824969; c=relaxed/simple;
	bh=wR7jKA0t4CicrNC69Yqv2+I4dYOHHNscXFwVsJu3sCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NMwrNBxdwPmX+oDY1WjIihYr3EQxyLzydcktiXclSfLl15wTdhaTFZxQAUVGrn6YmzZdx3YBr8YERbUZGsxBV32n3D9x5P5TPgV8JmkAK9dyVoxwisTF8zU9d4yKsFGn/i5vPk8KIl5sdlQfbbtua60rD+cUs+Fs3+3C8uMPdl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HIoD/zqW; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-836ebdeb969so4083045b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 23:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778824967; x=1779429767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hBdfbCTSyRrEf51qC6bvgO49tgTiXounMMZECu9Vp8k=;
        b=HIoD/zqWLfBDlONwYIPKqLxY+V/dz/RAdxdZiMBXdIju6RdQEyfIS0S6JXA5rrqQeX
         wz3iYjewEnWgcTLRr0BKQjdN90fEUo6qDHEm+LJsUHczDs/nR51QSLa5AApAeo2Fxmpt
         2rOyjX8+uXkxFaCMBmMHDZIWllm/qTSmGLymQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778824967; x=1779429767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBdfbCTSyRrEf51qC6bvgO49tgTiXounMMZECu9Vp8k=;
        b=hY+oo1ZFx/2ssiC6zEJXF7oKGDmfvrUCYfu9e++SS1rW7ie995tomFjRymuOAICf6Q
         jpc29pRT7OQSJypKWzPY2S7ivVqd9R5k5LX9cbfjBGk9tuHZCL02ThfcZSFu0Hk8RciP
         uzEVjC9vzjbbj68tsFvuLe0ZKwwpnOCSz6uMaHqvP+fashAuvfzA7r14f14NL6uyxRko
         vphFIumQ7ebVKPygUSJkyzvYWyEEOr9JkosBtXwZ9Vg7w2pPrTfwsl4vc2FmjmI1nGHx
         f4sbzp0djvtJllKOcT58tE0MjKbteK8drxszEQV4KTgCZCPoDumV2nR2sTApKTGBJAWK
         SlAA==
X-Forwarded-Encrypted: i=1; AFNElJ+VVuKRXFUvJqoeOe+DCBqJDuGBPy2h/08YWyNetAxIRtIXS1qqLxTa3Vvfl9pMwL3izP7XEE1pRTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJRFKrj9kvGWjk9dnQFLY269lzAji0GWftI6NMcTc39PMEoOAX
	khD6JVsbpF76hNTsj0RA/5kviBLBWRorh+DcKiDhUJ3jG9dFw1bq0ZehDH0Dxb/y/g==
X-Gm-Gg: Acq92OGtdvAlCDN5M4/Z9y69Yyug8kNR6Xq8NcLmhmGHPL1b1drp3eVX1tAwT0TcZsO
	OKreAXVNCshPT1w24r+XJzjgpS3Pbw9cjwCdZlxokvjx82Dyq9aUhZbdVbIAxYgRWAL3fuokZ9t
	LkLmUVRh9sD3Pi14MkdH1OZgjZ21Aa4SKkvs1F99RS2cYg2cduB6BQXV5heyzRhIfb0ZZEr/23S
	ZBx1hRDf+bLWlAapz/6yLlPC1uWOP+XZsUCL0xG+ehMG1JJrgaBZSUPLbbIGn8UeELCEuBK08XV
	QwM4nKmWL5GoCxtV/A+O23jJy9C1OQKkYNAccVJBbNoIZpZ3UqkI2IjKXbWurcFJDSA4X1dA5H+
	Cy3cmaVvPtVAwu/rmDBkyqQzhP9xBO5VWZn4hiR2T0ry4egDJGVTKwafUTaMQ/NGDSXA+N+S2gS
	XzGRLLU5cn7BvwapWC2fsvEIJ4ScPFQeShGuj4ayNgrIN1/S1ibsX0IhJHMeaEZJ5xhAHy/6jc4
	s4QKuDA/ogRItFi9IVyOoKT
X-Received: by 2002:a05:6a00:178e:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-83f33ba0aa1mr2853552b3a.9.1778824967552;
        Thu, 14 May 2026 23:02:47 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:68cc:d8b9:b76e:e07e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77822sm4985125b3a.41.2026.05.14.23.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 23:02:46 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] usb: typec: ucsi: split connector lock classes
Date: Fri, 15 May 2026 15:00:30 +0900
Message-ID: <20260515060042.136083-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 49C70549D6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37463-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:mid,chromium.org:dkim]
X-Rspamd-Action: no action

Lockdep detects a possible recursive locking scenario during
ucsi init:

[    5.418616] ============================================
[    5.418634] WARNING: possible recursive locking detected
[    5.418706] --------------------------------------------
[    5.418725] kworker/4:1/82 is trying to acquire lock:
[    5.418759] ffff888119a34648 (&con->lock){+.+.}-{3:3}, at: ucsi_init_work+0x1a78/0x2eb0 [typec_ucsi]
[    5.418801]
               but task is already holding lock:
[    5.418835] ffff888119a34080 (&con->lock){+.+.}-{3:3}, at: ucsi_init_work+0x1a78/0x2eb0 [typec_ucsi]
[    5.418884]
               other info that might help us debug this:
[    5.418904]  Possible unsafe locking scenario:

[    5.418937]        CPU0
[    5.418956]        ----
[    5.418991]   lock(&con->lock);
[    5.419013]   lock(&con->lock);
[    5.419033]
                *** DEADLOCK ***

[    5.419387] Call Trace:
[    5.419406]  <TASK>
[    5.419425]  dump_stack_lvl+0x61/0xa0
[    5.419448]  print_deadlock_bug+0x4a6/0x650
[    5.419483]  __lock_acquire+0x62b6/0x7f50
[    5.419507]  lock_acquire+0x11b/0x390
[    5.419654]  __mutex_lock+0xbc/0xcd0
[    5.419741]  ucsi_init_work+0x1a78/0x2eb0
[    5.419785]  ? worker_thread+0xf53/0x2bc0
[    5.419819]  worker_thread+0xff4/0x2bc0
[    5.419842]  kthread+0x2a7/0x330
[    5.419863]  ? __pfx_worker_thread+0x10/0x10
[    5.419896]  ? __pfx_kthread+0x10/0x10
[    5.419916]  ret_from_fork+0x38/0x70
[    5.419936]  ? __pfx_kthread+0x10/0x10
[    5.419969]  ret_from_fork_asm+0x1b/0x30
[    5.419991]  </TASK>
[    5.420009] ---[ end trace 0000000000000000 ]---

The problem is that all connector locks belong to the same
lockdep lock class, so the following loop:

	for (i = 0; i < ucsi->cap.num_connectors; i++)
		ucsi_register_port(connector[i])
			mutex_lock(&connector[i]->lock)

looks like a recursive acquire of the same mutex.  Put each connector
lock into a dedicated lock class so that lockdep doesn't see it as a
possible recursion.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 8 ++++++++
 drivers/usb/typec/ucsi/ucsi.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5b7ad9e99cb9..43da7512dea0 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1642,6 +1642,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	INIT_WORK(&con->work, ucsi_handle_connector_change);
 	init_completion(&con->complete);
 	mutex_init(&con->lock);
+	lockdep_set_class(&con->lock, &con->lock_key);
 	INIT_LIST_HEAD(&con->partner_tasks);
 	con->ucsi = ucsi;
 
@@ -1887,6 +1888,9 @@ static int ucsi_init(struct ucsi *ucsi)
 		goto err_reset;
 	}
 
+	for (i = 0; i < ucsi->cap.num_connectors; i++)
+		lockdep_register_key(&connector[i].lock_key);
+
 	/* Register all connectors */
 	for (i = 0; i < ucsi->cap.num_connectors; i++) {
 		connector[i].num = i + 1;
@@ -1916,6 +1920,9 @@ static int ucsi_init(struct ucsi *ucsi)
 	return 0;
 
 err_unregister:
+	for (i = 0; i < ucsi->cap.num_connectors; i++)
+		lockdep_unregister_key(&connector[i].lock_key);
+
 	for (con = connector; con->port; con++) {
 		if (con->wq)
 			destroy_workqueue(con->wq);
@@ -2166,6 +2173,7 @@ void ucsi_unregister(struct ucsi *ucsi)
 		usb_power_delivery_unregister(ucsi->connector[i].pd);
 		ucsi->connector[i].pd = NULL;
 		typec_unregister_port(ucsi->connector[i].port);
+		lockdep_unregister_key(&ucsi->connector[i].lock_key);
 	}
 
 	kfree(ucsi->connector);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index cff9ddc2ae21..51f6c3c0d365 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -517,6 +517,7 @@ struct ucsi_connector {
 
 	struct ucsi *ucsi;
 	struct mutex lock; /* port lock */
+	struct lock_class_key lock_key;
 	struct work_struct work;
 	struct completion complete;
 	struct workqueue_struct *wq;
-- 
2.54.0.563.g4f69b47b94-goog


