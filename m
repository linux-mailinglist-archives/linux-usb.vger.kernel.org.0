Return-Path: <linux-usb+bounces-27724-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A939B49594
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C054441295
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6162230FF04;
	Mon,  8 Sep 2025 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kko2jwSj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CFF30F958
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349157; cv=none; b=oI8QjfY0bRC3tgU4N8knLH0Q67wehyHHBK7VBE1q7K63lbiYwOXsLeNfGFMVuP5s/+pgXLr5/h8I3AO7vXpxbwiiSIt1cO7Zk1o5n3u3ASZMex1cI/EAtLnzSVdnmf7z4+wZO8GWOw3pe3BCBoKvUoZ83pYwm4Z1Xip81G11GiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349157; c=relaxed/simple;
	bh=auxsp0ADqi/uk/wMVX70SGz7FrST/Fi7OM4oxJ49ByY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kmavtpek3105O0zbGrWWD5DCFe1c6gRk8v6Y9r+Grufb3Fy+3IDQ1wSLTFgxrx8FItzEJ8oQRcU1DDATHIhZjkbnpBSaKhrZzKVYBYYbFKjPEwFcpMWzeMD/AQbsm4psTxRGZ+4rSoRpmNPF7CMi+hWFHYWkDb8SxA+AuvacMS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kko2jwSj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349157; x=1788885157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=auxsp0ADqi/uk/wMVX70SGz7FrST/Fi7OM4oxJ49ByY=;
  b=kko2jwSjZwQRjKJSHzLqDm/HNJYYzPCJBuANklkSKjSvGOcha5wZH8O6
   s3jEpxgwd/Jvun+BgfP9O078o9eIJr3i19qs6V1i+GL0kNqq7INfGResV
   HFHb0GpYekv46/xFIMyH4KIJ0Knvj3/Z7fJNPG9yjZx2v+MOJumycezEk
   JKW+94Rqq59og4R5ALFdBBjstBkDqmxZRGxQWdrG+Yp30rsfsI6iaHu4h
   AkrZyqGr/fF+gb+pzEpHYa0UBHqTYHMiQiqroQZtboq8R+ATeQa1I+aFw
   T153Ev6h7QL8KdJHAdss6PUVtdDMz8bJI+1p9g0QbjSnA74fYTDCwOD8I
   g==;
X-CSE-ConnectionGUID: r68vf2QPRKyjm9fL6WatdQ==
X-CSE-MsgGUID: LN0mV0ZAQQy09jLeNqcaEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63252092"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="63252092"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:34 -0700
X-CSE-ConnectionGUID: ZwKaHflyTnKOVwk18D/z8A==
X-CSE-MsgGUID: WSzewAOhStCtV4QhSnkSOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203622634"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 09:32:31 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D0A0098; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 04/26] thunderbolt: Update ctl.c function documentation
Date: Mon,  8 Sep 2025 18:32:08 +0200
Message-ID: <20250908163230.2614397-5-mika.westerberg@linux.intel.com>
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

Make ctl.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 1db2e951b53f..f92175ee3841 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -82,6 +82,8 @@ static DEFINE_MUTEX(tb_cfg_request_lock);
  *
  * This is refcounted object so when you are done with this, call
  * tb_cfg_request_put() to it.
