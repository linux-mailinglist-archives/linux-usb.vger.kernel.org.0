Return-Path: <linux-usb+bounces-29406-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FA1BE6EBC
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 09:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E33F62474D
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 07:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49296311C05;
	Fri, 17 Oct 2025 07:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgUWjHQM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B563530FC3B
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 07:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760685780; cv=none; b=ReOMZ81Q5uyA/JZOVpdbny3+lfoPU8fhZlo/r8cdXXZwP7QOooVkZbnMm+WMdsEWba4Gr+ELPtmWKawzlRhIqRNH1dyPlv8Wion3QbXiTy8/qoIrKdBILjS9eLqKkThE3zVv3LEedNy2DtlMwb7UTlqkHFPz3WNSELQeFSK33sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760685780; c=relaxed/simple;
	bh=FQNF7rab9sUAzTsVB+VNTyhiHcZIey+qjslzy2HMT58=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=djAsphf5tUl+k4GuQx+3VbXGo/nLUl5YK76AqIr3FfmDGwamyd1DzPZywvMTl/+X8mgTtbUUyTk8isO+8UdEx4eZKMdYLUZTPNkOXmrTsxfLrWWrjZB41R1aX0GcXsM79Tr4u/zZq0GcMdnW3zoqSOEyEhgYrEFK8La5W4K2kqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgUWjHQM; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-856701dc22aso254902385a.3
        for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760685777; x=1761290577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5uDQgzdhwvYDbFaPZiJi3wbXGaN95FTGftwiemGKqQ=;
        b=GgUWjHQMRuI42ypwEewg/Ji9hLbFsTydfEPGyt0kPYfyvQdJFnqMpvuwFTjyNIrcAi
         6PjoQoElKAJ+WDgwUmttLuAVFG/QfkFuaGsoTm0YtO/PkB2JQ6pdDSHET41BqsdCGqOo
         tv73GntyHTKLtzfsHhOvJ0+Z9vpVTrlrmwwRfCOrj18JO1cmvppNbu1vRFT7QMMkWOtw
         8Ce2M10+zG487+7TETMEX9rTktvU4I/PLz0HEkrjvRF3XMbOyQy22AAf7TUKgE2/XeGV
         rc2jBwuiavl7lyV4kjWtE1T3IjaAxpg75dDDO1T+sQzWZ6otXF3ABzlMmLPkuDISJ+yh
         N5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760685777; x=1761290577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5uDQgzdhwvYDbFaPZiJi3wbXGaN95FTGftwiemGKqQ=;
        b=nQiUb0CqwcTyfAqVO7fqHXU+4zWx8a6KvScSbyE4PZiigHWMXu1d5+b1Yy63zbyFUX
         1t51J2XmPUvYH7hAVpN5lWMbWBdgurWfZP7QPLEDC/jjBDXRYZXJZ0YDpjL0mcxUP50E
         bLxaPMvooYLM9JCabeozE1HwDaVvkO178bdu4Nmqk385ptTYQm3d30xesmM1D7hlpLtG
         5pp67hneanHk5/8emJC3GnbMtsbBVKD692H8wmqbZGAM1Ib7rOpePhwtJdznJB7rftk6
         /LG+qz27qbhrblwzGrOuH1D3SgycY4B1DNCkLEv+mw+AZIPHVHyHnyNCWL8IcmPRPmdf
         KiPA==
X-Forwarded-Encrypted: i=1; AJvYcCWDa9goYHaSEStibPYDhEOVGNM/lCwDeuXJFV19+t6zEnZkLNtIns5ObsM3qEdUSi8kEhY5tTxrvkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkKKZt1w6cFTXI8NkH5/UbelaWnbTy1e8jA2utSQd94k7tREcE
	SuTF61t6wfwbu3UiTSJBaWXacbuFxhXO0U4us2IMdBPmYeTq57Y41V9o
