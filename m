Return-Path: <linux-usb+bounces-27739-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6A9B49598
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F3C81C20B09
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0907319847;
	Mon,  8 Sep 2025 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZN+pQIb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF8A318143
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349162; cv=none; b=kQiqKSxubZVEvCm4jKz95uqlSTD5SSR1nShOjVOmYGxL18oVSlXx5WGt1vO/m1WP0jtzTnEsUMWk7xnNoaBGIA6jMb/9chRYXV3LM9QkZepeeSWCs8kf+ddiZa2YebRFUkSKpkaXMBwMWItbHp8sDySXJuL/Fg7RYksg3amc2Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349162; c=relaxed/simple;
	bh=XTWQ0JU72TxagY54gQ5NybzAJoi6fLmzLDYZmU6G8a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uG1XbyC7Vu7lRZRAkhkTYnnPHUHOyHYR8u4MFOqUTlFXxtS5+5ysGxAccQrgODI0v2qL9fK1phGCD+6SEQQKAsReLuHUpHKnTs325eVJen69S/dr2NLTFpwUUxHV+1xOy+oDB4JcpTsH0b+BOAGdxVj5zopRwPdbIwXAfrxgPfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZN+pQIb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349161; x=1788885161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XTWQ0JU72TxagY54gQ5NybzAJoi6fLmzLDYZmU6G8a8=;
  b=XZN+pQIbu7fZnhzpSKyDnA6Hw79xqwYedPrpJHpF7WchaoYW+8iFTXWr
   5siuvid4rgmBGzrsFiwa+Y68mRjoRu/d80b5bytwXPeZwcsMh6JT5KQlK
   NzqYksSKrs8WAy2+s29vb7dbhTrLbqktdliDfzQA8AHlPLgoYEeX3Bmyl
   Xx/bIAUbH76BBPopfRn74/CMPIJFnF37utjosBv70lB9PEsFs0dfKNjCA
   t8uHOwPP3LFumPqNDE4WeOYN1aKIbKTNWumMBleOHM0V2Sl7ycrNfWbk2
   mbwdgtHlRkWcCoupIPo+FmAceYsLtUp1mmvxLVGTdcd05VcfsgStqV3Ae
   A==;
X-CSE-ConnectionGUID: Jzc1JIXeT0yhG8WJE7tJPA==
X-CSE-MsgGUID: W6jajBBVSxiL4viXYqxG0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63252121"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="63252121"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:39 -0700
X-CSE-ConnectionGUID: RiutqrM7Szafh72X9HoiUw==
X-CSE-MsgGUID: PG8O5luWSme/8n2sOYGE4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203622653"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 09:32:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0F5D6A8; Mon, 08 Sep 2025 18:32:31 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 20/26] thunderbolt: Update tmu.c function documentation
Date: Mon,  8 Sep 2025 18:32:24 +0200
Message-ID: <20250908163230.2614397-21-mika.westerberg@linux.intel.com>
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

Make tmu.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tmu.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 9a259c72e5a7..b22831b41ec0 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -405,6 +405,8 @@ static int tmu_mode_init(struct tb_switch *sw)
  * This function must be called before other TMU related functions to
  * makes the internal structures are filled in correctly. Does not
  * change any hardware configuration.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_tmu_init(struct tb_switch *sw)
 {
@@ -439,6 +441,8 @@ int tb_switch_tmu_init(struct tb_switch *sw)
  * @sw: Switch whose time to update
  *
  * Updates switch local time using time posting procedure.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_tmu_post_time(struct tb_switch *sw)
 {
@@ -555,6 +559,8 @@ static int disable_enhanced(struct tb_port *up, struct tb_port *down)
  * @sw: Switch whose TMU to disable
  *
  * Turns off TMU of @sw if it is enabled. If not enabled does nothing.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_tmu_disable(struct tb_switch *sw)
 {
@@ -938,6 +944,8 @@ static int tb_switch_tmu_change_mode(struct tb_switch *sw)
  * Enables TMU of a router to be in uni-directional Normal/HiFi or
  * bi-directional HiFi mode. Calling tb_switch_tmu_configure() is
  * required before calling this function.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_tmu_enable(struct tb_switch *sw)
 {
@@ -1017,9 +1025,11 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
  * Selects the TMU mode that is enabled when tb_switch_tmu_enable() is
  * next called.
  *
- * Returns %0 in success and negative errno otherwise. Specifically
- * returns %-EOPNOTSUPP if the requested mode is not possible (not
- * supported by the router and/or topology).
+ * Return:
+ * * %0 - On success.
+ * * %-EOPNOTSUPP - If the requested mode is not possible (not supported by
+ *   the router and/or topology).
+ * * Negative errno - Another error occurred.
  */
 int tb_switch_tmu_configure(struct tb_switch *sw, enum tb_switch_tmu_mode mode)
 {
-- 
2.50.1


