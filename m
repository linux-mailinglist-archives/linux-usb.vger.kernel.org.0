Return-Path: <linux-usb+bounces-27741-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EABB4959D
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3F8B2000C3
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346D1319863;
	Mon,  8 Sep 2025 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezr1cL4t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5F1318152
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349163; cv=none; b=Ndedtm+V34KBjfbkkAOSZ0Ev2f2hRc/M1j5C1yn4vwN+pdCStWeNe0Pb29b/wJtUh6ASI/6Abns9ZjmRPt8gc8VtZGIX0ryja3Fsf1RIUi6VK4HFV2McPLyOh+997J9HNVCFJEjiMoW2k2IQMGVyw/YEC0ZzNUOv2tlFXl1bL/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349163; c=relaxed/simple;
	bh=1rdNFYAX5oXQ0Y+/6jkLam2cbhkRmMWVX68nTSMBGAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZAU6rd5RCFZOo1RgyMtIReK+qyH3ASn4oe6Gl6qI0KqrnI5JUrHjsfVwZHsYAwfkP/WiQ86EykkcwU7ce5VHibbv1KCPJ0nA+41iUtJOV6ibrPU3qlVyOqvaazCYhRjzjvqOsHfFzOWYfddiH4n0QAn58LUV0daKqedocufazE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezr1cL4t; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349162; x=1788885162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1rdNFYAX5oXQ0Y+/6jkLam2cbhkRmMWVX68nTSMBGAQ=;
  b=ezr1cL4tNcEhFKmi5lXEu02scTTwaA6k7EiTLj/+dhKegAxp4n3shApl
   IXYMlZj07/ZbAwQylxmd5FkmJZ5/kpXGucK1gn43KTLu5OKAUsBmdKr1X
   7TXZHwlDEAdNTwr/MBAxJjLf8NdF4yRjMJM/aMRon0rTSXHhIRMXQlAg6
   LVQtO4tCUp6rc0kyqGnOuKkJBijP+yuz3vSroxNRhBqJlUVSlE3g5/sMA
   Xj2WZi+OnIEyeMQ3sdP0YhycXHG0vKZT/9i9Y+DJE7qcalsI95vhfW0gP
   IlkGc5MT1cH+iZX+Ui3PSIxy+Iv3qonTJ3S6QbX1pRud3g5OJgK3D3nb+
   A==;
X-CSE-ConnectionGUID: UD7L2ovMQhm2imCF8q/Sxg==
X-CSE-MsgGUID: viKcmG7oQViVCQm7Ir1jeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63252124"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="63252124"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:39 -0700
X-CSE-ConnectionGUID: /u/gT56gRcOE5YlST1kbMA==
X-CSE-MsgGUID: S7RbcS5GRbyv4S3+/4bKEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203622652"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 09:32:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 02E59A4; Mon, 08 Sep 2025 18:32:31 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 16/26] thunderbolt: Update switch.c function documentation
Date: Mon,  8 Sep 2025 18:32:20 +0200
Message-ID: <20250908163230.2614397-17-mika.westerberg@linux.intel.com>
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

Make switch.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 140 +++++++++++++++++++++++++----------
 1 file changed, 102 insertions(+), 38 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index e9f4186f20f4..0e07904aa73b 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -290,8 +290,9 @@ static int nvm_authenticate(struct tb_switch *sw, bool auth_only)
  * @size: Size of the buffer in bytes
  *
  * Reads from router NVM and returns the requested data in @buf. Locking
- * is up to the caller. Returns %0 in success and negative errno in case
- * of failure.
+ * is up to the caller.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_nvm_read(struct tb_switch *sw, unsigned int address, void *buf,
 		       size_t size)
@@ -464,7 +465,7 @@ static void tb_dump_port(struct tb *tb, const struct tb_port *port)
  *
  * The port must have a TB_CAP_PHY (i.e. it should be a real port).
  *
