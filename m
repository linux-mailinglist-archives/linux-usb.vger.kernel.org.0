Return-Path: <linux-usb+bounces-27730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61932B49592
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 521201C20A21
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7754D318138;
	Mon,  8 Sep 2025 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZE6IBarG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227E930FC2F
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349159; cv=none; b=ZEHbJs4jOYRHlimJrduF989eJnfzsO70P39JXBaMI8F1rV31QG+5n+T2r6pzf+eM5KT/tsrNk7fy4Zus9D8GL8vviyx9+eGm6FXILDdUFT7SXdkXoK+Bo/gVCAgJ25AonnvZVO0FMUPHk/Komgy4EpsLxR1WKcoCjyW15K9YAWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349159; c=relaxed/simple;
	bh=8Hf47h04LS3jGfZAqVgu5kE+o5YbkqCt83zFQawxXvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFdhKWLLvcwLxwptYItpyGiua9Yirg3pQD0/PHY3ECfO45thcd7wUmKyAR/1oU54RHDtMEKvHVvA1ExmWZ/VDMfQwaOb0ePutOyhDwh+Udp6losbHcixG35+xmHu9ZGW2tjNd9VsQ7dJ0jX9Uxrx+aCqfqVnYP33aDUGiTw9yIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZE6IBarG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349157; x=1788885157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Hf47h04LS3jGfZAqVgu5kE+o5YbkqCt83zFQawxXvE=;
  b=ZE6IBarGq67ybb2meBnnj6G9m0SmkKl2S1UJ7dhd66clIKuybfJML13K
   bEwO4vI0MatkUJQNbQVtWusRr+ew9oJh2Ce1u110ryfstcXStoPfPZuWs
   mIxRDx3EqATlotFJiABspKiTdlfNty7oQYgYPHhX02dLZNjUIPwS7jAcn
   ubeDHWtu+YpjvufWGMtMAEulDPhj4BuutZTLVmxKVmTrtuBqSQJH9Cg72
   j4rPudvxn7tRC6Arta4hxX8h5PrSezZti8lIpTJaxZ4pv2ThyY/kkrd3y
   +vvnXkDnLGOygt+TexMDUFqGqQxTBLZJkWFqmrt+ZGefOgsc8A1qgn5CO
   A==;
X-CSE-ConnectionGUID: D+di1XKCR0ayH5k+3Z29ZA==
X-CSE-MsgGUID: Dv0AgcOUSLi0kMjSO1I8cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443049"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443049"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:35 -0700
X-CSE-ConnectionGUID: nNppU07XRqmnlwxSuIcaEw==
X-CSE-MsgGUID: w7YXxbZUSCiC5HOidi19Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291148"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id DA3A19B; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 07/26] thunderbolt: Update domain.c function documentation
Date: Mon,  8 Sep 2025 18:32:11 +0200
Message-ID: <20250908163230.2614397-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
References: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Make domain.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/domain.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 45239703745e..1d9992ce6a09 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -368,7 +368,7 @@ static bool tb_domain_event_cb(void *data, enum tb_cfg_pkg_type type,
  * Call tb_domain_put() to release the domain before it has been added
  * to the system.
  *
- * Return: allocated domain structure on %NULL in case of error
+ * Return: Pointer to &struct tb or %NULL in case of error.
  */
 struct tb *tb_domain_alloc(struct tb_nhi *nhi, int timeout_msec, size_t privsize)
 {
@@ -430,7 +430,7 @@ struct tb *tb_domain_alloc(struct tb_nhi *nhi, int timeout_msec, size_t privsize
  * and release the domain after this function has been called, call
  * tb_domain_remove().
  *
- * Return: %0 in case of success and negative errno in case of error
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_domain_add(struct tb *tb, bool reset)
 {
@@ -518,6 +518,8 @@ void tb_domain_remove(struct tb *tb)
  * @tb: Domain to suspend
  *
  * Suspends all devices in the domain and stops the control channel.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_domain_suspend_noirq(struct tb *tb)
 {
@@ -544,6 +546,8 @@ int tb_domain_suspend_noirq(struct tb *tb)
  *
  * Re-starts the control channel, and resumes all devices connected to
  * the domain.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_domain_resume_noirq(struct tb *tb)
 {
@@ -643,6 +647,8 @@ int tb_domain_disapprove_switch(struct tb *tb, struct tb_switch *sw)
  * This will approve switch by connection manager specific means. In
  * case of success the connection manager will create PCIe tunnel from
  * parent to @sw.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_domain_approve_switch(struct tb *tb, struct tb_switch *sw)
 {
@@ -773,7 +779,7 @@ int tb_domain_challenge_switch_key(struct tb *tb, struct tb_switch *sw)
  * This needs to be called in preparation for NVM upgrade of the host
  * controller. Makes sure all PCIe paths are disconnected.
  *
- * Return %0 on success and negative errno in case of error.
+ * Return: %0 on success and negative errno in case of error.
  */
 int tb_domain_disconnect_pcie_paths(struct tb *tb)
 {
@@ -795,9 +801,11 @@ int tb_domain_disconnect_pcie_paths(struct tb *tb)
  * Calls connection manager specific method to enable DMA paths to the
  * XDomain in question.
  *
- * Return: 0% in case of success and negative errno otherwise. In
- * particular returns %-ENOTSUPP if the connection manager
- * implementation does not support XDomains.
+ * Return:
+ * * %0 - On success.
+ * * %-ENOTSUPP - If the connection manager implementation does not support
+ *   XDomains.
+ * * Negative errno - An error occurred.
  */
 int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 				    int transmit_path, int transmit_ring,
@@ -822,9 +830,11 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
  * Calls connection manager specific method to disconnect DMA paths to
  * the XDomain in question.
  *
- * Return: 0% in case of success and negative errno otherwise. In
- * particular returns %-ENOTSUPP if the connection manager
- * implementation does not support XDomains.
+ * Return:
+ * * %0 - On success.
+ * * %-ENOTSUPP - If the connection manager implementation does not support
+ *   XDomains.
+ * * Negative errno - An error occurred.
  */
 int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 				       int transmit_path, int transmit_ring,
-- 
2.50.1


