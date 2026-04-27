Return-Path: <linux-usb+bounces-36517-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG3lJlEa72lx6gAAu9opvQ
	(envelope-from <linux-usb+bounces-36517-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:12:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DE746EDD8
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8820C302A2DB
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC58939A058;
	Mon, 27 Apr 2026 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwUhaWs3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D6839A077
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277477; cv=none; b=Jc6my/U7qSGZF35WfXTnY8ELk3z88XdAP8C74KV1WP4WwiD8/1Qu24hDipxTwT0GG/8laEfc00UtHGCIXOvc08mbzUmqDpGBAxt3IEuKwliCF+VFTNbYIcX3p1eUu9LKFr4hS5Gf0sYkJw0qnxjYNWGZX2v1wTVgNi0+TNWh/hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277477; c=relaxed/simple;
	bh=QfjOQ/HqJ0/a8+UtFT2xeGrvqhKTTlmENoSKnzKE0Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nu85/7+/Eh1A7WMUegcjOyejnvPrvQ9ozQhoyzJovgPhCL+ER+a0aWoYvZuoH5wmYtRQKZSJBqFbHRLSwCtvIR0nm9JHRaMQP5pfFcMUzlod/fM64Zoq0NvfzL7wNtd81mn1gA6N74ObO5PcrPQ52+Zae+//2g3gqdZfe/GtFVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwUhaWs3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777277476; x=1808813476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QfjOQ/HqJ0/a8+UtFT2xeGrvqhKTTlmENoSKnzKE0Vs=;
  b=OwUhaWs3h6Ksx2kSyLdhFj/ItAqYKpgZMK95wPT78wT2Zli4PgXS6UsQ
   jvQeYWWc8o7niAT10y/yF7oE+iyToGzhhNrsee6+ADc2J+7LWi6qzTHKt
   /wcbBH/klqi7+a05q5MBlLlCTQ7gVs0eto4/6skhfxyj+YIFwvkDYd4Tn
   RScs3qrdFV0pl6U3ZZFBI1E9KCJ5aydCJP7i5KuvUUxLkYMcBNTF1V2Yo
   LZNn95Ztldc8OQ5HuHJ1MZrXkD8U5tM5+AdxuXXmY8HwH3TB7M89xebnG
   FZlOeq/78B7rEy2p/XKCW+3xXNy/xbyg7UBqjmbCgnhE0nxScbA0Us8O7
   w==;
X-CSE-ConnectionGUID: UUaduL4IRMKjrYuAiJfvxg==
X-CSE-MsgGUID: SGTRWDvzTey4EDd76dKHeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77863257"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="77863257"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:11:14 -0700
X-CSE-ConnectionGUID: MT5rY3dXRomDnwfAs0+rVQ==
X-CSE-MsgGUID: Xf//yORSTPGa2jtz+88nIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="229008935"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 27 Apr 2026 01:11:12 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8299BA5; Mon, 27 Apr 2026 10:11:09 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 09/12] thunderbolt: dma_test: No need to store debugfs directory pointer
Date: Mon, 27 Apr 2026 10:11:06 +0200
Message-ID: <20260427081109.2337731-10-mika.westerberg@linux.intel.com>
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
X-Rspamd-Queue-Id: 01DE746EDD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36517-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

We don't actually need to store the debugfs directory pointer inside
struct dma_test. Instead we can use the debugfs_lookup_and_remove()
which also handles the case if the debugfs directory is already removed
by the core driver (for example when cable is disconnected).

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/dma_test.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/thunderbolt/dma_test.c b/drivers/thunderbolt/dma_test.c
index b4aa79d482a0..af1e6bc9c7cd 100644
--- a/drivers/thunderbolt/dma_test.c
+++ b/drivers/thunderbolt/dma_test.c
@@ -87,7 +87,6 @@ static const char * const dma_test_result_names[] = {
  * @error_code: Error code of the last run
  * @complete: Used to wait for the Rx to complete
  * @lock: Lock serializing access to this structure
- * @debugfs_dir: dentry of this dma_test
  */
 struct dma_test {
 	const struct tb_service *svc;
@@ -108,7 +107,6 @@ struct dma_test {
 	enum dma_test_test_error error_code;
 	struct completion complete;
 	struct mutex lock;
-	struct dentry *debugfs_dir;
 };
 
 /* DMA test property directory UUID: 3188cd10-6523-4a5a-a682-fdca07a248d8 */
@@ -619,18 +617,18 @@ DEFINE_SHOW_ATTRIBUTE(status);
 
 static void dma_test_debugfs_init(struct tb_service *svc)
 {
-	struct dma_test *dt = tb_service_get_drvdata(svc);
+	struct dentry *debugfs_dir;
 
-	dt->debugfs_dir = debugfs_create_dir("dma_test", svc->debugfs_dir);
+	debugfs_dir = debugfs_create_dir("dma_test", svc->debugfs_dir);
 
-	debugfs_create_file("lanes", 0600, dt->debugfs_dir, svc, &lanes_fops);
-	debugfs_create_file("speed", 0600, dt->debugfs_dir, svc, &speed_fops);
-	debugfs_create_file("packets_to_receive", 0600, dt->debugfs_dir, svc,
+	debugfs_create_file("lanes", 0600, debugfs_dir, svc, &lanes_fops);
+	debugfs_create_file("speed", 0600, debugfs_dir, svc, &speed_fops);
+	debugfs_create_file("packets_to_receive", 0600, debugfs_dir, svc,
 			    &packets_to_receive_fops);
-	debugfs_create_file("packets_to_send", 0600, dt->debugfs_dir, svc,
+	debugfs_create_file("packets_to_send", 0600, debugfs_dir, svc,
 			    &packets_to_send_fops);
-	debugfs_create_file("status", 0400, dt->debugfs_dir, svc, &status_fops);
-	debugfs_create_file("test", 0200, dt->debugfs_dir, svc, &test_fops);
+	debugfs_create_file("status", 0400, debugfs_dir, svc, &status_fops);
+	debugfs_create_file("test", 0200, debugfs_dir, svc, &test_fops);
 }
 
 static int dma_test_probe(struct tb_service *svc, const struct tb_service_id *id)
@@ -658,7 +656,7 @@ static void dma_test_remove(struct tb_service *svc)
 	struct dma_test *dt = tb_service_get_drvdata(svc);
 
 	mutex_lock(&dt->lock);
-	debugfs_remove_recursive(dt->debugfs_dir);
+	debugfs_lookup_and_remove("dma_test", svc->debugfs_dir);
 	mutex_unlock(&dt->lock);
 }
 
-- 
2.50.1


