Return-Path: <linux-usb+bounces-27729-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD2BB49591
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D8E4175013
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23485318125;
	Mon,  8 Sep 2025 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOySWvvT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25E930FC2E
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349159; cv=none; b=SLkSxhiT/VByrAxRL1HMIfY7mNXVtgIKD73vr3BDyig3lk8PlQ9Ds/GVjm8im5BlfUMsIXX6i3TCmUDYyBqGp9HRsefqticSPJVVWGBXtRJ49Ot3j+knoDklHo6ztnkUrSxHnFSdZlFg3ivfjLi7rRYKGj4djvtqXEAkfOGatws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349159; c=relaxed/simple;
	bh=LJC70j92Ql84y3vV9Kqc/0ci0uuk26Z91+zjR+el5KE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9Xeix5icRl316JN5Yyt8hBp6H/ByxGZFnu7VIEtw5IjO5DGDxmhaBAdONfR8cAsg5jV5yCFwh8oRJc0ON4QEOjMTNK3g+haCN1vbi7Hur2Iusss0tgeYO2RaxgDbVf2R/y6S4lgFlnHMpkREUF3B/HWdIweZB8+HvAo2K5y9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOySWvvT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349159; x=1788885159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LJC70j92Ql84y3vV9Kqc/0ci0uuk26Z91+zjR+el5KE=;
  b=iOySWvvTixFEueyCyRRLjG0gOErOuAyvc9hV6qZM32K3he1Z9MXhdqlW
   OryLcx/+IRpdXwxvdXUtKrS39ptg3KDBIuB6/q+XVhpprvOFfApHkrbE+
   p9JD8VHSh9yqy8IgHgyiY4LrWkqFFgGYAzHmvdKYYApA+n/4oTAWslz7c
   pOnuRkMHpjkO17eXRd6tJ5+HcverFgQJeorfPuVezkKUSqFfyPmNOL5Kv
   H9m4/6q84hqLL0/eEZLarJp0TpLRcnmYzo7dDg8yhUHoHKG+Q4KzFkWR1
   FpxF/1jczpFuZhrDi2tIfK6ouN7NwBiAyIYP4v2gmmwBzTSWrVnohF4OZ
   A==;
X-CSE-ConnectionGUID: GeOVc/uITx2gh/7Ag2IyhA==
X-CSE-MsgGUID: BPD/i+1lRmmsuFyFgZHMzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63252106"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="63252106"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:37 -0700
X-CSE-ConnectionGUID: Rwfbj4krThqv0hYJvpRneQ==
X-CSE-MsgGUID: V+0WIZQZQM22sahDKCBVpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203622643"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 09:32:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E9C51A0; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 12/26] thunderbolt: Update nvm.c function documentation
Date: Mon,  8 Sep 2025 18:32:16 +0200
Message-ID: <20250908163230.2614397-13-mika.westerberg@linux.intel.com>
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

