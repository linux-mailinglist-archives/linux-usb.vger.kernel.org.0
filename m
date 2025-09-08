Return-Path: <linux-usb+bounces-27735-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 055C8B4959B
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8C073A8D1D
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5173191C3;
	Mon,  8 Sep 2025 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0RRmITg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC7F317707
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349161; cv=none; b=T2/cdhkrpC0BveC9/qjQjwhiwdmXLuKRQca72OrhjYP6F4uOH0bBMKf6lSogVKAyKZtefO59KCVPwxOPw3PNgc7cOYZQq1k5OWMTXQkzR+MPzYXZvqg+INCgVmKtb2CFQ6Ftb37Cz/1VUTn5j73c7nisOrD+KLjbdOpUe1eLDkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349161; c=relaxed/simple;
	bh=lcAaRkgMX5imH2Q4sdZ17r8/WzGKg6ZO3dvWaAa7tV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9HYopRxDg+ExtEf4Hwz6g2LaC80k1OJAYT122LIDCMx2vJTKxO70dR3nXKLx+sopjgEmZPWghKOkChIf/h5/uz7QBxxRejy0GZItrKg+zsQccleIu5rmLodljNpMch1jK/BwwcLUJx7l7aaPBqYolBXubAw2qV5YDKEj6aG3Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0RRmITg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349160; x=1788885160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lcAaRkgMX5imH2Q4sdZ17r8/WzGKg6ZO3dvWaAa7tV8=;
  b=A0RRmITgZGHZeOav27oOL2wZfGWo2krrz4Lx0hCUtcnPKkgI7oeYC8Kz
   /yGAWW6aJn7j5KXNK/FebEzPTQcsiZXBYY1I22ZlauXzdSBXgiC7aLihM
   8gp560UsCg0iyPGqWGk8xKfdmVlCPyznuX2zH91R4CtJYaONORurMdx7l
   wuZY37r7q1ie2iErI6IDAVM7iVkv1V7oJgp/locsS5mWMovkVK/Xu+cWo
   B0ou3m29t6DOb0vuO1AJX7robPEABXnEiZIiJnbZAuDxml54lUiUrgKrd
   5/coMlmKvhVVRENgcWTa1KqYUCOcs81fsro+SbABIKjCw0MQov4g3qcfl
   Q==;
X-CSE-ConnectionGUID: fNMRXr+jTsaxsrPvQvwqRw==
X-CSE-MsgGUID: weCMyP1LTg6S/IRaUa4ylA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63252118"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="63252118"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:39 -0700
X-CSE-ConnectionGUID: BmcRMriFTmG4eHFVYK9Gfg==
X-CSE-MsgGUID: RFdrLFxkTDCdThsqGruynA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203622651"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 09:32:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1F11BAD; Mon, 08 Sep 2025 18:32:31 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 25/26] thunderbolt: Update xdomain.c function documentation
Date: Mon,  8 Sep 2025 18:32:29 +0200
Message-ID: <20250908163230.2614397-26-mika.westerberg@linux.intel.com>
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

