Return-Path: <linux-usb+bounces-27743-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCB0B495A2
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06D3A448233
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1208731A05B;
	Mon,  8 Sep 2025 16:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+94jtZE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9391331815E
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349164; cv=none; b=a3ryUizznmGGYruwOTkgIkMczuDktNz4FZGNZgrhRSHevMiXUwfsCLUq/GTQRTLAsopDz2BieShV9bPJjtusRy270NF5kHFdI5fiEmuAyEDm6nqxuhYE8zY6unpq/h6I7oG1FENUC1jbwc63uIc7u+QFjM+FP0J2ZbsOUGwJx6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349164; c=relaxed/simple;
	bh=TCUN2w4wCGWWDqqBXMKHW2XkvNtz4r7zKx/AQtkv0ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FugmQQ5CbJNMUuOar+JEl9/EFicNPaAM4WV0FTngd/CEwUk7RGeAgNXylm9heToIADenoQn6Q6A6oFmZ9VtoCRS2fna/kUcpw7oZ2J2GToh8lncSnghxmt4NI4PIeBlNnCT3p8FI2RSwIkP0zCr9RAkWZ0C4IBmzcL3dQzMZDQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+94jtZE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349162; x=1788885162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TCUN2w4wCGWWDqqBXMKHW2XkvNtz4r7zKx/AQtkv0ak=;
  b=X+94jtZEasjTdauuMbAjzsZ08vidAyfaoBIPBrbUt00TyTwWZJFRdfyU
   go2iuLpPRcAGwqD5QY9hIMVtu46cxmVGS9EuhqExJOHpsD9C8M9Jc2RXN
   jsXhsQvNEifW0NyknXximJZwZTYPCvKl41LLjRQLyXgAf+ZrjkqQ23iEE
   IcoSKEf0UK7p/Z5DHZqrtQM+Y4BKKkhwzXUAmK7Wdwa5XYINOpZwd3YGz
   Vcyqqg1eljjY6eracxrXWySw01cx5qfBkMO5vqF7Eb581nnSpyIozfRKZ
   ray9xDiJ+4D5nEX/5snP2zM/vT9tp9+9AFHpr0ugD41wws65MKnuQHsjb
   Q==;
X-CSE-ConnectionGUID: V6KUp3bLQuG/ygAJCybsRw==
X-CSE-MsgGUID: hXtqDuePRqaZkwNr0VLQkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63252127"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="63252127"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:39 -0700
X-CSE-ConnectionGUID: kQ/V2mK1Qqy6m2kJ6qDINw==
X-CSE-MsgGUID: tVOCmuC1SDeUbUMjwEZ5PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203622650"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 09:32:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 192ACAB; Mon, 08 Sep 2025 18:32:31 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 23/26] thunderbolt: Update usb4.c function documentation
Date: Mon,  8 Sep 2025 18:32:27 +0200
Message-ID: <20250908163230.2614397-24-mika.westerberg@linux.intel.com>
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