Make nvm.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nvm.c | 42 ++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/thunderbolt/nvm.c b/drivers/thunderbolt/nvm.c
index da11c8112e29..6901058b7ac0 100644
--- a/drivers/thunderbolt/nvm.c
+++ b/drivers/thunderbolt/nvm.c
@@ -278,9 +278,13 @@ static const struct tb_nvm_vendor retimer_nvm_vendors[] = {
  * tb_nvm_alloc() - Allocate new NVM structure
  * @dev: Device owning the NVM
  *
- * Allocates new NVM structure with unique @id and returns it. In case
- * of error returns ERR_PTR(). Specifically returns %-EOPNOTSUPP if the
- * NVM format of the @dev is not known by the kernel.
+ * Allocates new NVM structure with unique @id and returns it.
+ *
+ * Return:
+ * * Pointer to &struct tb_nvm - On success.
+ * * %-EOPNOTSUPP - If the NVM format of the @dev is not known by the
+ *   kernel.
+ * * %ERR_PTR - In case of failure.
  */
 struct tb_nvm *tb_nvm_alloc(struct device *dev)
 {
@@ -347,9 +351,10 @@ struct tb_nvm *tb_nvm_alloc(struct device *dev)
  * tb_nvm_read_version() - Read and populate NVM version
  * @nvm: NVM structure
  *
- * Uses vendor specific means to read out and fill in the existing
- * active NVM version. Returns %0 in case of success and negative errno
- * otherwise.
+ * Uses vendor specific means to read and fill out the existing
+ * active NVM version.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_nvm_read_version(struct tb_nvm *nvm)
 {
@@ -365,12 +370,11 @@ int tb_nvm_read_version(struct tb_nvm *nvm)
  * tb_nvm_validate() - Validate new NVM image
  * @nvm: NVM structure
  *
- * Runs vendor specific validation over the new NVM image and if all
- * checks pass returns %0. As side effect updates @nvm->buf_data_start
- * and @nvm->buf_data_size fields to match the actual data to be written
- * to the NVM.
+ * Runs vendor specific validation over the new NVM image. As a
+ * side effect, updates @nvm->buf_data_start and @nvm->buf_data_size
+ * fields to match the actual data to be written to the NVM.
  *
- * If the validation does not pass then returns negative errno.
+ * Return: %0 on successful validation, negative errno otherwise.
  */
 int tb_nvm_validate(struct tb_nvm *nvm)
 {
@@ -405,7 +409,7 @@ int tb_nvm_validate(struct tb_nvm *nvm)
  * the image, this function does that. Can be called even if the device
  * does not need this.
  *
- * Returns %0 in case of success and negative errno otherwise.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_nvm_write_headers(struct tb_nvm *nvm)
 {
@@ -423,7 +427,8 @@ int tb_nvm_write_headers(struct tb_nvm *nvm)
  * Registers new active NVmem device for @nvm. The @reg_read is called
  * directly from NVMem so it must handle possible concurrent access if
  * needed. The first parameter passed to @reg_read is @nvm structure.
- * Returns %0 in success and negative errno otherwise.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_nvm_add_active(struct tb_nvm *nvm, nvmem_reg_read_t reg_read)
 {
@@ -461,6 +466,11 @@ int tb_nvm_add_active(struct tb_nvm *nvm, nvmem_reg_read_t reg_read)
  * Helper function to cache the new NVM image before it is actually
  * written to the flash. Copies @bytes from @val to @nvm->buf starting
  * from @offset.
+ *
+ * Return:
+ * * %0 - On success.
+ * * %-ENOMEM - If buffer allocation failed.
+ * * Negative errno - Another error occurred.
  */
 int tb_nvm_write_buf(struct tb_nvm *nvm, unsigned int offset, void *val,
 		     size_t bytes)
@@ -488,7 +498,7 @@ int tb_nvm_write_buf(struct tb_nvm *nvm, unsigned int offset, void *val,
  * needed. The first parameter passed to @reg_write is @nvm structure.
  * The size of the NVMem device is set to %NVM_MAX_SIZE.
  *
- * Returns %0 in success and negative errno otherwise.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_nvm_add_non_active(struct tb_nvm *nvm, nvmem_reg_write_t reg_write)
 {
@@ -545,7 +555,7 @@ void tb_nvm_free(struct tb_nvm *nvm)
  * This is a generic function that reads data from NVM or NVM like
  * device.
  *
- * Returns %0 on success and negative errno otherwise.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_nvm_read_data(unsigned int address, void *buf, size_t size,
 		     unsigned int retries, read_block_fn read_block,
@@ -592,7 +602,7 @@ int tb_nvm_read_data(unsigned int address, void *buf, size_t size,
  *
  * This is generic function that writes data to NVM or NVM like device.
  *
- * Returns %0 on success and negative errno otherwise.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_nvm_write_data(unsigned int address, const void *buf, size_t size,
 		      unsigned int retries, write_block_fn write_block,
-- 
2.50.1


