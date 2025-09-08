Return-Path: <linux-usb+bounces-27732-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30947B49593
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 141631C208A9
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910B9318139;
	Mon,  8 Sep 2025 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljzLSi6O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4411130FC3B
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349160; cv=none; b=Q9mbuqTjelhUEfNwUAO3qhYJuK/Hn7gVsCDtP2Ej/WzWPJfum/vpgCjDmWP/ixsVzQwdC8MslTxrDXAQ/j0f2rYORwCSHmQI3Y4Rb2JD1rTNkXeEP3VfWBjK8kDVnGvp3lK4Ru0fgho4tD7kp4HqQYzTT5TwisJVhicol+Gv1hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349160; c=relaxed/simple;
	bh=3UcB6+U2+IYRPRjAovaMuakhmNAEnIHLcUqGZbXEq/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/Uc8K4KkXreQiII7HXG8Hfzgkfrj2c4EekTW/3h/aklcSE7nnb6Sm734nlXoNN7hSodDRg4r2/ddpY4OTE1L6rg1kSnKi724D7/ao5yrqcixDb43q3IKs9T3dft0h1262WgukPlxNx5dKaUPt+qEGFd+Y6Qx8S4TYhi1yc3GkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljzLSi6O; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349157; x=1788885157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3UcB6+U2+IYRPRjAovaMuakhmNAEnIHLcUqGZbXEq/c=;
  b=ljzLSi6OWMflV2XwuClmfAt3M69Yr5aChC8l/oUWwgInKaxr45hHu51b
   WBWhvNM0zD5NXr5LYZGUeipLmQnAXzQw14GZYKS9NdFL+w79+IBTK6qa7
   bqXz3ouyfGoqZdfnFn9//sBYmAx2h0m+gF4SIUk3SDpKcKCqjq3ugt89q
   FYxZIkOM2SGk61elaHx2feo9fY6ROusHANkgKF2zoCvu+19g+CRfq/v7c
   Gc1CKn23PsaWQa9ayFTcrSQjOt1EfRzIXXXfGZnnhNSJqz4Jnw8lfrbPM
   kHQl3OnWwIcYxTIfMII1MGmnY4+TTWHxNSIbZztmhztS/aniuagDufgI2
   w==;
X-CSE-ConnectionGUID: XE6KHIWoQnWuFPZrlzdshA==
X-CSE-MsgGUID: J39XKkmKRYCAAGfAC6gAnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443055"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443055"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:35 -0700
X-CSE-ConnectionGUID: 4u2aO8gYQsKTsZ/S40r7yw==
X-CSE-MsgGUID: t+CUde2tSbWBDSj0+7xGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291150"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E0C029D; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 09/26] thunderbolt: Update lc.c function documentation
Date: Mon,  8 Sep 2025 18:32:13 +0200
Message-ID: <20250908163230.2614397-10-mika.westerberg@linux.intel.com>
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

