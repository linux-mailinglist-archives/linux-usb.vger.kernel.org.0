Return-Path: <linux-usb+bounces-27746-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE19FB495A5
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 581384477A1
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CCA3101D2;
	Mon,  8 Sep 2025 16:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8jz/ynr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414A831986C
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349166; cv=none; b=uccP0+XwebHdW3S5GyDH6dP15pIepaIMJHG1ismMPSFtfRraG/9SgIjSWJlvfvVJsE8V5OofXS04Ciwgd6moL+YGelRlAUGif/rn6kNyGB4N9hGktdI/pxGNwGFr/YSmdUiPBwi27clMwAPRSbRKTz67e/kWUZIVjEvpzBAi5yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349166; c=relaxed/simple;
	bh=IG/acHa9sGnq2DDEO/0Ff5ql9xpaLVsTZHZQexj+Uus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pg6pY7gYbW+WSOgboYd8l0BHUgUWH+1NqrEUqUqoLvgaZ1OBgauEdWzUyakiHvTncRn88gVgrwK0ymLnWL4EuzSDGR0Dywp9FF/VJABQRzGkAaOL3klBthezObVSfNiqW9fCL5K4mh5p7MGfrAi7B6TJFkgnAXEmefWaw1mEqrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8jz/ynr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349163; x=1788885163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IG/acHa9sGnq2DDEO/0Ff5ql9xpaLVsTZHZQexj+Uus=;
  b=e8jz/ynrQJ9LF4EplQMok8aQRsZEVsO14eV/eOYxGzZNpDSrQ8V1EPKI
   ay/zzjlb60cyi+veBHeNmvkK38YK+F9vz0Oe4wAJ2NaYyjdLcBOJqixEn
   VwawwgbfyYqxpNotn2wx/GK8O5ynPTUAmIM3In6L5shWw37k14oKAjiAc
   8iAQtQyBE1yvBwQLyA8LB5wN+Lj01KYsgXPT+FMJqGEoJcONy6WrQi7bh
   Q/+olalrkfjd4X8UqGIIevfAiEVu6BkVIZCZYDrz1oxPfr+qPmEn+IFYS
   3DhNbK7w752bM37sqfRsJRRT2X076X7fY+RTJWt96KlOiWOc+JWAdpQLC
   A==;
X-CSE-ConnectionGUID: cmRB06IwTXew1wxLE7B/PQ==
X-CSE-MsgGUID: prSf6VaaTKC7wyfpxArtnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443085"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443085"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:37 -0700
X-CSE-ConnectionGUID: mORxxEmNS2+rZQ9yagvjOg==
X-CSE-MsgGUID: UxwbEbqERaa1VbV5za9hbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291160"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 08EAFA6; Mon, 08 Sep 2025 18:32:31 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 18/26] thunderbolt: Update tb.h function documentation
Date: Mon,  8 Sep 2025 18:32:22 +0200
Message-ID: <20250908163230.2614397-19-mika.westerberg@linux.intel.com>
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

Make tb.h function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index f503bad86413..c1ffaf0bb39e 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -558,7 +558,7 @@ static inline void *tb_priv(struct tb *tb)
  * During switch alloc/init tb_upstream_port()->remote may be NULL, even for
  * non root switches (on the NHI port remote is always NULL).
  *