X-Gm-Gg: ASbGncv1ppoQantynWYTriQ2lVDQUTG4/f//zKocgd8/pW2yqsFk6NNnRdWnYLXpyvm
	aZ5op4GO76g3wE7sPQDVZmKnmWkkZpZpQJq4EBVHlBXgdBR4BjjXLQj5/6kSEVVuQCLnFQVVqIS
	+OaxrwkAShDAwoDU29SrK/lVv7TOEBufjebG/NbJ5uvRCrgJPS7ykJm341IXs67K38EWqbSkpT6
	1/bqBOS+ZCNnbf4y5+ucQT7QVxo+UqXRaIQn1gjSkt3oM4U+D/qiyTukOMs7SGA9CEmFVb6usAK
	nRzfGYXFf/Ffho6kn9hWAZgkoRKFwCB1q9z4x89sYYjDaYxoJEnW2DVrLw8RE67JVUTwZE+9sCQ
	Kx7kHQ0BEaMMH/56326oVctTkdObY8vVGv3l/znn2c4oC7jZ32ngoug2Jkvo=
X-Google-Smtp-Source: AGHT+IH68U9c8zKEnTirgbxWW9RfQnZi23N/tX6FIzjg1zraSyTWly+MVJoqafLxEp0RN8L6SditnA==
X-Received: by 2002:ac8:5a88:0:b0:4b2:fdda:f7be with SMTP id d75a77b69052e-4e89d263e09mr32511821cf.3.1760685777426;
        Fri, 17 Oct 2025 00:22:57 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e881c7e74dsm57959301cf.14.2025.10.17.00.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 00:22:56 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] usb: typec: ucsi: Fix workqueue destruction race during connector cleanup
Date: Fri, 17 Oct 2025 15:22:50 +0800
Message-ID: <20251017072250.3261616-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During UCSI initialization and operation, there is a race condition where
delayed work items can be scheduled but attempt to queue work after the
workqueue has been destroyed. This occurs in multiple code paths.

The race occurs when:
1. ucsi_partner_task() or ucsi_poll_worker() schedule delayed work
2. Connector cleanup paths call destroy_workqueue()
3. Previously scheduled delayed work timers fire after destruction
4. This triggers warnings and crashes in __queue_work()

The issue is timing-sensitive and typically manifests when:
- Port registration fails due to PPM timing issues
- System shutdown/cleanup occurs with pending delayed work
- Module removal races with active delayed work

