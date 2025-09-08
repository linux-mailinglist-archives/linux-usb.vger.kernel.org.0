Return-Path: <linux-usb+bounces-27725-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F97B4958E
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48171171C69
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9393730FF13;
	Mon,  8 Sep 2025 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKqS1NuP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4289A30FC03
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349158; cv=none; b=lXgFOudpmE2ZO+PzFmToEfcXMnQIA6UYkuHzACXS9af3Ke8QMEpxNufURSWAeMCnemoSf4SJP/8rqPw/LDV/WJUFwpc7ThHvJcZty9Aq30T7ASjSFBCW1StvgYQomHpm6tcB528jYvReYVWy65Th61eRI+LBNDq74sagy92mOng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349158; c=relaxed/simple;
	bh=z9x6jpbisfkfvEx6j4+11qoxu9bY9+aWBhbwxiBWqJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jh86LPTdmxsY76Z4oW+V3UKZxYgViXXCKvMmekuCe47phHt3YcfmhvEHfNRTTSCO2KutcmhJlvYawldcWJRRZSUi8n0vcQYqPpe/AJEy90VJmW8fw4E7tY/+Zv4GYpNYSwiFzMWoarH30p4+hVnUYFMOo3TkjLJYwJkCpia3fgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKqS1NuP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349155; x=1788885155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z9x6jpbisfkfvEx6j4+11qoxu9bY9+aWBhbwxiBWqJM=;
  b=WKqS1NuPXYGfeumuHbShjZ3a03nvp7YLChG61OeOMgCooAlY6XXr9d5F
   XNpfiBp7RrXTunkGqQ72C0Pr1arLIGTzFH/uq8MjqeJaQfxjvtm340Lll
   yh/R5ZtiJk1CDPVYcni9x3r+kAOvuQNQat4T9+aBAM6GwpbehlDrXSyUw
   jb7puxCUXwcD9ainLc4ZOrOMtjfy+3Jcwvxu8/X9HmGfeIAKjf0osoFYo
   jN7UnQZDuHr8vfrRM/MH3kfF9Rh+uDs5hytrSPwz+MoAkm0yJF5AxmcI4
   UN8CgnN5no9JuKuBolXUnLr9m0WRgWKc8JTJHDUWof+7rFdHp/vjTDNoI
   Q==;
X-CSE-ConnectionGUID: 1nw6th49R3SC77zqvKLZ3A==
X-CSE-MsgGUID: GlNNUWXvQ7yd/fLbbnfLHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443040"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443040"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:33 -0700
X-CSE-ConnectionGUID: za5tVIOYRnOLf5ddcxRQeA==
X-CSE-MsgGUID: 02IN+gzGQzSPGFicLksa3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291146"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:31 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CA65796; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 02/26] thunderbolt: Update cap.c function documentation
Date: Mon,  8 Sep 2025 18:32:06 +0200
Message-ID: <20250908163230.2614397-3-mika.westerberg@linux.intel.com>
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

Make cap.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/cap.c | 49 +++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/thunderbolt/cap.c b/drivers/thunderbolt/cap.c
index 8ecd610c62d5..4ab22d5291ac 100644
--- a/drivers/thunderbolt/cap.c
+++ b/drivers/thunderbolt/cap.c
@@ -64,10 +64,14 @@ static void tb_port_dummy_read(struct tb_port *port)
  * @port: Port to find the capability for
  * @offset: Previous capability offset (%0 for start)
  *
- * Returns dword offset of the next capability in port config space
- * capability list and returns it. Passing %0 returns the first entry in
- * the capability list. If no next capability is found returns %0. In case
- * of failure returns negative errno.
+ * Finds dword offset of the next capability in port config space
+ * capability list. When passed %0 in @offset parameter, first entry
+ * will be returned, if it exists.
+ *
+ * Return:
+ * * Double word offset of the first or next capability - On success.
+ * * %0 - If no next capability is found.
+ * * Negative errno - Another error occurred.
  */
 int tb_port_next_cap(struct tb_port *port, unsigned int offset)
 {
@@ -112,9 +116,10 @@ static int __tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap)
  * @port: Port to find the capability for
  * @cap: Capability to look
  *
- * Returns offset to start of capability or %-ENOENT if no such
- * capability was found. Negative errno is returned if there was an
- * error.
+ * Return:
+ * * Offset to the start of capability - On success.
+ * * %-ENOENT - If no such capability was found.
+ * * Negative errno - Another error occurred.
  */
 int tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap)
 {
@@ -137,10 +142,14 @@ int tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap)
  * @sw: Switch to find the capability for
  * @offset: Previous capability offset (%0 for start)
  *
- * Finds dword offset of the next capability in router config space
- * capability list and returns it. Passing %0 returns the first entry in
- * the capability list. If no next capability is found returns %0. In case
- * of failure returns negative errno.
+ * Finds dword offset of the next capability in port config space
+ * capability list. When passed %0 in @offset parameter, first entry
+ * will be returned, if it exists.
+ *
+ * Return:
+ * * Double word offset of the first or next capability - On success.
+ * * %0 - If no next capability is found.
+ * * Negative errno - Another error occurred.
  */
 int tb_switch_next_cap(struct tb_switch *sw, unsigned int offset)
 {
@@ -181,9 +190,10 @@ int tb_switch_next_cap(struct tb_switch *sw, unsigned int offset)
  * @sw: Switch to find the capability for
  * @cap: Capability to look
  *
- * Returns offset to start of capability or %-ENOENT if no such
- * capability was found. Negative errno is returned if there was an
- * error.
+ * Return:
+ * * Offset to the start of capability - On success.
+ * * %-ENOENT - If no such capability was found.
+ * * Negative errno - Another error occurred.
  */
 int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap)
 {
@@ -213,10 +223,13 @@ int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap)
  * @sw: Switch to find the capability for
  * @vsec: Vendor specific capability to look
  *
- * Functions enumerates vendor specific capabilities (VSEC) of a switch
- * and returns offset when capability matching @vsec is found. If no
- * such capability is found returns %-ENOENT. In case of error returns
- * negative errno.
+ * This function enumerates vendor specific capabilities (VSEC) of a
+ * switch and returns offset when capability matching @vsec is found.
+ *
+ * Return:
+ * * Offset of capability - On success.
+ * * %-ENOENT - If capability was not found.
+ * * Negative errno - Another error occurred.
  */
 int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec)
 {
-- 
2.50.1


