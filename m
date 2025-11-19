Return-Path: <linux-usb+bounces-30712-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BA8C6F484
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id C42432AB78
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527D536998F;
	Wed, 19 Nov 2025 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QU5R2uhk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055FD369203
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562294; cv=none; b=MJ/cCDWLrRtVbJtrB/NFVpqfPXoS8hTRNnAkc3dAoYgySr5Dj/90iQc4YoGFhEQIc/bFFUlhOjQOlN+yqRAMfMhoQqk7BH/qXZHNA9NmeTOtQ0jOXxNjw5/r2rUyZen5D9WA5EZG4lf4rtMVZrSm5jvTVPflY6xp2qvD9FMXfP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562294; c=relaxed/simple;
	bh=aonL2C/IjDr8i68x6nQF45COwK3CT5kwJa3ANb/f+zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LeYRecFy/sO0FN1w49J2gq4P1d7bL2+nF0GfRRdJetRbkIQ9mEN5/A0WRxG18Q5vGYpgXjifpfMwd5UvQtJ2B6TcaveiLNYbfSdCgRrU1V9NPX4jjJlIm1o+n+Ht/JIskLQCBiGgOrqGB5yS2+nha5LotASGS63LtmTu2fUyBS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QU5R2uhk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562293; x=1795098293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aonL2C/IjDr8i68x6nQF45COwK3CT5kwJa3ANb/f+zg=;
  b=QU5R2uhkOxCYZp79ge316p6r71I2VIYjWWH11FFnFmkHJyz8SfmnwBCp
   IY16JUgKhWUs/Ur7CC/R8bo7JPTI49367gGS+HPLDMQPZhKbrVCRNubGa
   2N7nrPFygpSOEqKL+j0vMdR1zKCk8eyc1jaIglQDy87Xf1cRx2urBh4OR
   fU42OjtEsqMnIYMbzf4w7rDAjH2/6/7h6uq94og73v6GrrdzAYWbbvwXP
   y8YLIXbjGyyPh43pDZWt187ulcdbpHL1V31KrWF3aSYAI+lWwdyGR7Cnx
   28N/Aw83t4f6XGNXDMH/9B+KIcmGbPZUvOWwojsSyLF4zip0M19h5Gl/2
   g==;
X-CSE-ConnectionGUID: uesRN2UJRZS4JwF4hXM3ig==
X-CSE-MsgGUID: jBHjZfakQ/K+g59B/r460w==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645544"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645544"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:53 -0800
X-CSE-ConnectionGUID: Ws9Y6RJZR0yA7bM8GWNUIg==
X-CSE-MsgGUID: 6GaNnkqESMOFIqaiW5Y+yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992067"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:51 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/23] usb: xhci: replace use of system_wq with system_percpu_wq
Date: Wed, 19 Nov 2025 16:24:05 +0200
Message-ID: <20251119142417.2820519-12-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marco Crivellari <marco.crivellari@suse.com>

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

Switch to using system_percpu_wq because system_wq is going away as part of
a workqueue restructuring.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 8 ++++----
 drivers/usb/host/xhci-ring.c   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index ecda964e018a..9da4f3b452cb 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -374,7 +374,7 @@ int dbc_ep_queue(struct dbc_request *req)
 		ret = dbc_ep_do_queue(req);
 	spin_unlock_irqrestore(&dbc->lock, flags);
 
-	mod_delayed_work(system_wq, &dbc->event_work, 0);
+	mod_delayed_work(system_percpu_wq, &dbc->event_work, 0);
 
 	trace_xhci_dbc_queue_request(req);
 
@@ -677,7 +677,7 @@ static int xhci_dbc_start(struct xhci_dbc *dbc)
 		return ret;
 	}
 
-	return mod_delayed_work(system_wq, &dbc->event_work,
+	return mod_delayed_work(system_percpu_wq, &dbc->event_work,
 				msecs_to_jiffies(dbc->poll_interval));
 }
 
@@ -1023,7 +1023,7 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 		return;
 	}
 
-	mod_delayed_work(system_wq, &dbc->event_work,
+	mod_delayed_work(system_percpu_wq, &dbc->event_work,
 			 msecs_to_jiffies(poll_interval));
 }
 
@@ -1274,7 +1274,7 @@ static ssize_t dbc_poll_interval_ms_store(struct device *dev,
 
 	dbc->poll_interval = value;
 
-	mod_delayed_work(system_wq, &dbc->event_work, 0);
+	mod_delayed_work(system_percpu_wq, &dbc->event_work, 0);
 
 	return size;
 }
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5acec9143811..f1582360d96a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -435,7 +435,7 @@ void xhci_ring_cmd_db(struct xhci_hcd *xhci)
 
 static bool xhci_mod_cmd_timer(struct xhci_hcd *xhci)
 {
-	return mod_delayed_work(system_wq, &xhci->cmd_timer,
+	return mod_delayed_work(system_percpu_wq, &xhci->cmd_timer,
 			msecs_to_jiffies(xhci->current_cmd->timeout_ms));
 }
 
-- 
2.43.0