[  170.605181] ucsi_acpi USBC000:00: con2: failed to register alt modes
[  181.868900] ------------[ cut here ]------------
[  181.868905] workqueue: cannot queue ucsi_poll_worker [typec_ucsi] on wq USBC000:00-con1
[  181.868918] WARNING: CPU: 1 PID: 0 at kernel/workqueue.c:2255 __queue_work+0x420/0x5a0
...
[  181.869062] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.17.0-rc7+ #1 PREEMPT(voluntary)
[  181.869065] Hardware name: Dell Inc. , BIOS xx.xx.xx xx/xx/2025
[  181.869067] RIP: 0010:__queue_work+0x420/0x5a0
[  181.869070] Code: 00 00 41 83 e4 01 0f 85 57 fd ff ff 49 8b 77 18 48 8d 93 c0 00 00 00 48 c7 c7 00 8c bc 92 c6 05 27 47 68 02 01 e8 50 24 fd f
f <0f> 0b e9 32 fd ff ff 0f 0b e9 1d fd ff ff 0f 0b e9 0f fd ff ff 0f
[  181.869072] RSP: 0018:ffffd53c000acdf8 EFLAGS: 00010046
[  181.869075] RAX: 0000000000000000 RBX: ffff8ecd0727f200 RCX: 0000000000000000
[  181.869076] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[  181.869077] RBP: ffffd53c000ace38 R08: 0000000000000000 R09: 0000000000000000
[  181.869078] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[  181.869079] R13: ffffffff913995e0 R14: ffff8ecc824387a0 R15: ffff8ecc82438780
[  181.869081] FS:  0000000000000000(0000) GS:ffff8eec0b92f000(0000) knlGS:0000000000000000
[  181.869083] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  181.869084] CR2: 000005593e67a008 CR3: 0000001f41840002 CR4: 0000000000f72ef0
[  181.869086] PKRU: 55555554
[  181.869087] Call Trace:
[  181.869089]  <IRQ>
[  181.869093]  ? sched_clock+0x10/0x30
[  181.869098]  ? __pfx_delayed_work_timer_fn+0x10/0x10
[  181.869100]  delayed_work_timer_fn+0x19/0x30
[  181.869102]  call_timer_fn+0x2c/0x150
[  181.869106]  ? __pfx_delayed_work_timer_fn+0x10/0x10
[  181.869108]  __run_timers+0x1c6/0x2d0
[  181.869111]  run_timer_softirq+0x8a/0x100
[  181.869114]  handle_softirqs+0xe4/0x340
[  181.869118]  __irq_exit_rcu+0x10e/0x130
[  181.869121]  irq_exit_rcu+0xe/0x20
[  181.869124]  sysvec_apic_timer_interrupt+0xa0/0xc0
[  181.869130]  </IRQ>
[  181.869131]  <TASK>
[  181.869132]  asm_sysvec_apic_timer_interrupt+0x1b/0x20                                                                                        [  181.869135] RIP: 0010:cpuidle_enter_state+0xda/0x710
[  181.869137] Code: 8f f7 fe e8 78 f0 ff ff 8b 53 04 49 89 c7 0f 1f 44 00 00 31 ff e8 86 bf f5 fe 80 7d d0 00 0f 85 22 02 00 00 fb 0f 1f 44 00 0
0 <45> 85 f6 0f 88 f2 01 00 00 4d 63 ee 49 83 fd 0a 0f 83 d8 04 00 00
[  181.869139] RSP: 0018:ffffd53c0022be18 EFLAGS: 00000246
[  181.869140] RAX: 0000000000000000 RBX: ffff8eeb9f8bf880 RCX: 0000000000000000
[  181.869142] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000000
[  181.869143] RBP: ffffd53c0022be68 R08: 0000000000000000 R09: 0000000000000000
[  181.869144] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff93914780
[  181.869145] R13: 0000000000000002 R14: 0000000000000002 R15: 0000002a583b0b41
[  181.869148]  ? cpuidle_enter_state+0xca/0x710
[  181.869151]  cpuidle_enter+0x2e/0x50
[  181.869156]  call_cpuidle+0x22/0x60
[  181.869160]  do_idle+0x1dc/0x240
[  181.869163]  cpu_startup_entry+0x29/0x30
[  181.869164]  start_secondary+0x128/0x160
[  181.869167]  common_startup_64+0x13e/0x141
[  181.869171]  </TASK>
[  181.869172] ---[ end trace 0000000000000000 ]---
[  226.924460] workqueue USBC000:00-con1: drain_workqueue() isn't complete after 10 tries
[  329.470977] ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed

Fix this by:
1. Creating ucsi_destroy_connector_wq() helper function that safely
   cancels all pending delayed work before destroying workqueues
2. Applying the safe cleanup to all three workqueue destruction paths:
   - ucsi_register_port() error path
   - ucsi_init() error path
   - ucsi_unregister() cleanup path

This prevents both the initial queueing on destroyed workqueues and
retry attempts from running workers, eliminating the timer races.

Fixes: b9aa02ca39a4 ("usb: typec: ucsi: Add polling mechanism for partner tasks like alt mode checking")
Cc: stable@vger.kernel.org
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
v2. Fixed the deadlock
   - ucsi_destroy_connector_wq() holds con->lock and calls cancel_delayed_work_sync()
   - ucsi_poll_worker() (the work being cancelled) also tries to acquire con->lock
v3. Fixed use-after-free
   If the poll worker is in flight while the workqueue is torn down,
   it's possible for the work item (`uwork`) to be freed by both the
   worker and the destruction path, leading to a use-after-free vulnerability.
---
 drivers/usb/typec/ucsi/ucsi.c | 71 +++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3995483a0aa0..a270efbb1086 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -264,10 +264,13 @@ static void ucsi_poll_worker(struct work_struct *work)
 
 	mutex_lock(&con->lock);
 