Make lc.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/lc.c | 58 +++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/drivers/thunderbolt/lc.c b/drivers/thunderbolt/lc.c
index 63cb4b6afb71..0891d51ac2e9 100644
--- a/drivers/thunderbolt/lc.c
+++ b/drivers/thunderbolt/lc.c
@@ -14,6 +14,8 @@
  * tb_lc_read_uuid() - Read switch UUID from link controller common register
  * @sw: Switch whose UUID is read
  * @uuid: UUID is placed here
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_lc_read_uuid(struct tb_switch *sw, u32 *uuid)
 {
@@ -52,9 +54,10 @@ static int find_port_lc_cap(struct tb_port *port)
  * @port: Port that is reset
  *
  * Triggers downstream port reset through link controller registers.
- * Returns %0 in case of success negative errno otherwise. Only supports
- * non-USB4 routers with link controller (that's Thunderbolt 2 and
- * Thunderbolt 3).
+ * Only supports non-USB4 routers with link controller (that's
+ * Thunderbolt 2 and Thunderbolt 3).
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_lc_reset_port(struct tb_port *port)
 {
@@ -132,6 +135,8 @@ static int tb_lc_set_port_configured(struct tb_port *port, bool configured)
  * @port: Port that is set as configured
  *
  * Sets the port configured for power management purposes.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_lc_configure_port(struct tb_port *port)
 {
@@ -143,6 +148,8 @@ int tb_lc_configure_port(struct tb_port *port)
  * @port: Port that is set as configured
  *
  * Sets the port unconfigured for power management purposes.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 void tb_lc_unconfigure_port(struct tb_port *port)
 {
@@ -184,8 +191,10 @@ static int tb_lc_set_xdomain_configured(struct tb_port *port, bool configure)
  * tb_lc_configure_xdomain() - Inform LC that the link is XDomain
  * @port: Switch downstream port connected to another host
  *
- * Sets the lane configured for XDomain accordingly so that the LC knows
- * about this. Returns %0 in success and negative errno in failure.
+ * Sets the lane configured for XDomain accordingly so that LC knows
+ * about this.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_lc_configure_xdomain(struct tb_port *port)
 {
@@ -211,7 +220,7 @@ void tb_lc_unconfigure_xdomain(struct tb_port *port)
  * sleep. Should be called for those downstream lane adapters that were
  * not connected (tb_lc_configure_port() was not called) before sleep.
  *
- * Returns %0 in success and negative errno in case of failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_lc_start_lane_initialization(struct tb_port *port)
 {
@@ -244,6 +253,8 @@ int tb_lc_start_lane_initialization(struct tb_port *port)
  *
  * TB_LC_LINK_ATTR_CPS bit reflects if the link supports CLx including
  * active cables (if connected on the link).
+ *
+ * Return: %true if CLx is supported, %false otherwise.
  */
 bool tb_lc_is_clx_supported(struct tb_port *port)
 {
@@ -266,7 +277,8 @@ bool tb_lc_is_clx_supported(struct tb_port *port)
  * tb_lc_is_usb_plugged() - Is there USB device connected to port
  * @port: Device router lane 0 adapter
  *
- * Returns true if the @port has USB type-C device connected.
+ * Return: %true if the @port has USB Type-C device connected, %false
+ * otherwise.
  */
 bool tb_lc_is_usb_plugged(struct tb_port *port)
 {
@@ -292,7 +304,8 @@ bool tb_lc_is_usb_plugged(struct tb_port *port)
  * tb_lc_is_xhci_connected() - Is the internal xHCI connected
  * @port: Device router lane 0 adapter
  *
- * Returns true if the internal xHCI has been connected to @port.
+ * Return: %true if the internal xHCI has been connected to
+ * @port, %false otherwise.
  */
 bool tb_lc_is_xhci_connected(struct tb_port *port)
 {
@@ -343,9 +356,10 @@ static int __tb_lc_xhci_connect(struct tb_port *port, bool connect)
  * tb_lc_xhci_connect() - Connect internal xHCI
  * @port: Device router lane 0 adapter
  *
- * Tells LC to connect the internal xHCI to @port. Returns %0 on success
- * and negative errno in case of failure. Can be called for Thunderbolt 3
- * routers only.
+ * Tells LC to connect the internal xHCI to @port. Can be called for
+ * Thunderbolt 3 routers only.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_lc_xhci_connect(struct tb_port *port)
 {
@@ -408,6 +422,8 @@ static int tb_lc_set_wake_one(struct tb_switch *sw, unsigned int offset,
  * @flags: Wakeup flags (%0 to disable)
  *
  * For each LC sets wake bits accordingly.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_lc_set_wake(struct tb_switch *sw, unsigned int flags)
 {
@@ -447,6 +463,8 @@ int tb_lc_set_wake(struct tb_switch *sw, unsigned int flags)
  *
  * Let the switch link controllers know that the switch is going to
  * sleep.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_lc_set_sleep(struct tb_switch *sw)
 {
@@ -491,6 +509,8 @@ int tb_lc_set_sleep(struct tb_switch *sw)
  *
  * Checks whether conditions for lane bonding from parent to @sw are
  * possible.
+ *
+ * Return: %true if lane bonding is possible, %false otherwise.
  */
 bool tb_lc_lane_bonding_possible(struct tb_switch *sw)
 {
@@ -562,6 +582,8 @@ static int tb_lc_dp_sink_available(struct tb_switch *sw, int sink)
  *
  * Queries through LC SNK_ALLOCATION registers whether DP sink is available
  * for the given DP IN port or not.
+ *
+ * Return: %true if DP sink is available, %false otherwise.
  */
 bool tb_lc_dp_sink_query(struct tb_switch *sw, struct tb_port *in)
 {
@@ -586,10 +608,12 @@ bool tb_lc_dp_sink_query(struct tb_switch *sw, struct tb_port *in)
  * @sw: Switch whose DP sink is allocated
  * @in: DP IN port the DP sink is allocated for
  *
- * Allocate DP sink for @in via LC SNK_ALLOCATION registers. If the
- * resource is available and allocation is successful returns %0. In all
- * other cases returs negative errno. In particular %-EBUSY is returned if
- * the resource was not available.
+ * Allocate DP sink for @in via LC SNK_ALLOCATION registers.
+ *
+ * Return:
+ * * %0 - If the resource is available and allocation is successful.
+ * * %-EBUSY - If resource is not available.
+ * * Negative errno - Another error occurred.
  */
 int tb_lc_dp_sink_alloc(struct tb_switch *sw, struct tb_port *in)
 {
@@ -637,6 +661,8 @@ int tb_lc_dp_sink_alloc(struct tb_switch *sw, struct tb_port *in)
  * @in: DP IN port whose DP sink is de-allocated
  *
  * De-allocate DP sink from @in using LC SNK_ALLOCATION registers.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_lc_dp_sink_dealloc(struct tb_switch *sw, struct tb_port *in)
 {
@@ -680,6 +706,8 @@ int tb_lc_dp_sink_dealloc(struct tb_switch *sw, struct tb_port *in)
  *
  * This is useful to let authentication cycle pass even without
  * a Thunderbolt link present.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_lc_force_power(struct tb_switch *sw)
 {
-- 
2.50.1