Make usb4.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 333 +++++++++++++++++++++++++------------
 1 file changed, 229 insertions(+), 104 deletions(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index fdae76c8f728..c6008e350ec3 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -236,6 +236,8 @@ static bool link_is_usb4(struct tb_port *port)
  *
  * This does not set the configuration valid bit of the router. To do
  * that call usb4_switch_configuration_valid().
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_switch_setup(struct tb_switch *sw)
 {
@@ -303,7 +305,7 @@ int usb4_switch_setup(struct tb_switch *sw)
  * usb4_switch_setup() has been called. Can be called to host and device
  * routers (does nothing for the latter).
  *
- * Returns %0 in success and negative errno otherwise.
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_switch_configuration_valid(struct tb_switch *sw)
 {
@@ -333,6 +335,8 @@ int usb4_switch_configuration_valid(struct tb_switch *sw)
  * @uid: UID is stored here
  *
  * Reads 64-bit UID from USB4 router config space.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_switch_read_uid(struct tb_switch *sw, u64 *uid)
 {
@@ -370,6 +374,8 @@ static int usb4_switch_drom_read_block(void *data,
  * Uses USB4 router operations to read router DROM. For devices this
  * should always work but for hosts it may return %-EOPNOTSUPP in which
  * case the host router does not have DROM.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_switch_drom_read(struct tb_switch *sw, unsigned int address, void *buf,
 			  size_t size)
@@ -384,6 +390,8 @@ int usb4_switch_drom_read(struct tb_switch *sw, unsigned int address, void *buf,
  *
  * Checks whether conditions are met so that lane bonding can be
  * established with the upstream router. Call only for device routers.
+ *
+ * Return: %true if lane bonding is possible, %false otherwise.
  */
 bool usb4_switch_lane_bonding_possible(struct tb_switch *sw)
 {
@@ -406,6 +414,8 @@ bool usb4_switch_lane_bonding_possible(struct tb_switch *sw)
  * @runtime: Wake is being programmed during system runtime
  *
  * Enables/disables router to wake up from sleep.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_switch_set_wake(struct tb_switch *sw, unsigned int flags, bool runtime)
 {
@@ -483,8 +493,10 @@ int usb4_switch_set_wake(struct tb_switch *sw, unsigned int flags, bool runtime)
  * usb4_switch_set_sleep() - Prepare the router to enter sleep
  * @sw: USB4 router
  *
- * Sets sleep bit for the router. Returns when the router sleep ready
+ * Sets sleep bit for the router and waits until router sleep ready
  * bit has been asserted.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_switch_set_sleep(struct tb_switch *sw)
 {
@@ -510,9 +522,10 @@ int usb4_switch_set_sleep(struct tb_switch *sw)
  * usb4_switch_nvm_sector_size() - Return router NVM sector size
  * @sw: USB4 router
  *
- * If the router supports NVM operations this function returns the NVM
- * sector size in bytes. If NVM operations are not supported returns
- * %-EOPNOTSUPP.
+ * Return:
+ * * NVM sector size in bytes if router supports NVM operations.
+ * * %-EOPNOTSUPP - If router does not support NVM operations.
+ * * Negative errno - Another error occurred.
  */
 int usb4_switch_nvm_sector_size(struct tb_switch *sw)
 {
@@ -559,8 +572,12 @@ static int usb4_switch_nvm_read_block(void *data,
  * @buf: Read data is placed here
  * @size: How many bytes to read
  *
- * Reads NVM contents of the router. If NVM is not supported returns
- * %-EOPNOTSUPP.
+ * Reads NVM contents of the router.
+ *
+ * Return:
+ * * %0 - Read completed successfully.
+ * * %-EOPNOTSUPP - NVM not supported.
+ * * Negative errno - Another error occurred.
  */
 int usb4_switch_nvm_read(struct tb_switch *sw, unsigned int address, void *buf,
 			 size_t size)
@@ -577,7 +594,7 @@ int usb4_switch_nvm_read(struct tb_switch *sw, unsigned int address, void *buf,
  * Explicitly sets NVM write offset. Normally when writing to NVM this
  * is done automatically by usb4_switch_nvm_write().
  *
- * Returns %0 in success and negative errno if there was a failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_switch_nvm_set_offset(struct tb_switch *sw, unsigned int address)
 {
@@ -619,8 +636,12 @@ static int usb4_switch_nvm_write_next_block(void *data, unsigned int dwaddress,
  * @buf: Pointer to the data to write
  * @size: Size of @buf in bytes
  *
- * Writes @buf to the router NVM using USB4 router operations. If NVM
- * write is not supported returns %-EOPNOTSUPP.
+ * Writes @buf to the router NVM using USB4 router operations.
+ *
+ * Return:
+ * * %0 - Write completed successfully.
+ * * %-EOPNOTSUPP - NVM write not supported.
+ * * Negative errno - Another error occurred.
  */
 int usb4_switch_nvm_write(struct tb_switch *sw, unsigned int address,
 			  const void *buf, size_t size)
@@ -642,11 +663,13 @@ int usb4_switch_nvm_write(struct tb_switch *sw, unsigned int address,
  * After the new NVM has been written via usb4_switch_nvm_write(), this
  * function triggers NVM authentication process. The router gets power
  * cycled and if the authentication is successful the new NVM starts
- * running. In case of failure returns negative errno.
+ * running.
  *
  * The caller should call usb4_switch_nvm_authenticate_status() to read
  * the status of the authentication after power cycle. It should be the
  * first router operation to avoid the status being lost.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_switch_nvm_authenticate(struct tb_switch *sw)
 {
@@ -674,11 +697,13 @@ int usb4_switch_nvm_authenticate(struct tb_switch *sw)
  * @status: Status code of the operation
  *
  * The function checks if there is status available from the last NVM
- * authenticate router operation. If there is status then %0 is returned
- * and the status code is placed in @status. Returns negative errno in case
- * of failure.
+ * authenticate router operation.
  *
  * Must be called before any other router operation.
+ *
+ * Return:
+ * * %0 - If there is status. Status code is placed in @status.
+ * * Negative errno - Failure occurred.
  */
 int usb4_switch_nvm_authenticate_status(struct tb_switch *sw, u32 *status)
 {
@@ -722,7 +747,7 @@ int usb4_switch_nvm_authenticate_status(struct tb_switch *sw, u32 *status)
  * allocation fields accordingly. Specifically @sw->credits_allocation
  * is set to %true if these parameters can be used in tunneling.
  *
- * Returns %0 on success and negative errno otherwise.
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_switch_credits_init(struct tb_switch *sw)
 {
@@ -861,8 +886,10 @@ int usb4_switch_credits_init(struct tb_switch *sw)
  * @in: DP IN adapter
  *
  * For DP tunneling this function can be used to query availability of
- * DP IN resource. Returns true if the resource is available for DP
- * tunneling, false otherwise.
+ * DP IN resource.
+ *
+ * Return: %true if the resource is available for DP tunneling, %false
+ * otherwise.
  */
 bool usb4_switch_query_dp_resource(struct tb_switch *sw, struct tb_port *in)
 {
@@ -890,9 +917,12 @@ bool usb4_switch_query_dp_resource(struct tb_switch *sw, struct tb_port *in)
  * @in: DP IN adapter
  *
  * Allocates DP IN resource for DP tunneling using USB4 router
- * operations. If the resource was allocated returns %0. Otherwise
- * returns negative errno, in particular %-EBUSY if the resource is
- * already allocated.
+ * operations.
+ *
+ * Return:
+ * * %0 - Resource allocated successfully.
+ * * %-EBUSY - Resource is already allocated.
+ * * Negative errno - Other failure occurred.
  */
 int usb4_switch_alloc_dp_resource(struct tb_switch *sw, struct tb_port *in)
 {
@@ -916,6 +946,8 @@ int usb4_switch_alloc_dp_resource(struct tb_switch *sw, struct tb_port *in)
  * @in: DP IN adapter
  *
  * Releases the previously allocated DP IN resource.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_switch_dealloc_dp_resource(struct tb_switch *sw, struct tb_port *in)
 {
@@ -971,6 +1003,8 @@ int usb4_port_index(const struct tb_switch *sw, const struct tb_port *port)
  * downstream adapters where the PCIe topology is extended. This
  * function returns the corresponding downstream PCIe adapter or %NULL
  * if no such mapping was possible.
+ *
+ * Return: Pointer to &struct tb_port or %NULL if not found.
  */
 struct tb_port *usb4_switch_map_pcie_down(struct tb_switch *sw,
 					  const struct tb_port *port)
@@ -1002,6 +1036,8 @@ struct tb_port *usb4_switch_map_pcie_down(struct tb_switch *sw,
  * downstream adapters where the USB 3.x topology is extended. This
  * function returns the corresponding downstream USB 3.x adapter or
  * %NULL if no such mapping was possible.
+ *
+ * Return: Pointer to &struct tb_port or %NULL if not found.
  */
 struct tb_port *usb4_switch_map_usb3_down(struct tb_switch *sw,
 					  const struct tb_port *port)
@@ -1031,7 +1067,7 @@ struct tb_port *usb4_switch_map_usb3_down(struct tb_switch *sw,
  * For USB4 router finds all USB4 ports and registers devices for each.
  * Can be called to any router.
  *
- * Return %0 in case of success and negative errno in case of failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_switch_add_ports(struct tb_switch *sw)
 {
@@ -1084,6 +1120,8 @@ void usb4_switch_remove_ports(struct tb_switch *sw)
  *
  * Unlocks USB4 downstream port so that the connection manager can
  * access the router below this port.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_unlock(struct tb_port *port)
 {
@@ -1104,6 +1142,8 @@ int usb4_port_unlock(struct tb_port *port)
  *
  * Enables hot plug events on a given port. This is only intended
  * to be used on lane, DP-IN, and DP-OUT adapters.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_hotplug_enable(struct tb_port *port)
 {
@@ -1123,6 +1163,8 @@ int usb4_port_hotplug_enable(struct tb_port *port)
  * @port: USB4 port to reset
  *
  * Issues downstream port reset to @port.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_reset(struct tb_port *port)
 {
@@ -1184,6 +1226,8 @@ static int usb4_port_set_configured(struct tb_port *port, bool configured)
  * @port: USB4 router
  *
  * Sets the USB4 link to be configured for power management purposes.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_configure(struct tb_port *port)
 {
@@ -1195,6 +1239,8 @@ int usb4_port_configure(struct tb_port *port)
  * @port: USB4 router
  *
  * Sets the USB4 link to be unconfigured for power management purposes.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 void usb4_port_unconfigure(struct tb_port *port)
 {
@@ -1229,7 +1275,9 @@ static int usb4_set_xdomain_configured(struct tb_port *port, bool configured)
  * @xd: XDomain that is connected to the port
  *
  * Marks the USB4 port as being connected to another host and updates
- * the link type. Returns %0 in success and negative errno in failure.
+ * the link type.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_configure_xdomain(struct tb_port *port, struct tb_xdomain *xd)
 {
@@ -1299,7 +1347,8 @@ static int usb4_port_write_data(struct tb_port *port, const void *data,
  * @size: Size of @buf
  *
  * Reads data from sideband register @reg and copies it into @buf.
- * Returns %0 in case of success and negative errno in case of failure.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_sb_read(struct tb_port *port, enum usb4_sb_target target, u8 index,
 		      u8 reg, void *buf, u8 size)
@@ -1350,8 +1399,9 @@ int usb4_port_sb_read(struct tb_port *port, enum usb4_sb_target target, u8 index
  * @buf: Data to write
  * @size: Size of @buf
  *
- * Writes @buf to sideband register @reg. Returns %0 in case of success
- * and negative errno in case of failure.
+ * Writes @buf to sideband register @reg.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_sb_write(struct tb_port *port, enum usb4_sb_target target,
 		       u8 index, u8 reg, const void *buf, u8 size)
@@ -1468,8 +1518,7 @@ static int usb4_port_set_router_offline(struct tb_port *port, bool offline)
  * port does not react on hotplug events anymore. This needs to be
  * called before retimer access is done when the USB4 links is not up.
  *
- * Returns %0 in case of success and negative errno if there was an
- * error.
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_router_offline(struct tb_port *port)
 {
@@ -1481,6 +1530,8 @@ int usb4_port_router_offline(struct tb_port *port)
  * @port: USB4 port
  *
  * Makes the USB4 port functional again.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_router_online(struct tb_port *port)
 {
@@ -1492,8 +1543,9 @@ int usb4_port_router_online(struct tb_port *port)
  * @port: USB4 port
  *
  * This forces the USB4 port to send broadcast RT transaction which
- * makes the retimers on the link to assign index to themselves. Returns
- * %0 in case of success and negative errno if there was an error.
+ * makes the retimers on the link assign index to themselves.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_enumerate_retimers(struct tb_port *port)
 {
@@ -1510,6 +1562,8 @@ int usb4_port_enumerate_retimers(struct tb_port *port)
  *
  * PORT_CS_18_CPS bit reflects if the link supports CLx including
  * active cables (if connected on the link).
+ *
+ * Return: %true if Clx is supported, %false otherwise.
  */
 bool usb4_port_clx_supported(struct tb_port *port)
 {
@@ -1528,8 +1582,9 @@ bool usb4_port_clx_supported(struct tb_port *port)
  * usb4_port_asym_supported() - If the port supports asymmetric link
  * @port: USB4 port
  *
- * Checks if the port and the cable supports asymmetric link and returns
- * %true in that case.
+ * Checks if the port and the cable support asymmetric link.
+ *
+ * Return: %true if asymmetric link is supported, %false otherwise.
  */
 bool usb4_port_asym_supported(struct tb_port *port)
 {
@@ -1551,6 +1606,8 @@ bool usb4_port_asym_supported(struct tb_port *port)
  *
  * Sets USB4 port link width to @width. Can be called for widths where
  * usb4_port_asym_width_supported() returned @true.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width)
 {
@@ -1595,8 +1652,10 @@ int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width
  * (according to what was previously set in tb_port_set_link_width().
  * Wait for completion of the change.
  *
- * Returns %0 in case of success, %-ETIMEDOUT if case of timeout or
- * a negative errno in case of a failure.
+ * Return:
+ * * %0 - Symmetry change was successful.
+ * * %-ETIMEDOUT - Timeout occurred.
+ * * Negative errno - Other failure occurred.
  */
 int usb4_port_asym_start(struct tb_port *port)
 {
@@ -1640,6 +1699,8 @@ int usb4_port_asym_start(struct tb_port *port)
  * @ncaps: Number of elements in the caps array
  *
  * Reads the USB4 port lane margining capabilities into @caps.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_margining_caps(struct tb_port *port, enum usb4_sb_target target,
 			     u8 index, u32 *caps, size_t ncaps)
@@ -1666,6 +1727,8 @@ int usb4_port_margining_caps(struct tb_port *port, enum usb4_sb_target target,
  *
  * Runs hardware lane margining on USB4 port and returns the result in
  * @results.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
 			u8 index, const struct usb4_port_margining_params *params,
@@ -1710,8 +1773,9 @@ int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
  * @results: Data word for the operation completion data
  *
  * Runs software lane margining on USB4 port. Read back the error
- * counters by calling usb4_port_sw_margin_errors(). Returns %0 in
- * success and negative errno otherwise.
+ * counters by calling usb4_port_sw_margin_errors().
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
 			u8 index, const struct usb4_port_margining_params *params,
@@ -1758,7 +1822,8 @@ int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
  * @errors: Error metadata is copied here.
  *
  * This reads back the software margining error counters from the port.
- * Returns %0 in success and negative errno otherwise.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_sw_margin_errors(struct tb_port *port, enum usb4_sb_target target,
 			       u8 index, u32 *errors)
@@ -1789,6 +1854,8 @@ static inline int usb4_port_retimer_op(struct tb_port *port, u8 index,
  *
  * Enables sideband channel transations on SBTX. Can be used when USB4
  * link does not go up, for example if there is no device connected.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_retimer_set_inbound_sbtx(struct tb_port *port, u8 index)
 {
@@ -1816,6 +1883,8 @@ int usb4_port_retimer_set_inbound_sbtx(struct tb_port *port, u8 index)
  *
  * Disables sideband channel transations on SBTX. The reverse of
  * usb4_port_retimer_set_inbound_sbtx().
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_retimer_unset_inbound_sbtx(struct tb_port *port, u8 index)
 {
@@ -1828,10 +1897,12 @@ int usb4_port_retimer_unset_inbound_sbtx(struct tb_port *port, u8 index)
  * @port: USB4 port
  * @index: Retimer index
  *
- * If the retimer at @index is last one (connected directly to the
- * Type-C port) this function returns %1. If it is not returns %0. If
- * the retimer is not present returns %-ENODEV. Otherwise returns
- * negative errno.
+ * Return:
+ * * %1 - Retimer at @index is the last one (connected directly to the
+ *   Type-C port).
+ * * %0 - Retimer at @index is not the last one.
+ * * %-ENODEV - Retimer is not present.
+ * * Negative errno - Other failure occurred.
  */
 int usb4_port_retimer_is_last(struct tb_port *port, u8 index)
 {
@@ -1853,9 +1924,11 @@ int usb4_port_retimer_is_last(struct tb_port *port, u8 index)
  * @port: USB4 port
  * @index: Retimer index
  *
- * If the retimer at @index is last cable retimer this function returns
- * %1 and %0 if it is on-board retimer. In case a retimer is not present
- * at @index returns %-ENODEV. Otherwise returns negative errno.
+ * Return:
+ * * %1 - Retimer at @index is the last cable retimer.
+ * * %0 - Retimer at @index is on-board retimer.
+ * * %-ENODEV - Retimer is not present.
+ * * Negative errno - Other failure occurred.
  */
 int usb4_port_retimer_is_cable(struct tb_port *port, u8 index)
 {
@@ -1879,9 +1952,12 @@ int usb4_port_retimer_is_cable(struct tb_port *port, u8 index)
  *
  * Reads NVM sector size (in bytes) of a retimer at @index. This
  * operation can be used to determine whether the retimer supports NVM
- * upgrade for example. Returns sector size in bytes or negative errno
- * in case of error. Specifically returns %-ENODEV if there is no
- * retimer at @index.
+ * upgrade for example.
+ *
+ * Return:
+ * * Sector size in bytes.
+ * * %-ENODEV - If there is no retimer at @index.
+ * * Negative errno - In case of an error.
  */
 int usb4_port_retimer_nvm_sector_size(struct tb_port *port, u8 index)
 {
@@ -1907,7 +1983,7 @@ int usb4_port_retimer_nvm_sector_size(struct tb_port *port, u8 index)
  * Exlicitly sets NVM write offset. Normally when writing to NVM this is
  * done automatically by usb4_port_retimer_nvm_write().
  *
- * Returns %0 in success and negative errno if there was a failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_retimer_nvm_set_offset(struct tb_port *port, u8 index,
 				     unsigned int address)
@@ -1960,9 +2036,12 @@ static int usb4_port_retimer_nvm_write_next_block(void *data,
  * @size: Size in bytes how much to write
  *
  * Writes @size bytes from @buf to the retimer NVM. Used for NVM
- * upgrade. Returns %0 if the data was written successfully and negative
- * errno in case of failure. Specifically returns %-ENODEV if there is
- * no retimer at @index.
+ * upgrade.
+ *
+ * Return:
+ * * %0 - If the data was written successfully.
+ * * %-ENODEV - If there is no retimer at @index.
+ * * Negative errno - In case of an error.
  */
 int usb4_port_retimer_nvm_write(struct tb_port *port, u8 index, unsigned int address,
 				const void *buf, size_t size)
@@ -1988,6 +2067,8 @@ int usb4_port_retimer_nvm_write(struct tb_port *port, u8 index, unsigned int add
  * successful the retimer restarts with the new NVM and may not have the
  * index set so one needs to call usb4_port_enumerate_retimers() to
  * force index to be assigned.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_retimer_nvm_authenticate(struct tb_port *port, u8 index)
 {
@@ -2012,9 +2093,9 @@ int usb4_port_retimer_nvm_authenticate(struct tb_port *port, u8 index)
  * This can be called after usb4_port_retimer_nvm_authenticate() and
  * usb4_port_enumerate_retimers() to fetch status of the NVM upgrade.
  *
- * Returns %0 if the authentication status was successfully read. The
+ * Return: %0 if the authentication status was successfully read. The
  * completion metadata (the result) is then stored into @status. If
- * reading the status fails, returns negative errno.
+ * status read fails, returns negative errno.
  */
 int usb4_port_retimer_nvm_authenticate_status(struct tb_port *port, u8 index,
 					      u32 *status)
@@ -2082,9 +2163,12 @@ static int usb4_port_retimer_nvm_read_block(void *data, unsigned int dwaddress,
  * @buf: Data read from NVM is stored here
  * @size: Number of bytes to read
  *
- * Reads retimer NVM and copies the contents to @buf. Returns %0 if the
- * read was successful and negative errno in case of failure.
- * Specifically returns %-ENODEV if there is no retimer at @index.
+ * Reads retimer NVM and copies the contents to @buf.
+ *
+ * Return:
+ * * %0 - If the read was successful.
+ * * %-ENODEV - If there is no retimer at @index.
+ * * Negative errno - In case of an error.
  */
 int usb4_port_retimer_nvm_read(struct tb_port *port, u8 index,
 			       unsigned int address, void *buf, size_t size)
@@ -2108,8 +2192,8 @@ usb4_usb3_port_max_bandwidth(const struct tb_port *port, unsigned int bw)
  * usb4_usb3_port_max_link_rate() - Maximum support USB3 link rate
  * @port: USB3 adapter port
  *
- * Return maximum supported link rate of a USB3 adapter in Mb/s.
- * Negative errno in case of error.
+ * Return: Maximum supported link rate of a USB3 adapter in Mb/s.
+ * Negative errno in case of an error.
  */
 int usb4_usb3_port_max_link_rate(struct tb_port *port)
 {
@@ -2227,8 +2311,9 @@ static int usb4_usb3_port_read_allocated_bandwidth(struct tb_port *port,
  * @downstream_bw: Allocated downstream bandwidth is stored here
  *
  * Stores currently allocated USB3 bandwidth into @upstream_bw and
- * @downstream_bw in Mb/s. Returns %0 in case of success and negative
- * errno in failure.
+ * @downstream_bw in Mb/s.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_usb3_port_allocated_bandwidth(struct tb_port *port, int *upstream_bw,
 				       int *downstream_bw)
@@ -2330,8 +2415,7 @@ static int usb4_usb3_port_write_allocated_bandwidth(struct tb_port *port,
  * cannot be taken away by CM). The actual new values are returned in
  * @upstream_bw and @downstream_bw.
  *
- * Returns %0 in case of success and negative errno if there was a
- * failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_usb3_port_allocate_bandwidth(struct tb_port *port, int *upstream_bw,
 				      int *downstream_bw)
@@ -2373,7 +2457,7 @@ int usb4_usb3_port_allocate_bandwidth(struct tb_port *port, int *upstream_bw,
  * Releases USB3 allocated bandwidth down to what is actually consumed.
  * The new bandwidth is returned in @upstream_bw and @downstream_bw.
  *
- * Returns 0% in success and negative errno in case of failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_usb3_port_release_bandwidth(struct tb_port *port, int *upstream_bw,
 				     int *downstream_bw)
@@ -2425,9 +2509,12 @@ static bool is_usb4_dpin(const struct tb_port *port)
  * @port: DP IN adapter
  * @cm_id: CM ID to assign
  *
- * Sets CM ID for the @port. Returns %0 on success and negative errno
- * otherwise. Speficially returns %-EOPNOTSUPP if the @port does not
- * support this.
+ * Sets CM ID for the @port.
+ *
+ * Return:
+ * * %0 - On success.
+ * * %-EOPNOTSUPP - If the @port does not support this.
+ * * Negative errno - Another error occurred.
  */
 int usb4_dp_port_set_cm_id(struct tb_port *port, int cm_id)
 {
@@ -2454,8 +2541,10 @@ int usb4_dp_port_set_cm_id(struct tb_port *port, int cm_id)
  *					     supported
  * @port: DP IN adapter to check
  *
- * Can be called to any DP IN adapter. Returns true if the adapter
- * supports USB4 bandwidth allocation mode, false otherwise.
+ * Can be called to any DP IN adapter.
+ *
+ * Return: %true if the adapter supports USB4 bandwidth allocation mode,
+ * %false otherwise.
  */
 bool usb4_dp_port_bandwidth_mode_supported(struct tb_port *port)
 {
@@ -2478,8 +2567,10 @@ bool usb4_dp_port_bandwidth_mode_supported(struct tb_port *port)
  *					   enabled
  * @port: DP IN adapter to check
  *
- * Can be called to any DP IN adapter. Returns true if the bandwidth
- * allocation mode has been enabled, false otherwise.
+ * Can be called to any DP IN adapter.
+ *
+ * Return: %true if the bandwidth allocation mode has been enabled,
+ * %false otherwise.
  */
 bool usb4_dp_port_bandwidth_mode_enabled(struct tb_port *port)
 {
@@ -2504,9 +2595,12 @@ bool usb4_dp_port_bandwidth_mode_enabled(struct tb_port *port)
  * @supported: Does the CM support bandwidth allocation mode
  *
  * Can be called to any DP IN adapter. Sets or clears the CM support bit
- * of the DP IN adapter. Returns %0 in success and negative errno
- * otherwise. Specifically returns %-OPNOTSUPP if the passed in adapter
- * does not support this.
+ * of the DP IN adapter.
+ *
+ * * Return:
+ * * %0 - On success.
+ * * %-EOPNOTSUPP - If the passed IN adapter does not support this.
+ * * Negative errno - Another error occurred.
  */
 int usb4_dp_port_set_cm_bandwidth_mode_supported(struct tb_port *port,
 						 bool supported)
@@ -2536,8 +2630,12 @@ int usb4_dp_port_set_cm_bandwidth_mode_supported(struct tb_port *port,
  * @port: DP IN adapter
  *
  * Reads bandwidth allocation Group ID from the DP IN adapter and
- * returns it. If the adapter does not support setting Group_ID
- * %-EOPNOTSUPP is returned.
+ * returns it.
+ *
+ * Return:
+ * * Group ID assigned to adapter @port.
+ * * %-EOPNOTSUPP - If adapter does not support setting GROUP_ID.
+ * * Negative errno - Another error occurred.
  */
 int usb4_dp_port_group_id(struct tb_port *port)
 {
@@ -2561,9 +2659,11 @@ int usb4_dp_port_group_id(struct tb_port *port)
  * @group_id: Group ID for the adapter
  *
  * Sets bandwidth allocation mode Group ID for the DP IN adapter.
- * Returns %0 in case of success and negative errno otherwise.
- * Specifically returns %-EOPNOTSUPP if the adapter does not support
- * this.
+ *
+ * Return:
+ * * %0 - On success.
+ * * %-EOPNOTSUPP - If the adapter does not support this.
+ * * Negative errno - Another error occurred.
  */
 int usb4_dp_port_set_group_id(struct tb_port *port, int group_id)
 {
@@ -2591,9 +2691,12 @@ int usb4_dp_port_set_group_id(struct tb_port *port, int group_id)
  * @rate: Non-reduced rate in Mb/s is placed here
  * @lanes: Non-reduced lanes are placed here
  *
- * Reads the non-reduced rate and lanes from the DP IN adapter. Returns
- * %0 in success and negative errno otherwise. Specifically returns
- * %-EOPNOTSUPP if the adapter does not support this.
+ * Reads the non-reduced rate and lanes from the DP IN adapter.
+ *
+ * Return:
+ * * %0 - On success.
+ * * %-EOPNOTSUPP - If the adapter does not support this.
+ * * Negative errno - Another error occurred.
  */
 int usb4_dp_port_nrd(struct tb_port *port, int *rate, int *lanes)
 {
@@ -2646,10 +2749,13 @@ int usb4_dp_port_nrd(struct tb_port *port, int *rate, int *lanes)
  * @rate: Non-reduced rate in Mb/s
  * @lanes: Non-reduced lanes
  *
- * Before the capabilities reduction this function can be used to set
- * the non-reduced values for the DP IN adapter. Returns %0 in success
- * and negative errno otherwise. If the adapter does not support this
- * %-EOPNOTSUPP is returned.
+ * Before the capabilities reduction, this function can be used to set
+ * the non-reduced values for the DP IN adapter.
+ *
+ * Return:
+ * * %0 - On success.
+ * * %-EOPNOTSUPP - If the adapter does not support this.
+ * * Negative errno - Another error occurred.
  */
 int usb4_dp_port_set_nrd(struct tb_port *port, int rate, int lanes)
 {
@@ -2708,9 +2814,13 @@ int usb4_dp_port_set_nrd(struct tb_port *port, int rate, int lanes)
  * usb4_dp_port_granularity() - Return granularity for the bandwidth values
  * @port: DP IN adapter
  *
- * Reads the programmed granularity from @port. If the DP IN adapter does
- * not support bandwidth allocation mode returns %-EOPNOTSUPP and negative
- * errno in other error cases.
+ * Reads the programmed granularity from @port.
+ *
+ * Return:
+ * * Granularity value of a @port.
+ * * %-EOPNOTSUPP - If the DP IN adapter does not support bandwidth
+ *   allocation mode.
+ * * Negative errno - Another error occurred.
  */
 int usb4_dp_port_granularity(struct tb_port *port)
 {
@@ -2746,8 +2856,12 @@ int usb4_dp_port_granularity(struct tb_port *port)
  * @granularity: Granularity in Mb/s. Supported values: 1000, 500 and 250.
  *
  * Sets the granularity used with the estimated, allocated and requested
- * bandwidth. Returns %0 in success and negative errno otherwise. If the
- * adapter does not support this %-EOPNOTSUPP is returned.
+ * bandwidth.
+ *
+ * Return:
+ * * %0 - On success.
+ * * %-EOPNOTSUPP - If the adapter does not support this.
+ * * Negative errno - Another error occurred.
  */
 int usb4_dp_port_set_granularity(struct tb_port *port, int granularity)
 {
@@ -2788,10 +2902,13 @@ int usb4_dp_port_set_granularity(struct tb_port *port, int granularity)
  * @bw: Estimated bandwidth in Mb/s.
  *
  * Sets the estimated bandwidth to @bw. Set the granularity by calling
- * usb4_dp_port_set_granularity() before calling this. The @bw is round
- * down to the closest granularity multiplier. Returns %0 in success
- * and negative errno otherwise. Specifically returns %-EOPNOTSUPP if
- * the adapter does not support this.
+ * usb4_dp_port_set_granularity() before calling this. The @bw is rounded
+ * down to the closest granularity multiplier.
+ *
+ * Return:
+ * * %0 - On success.
+ * * %-EOPNOTSUPP - If the adapter does not support this.
+ * * Negative errno - Another error occurred.
  */
 int usb4_dp_port_set_estimated_bandwidth(struct tb_port *port, int bw)
 {
@@ -2822,9 +2939,10 @@ int usb4_dp_port_set_estimated_bandwidth(struct tb_port *port, int bw)
  * usb4_dp_port_allocated_bandwidth() - Return allocated bandwidth
  * @port: DP IN adapter
  *
- * Reads and returns allocated bandwidth for @port in Mb/s (taking into
- * account the programmed granularity). Returns negative errno in case
- * of error.
+ * Reads the allocated bandwidth for @port in Mb/s (taking into account
+ * the programmed granularity).
+ *
+ * Return: Allocated bandwidth in Mb/s or negative errno in case of an error.
  */
 int usb4_dp_port_allocated_bandwidth(struct tb_port *port)
 {
@@ -2919,8 +3037,9 @@ static int usb4_dp_port_wait_and_clear_cm_ack(struct tb_port *port,
  * @bw: New allocated bandwidth in Mb/s
  *
  * Communicates the new allocated bandwidth with the DPCD (graphics
- * driver). Takes into account the programmed granularity. Returns %0 in
- * success and negative errno in case of error.
+ * driver). Takes into account the programmed granularity.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_dp_port_allocate_bandwidth(struct tb_port *port, int bw)
 {
@@ -2960,10 +3079,15 @@ int usb4_dp_port_allocate_bandwidth(struct tb_port *port, int bw)
  * @port: DP IN adapter
  *
  * Reads the DPCD (graphics driver) requested bandwidth and returns it
- * in Mb/s. Takes the programmed granularity into account. In case of
- * error returns negative errno. Specifically returns %-EOPNOTSUPP if
- * the adapter does not support bandwidth allocation mode, and %ENODATA
- * if there is no active bandwidth request from the graphics driver.
+ * in Mb/s. Takes the programmed granularity into account.
+ *
+ * Return:
+ * * Requested bandwidth in Mb/s - On success.
+ * * %-EOPNOTSUPP - If the adapter does not support bandwidth allocation
+ *   mode.
+ * * %ENODATA - If there is no active bandwidth request from the graphics
+ *   driver.
+ * * Negative errno - On failure.
  */
 int usb4_dp_port_requested_bandwidth(struct tb_port *port)
 {
@@ -2995,8 +3119,9 @@ int usb4_dp_port_requested_bandwidth(struct tb_port *port)
  * @enable: Enable/disable extended encapsulation
  *
  * Enables or disables extended encapsulation used in PCIe tunneling. Caller
- * needs to make sure both adapters support this before enabling. Returns %0 on
- * success and negative errno otherwise.
+ * needs to make sure both adapters support this before enabling.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_pci_port_set_ext_encapsulation(struct tb_port *port, bool enable)
 {
-- 
2.50.1