- * Return: Returns an enum tb_port_state on success or an error code on failure.
+ * Return: &enum tb_port_state or negative error code on failure.
  */
 int tb_port_state(struct tb_port *port)
 {
@@ -491,9 +492,11 @@ int tb_port_state(struct tb_port *port)
  * switch resume). Otherwise we only wait if a device is registered but the link
  * has not yet been established.
  *
- * Return: Returns an error code on failure. Returns 0 if the port is not
- * connected or failed to reach state TB_PORT_UP within one second. Returns 1
- * if the port is connected and in state TB_PORT_UP.
+ * Return:
+ * * %0 - If the port is not connected or failed to reach
+ *   state %TB_PORT_UP within one second.
+ * * %1 - If the port is connected and in state %TB_PORT_UP.
+ * * Negative errno - An error occurred.
  */
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 {
@@ -562,7 +565,7 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
  * Change the number of NFC credits allocated to @port by @credits. To remove
  * NFC credits pass a negative amount of credits.
  *
- * Return: Returns 0 on success or an error code on failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_port_add_nfc_credits(struct tb_port *port, int credits)
 {
@@ -599,7 +602,7 @@ int tb_port_add_nfc_credits(struct tb_port *port, int credits)
  * @port: Port whose counters to clear
  * @counter: Counter index to clear
  *
- * Return: Returns 0 on success or an error code on failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_port_clear_counter(struct tb_port *port, int counter)
 {
@@ -614,6 +617,8 @@ int tb_port_clear_counter(struct tb_port *port, int counter)
  *
  * Needed for USB4 but can be called for any CIO/USB4 ports. Makes the
  * downstream router accessible for CM.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_port_unlock(struct tb_port *port)
 {
@@ -659,6 +664,8 @@ static int __tb_port_enable(struct tb_port *port, bool enable)
  * @port: Port to enable (can be %NULL)
  *
  * This is used for lane 0 and 1 adapters to enable it.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_port_enable(struct tb_port *port)
 {
@@ -670,6 +677,8 @@ int tb_port_enable(struct tb_port *port)
  * @port: Port to disable (can be %NULL)
  *
  * This is used for lane 0 and 1 adapters to disable it.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_port_disable(struct tb_port *port)
 {
@@ -689,7 +698,7 @@ static int tb_port_reset(struct tb_port *port)
  * This is a helper method for tb_switch_alloc. Does not check or initialize
  * any downstream switches.
  *
- * Return: Returns 0 on success or an error code on failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 static int tb_init_port(struct tb_port *port)
 {
@@ -847,9 +856,9 @@ static inline bool tb_switch_is_reachable(const struct tb_switch *parent,
  * link port, the function follows that link and returns another end on
  * that same link.
  *
- * If the @end port has been reached, return %NULL.
- *
  * Domain tb->lock must be held when this function is called.
+ *
+ * Return: Pointer to &struct tb_port, %NULL if the @end port has been reached.
  */
 struct tb_port *tb_next_port_on_path(struct tb_port *start, struct tb_port *end,
 				     struct tb_port *prev)
@@ -894,7 +903,7 @@ struct tb_port *tb_next_port_on_path(struct tb_port *start, struct tb_port *end,
  * tb_port_get_link_speed() - Get current link speed
  * @port: Port to check (USB4 or CIO)
  *
- * Returns link speed in Gb/s or negative errno in case of failure.
+ * Return: Link speed in Gb/s or negative errno in case of failure.
  */
 int tb_port_get_link_speed(struct tb_port *port)
 {
@@ -926,9 +935,11 @@ int tb_port_get_link_speed(struct tb_port *port)
  * tb_port_get_link_generation() - Returns link generation
  * @port: Lane adapter
  *
- * Returns link generation as number or negative errno in case of
- * failure. Does not distinguish between Thunderbolt 1 and Thunderbolt 2
- * links so for those always returns 2.
+ * Return: Link generation as a number or negative errno in case of
+ * failure.
+ *
+ * Does not distinguish between Thunderbolt 1 and Thunderbolt 2
+ * links so for those always returns %2.
  */
 int tb_port_get_link_generation(struct tb_port *port)
 {
@@ -952,8 +963,8 @@ int tb_port_get_link_generation(struct tb_port *port)
  * tb_port_get_link_width() - Get current link width
  * @port: Port to check (USB4 or CIO)
  *
- * Returns link width. Return the link width as encoded in &enum
- * tb_link_width or negative errno in case of failure.
+ * Return: Link width encoded in &enum tb_link_width or
+ * negative errno in case of failure.
  */
 int tb_port_get_link_width(struct tb_port *port)
 {
@@ -979,7 +990,9 @@ int tb_port_get_link_width(struct tb_port *port)
  * @width: Widths to check (bitmask)
  *
  * Can be called to any lane adapter. Checks if given @width is
- * supported by the hardware and returns %true if it is.
+ * supported by the hardware.
+ *
+ * Return: %true if link width is supported, %false otherwise.
  */
 bool tb_port_width_supported(struct tb_port *port, unsigned int width)
 {
@@ -1016,7 +1029,7 @@ bool tb_port_width_supported(struct tb_port *port, unsigned int width)
  * Sets the target link width of the lane adapter to @width. Does not
  * enable/disable lane bonding. For that call tb_port_set_lane_bonding().
  *
- * Return: %0 in case of success and negative errno in case of error
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_port_set_link_width(struct tb_port *port, enum tb_link_width width)
 {
@@ -1070,7 +1083,7 @@ int tb_port_set_link_width(struct tb_port *port, enum tb_link_width width)
  * cases one should use tb_port_lane_bonding_enable() instead to enable
  * lane bonding.
  *
- * Return: %0 in case of success and negative errno in case of error
+ * Return: %0 on success, negative errno otherwise.
  */
 static int tb_port_set_lane_bonding(struct tb_port *port, bool bonding)
 {
@@ -1104,7 +1117,7 @@ static int tb_port_set_lane_bonding(struct tb_port *port, bool bonding)
  * tb_port_wait_for_link_width() before enabling any paths through the
  * link to make sure the link is in expected state.
  *
- * Return: %0 in case of success and negative errno in case of error
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_port_lane_bonding_enable(struct tb_port *port)
 {
@@ -1181,9 +1194,14 @@ void tb_port_lane_bonding_disable(struct tb_port *port)
  *
  * Should be used after both ends of the link have been bonded (or
  * bonding has been disabled) to wait until the link actually reaches
- * the expected state. Returns %-ETIMEDOUT if the width was not reached
- * within the given timeout, %0 if it did. Can be passed a mask of
- * expected widths and succeeds if any of the widths is reached.
+ * the expected state.
+ *
+ * Can be passed a mask of expected widths.
+ *
+ * Return:
+ * * %0 - If link reaches any of the specified widths.
+ * * %-ETIMEDOUT - If link does not reach specified width.
+ * * Negative errno - Another error occurred.
  */
 int tb_port_wait_for_link_width(struct tb_port *port, unsigned int width,
 				int timeout_msec)
@@ -1248,6 +1266,8 @@ static int tb_port_do_update_credits(struct tb_port *port)
  * After the link is bonded (or bonding was disabled) the port total
  * credits may change, so this function needs to be called to re-read
  * the credits. Updates also the second lane adapter.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_port_update_credits(struct tb_port *port)
 {
@@ -1303,6 +1323,8 @@ static bool tb_port_resume(struct tb_port *port)
 /**
  * tb_port_is_enabled() - Is the adapter port enabled
  * @port: Port to check
+ *
+ * Return: %true if port is enabled, %false otherwise.
  */
 bool tb_port_is_enabled(struct tb_port *port)
 {
@@ -1327,6 +1349,8 @@ bool tb_port_is_enabled(struct tb_port *port)
 /**
  * tb_usb3_port_is_enabled() - Is the USB3 adapter port enabled
  * @port: USB3 adapter port to check
+ *
+ * Return: %true if port is enabled, %false otherwise.
  */
 bool tb_usb3_port_is_enabled(struct tb_port *port)
 {
@@ -1343,6 +1367,8 @@ bool tb_usb3_port_is_enabled(struct tb_port *port)
  * tb_usb3_port_enable() - Enable USB3 adapter port
  * @port: USB3 adapter port to enable
  * @enable: Enable/disable the USB3 adapter
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_usb3_port_enable(struct tb_port *port, bool enable)
 {
@@ -1358,6 +1384,8 @@ int tb_usb3_port_enable(struct tb_port *port, bool enable)
 /**
  * tb_pci_port_is_enabled() - Is the PCIe adapter port enabled
  * @port: PCIe port to check
+ *
+ * Return: %true if port is enabled, %false otherwise.
  */
 bool tb_pci_port_is_enabled(struct tb_port *port)
 {
@@ -1374,6 +1402,8 @@ bool tb_pci_port_is_enabled(struct tb_port *port)
  * tb_pci_port_enable() - Enable PCIe adapter port
  * @port: PCIe port to enable
  * @enable: Enable/disable the PCIe adapter
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_pci_port_enable(struct tb_port *port, bool enable)
 {
@@ -1389,6 +1419,8 @@ int tb_pci_port_enable(struct tb_port *port, bool enable)
  * @port: DP out port to check
  *
  * Checks if the DP OUT adapter port has HPD bit already set.
+ *
+ * Return: %1 if HPD is active, %0 otherwise.
  */
 int tb_dp_port_hpd_is_active(struct tb_port *port)
 {
@@ -1408,6 +1440,8 @@ int tb_dp_port_hpd_is_active(struct tb_port *port)
  * @port: Port to clear HPD
  *
  * If the DP IN port has HPD set, this function can be used to clear it.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_dp_port_hpd_clear(struct tb_port *port)
 {
@@ -1434,6 +1468,8 @@ int tb_dp_port_hpd_clear(struct tb_port *port)
  * Programs specified Hop IDs for DP IN/OUT port. Can be called for USB4
  * router DP adapters too but does not program the values as the fields
  * are read-only.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_dp_port_set_hops(struct tb_port *port, unsigned int video,
 			unsigned int aux_tx, unsigned int aux_rx)
@@ -1466,6 +1502,8 @@ int tb_dp_port_set_hops(struct tb_port *port, unsigned int video,
 /**
  * tb_dp_port_is_enabled() - Is DP adapter port enabled
  * @port: DP adapter port to check
+ *
+ * Return: %true if DP port is enabled, %false otherwise.
  */
 bool tb_dp_port_is_enabled(struct tb_port *port)
 {
@@ -1485,6 +1523,8 @@ bool tb_dp_port_is_enabled(struct tb_port *port)
  *
  * Once Hop IDs are programmed DP paths can be enabled or disabled by
  * calling this function.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_dp_port_enable(struct tb_port *port, bool enable)
 {
@@ -1634,7 +1674,7 @@ static bool tb_switch_enumerated(struct tb_switch *sw)
  *
  * If the router is not enumerated does nothing.
  *
- * Returns %0 on success or negative errno in case of failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_reset(struct tb_switch *sw)
 {
@@ -1670,8 +1710,12 @@ int tb_switch_reset(struct tb_switch *sw)
  * @timeout_msec: Timeout in ms how long to wait
  *
  * Wait till the specified bits in specified offset reach specified value.
- * Returns %0 in case of success, %-ETIMEDOUT if the @value was not reached
- * within the given timeout or a negative errno in case of failure.
+ *
+ * Return:
+ * * %0 - On success.
+ * * %-ETIMEDOUT - If the @value was not reached within
+ *   the given timeout.
+ * * Negative errno - In case of failure.
  */
 int tb_switch_wait_for_bit(struct tb_switch *sw, u32 offset, u32 bit,
 			   u32 value, int timeout_msec)
@@ -1700,7 +1744,7 @@ int tb_switch_wait_for_bit(struct tb_switch *sw, u32 offset, u32 bit,
  *
  * Also configures a sane plug_events_delay of 255ms.
  *
- * Return: Returns 0 on success or an error code on failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 static int tb_plug_events_active(struct tb_switch *sw, bool active)
 {
@@ -2406,8 +2450,7 @@ static bool tb_switch_exceeds_max_depth(const struct tb_switch *sw, int depth)
  * separately. The returned switch should be released by calling
  * tb_switch_put().
  *
- * Return: Pointer to the allocated switch or ERR_PTR() in case of
- * failure.
+ * Return: Pointer to &struct tb_switch or ERR_PTR() in case of failure.
  */
 struct tb_switch *tb_switch_alloc(struct tb *tb, struct device *parent,
 				  u64 route)
@@ -2526,7 +2569,7 @@ struct tb_switch *tb_switch_alloc(struct tb *tb, struct device *parent,
  *
  * The returned switch must be released by calling tb_switch_put().
  *
- * Return: Pointer to the allocated switch or ERR_PTR() in case of failure
+ * Return: Pointer to &struct tb_switch or ERR_PTR() in case of failure.
  */
 struct tb_switch *
 tb_switch_alloc_safe_mode(struct tb *tb, struct device *parent, u64 route)
@@ -2562,7 +2605,7 @@ tb_switch_alloc_safe_mode(struct tb *tb, struct device *parent, u64 route)
  * connection manager to use. Can be called to the switch again after
  * resume from low power states to re-initialize it.
  *
- * Return: %0 in case of success and negative errno in case of failure
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_configure(struct tb_switch *sw)
 {
@@ -2625,7 +2668,7 @@ int tb_switch_configure(struct tb_switch *sw)
  * Needs to be called before any tunnels can be setup through the
  * router. Can be called to any router.
  *
- * Returns %0 in success and negative errno otherwise.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_configuration_valid(struct tb_switch *sw)
 {
@@ -2900,6 +2943,8 @@ static void tb_switch_link_init(struct tb_switch *sw)
  * Connection manager can call this function to enable lane bonding of a
  * switch. If conditions are correct and both switches support the feature,
  * lanes are bonded. It is safe to call this to any switch.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 static int tb_switch_lane_bonding_enable(struct tb_switch *sw)
 {
@@ -2950,6 +2995,8 @@ static int tb_switch_lane_bonding_enable(struct tb_switch *sw)
  *
  * Disables lane bonding between @sw and parent. This can be called even
  * if lanes were not bonded originally.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 static int tb_switch_lane_bonding_disable(struct tb_switch *sw)
 {
@@ -3074,7 +3121,7 @@ static int tb_switch_asym_disable(struct tb_switch *sw)
  *
  * Does nothing for host router.
  *
- * Returns %0 in case of success, negative errno otherwise.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_set_link_width(struct tb_switch *sw, enum tb_link_width width)
 {
@@ -3145,7 +3192,7 @@ int tb_switch_set_link_width(struct tb_switch *sw, enum tb_link_width width)
  *
  * It is recommended that this is called after lane bonding is enabled.
  *
- * Returns %0 on success and negative errno in case of error.
+ * Return: %0 on success and negative errno otherwise.
  */
 int tb_switch_configure_link(struct tb_switch *sw)
 {
@@ -3245,7 +3292,7 @@ static int tb_switch_port_hotplug_enable(struct tb_switch *sw)
  * exposed to the userspace when this function successfully returns. To
  * remove and release the switch, call tb_switch_remove().
  *
- * Return: %0 in case of success and negative errno in case of failure
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_add(struct tb_switch *sw)
 {
@@ -3467,6 +3514,8 @@ static void tb_switch_check_wakes(struct tb_switch *sw)
  * suspend. If this is resume from system sleep, notifies PM core about the
  * wakes occurred during suspend. Disables all wakes, except USB4 wake of
  * upstream port for USB4 routers that shall be always enabled.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_resume(struct tb_switch *sw, bool runtime)
 {
@@ -3617,7 +3666,9 @@ void tb_switch_suspend(struct tb_switch *sw, bool runtime)
  * @in: DP IN port
  *
  * Queries availability of DP resource for DP tunneling using switch
- * specific means. Returns %true if resource is available.
+ * specific means.
+ *
+ * Return: %true if resource is available, %false otherwise.
  */
 bool tb_switch_query_dp_resource(struct tb_switch *sw, struct tb_port *in)
 {
@@ -3633,7 +3684,8 @@ bool tb_switch_query_dp_resource(struct tb_switch *sw, struct tb_port *in)
  *
  * Allocates DP resource for DP tunneling. The resource must be
  * available for this to succeed (see tb_switch_query_dp_resource()).
- * Returns %0 in success and negative errno otherwise.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_alloc_dp_resource(struct tb_switch *sw, struct tb_port *in)
 {
@@ -3718,6 +3770,8 @@ static int tb_switch_match(struct device *dev, const void *data)
  *
  * Returned switch has reference count increased so the caller needs to
  * call tb_switch_put() when done with the switch.
+ *
+ * Return: Pointer to &struct tb_switch, %NULL if not found.
  */
 struct tb_switch *tb_switch_find_by_link_depth(struct tb *tb, u8 link, u8 depth)
 {
@@ -3743,6 +3797,8 @@ struct tb_switch *tb_switch_find_by_link_depth(struct tb *tb, u8 link, u8 depth)
  *
  * Returned switch has reference count increased so the caller needs to
  * call tb_switch_put() when done with the switch.
+ *
+ * Return: Pointer to &struct tb_switch, %NULL if not found.
  */
 struct tb_switch *tb_switch_find_by_uuid(struct tb *tb, const uuid_t *uuid)
 {
@@ -3767,6 +3823,8 @@ struct tb_switch *tb_switch_find_by_uuid(struct tb *tb, const uuid_t *uuid)
  *
  * Returned switch has reference count increased so the caller needs to
  * call tb_switch_put() when done with the switch.
+ *
+ * Return: Pointer to &struct tb_switch, %NULL if not found.
  */
 struct tb_switch *tb_switch_find_by_route(struct tb *tb, u64 route)
 {
@@ -3791,6 +3849,8 @@ struct tb_switch *tb_switch_find_by_route(struct tb *tb, u64 route)
  * tb_switch_find_port() - return the first port of @type on @sw or NULL
  * @sw: Switch to find the port from
  * @type: Port type to look for
+ *
+ * Return: Pointer to &struct tb_port, %NULL if not found.
  */
 struct tb_port *tb_switch_find_port(struct tb_switch *sw,
 				    enum tb_port_type type)
@@ -3859,6 +3919,8 @@ static int tb_switch_pcie_bridge_write(struct tb_switch *sw, unsigned int bridge
  * entry to PCIe L1 state. Shall be called after the upstream PCIe tunnel
  * was configured. Due to Intel platforms limitation, shall be called only
  * for first hop switch.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_pcie_l1_enable(struct tb_switch *sw)
 {
@@ -3893,6 +3955,8 @@ int tb_switch_pcie_l1_enable(struct tb_switch *sw)
  * connected to the type-C port. Call only after PCIe tunnel has been
  * established. The function only does the connect if not done already
  * so can be called several times for the same router.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_xhci_connect(struct tb_switch *sw)
 {
-- 
2.50.1