Make xdomain.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 46 +++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index fffa28cc491d..9d220ba544ec 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -160,7 +160,7 @@ static int __tb_xdomain_response(struct tb_ctl *ctl, const void *response,
  * This can be used to send a XDomain response message to the other
  * domain. No response for the message is expected.
  *
- * Return: %0 in case of success and negative errno in case of failure
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_xdomain_response(struct tb_xdomain *xd, const void *response,
 			size_t size, enum tb_cfg_pkg_type type)
@@ -212,7 +212,7 @@ static int __tb_xdomain_request(struct tb_ctl *ctl, const void *request,
  * the other domain. The function waits until the response is received
  * or when timeout triggers. Whichever comes first.
  *
- * Return: %0 in case of success and negative errno in case of failure
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_xdomain_request(struct tb_xdomain *xd, const void *request,
 	size_t request_size, enum tb_cfg_pkg_type request_type,
@@ -613,6 +613,8 @@ static int tb_xdp_link_state_change_response(struct tb_ctl *ctl, u64 route,
  * messages. After this function is called the service driver needs to
  * be able to handle calls to callback whenever a package with the
  * registered protocol is received.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_register_protocol_handler(struct tb_protocol_handler *handler)
 {
@@ -877,6 +879,8 @@ tb_xdp_schedule_request(struct tb *tb, const struct tb_xdp_header *hdr,
  * @drv: Driver to register
  *
  * Registers new service driver from @drv to the bus.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_register_service_driver(struct tb_service_driver *drv)
 {
@@ -1955,6 +1959,8 @@ static void tb_xdomain_link_exit(struct tb_xdomain *xd)
  *
  * Allocates new XDomain structure and returns pointer to that. The
  * object must be released by calling tb_xdomain_put().
+ *
+ * Return: Pointer to &struct tb_xdomain, %NULL in case of failure.
  */
 struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
 				    u64 route, const uuid_t *local_uuid,
@@ -2091,7 +2097,7 @@ void tb_xdomain_remove(struct tb_xdomain *xd)
  * to enable bonding by first enabling the port and waiting for the CL0
  * state.
  *
- * Return: %0 in case of success and negative errno in case of error.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_xdomain_lane_bonding_enable(struct tb_xdomain *xd)
 {
@@ -2171,10 +2177,14 @@ EXPORT_SYMBOL_GPL(tb_xdomain_lane_bonding_disable);
  * @xd: XDomain connection
  * @hopid: Preferred HopID or %-1 for next available
  *
- * Returns allocated HopID or negative errno. Specifically returns
- * %-ENOSPC if there are no more available HopIDs. Returned HopID is
- * guaranteed to be within range supported by the input lane adapter.
+ * Returned HopID is guaranteed to be within range supported by the input
+ * lane adapter.
  * Call tb_xdomain_release_in_hopid() to release the allocated HopID.
+ *
+ * Return:
+ * * Allocated HopID - On success.
+ * * %-ENOSPC - If there are no more available HopIDs.
+ * * Negative errno - Another error occurred.
  */
 int tb_xdomain_alloc_in_hopid(struct tb_xdomain *xd, int hopid)
 {
@@ -2193,10 +2203,14 @@ EXPORT_SYMBOL_GPL(tb_xdomain_alloc_in_hopid);
  * @xd: XDomain connection
  * @hopid: Preferred HopID or %-1 for next available
  *
- * Returns allocated HopID or negative errno. Specifically returns
- * %-ENOSPC if there are no more available HopIDs. Returned HopID is
- * guaranteed to be within range supported by the output lane adapter.
- * Call tb_xdomain_release_in_hopid() to release the allocated HopID.
+ * Returned HopID is guaranteed to be within range supported by the
+ * output lane adapter.
+ * Call tb_xdomain_release_out_hopid() to release the allocated HopID.
+ *
+ * Return:
+ * * Allocated HopID - On success.
+ * * %-ENOSPC - If there are no more available HopIDs.
+ * * Negative errno - Another error occurred.
  */
 int tb_xdomain_alloc_out_hopid(struct tb_xdomain *xd, int hopid)
 {
@@ -2245,7 +2259,7 @@ EXPORT_SYMBOL_GPL(tb_xdomain_release_out_hopid);
  * path. If a transmit or receive path is not needed, pass %-1 for those
  * parameters.
  *
- * Return: %0 in case of success and negative errno in case of error
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_xdomain_enable_paths(struct tb_xdomain *xd, int transmit_path,
 			    int transmit_ring, int receive_path,
@@ -2270,7 +2284,7 @@ EXPORT_SYMBOL_GPL(tb_xdomain_enable_paths);
  * as path/ring parameter means don't care. Normally the callers should
  * pass the same values here as they do when paths are enabled.
  *
- * Return: %0 in case of success and negative errno in case of error
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_xdomain_disable_paths(struct tb_xdomain *xd, int transmit_path,
 			     int transmit_ring, int receive_path,
@@ -2335,6 +2349,8 @@ static struct tb_xdomain *switch_find_xdomain(struct tb_switch *sw,
  * to the bus (handshake is still in progress).
  *
  * The caller needs to hold @tb->lock.
+ *
+ * Return: Pointer to &struct tb_xdomain or %NULL if not found.
  */
 struct tb_xdomain *tb_xdomain_find_by_uuid(struct tb *tb, const uuid_t *uuid)
 {
@@ -2364,6 +2380,8 @@ EXPORT_SYMBOL_GPL(tb_xdomain_find_by_uuid);
  * to the bus (handshake is still in progress).
  *
  * The caller needs to hold @tb->lock.
+ *
+ * Return: Pointer to &struct tb_xdomain or %NULL if not found.
  */
 struct tb_xdomain *tb_xdomain_find_by_link_depth(struct tb *tb, u8 link,
 						 u8 depth)
@@ -2393,6 +2411,8 @@ struct tb_xdomain *tb_xdomain_find_by_link_depth(struct tb *tb, u8 link,
  * to the bus (handshake is still in progress).
  *
  * The caller needs to hold @tb->lock.
+ *
+ * Return: Pointer to &struct tb_xdomain or %NULL if not found.
  */
 struct tb_xdomain *tb_xdomain_find_by_route(struct tb *tb, u64 route)
 {
@@ -2491,7 +2511,7 @@ static bool remove_directory(const char *key, const struct tb_property_dir *dir)
  * notified so they can re-read properties of this host if they are
  * interested.
  *
- * Return: %0 on success and negative errno on failure
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_register_property_dir(const char *key, struct tb_property_dir *dir)
 {
-- 
2.50.1


