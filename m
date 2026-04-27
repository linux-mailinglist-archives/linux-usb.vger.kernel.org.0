Return-Path: <linux-usb+bounces-36520-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIuxOi4a72lr6gAAu9opvQ
	(envelope-from <linux-usb+bounces-36520-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7132F46ED81
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A96A030055AF
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352EF39934B;
	Mon, 27 Apr 2026 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAZZP9sr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D739936F
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277483; cv=none; b=c7WkHYroafq5pZB8oSuJOTwN0Qf4Kogkgbut3sktDNXlxkwHcX+ofX/YhlAZLJ7aPksyoobGidCl0FzZZRLOu65bdi4A+T2RL7zYn8mPHcgZ6norKs+9gGNtFEpsKrcD2V46tp9gFi9CjIHoGFYSaoDWffiK0qZS+I6pPUZKGW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277483; c=relaxed/simple;
	bh=JbVQB2TJjhnPnYjWP78pRddv3rZFpJoKdXWt8kg3U9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MuhEdEVfLc9muQcPKin8kmfRa4FUV0LR/VFaqPt9Po7lYRwByvVE7zifmFcwvOUKbB9WTdgHEUjpdEdGiKgsW/z594hQXlupPETmrw4/YQMvpV7CQw0Olw2w+qYVtqrIwycgX8s8+C9/d4a2AevjEtxKleK2SUNNwpXL2eQntpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAZZP9sr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777277480; x=1808813480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JbVQB2TJjhnPnYjWP78pRddv3rZFpJoKdXWt8kg3U9s=;
  b=IAZZP9srHUpIjPjr9Af+8mbO6a9Y7JqQufEA12Ri0I26S70SbIz45waZ
   cVzSWgaG//z0+5iaMf6wW+Te+8ek0e23bzCaseyjrV6rRn4rCdr12aF3C
   49/y8131wbrxcHNP8Cxj4izv++IPf5UIlJf4Lc+ajJ66UFWIalFthEOsG
   CcDoQ+W75uJ+krJdz681IYnScq8u860+3DE+H/pWPir5sj8hb7n3aoRVV
   DlLGQ/Y/iuNYVwb1DBzSDoOGTFPSCQJmum1j5FN1fJMDvtzrVm7DPSks2
   FBV3ZzsjqL/tHtBpZ4y5OT+52h8xG/DmS17UpOQV3p0QcYiaw1JCsD0ts
   A==;
X-CSE-ConnectionGUID: ycbR00EwQQGe9KOevtwILA==
X-CSE-MsgGUID: 6qUr03iORcCe5x89nnWtRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78034454"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78034454"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:11:19 -0700
X-CSE-ConnectionGUID: EYBX/2VXQaaQDpM+MpkUpw==
X-CSE-MsgGUID: +tnoQg53TUWmnaRxzn7E3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="237531373"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 27 Apr 2026 01:11:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 801E0A4; Mon, 27 Apr 2026 10:11:09 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 08/12] thunderbolt: Keep XDomain reference during the lifetime of a service
Date: Mon, 27 Apr 2026 10:11:05 +0200
Message-ID: <20260427081109.2337731-9-mika.westerberg@linux.intel.com>
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
X-Rspamd-Queue-Id: 7132F46ED81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36520-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]

This is needed because we release the service ID in tb_service_release()
and the ID array is owned by the parent XDomain.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index a1887a15a284..0e97d0ad7733 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1039,6 +1039,7 @@ static void tb_service_release(struct device *dev)
 	ida_free(&xd->service_ids, svc->id);
 	kfree(svc->key);
 	kfree(svc);
+	tb_xdomain_put(xd);
 }
 
 const struct device_type tb_service_type = {
@@ -1147,7 +1148,7 @@ static void enumerate_services(struct tb_xdomain *xd)
 		svc->id = id;
 		svc->dev.bus = &tb_bus_type;
 		svc->dev.type = &tb_service_type;
-		svc->dev.parent = &xd->dev;
+		svc->dev.parent = get_device(&xd->dev);
 		dev_set_name(&svc->dev, "%s.%d", dev_name(&xd->dev), svc->id);
 
 		tb_service_debugfs_init(svc);
-- 
2.50.1


