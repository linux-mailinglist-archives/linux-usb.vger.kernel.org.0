Return-Path: <linux-usb+bounces-27737-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA56B49597
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FE4E1C20B02
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720D43191D8;
	Mon,  8 Sep 2025 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExS25ilN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9FC317717
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349161; cv=none; b=PyfH2Vkr1KS7qswBmjcjTO/aAkxz2qmdYe0+7vWFAR6MCxiqq/2riPx4pdZ4tW188AiDT8XCVdaHi9mf9rAIgEiurL0Dm+EKNhB+51bEM9xVi/qX2avfxt7SifwdbbPLGNGi9lKcr2hC1JqU121WYam4mhHT3tMIAw0X18+u+1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349161; c=relaxed/simple;
	bh=1JGkUZAPUVhbnMgiHCs/mibRBYQCFYkXBZE8z704BXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V99fbYIhKd1FxG8GvmEbfcGTjmv0c4tUGAf3hPPJpa++F3u/gQvMemMxxskc8pI+YFZi3vSGPXwlRl/yyFsTHsE/8C1/+fUIhXPSP9kY5WXtEMez6QBMw2tpgXB0cATbDZcZzD5IK2A6bgufNkpRUI0bmDr4VZL52LAimId8opE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExS25ilN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349159; x=1788885159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1JGkUZAPUVhbnMgiHCs/mibRBYQCFYkXBZE8z704BXw=;
  b=ExS25ilNHra7WTJB38zCCkLlxQiLuUfeCitx7l1vl2AbrhyYc7T3kAd5
   ZsJwUB3vGp9mwSD188CsxJnxRKDD1BOWFiSTZL9SillW8B9HRvIO4ONnu
   266vsxFQh4/wEPE/OuRm0D/BGZCShpVeOTu5cfUecNMU6V/W8a0Y5iJT0
   zfgSjBiMpNd/7J/2XYCQou1S1coGFc8XqJNvxEcQai9bxb9hqEn3Af4jL
   XmFNWkUntcylClSudggljjXhgdEJsxTP0HcsNuAHrtYkX1YxqGenYtQ3u
   puARTrKGATYGusgrb8rNq85IpPIOkavIIIMIotAI52aGvdoOBCxCUuJhV
   g==;
X-CSE-ConnectionGUID: FIDNAbhjTdu44RNk1gXRUA==
X-CSE-MsgGUID: WaCKltPuQUGOpjUKYqSdZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443062"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443062"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:35 -0700
X-CSE-ConnectionGUID: 42w+2ZLrTDe2kwl1SZ5CEA==
X-CSE-MsgGUID: iLNMa2taT2Ot78T3k6UTVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291152"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id F062AA2; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 14/26] thunderbolt: Update property.c function documentation
Date: Mon,  8 Sep 2025 18:32:18 +0200
Message-ID: <20250908163230.2614397-15-mika.westerberg@linux.intel.com>
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

Make property.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/property.c | 38 +++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index dc555cda98e6..31aa0516932a 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -211,11 +211,13 @@ static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
  *
  * This function parses the XDomain properties data block into format that
  * can be traversed using the helper functions provided by this module.
- * Upon success returns the parsed directory. In case of error returns
- * %NULL. The resulting &struct tb_property_dir needs to be released by
+ *
+ * The resulting &struct tb_property_dir needs to be released by
  * calling tb_property_free_dir() when not needed anymore.
  *
  * The @block is expected to be root directory.
+ *
+ * Return: Pointer to &struct tb_property_dir, %NULL in case of failure.
  */
 struct tb_property_dir *tb_property_parse_dir(const u32 *block,
 					      size_t block_len)
@@ -238,6 +240,8 @@ struct tb_property_dir *tb_property_parse_dir(const u32 *block,
  *
  * Creates new, empty property directory. If @uuid is %NULL then the
  * directory is assumed to be root directory.
+ *
+ * Return: Pointer to &struct tb_property_dir, %NULL in case of failure.
  */
 struct tb_property_dir *tb_property_create_dir(const uuid_t *uuid)
 {
@@ -481,9 +485,11 @@ static ssize_t __tb_property_format_dir(const struct tb_property_dir *dir,
  * @block_len: Length of the property block
  *
  * This function formats the directory to the packed format that can be
- * then send over the thunderbolt fabric to receiving host. Returns %0 in
- * case of success and negative errno on faulure. Passing %NULL in @block
- * returns number of entries the block takes.
+ * then sent over the thunderbolt fabric to receiving host.
+ *
+ * Passing %NULL in @block returns number of entries the block takes.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 ssize_t tb_property_format_dir(const struct tb_property_dir *dir, u32 *block,
 			       size_t block_len)
@@ -505,9 +511,9 @@ ssize_t tb_property_format_dir(const struct tb_property_dir *dir, u32 *block,
  * tb_property_copy_dir() - Take a deep copy of directory
  * @dir: Directory to copy
  *
- * This function takes a deep copy of @dir and returns back the copy. In
- * case of error returns %NULL. The resulting directory needs to be
- * released by calling tb_property_free_dir().
+ * The resulting directory needs to be released by calling tb_property_free_dir().
+ *
+ * Return: Pointer to &struct tb_property_dir, %NULL in case of failure.
  */
 struct tb_property_dir *tb_property_copy_dir(const struct tb_property_dir *dir)
 {
@@ -577,6 +583,8 @@ struct tb_property_dir *tb_property_copy_dir(const struct tb_property_dir *dir)
  * @parent: Directory to add the property
  * @key: Key for the property
  * @value: Immediate value to store with the property
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_property_add_immediate(struct tb_property_dir *parent, const char *key,
 			      u32 value)
@@ -606,6 +614,8 @@ EXPORT_SYMBOL_GPL(tb_property_add_immediate);
  * @buflen: Number of bytes in the data buffer
  *
  * Function takes a copy of @buf and adds it to the directory.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_property_add_data(struct tb_property_dir *parent, const char *key,
 			 const void *buf, size_t buflen)
@@ -642,6 +652,8 @@ EXPORT_SYMBOL_GPL(tb_property_add_data);
  * @text: String to add
  *
  * Function takes a copy of @text and adds it to the directory.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_property_add_text(struct tb_property_dir *parent, const char *key,
 			 const char *text)
@@ -676,6 +688,8 @@ EXPORT_SYMBOL_GPL(tb_property_add_text);
  * @parent: Directory to add the property
  * @key: Key for the property
  * @dir: Directory to add
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_property_add_dir(struct tb_property_dir *parent, const char *key,
 			struct tb_property_dir *dir)
@@ -716,8 +730,10 @@ EXPORT_SYMBOL_GPL(tb_property_remove);
  * @key: Key to look for
  * @type: Type of the property
  *
- * Finds and returns property from the given directory. Does not recurse
- * into sub-directories. Returns %NULL if the property was not found.
+ * Finds and returns property from the given directory. Does not
+ * recurse into sub-directories.
+ *
+ * Return: Pointer to &struct tb_property, %NULL if the property was not found.
  */
 struct tb_property *tb_property_find(struct tb_property_dir *dir,
 	const char *key, enum tb_property_type type)
@@ -737,6 +753,8 @@ EXPORT_SYMBOL_GPL(tb_property_find);
  * tb_property_get_next() - Get next property from directory
  * @dir: Directory holding properties
  * @prev: Previous property in the directory (%NULL returns the first)
+ *
+ * Return: Pointer to &struct tb_property, %NULL if property was not found.
  */
 struct tb_property *tb_property_get_next(struct tb_property_dir *dir,
 					 struct tb_property *prev)
-- 
2.50.1


