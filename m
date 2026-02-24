Return-Path: <linux-usb+bounces-33619-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM9JLfdMnWmhOQQAu9opvQ
	(envelope-from <linux-usb+bounces-33619-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 08:02:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF873182B15
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 08:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C873301281B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 07:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610BA30ACF1;
	Tue, 24 Feb 2026 07:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iG+xSD7h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CA72BE7DD
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771916516; cv=none; b=KHkWiwjvFvySXjYvcOPfnH6ap1MmD2l2CYGqbsVqnVCKLdaKn8l0q1tPNbRXTfKyGZhXSztdZ9IlYlQdbofwhcB4bCOqsAnoS/zwST/pexmBF715BGzJ9INDitT8HEfePdwA2GEBi9902DlBrUI7zTZ1LqaptiZQVrQmWQKNKrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771916516; c=relaxed/simple;
	bh=ssR2ACQbzkKteKkJQaC4nDfQEv0fKbnfoZ9GNwGIHDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZuptWdsyPcGR3AXnxb4i9zbQlPdDR7sRob7zEEeIs8DF2im/ogWCWZc+qImT0uP+jQLwliTmUdro+o8SN/kqoOXeQDrGVixhPKcj505Qk3VlbUsGiq30kjDarJJ/3FxOLliBMwXw2VguoG9Dv+RUiYFoVZfGo7miTOTOuG9EMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iG+xSD7h; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771916515; x=1803452515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ssR2ACQbzkKteKkJQaC4nDfQEv0fKbnfoZ9GNwGIHDw=;
  b=iG+xSD7hsxOrDs6oXQts1PpkxWR9yYMn6j+1bJm6+0aPPMSMF5W82Sad
   F1ZQ+haOBz17BJ+MQ1Exs4FMyuIFI29daa7cYxKuJV/vvD0BqVKBK0LMK
   5P2pVVfOHpDYgpHUmfAiYZ1bwwwEAwoOORGBpqCEvD7PGkuFFhrOIsHz/
   uVq6ZBiAds6gLJlpehe8yypWVAHYYBvP43b2E/E+CLkyR+IKZsr8ovJrQ
   q70pRkaAXAQ9ZnRt70+aysorpQz/toKNsGLCafjL/fK3gkaGSY9+D2KmW
   BxBoUqy7zYGyA/mElkB1ECEbvIiYFpc7vlIKA0wR/PlmigwizehiTWSlh
   g==;
X-CSE-ConnectionGUID: CMFUjc1IQTqra9hy8uYvnw==
X-CSE-MsgGUID: infT80xVQuO6TN82vqLMZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="95539951"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="95539951"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 23:01:53 -0800
X-CSE-ConnectionGUID: 208KvUejQmCB4Wq1IUzsOg==
X-CSE-MsgGUID: zNJyDI4YQ0CZXG0n8HCzhQ==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 23 Feb 2026 23:01:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8954F98; Tue, 24 Feb 2026 08:01:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] thunderbolt: Read router NVM version before applying quirks
Date: Tue, 24 Feb 2026 08:01:49 +0100
Message-ID: <20260224070150.3320641-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260224070150.3320641-1-mika.westerberg@linux.intel.com>
References: <20260224070150.3320641-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33619-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: DF873182B15
X-Rspamd-Action: no action

From: Rene Sapiens <rene.sapiens@linux.intel.com>

The router NVM version is currently only available after the NVMem devices
have been registered. This is too late for firmware-dependent quirks that
are evaluated during tb_switch_add() before device registration.

Split router NVM handling into two phases:
  - tb_switch_nvm_init() allocates the NVM object and reads the version
  - tb_switch_nvm_add() registers the NVMem devices using the pre-read NVM

This makes the NVM major/minor version available before tb_check_quirks()
without changing when the NVMem devices are registered.

Signed-off-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index e5b48a331c58..c2ad58b19e7b 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -347,7 +347,7 @@ static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 	return ret;
 }
 
-static int tb_switch_nvm_add(struct tb_switch *sw)
+static int tb_switch_nvm_init(struct tb_switch *sw)
 {
 	struct tb_nvm *nvm;
 	int ret;
@@ -365,6 +365,26 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
 	if (ret)
 		goto err_nvm;
 
+	sw->nvm = nvm;
+	return 0;
+
+err_nvm:
+	tb_sw_dbg(sw, "NVM upgrade disabled\n");
+	sw->no_nvm_upgrade = true;
+	if (!IS_ERR(nvm))
+		tb_nvm_free(nvm);
+
+	return ret;
+}
+
+static int tb_switch_nvm_add(struct tb_switch *sw)
+{
+	struct tb_nvm *nvm = sw->nvm;
+	int ret;
+
+	if (!nvm)
+		return 0;
+
 	/*
 	 * If the switch is in safe-mode the only accessible portion of
 	 * the NVM is the non-active one where userspace is expected to
@@ -383,14 +403,12 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
 			goto err_nvm;
 	}
 
-	sw->nvm = nvm;
 	return 0;
 
 err_nvm:
 	tb_sw_dbg(sw, "NVM upgrade disabled\n");
 	sw->no_nvm_upgrade = true;
-	if (!IS_ERR(nvm))
-		tb_nvm_free(nvm);
+	tb_nvm_free(nvm);
 
 	return ret;
 }
@@ -3311,6 +3329,10 @@ int tb_switch_add(struct tb_switch *sw)
 		return ret;
 	}
 
+	ret = tb_switch_nvm_init(sw);
+	if (ret)
+		return ret;
+
 	if (!sw->safe_mode) {
 		tb_switch_credits_init(sw);
 
-- 
2.50.1


