Return-Path: <linux-usb+bounces-36514-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHd0BkMa72lx6gAAu9opvQ
	(envelope-from <linux-usb+bounces-36514-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A0D46EDA4
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20E453024C95
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A7A39A804;
	Mon, 27 Apr 2026 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhsUDzpz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8701739A058
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277477; cv=none; b=cX9pt93++++d4fAKfKjm84hjqWE2Ir6mWf5t50hM1C2guEpkv5ali+cM5aui0YQV4aFB5TnjpAU2e/W3rDXCXiQoYmVzKbV5sAr8Fh7o5UoWg+bCUnGEhzUjk5LkT/98Zu/RIzE3VCj+N9MnTEdDUDDuDSsx0pkFaRJlrDlJgXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277477; c=relaxed/simple;
	bh=KNd3iwdpWK7AQa3H6R5oh7hdElDzb4V01q4GLbMx5MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYdtcOjSbF/HsfQSiJYGf4D3kfGR5WeN9iBCOxUBT2BPTIrFvCecB3zgt/fDHgPLmCdlla+nFyJB39fqWe2G6zD+dSmQrrK7M9Bgiz63nd3L4dn2TrlUw5/d5oH0qbQGiokmbzaSjbkyPSz1rp/wiwSCMesBEqinEE7Vzw9ouko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhsUDzpz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777277476; x=1808813476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KNd3iwdpWK7AQa3H6R5oh7hdElDzb4V01q4GLbMx5MI=;
  b=AhsUDzpz+rqUySqfgD7SSUMI2VcEDS9fTzgIa0sUadTLHrWFCHkulOih
   ME/35OZXcH11VdoCe4aV6iECbSKdlxG5v1cehd7KNmdg39iCGruvmDeIl
   t0ZW1ri6l9Plq6V4W6yWVvvhpUcZoSlr8uUN2+s9IVMuat43LuRGj06Sk
   JEAZ5U981Fg6Zs6hZ9ZZBYRvMRUKMOZp9RqidVs9nwR2QhmdRApy2EP/4
   zJZT6PHqxdAkpsopa12A30qu2g7V19hwAkz+hwje1WgHq0wkuiN2ykvCy
   nrNV9Lu675xIryE0k6m5ALw/Meyh6ceivsiBSoVr/FXJtIO2XzlfAKZti
   w==;
X-CSE-ConnectionGUID: n9pMi2iWRDG+fsqZKBMc7g==
X-CSE-MsgGUID: 3uha7mU5TlGeiLr01qaKqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78034436"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78034436"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:11:15 -0700
X-CSE-ConnectionGUID: zYM898B1QQ+ULSpnBoZBgg==
X-CSE-MsgGUID: sqLApeArSDya93ZAg41QEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="237531367"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 27 Apr 2026 01:11:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7D0E2A2; Mon, 27 Apr 2026 10:11:09 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 07/12] thunderbolt: Wait for tb_domain_release() to complete when driver is removed
Date: Mon, 27 Apr 2026 10:11:04 +0200
Message-ID: <20260427081109.2337731-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260427081109.2337731-1-mika.westerberg@linux.intel.com>
References: <20260427081109.2337731-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 76A0D46EDA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36514-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]

We should not call nhi_shutdown() before the domain structure and the
control channel rings are completely released. Otherwise we might
release resources like the nhi->msix_ida that are still referenced in
tb_domain_release(). For this reason wait for the tb_domain_release() to
be completed before continuing to nhi_shutdown() and eventually
releasing of the rest of the data structures.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/domain.c | 3 +++
 drivers/thunderbolt/nhi.c    | 4 ++++
 include/linux/thunderbolt.h  | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 317780b99992..df4d7dd45adf 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -319,12 +319,15 @@ const struct bus_type tb_bus_type = {
 static void tb_domain_release(struct device *dev)
 {
 	struct tb *tb = container_of(dev, struct tb, dev);
+	struct tb_nhi *nhi = tb->nhi;
 
 	tb_ctl_free(tb->ctl);
 	destroy_workqueue(tb->wq);
 	ida_free(&tb_domain_ida, tb->index);
 	mutex_destroy(&tb->lock);
 	kfree(tb);
+
+	complete(&nhi->domain_released);
 }
 
 const struct device_type tb_domain_type = {
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 2bb2e79ca3cb..1a2051673067 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1401,6 +1401,8 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	dev_dbg(dev, "NHI initialized, starting thunderbolt\n");
 
+	init_completion(&nhi->domain_released);
+
 	res = tb_domain_add(tb, host_reset);
 	if (res) {
 		/*
@@ -1408,6 +1410,7 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		 * activated. Do a proper shutdown.
 		 */
 		tb_domain_put(tb);
+		wait_for_completion(&nhi->domain_released);
 		nhi_shutdown(nhi);
 		return res;
 	}
@@ -1433,6 +1436,7 @@ static void nhi_remove(struct pci_dev *pdev)
 	pm_runtime_forbid(&pdev->dev);
 
 	tb_domain_remove(tb);
+	wait_for_completion(&nhi->domain_released);
 	nhi_shutdown(nhi);
 }
 
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 0ba112175bb3..a5ef7100a6d3 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -493,6 +493,7 @@ static inline struct tb_xdomain *tb_service_parent(struct tb_service *svc)
  *		    MSI-X is used.
  * @hop_count: Number of rings (end point hops) supported by NHI.
  * @quirks: NHI specific quirks if any
+ * @domain_released: Completed when domain has been fully released
  */
 struct tb_nhi {
 	spinlock_t lock;
@@ -507,6 +508,7 @@ struct tb_nhi {
 	struct work_struct interrupt_work;
 	u32 hop_count;
 	unsigned long quirks;
+	struct completion domain_released;
 };
 
 /**
-- 
2.50.1


