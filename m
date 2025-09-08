Return-Path: <linux-usb+bounces-27726-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F91B4958F
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4765816E9CB
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E2030FF29;
	Mon,  8 Sep 2025 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fo8aEtjd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A96F30FC08
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349158; cv=none; b=OrnWssi5mvosdQ2BKB2abX86xIKjyhdH8xZQ4oXrpMFe7brew0UCmSI+bdjlycja9yCxmpBEkPlApyoWXgaTEVN0iXZE3FdWmOdGniRP2QS/9NmxmFEikdCAPheSyy+wAk+t46/uu0nauEj+DBxR/20DAX6NJmjNA/cx9cjCZWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349158; c=relaxed/simple;
	bh=0ZssnZWmTH6DXQs87+xsICJpAhW36t0Zu0hKea0l51o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aXH6Hkp9yNIEDihEVfOBKLGhWyBAVljnYZU7H0mHImLviIpdyGaXfLjIVn1g1NCqmJncaiFSNLeJA8Hjsuy+v9Zour7DErzUTFD4YoAaYJUMxX7Ez4mamfhCmg6DyzS4bg6La1AkCwrm97+e+peHPC+lX44EIr2GTUTaY3qRWPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fo8aEtjd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349155; x=1788885155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0ZssnZWmTH6DXQs87+xsICJpAhW36t0Zu0hKea0l51o=;
  b=Fo8aEtjdwLHGgHjvOG6OfaPikmbjaFR/5Nw8RJQR++5dsjYNctkbUWDE
   AXotEax4eBXhKZOHwzyfnomOwCK2Tqodg3S74nvbG1ZulCG1K7wy8pK8u
   w5oCMGDDgbFwUSscrKoks4QzJImYT0k1rgdnDtQaeKfKq/nPhbmI9mxyi
   0ejFj9PZ2mN+zd19829wSbPSzzg+O5o1gKQtmJsIcCqN6FyQC9SAtorCQ
   BMHX0i92VqZkXhlTBb6kZkpCTY9HBKtFTV6F+NWIuVV9yDSevKvdHFEGk
   djOIu7spzjgR9WsDNIYtTBcFFGqRXcB40orMBCCm8WN3AL25n1yA1DQaD
   Q==;
X-CSE-ConnectionGUID: rIfFV2hgSRKKXP+r+0mquA==
X-CSE-MsgGUID: 8TUcyuUrRraLHxZyoRZdzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443045"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443045"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:35 -0700
X-CSE-ConnectionGUID: lNEVcb+kR1+cibzCq9oIsg==
X-CSE-MsgGUID: bMkiVAlQT2OfJpDEm3GUyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291149"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id DD6D89C; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 08/26] thunderbolt: Update eeprom.c function documentation
Date: Mon,  8 Sep 2025 18:32:12 +0200
Message-ID: <20250908163230.2614397-9-mika.westerberg@linux.intel.com>
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

Make eeprom.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/eeprom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index e66183a72cf9..1af65fece495 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -298,6 +298,8 @@ struct tb_drom_entry_desc {
  *
  * Does not use the cached copy in sw->drom. Used during resume to check switch
  * identity.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_drom_read_uid_only(struct tb_switch *sw, u64 *uid)
 {
@@ -709,7 +711,7 @@ static int tb_drom_device_read(struct tb_switch *sw)
  * populates the fields in @sw accordingly. Can be called for any router
  * generation.
  *
- * Returns %0 in case of success and negative errno otherwise.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_drom_read(struct tb_switch *sw)
 {
-- 
2.50.1