- * Return: Returns the upstream port of the switch.
+ * Return: Pointer to &struct tb_port.
  */
 static inline struct tb_port *tb_upstream_port(struct tb_switch *sw)
 {
@@ -569,8 +569,8 @@ static inline struct tb_port *tb_upstream_port(struct tb_switch *sw)
  * tb_is_upstream_port() - Is the port upstream facing
  * @port: Port to check
  *
- * Returns true if @port is upstream facing port. In case of dual link
- * ports both return true.
+ * Return: %true if @port is upstream facing port. In case of dual link
+ * ports, both return %true.
  */
 static inline bool tb_is_upstream_port(const struct tb_port *port)
 {
@@ -613,7 +613,7 @@ static inline const char *tb_width_name(enum tb_link_width width)
  * tb_port_has_remote() - Does the port have switch connected downstream
  * @port: Port to check
  *
- * Returns true only when the port is primary port and has remote set.
+ * Return: %true only when the port is primary port and has remote set.
  */
 static inline bool tb_port_has_remote(const struct tb_port *port)
 {
@@ -905,8 +905,9 @@ static inline struct tb_switch *tb_switch_parent(struct tb_switch *sw)
  * tb_switch_downstream_port() - Return downstream facing port of parent router
  * @sw: Device router pointer
  *
- * Only call for device routers. Returns the downstream facing port of
- * the parent router.
+ * Call only for device routers.
+ *
+ * Return: Pointer to &struct tb_port or %NULL in case of failure.
  */
 static inline struct tb_port *tb_switch_downstream_port(struct tb_switch *sw)
 {
@@ -918,6 +919,8 @@ static inline struct tb_port *tb_switch_downstream_port(struct tb_switch *sw)
 /**
  * tb_switch_depth() - Returns depth of the connected router
  * @sw: Router
+ *
+ * Return: Router depth level as a number.
  */
 static inline int tb_switch_depth(const struct tb_switch *sw)
 {
@@ -1010,6 +1013,9 @@ static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
  * is handling @sw this function can be called. It is valid to call this
  * after tb_switch_alloc() and tb_switch_configure() has been called
  * (latter only for SW CM case).
+ *
+ * Return: %true if switch is handled by ICM, %false if handled by
+ * software CM.
  */
 static inline bool tb_switch_is_icm(const struct tb_switch *sw)
 {
@@ -1037,6 +1043,8 @@ int tb_switch_tmu_configure(struct tb_switch *sw, enum tb_switch_tmu_mode mode);
  *
  * Checks if given router TMU mode is configured to @mode. Note the
  * router TMU might not be enabled to this mode.
+ *
+ * Return: %true if TMU mode is equal to @mode, %false otherwise.
  */
 static inline bool tb_switch_tmu_is_configured(const struct tb_switch *sw,
 					       enum tb_switch_tmu_mode mode)
@@ -1048,8 +1056,8 @@ static inline bool tb_switch_tmu_is_configured(const struct tb_switch *sw,
  * tb_switch_tmu_is_enabled() - Checks if the specified TMU mode is enabled
  * @sw: Router whose TMU mode to check
  *
- * Return true if hardware TMU configuration matches the requested
- * configuration (and is not %TB_SWITCH_TMU_MODE_OFF).
+ * Return: %true if hardware TMU configuration matches the requested
+ * configuration (and is not %TB_SWITCH_TMU_MODE_OFF), %false otherwise.
  */
 static inline bool tb_switch_tmu_is_enabled(const struct tb_switch *sw)
 {
@@ -1069,9 +1077,10 @@ int tb_switch_clx_disable(struct tb_switch *sw);
  * @clx: The CLx states to check for
  *
  * Checks if the specified CLx is enabled on the router upstream link.
- * Returns true if any of the given states is enabled.
  *
  * Not applicable for a host router.
+ *
+ * Return: %true if any of the given states is enabled, %false otherwise.
  */
 static inline bool tb_switch_clx_is_enabled(const struct tb_switch *sw,
 					    unsigned int clx)
@@ -1103,7 +1112,7 @@ struct tb_port *tb_next_port_on_path(struct tb_port *start, struct tb_port *end,
  * @src: Source adapter
  * @dst: Destination adapter
  *
- * Returns %true only if the specified path from source adapter (@src)
+ * Return: %true only if the specified path from source adapter (@src)
  * to destination adapter (@dst) is directed downstream.
  */
 static inline bool
@@ -1235,7 +1244,7 @@ static inline int tb_route_length(u64 route)
  *
  * Port must not be the upstream port (otherwise a loop is created).
  *
- * Return: Returns a route to the switch behind @port.
+ * Return: Route to the switch behind @port.
  */
 static inline u64 tb_downstream_route(struct tb_port *port)
 {
@@ -1263,7 +1272,7 @@ static inline struct tb_switch *tb_xdomain_parent(struct tb_xdomain *xd)
  * tb_xdomain_downstream_port() - Return downstream facing port of parent router
  * @xd: Xdomain pointer
  *
- * Returns the downstream port the XDomain is connected to.
+ * Return: Pointer to &struct tb_port or %NULL in case of failure.
  */
 static inline struct tb_port *tb_xdomain_downstream_port(struct tb_xdomain *xd)
 {
@@ -1291,7 +1300,7 @@ static inline struct tb_retimer *tb_to_retimer(struct device *dev)
  * usb4_switch_version() - Returns USB4 version of the router
  * @sw: Router to check
  *
- * Returns major version of USB4 router (%1 for v1, %2 for v2 and so
+ * Return: Major version of USB4 router (%1 for v1, %2 for v2 and so
  * on). Can be called to pre-USB4 router too and in that case returns %0.
  */
 static inline unsigned int usb4_switch_version(const struct tb_switch *sw)
@@ -1303,7 +1312,7 @@ static inline unsigned int usb4_switch_version(const struct tb_switch *sw)
  * tb_switch_is_usb4() - Is the switch USB4 compliant
  * @sw: Switch to check
  *
- * Returns true if the @sw is USB4 compliant router, false otherwise.
+ * Return: %true if the @sw is USB4 compliant router, %false otherwise.
  */
 static inline bool tb_switch_is_usb4(const struct tb_switch *sw)
 {
-- 
2.50.1