+ *
+ * Return: &struct tb_cfg_request on success, %NULL otherwise.
  */
 struct tb_cfg_request *tb_cfg_request_alloc(void)
 {
@@ -359,7 +361,7 @@ static void tb_ctl_tx_callback(struct tb_ring *ring, struct ring_frame *frame,
  *
  * len must be a multiple of four.
  *
- * Return: Returns 0 on success or an error code on failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 static int tb_ctl_tx(struct tb_ctl *ctl, const void *data, size_t len,
 		     enum tb_cfg_pkg_type type)
@@ -539,6 +541,8 @@ static void tb_cfg_request_work(struct work_struct *work)
  *
  * This queues @req on the given control channel without waiting for it
  * to complete. When the request completes @callback is called.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
 		   void (*callback)(void *), void *callback_data)
@@ -605,6 +609,9 @@ static void tb_cfg_request_complete(void *data)
  * triggers the request is canceled before function returns. Note the
  * caller needs to make sure only one message for given switch is active
  * at a time.
+ *
+ * Return: &struct tb_cfg_result with non-zero @err field if error
+ * has occurred.
  */
 struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
 					 struct tb_cfg_request *req,
@@ -641,7 +648,7 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
  *
  * cb will be invoked once for every hot plug event.
  *
- * Return: Returns a pointer on success or NULL on failure.
+ * Return: Pointer to &struct tb_ctl, %NULL on failure.
  */
 struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int index, int timeout_msec,
 			    event_cb cb, void *cb_data)
@@ -764,8 +771,9 @@ void tb_ctl_stop(struct tb_ctl *ctl)
  * @route: Router that originated the event
  * @error: Pointer to the notification package
  *
- * Call this as response for non-plug notification to ack it. Returns
- * %0 on success or an error code on failure.
+ * Call this as a response for non-plug notification to ack it.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_cfg_ack_notification(struct tb_ctl *ctl, u64 route,
 			    const struct cfg_error_pkg *error)
@@ -827,8 +835,9 @@ int tb_cfg_ack_notification(struct tb_ctl *ctl, u64 route,
  * @port: Port where the hot plug/unplug happened
  * @unplug: Ack hot plug or unplug
  *
- * Call this as response for hot plug/unplug event to ack it.
- * Returns %0 on success or an error code on failure.
+ * Call this as a response for hot plug/unplug event to ack it.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_cfg_ack_plug(struct tb_ctl *ctl, u64 route, u32 port, bool unplug)
 {
@@ -895,6 +904,9 @@ static bool tb_cfg_copy(struct tb_cfg_request *req, const struct ctl_pkg *pkg)
  * If the switch at route is incorrectly configured then we will not receive a
  * reply (even though the switch will reset). The caller should check for
  * -ETIMEDOUT and attempt to reconfigure the switch.
+ *
+ * Return: &struct tb_cfg_result with non-zero @err field if error
+ * has occurred.
  */
 struct tb_cfg_result tb_cfg_reset(struct tb_ctl *ctl, u64 route)
 {
@@ -937,6 +949,9 @@ struct tb_cfg_result tb_cfg_reset(struct tb_ctl *ctl, u64 route)
  * @timeout_msec: Timeout in ms how long to wait for the response
  *
  * Reads from router config space without translating the possible error.
+ *
+ * Return: &struct tb_cfg_result with non-zero @err field if error
+ * has occurred.
  */
 struct tb_cfg_result tb_cfg_read_raw(struct tb_ctl *ctl, void *buffer,
 		u64 route, u32 port, enum tb_cfg_space space,
@@ -1008,6 +1023,9 @@ struct tb_cfg_result tb_cfg_read_raw(struct tb_ctl *ctl, void *buffer,
  * @timeout_msec: Timeout in ms how long to wait for the response
  *
  * Writes to router config space without translating the possible error.
+ *
+ * Return: &struct tb_cfg_result with non-zero @err field if error
+ * has occurred.
  */
 struct tb_cfg_result tb_cfg_write_raw(struct tb_ctl *ctl, const void *buffer,
 		u64 route, u32 port, enum tb_cfg_space space,
@@ -1150,8 +1168,7 @@ int tb_cfg_write(struct tb_ctl *ctl, const void *buffer, u64 route, u32 port,
  * Reads the first dword from the switches TB_CFG_SWITCH config area and
  * returns the port number from which the reply originated.
  *
- * Return: Returns the upstream port number on success or an error code on
- * failure.
+ * Return: Upstream port number on success or negative error code on failure.
  */
 int tb_cfg_get_upstream_port(struct tb_ctl *ctl, u64 route)
 {
-- 
2.50.1