-	if (!con->partner) {
-		list_del(&uwork->node);
+	if (!con->partner || !con->wq) {
+		/*
+		 * Workqueue is being destroyed. Don't free the work item here;
+		 * ucsi_destroy_connector_wq() will handle cleanup to avoid
+		 * use-after-free race.
+		 */
 		mutex_unlock(&con->lock);
-		kfree(uwork);
 		return;
 	}
 
@@ -283,13 +286,50 @@ static void ucsi_poll_worker(struct work_struct *work)
 	mutex_unlock(&con->lock);
 }
 
+/**
+ * ucsi_destroy_connector_wq - Safely destroy connector workqueue
+ * @con: UCSI connector
+ *
+ * Cancel all pending delayed work and destroy the workqueue to prevent
+ * timer races where delayed work tries to queue on destroyed workqueue.
+ */
+static void ucsi_destroy_connector_wq(struct ucsi_connector *con)
+{
+	struct workqueue_struct *wq;
+	struct ucsi_work *uwork, *tmp;
+	LIST_HEAD(list);
+
+	if (!con->wq)
+		return;
+
+	/*
+	 * Prevent new work from being queued and signal existing work to stop.
+	 * Move all work items to a temporary list while holding the lock,
+	 * then cancel them without the lock to avoid deadlock with
+	 * ucsi_poll_worker() which also acquires con->lock.
+	 */
+	mutex_lock(&con->lock);
+	wq = con->wq;
+	con->wq = NULL; /* Signal workers to stop before canceling */
+	list_splice_init(&con->partner_tasks, &list);
+	mutex_unlock(&con->lock);
+
+	list_for_each_entry_safe(uwork, tmp, &list, node) {
+		cancel_delayed_work_sync(&uwork->work);
+		list_del(&uwork->node);
+		kfree(uwork);
+	}
+
+	destroy_workqueue(wq);
+}
+
 static int ucsi_partner_task(struct ucsi_connector *con,
 			     int (*cb)(struct ucsi_connector *),
 			     int retries, unsigned long delay)
 {
 	struct ucsi_work *uwork;
 
-	if (!con->partner)
+	if (!con->partner || !con->wq)
 		return 0;
 
 	uwork = kzalloc(sizeof(*uwork), GFP_KERNEL);
@@ -1722,10 +1762,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 out_unlock:
 	mutex_unlock(&con->lock);
 
-	if (ret && con->wq) {
-		destroy_workqueue(con->wq);
-		con->wq = NULL;
-	}
+	if (ret)
+		ucsi_destroy_connector_wq(con);
 
 	return ret;
 }
@@ -1851,8 +1889,7 @@ static int ucsi_init(struct ucsi *ucsi)
 
 err_unregister:
 	for (con = connector; con->port; con++) {
-		if (con->wq)
-			destroy_workqueue(con->wq);
+		ucsi_destroy_connector_wq(con);
 		ucsi_unregister_partner(con);
 		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
 		ucsi_unregister_port_psy(con);
@@ -2074,19 +2111,7 @@ void ucsi_unregister(struct ucsi *ucsi)
 	for (i = 0; i < ucsi->cap.num_connectors; i++) {
 		cancel_work_sync(&ucsi->connector[i].work);
 
-		if (ucsi->connector[i].wq) {
-			struct ucsi_work *uwork;
-
-			mutex_lock(&ucsi->connector[i].lock);
-			/*
-			 * queue delayed items immediately so they can execute
-			 * and free themselves before the wq is destroyed
-			 */
-			list_for_each_entry(uwork, &ucsi->connector[i].partner_tasks, node)
-				mod_delayed_work(ucsi->connector[i].wq, &uwork->work, 0);
-			mutex_unlock(&ucsi->connector[i].lock);
-			destroy_workqueue(ucsi->connector[i].wq);
-		}
+		ucsi_destroy_connector_wq(&ucsi->connector[i]);
 
 		ucsi_unregister_partner(&ucsi->connector[i]);
 		ucsi_unregister_altmodes(&ucsi->connector[i],
-- 
2.43.0


