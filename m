Return-Path: <linux-usb+bounces-27733-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B75D1B49595
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DB811C208A9
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1851E30FC2F;
	Mon,  8 Sep 2025 16:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KyplIg4r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EC43115B5
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349160; cv=none; b=FOS1ghbOqa6saxrbdGmvGLEJFtNLRJRJqT63zX+cqp16lqE/cFkL/vhtmW92BSjvLQ6OyemgNsoqVaShAOk9Jfmqy6nMhs4JjpCrOmjfm9y3UpY+qABHyLS+1m0ck2FXFUERzzE1yvo3ffokP1IS3DHZD8PsYA+m6TTtXeeEkUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349160; c=relaxed/simple;
	bh=ayhLE47PZTaDIp3ntX6M9zCsn0gZirSonHoOi69fftc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GedtCzDyedgFm0H8N2C2Fx2ofV7oFQ+xIvCnjdIP819zRTQnXeovH1+xwj4yl2aCTxWaHC3RlGSdjusr5tNKiLOIfxaV2gptUd/vq9ws51UF8a93W2FwhZ9j+ccETgo6QhHb0NGdRPZ1iR/Mui1UMsaVkRnS+DvxjmRRFVdLJbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KyplIg4r; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349160; x=1788885160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ayhLE47PZTaDIp3ntX6M9zCsn0gZirSonHoOi69fftc=;
  b=KyplIg4rSXmyE4Fy0o8pL9aWhkVj0AVo5n7wJUx2vnRz7XAVkoFYwiCn
   vW1WO/61TPN6gVRdEiV9YGtpNjbnzR0cz/ZZdmlwqko+2B4M6yFg6I7zr
   YE8dJd5SMudoLfgzNPYMhyqutxncP9H4c1mvg2/XIKS1pVRtRfBXWa0mF
   2ECiq1nrm349Wfugi6nATpCmVMWV2VlJFLgYHdI8biD1lwRw8+gRVvLLt
   yLwDxTj8T+N8RIX2U5P9J1U2ZpnuAzRLGa2eRA3lb5K/BHrVH08f34KoO
   eD0mkRTF0P/Zxz880bql3im9H3ORLo+IUWmliaXBtQcZwl3nZInBcOjmh
   g==;
X-CSE-ConnectionGUID: 8pQ8IBr1Qwee7tYYtH8YFw==
X-CSE-MsgGUID: 5w4QcmBrTtu5hu6Jfhr00Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63252109"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="63252109"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:37 -0700
X-CSE-ConnectionGUID: 2bDCj/2JSOONkHir0mg0cw==
X-CSE-MsgGUID: 8F5efss1Rd+bLQ1zPq34Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203622644"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 09:32:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id ED1CFA1; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 13/26] thunderbolt: Update path.c function documentation
Date: Mon,  8 Sep 2025 18:32:17 +0200
Message-ID: <20250908163230.2614397-14-mika.westerberg@linux.intel.com>
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

Make path.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/path.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index e1a5f6e3d0b6..f9b11dadfbdd 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -96,7 +96,7 @@ static int tb_path_find_src_hopid(struct tb_port *src,
  * that the @dst port is the expected one. If it is not, the path can be
  * cleaned up by calling tb_path_deactivate() before tb_path_free().
  *
- * Return: Discovered path on success, %NULL in case of failure
+ * Return: Pointer to &struct tb_path, %NULL in case of failure.
  */
 struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
 				 struct tb_port *dst, int dst_hopid,
@@ -233,7 +233,7 @@ struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
  * links on the path, prioritizes using @link_nr but takes into account
  * that the lanes may be bonded.
  *
- * Return: Returns a tb_path on success or NULL on failure.
+ * Return: Pointer to &struct tb_path, %NULL in case of failure.
  */
 struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
 			      struct tb_port *dst, int dst_hopid, int link_nr,
@@ -452,7 +452,9 @@ static int __tb_path_deactivate_hop(struct tb_port *port, int hop_index,
  * @hop_index: HopID of the path to be cleared
  *
  * This deactivates or clears a single path config space entry at
- * @hop_index. Returns %0 in success and negative errno otherwise.
+ * @hop_index.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_path_deactivate_hop(struct tb_port *port, int hop_index)
 {
@@ -498,7 +500,7 @@ void tb_path_deactivate(struct tb_path *path)
  * Activate a path starting with the last hop and iterating backwards. The
  * caller must fill path->hops before calling tb_path_activate().
  *
- * Return: Returns 0 on success or an error code on failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_path_activate(struct tb_path *path)
 {
@@ -592,7 +594,7 @@ int tb_path_activate(struct tb_path *path)
  * tb_path_is_invalid() - check whether any ports on the path are invalid
  * @path: Path to check
  *
- * Return: Returns true if the path is invalid, false otherwise.
+ * Return: %true if the path is invalid, %false otherwise.
  */
 bool tb_path_is_invalid(struct tb_path *path)
 {
@@ -613,6 +615,8 @@ bool tb_path_is_invalid(struct tb_path *path)
  *
  * Goes over all hops on path and checks if @port is any of them.
  * Direction does not matter.
+ *
+ * Return: %true if port is on the path, %false otherwise.
  */
 bool tb_path_port_on_path(const struct tb_path *path, const struct tb_port *port)
 {
-- 
2.50.1


