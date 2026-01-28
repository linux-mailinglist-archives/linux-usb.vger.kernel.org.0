Return-Path: <linux-usb+bounces-32884-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ARtORgMemlo2AEAu9opvQ
	(envelope-from <linux-usb+bounces-32884-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 14:16:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90685A1E1C
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 14:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4253C301FFB2
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 13:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE90223DE7;
	Wed, 28 Jan 2026 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cM/m9oyE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA83125A9
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606160; cv=none; b=rIxSU0dAp2fxt8xk9+DtkFhDVn6aNIFWfoWI6BYlgVJfCrlDoeKFmfF6B+98rXSZLK/Wv37IUvKC8kazh0RdHkq7YdvTBMzupCdwikOU7cBksupeGcSzP0FS/mWEkST6A/cUqtHDx8o9OcRPy76j9lH/M1Eh4nQ8FmfsX9EwQXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606160; c=relaxed/simple;
	bh=haXiLR6iNBXJp0LN7677HOYkluK9cp1gfOmAJ02f9AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9+NqsvJ91IjUEC+/HW6CJdT2VA7FMGqQP5FHPHuXz+FSdg/v9sm3TD/Gq9SLKqUAPsu3SVEf+5+Tv8fNG1yPHtdKfjzgXRUtgyi3QP7C5s8yAhT7w5ezA76FNOMaf8HYA+AYKFdpAc81Et8gWVriFf1BkbNhC9Xc2XQMcVCPU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cM/m9oyE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606159; x=1801142159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=haXiLR6iNBXJp0LN7677HOYkluK9cp1gfOmAJ02f9AE=;
  b=cM/m9oyEXD/UDtj9kOJtw/DOl/H2aazRbCx2SBptfnEz1iTIQY5/2HgF
   JTjSNnVfh40aacAJk1ObxFNP07IWFoaehaINQfh/+aZle3GfEeWiaZhID
   39VU5EwJCIQGVDz46NOD0wypXGAPZg70h4vDF7aJqawyCJUqyvlR8r1uq
   magk+Bw5XrOPWIZclNop9he2IlgwsRT9LBsFMFfVFzEpZdAy/5vLk3Bwv
   ukfcUZ7TpsXyDPj+ZjUxFH1pl/4Y/Hv3zPbdxN9hrnFsR44nj/w9orzzz
   YQdRy7xTdh1ie3rgeHJKOuDDiiFOdcIeBGHbpHepTBtVR+rAQUH1uFnFY
   g==;
X-CSE-ConnectionGUID: TqcEN7HZQuO6oriN4VJebA==
X-CSE-MsgGUID: yUwRZOxGROOwyOqH1miUhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82183772"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="82183772"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:15:58 -0800
X-CSE-ConnectionGUID: JSaXVFjxSNGigjllZD3XVg==
X-CSE-MsgGUID: 59qGEPU/QEeXTSBKqXztDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208279723"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 28 Jan 2026 05:15:57 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 2CF469B; Wed, 28 Jan 2026 14:15:56 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/2] usb: xhci: add interrupter type
Date: Wed, 28 Jan 2026 14:15:04 +0100
Message-ID: <20260128131504.124322-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260128131504.124322-1-niklas.neronin@linux.intel.com>
References: <20260128131504.124322-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32884-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 90685A1E1C
X-Rspamd-Action: no action

xhci-sideband creates a secondary interrupter without an associated IRQ.
Such interrupters are non-operational and cannot enabled or disabled.

Add a type field to struct 'xhci_interrupter' to distinguish
non-operational interrupters. When the type is set to 'INTR_NOOP',
the interrupter enable/disable helpers become no-ops.

This allows callers to iterate over all allocated interrupters without
special-casing, while ensuring that actions are applied only to
operational interrupters. It also provides a simple extension point
for adding additional interrupter types in the future.

Operational interrupters remain the default; no-op interrupters are the
exception.

No functional changes are introduced; behavior remains the same.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-sideband.c | 1 +
 drivers/usb/host/xhci.c          | 6 ++++++
 drivers/usb/host/xhci.h          | 8 ++++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 2bd77255032b..21ee4e96bc70 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -352,6 +352,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 	ret = usb_offload_get(udev);
 
 	sb->ir->ip_autoclear = ip_autoclear;
+	sb->ir->type = INTR_NOOP;
 
 	return ret;
 }
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index fcf8b486b0e0..c4e0c1cfb94e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -314,6 +314,9 @@ int xhci_enable_interrupter(struct xhci_interrupter *ir)
 {
 	u32 iman;
 
+	if (ir->type == INTR_NOOP)
+		return 0;
+
 	if (!ir || !ir->ir_set)
 		return -EINVAL;
 
@@ -331,6 +334,9 @@ int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
 	u32 iman;
 
+	if (ir->type == INTR_NOOP)
+		return 0;
+
 	if (!ir || !ir->ir_set)
 		return -EINVAL;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2b0796f6d00e..59840d613e94 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1443,6 +1443,13 @@ struct xhci_bus_state {
 	unsigned long		resuming_ports;
 };
 
+enum interrupter_type {
+	/* Normal interrupter, e.g. Primary */
+	INTR_DEFAULT = 0,
+	/* Non-operational, e.g. xhci-sideband */
+	INTR_NOOP,
+};
+
 struct xhci_interrupter {
 	struct xhci_ring	*event_ring;
 	struct xhci_erst	erst;
@@ -1450,6 +1457,7 @@ struct xhci_interrupter {
 	unsigned int		intr_num;
 	bool			ip_autoclear;
 	u32			isoc_bei_interval;
+	enum interrupter_type	type;
 	/* For interrupter registers save and restore over suspend/resume */
 	u32	s3_iman;
 	u32	s3_imod;
-- 
2.50.1


