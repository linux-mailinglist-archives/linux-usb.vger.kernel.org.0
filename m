Return-Path: <linux-usb+bounces-27742-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A62B4959E
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76532200A88
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9746131A045;
	Mon,  8 Sep 2025 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIXym1+q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC483191C8
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349164; cv=none; b=nUhFot32dszAilVkVs5mHKzqDtnv7oQrr2+t9M8L4EZ7UjLrWdUdZl04W3pvophvC2xIpVaPeSa+PjPp84lKysDy0vZuuiAn0utziMSxioIbSAd7antq5igwf99qOvOFKubFZXJX1BC60pOH1OmFwQ92ioTdBoMmDGPWIS+JjP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349164; c=relaxed/simple;
	bh=htdUpKiFiui+gzjoQAd77JWwe0c4jtDTvZAEY5UmQXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3ZXHW3TNwfPE96jVPVpxFm93phqHKtgMABg0BvWtDsLhs/rs8ufiI45AC2WNIVCe6h2iI7iS0YWjqhtC88/o9sARDkmKKNT4dGv8eJWqgH4d7BJu1VWSBSZfBFhKvwpzioRpaSPcYEoA1G+6lExTbUHzqnvGNtrADeWFBJBNvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIXym1+q; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349161; x=1788885161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=htdUpKiFiui+gzjoQAd77JWwe0c4jtDTvZAEY5UmQXU=;
  b=gIXym1+qNH+NAIA4Z+cgAy6QzHoiJpKhkOvxopBMZUuGoed2iALSm7QR
   ATS1cprbx5v7ymt9Ne2w1gc0TrlEHoB7oATVbibUqKUxGcT/vFtXyVWLX
   AdZiFvTLHneQ0hPYog6xoanEa/cozauqMuLvG5SiB0KWi2l7xjAO3Hd0Q
   4Pb7gcxATsvNSdWWccqNvLt0jEBq94ZK2pGLd72Trgn4CbK2D6/DQNNSX
   LErzt0iZ3+XoGps+K0/ToHZ8qMl71opN13N6Vq9XZdAAWKc8pRN75lRmb
   fSIoPxc5GARHVbowH6NlCYVHLlbFTSlAeYOxfrAICZ1deETBlJiljVSOP
   Q==;
X-CSE-ConnectionGUID: vsC0VphoTc61ixxQYtB7wA==
X-CSE-MsgGUID: 5qs2FKdvRKWcjLApTiVlOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443077"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443077"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:37 -0700
X-CSE-ConnectionGUID: KjdTsf/cT2mWAeYNF4zhfA==
X-CSE-MsgGUID: hO6ieeDhSW6a9yKOXPG+XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291158"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 12AE0A9; Mon, 08 Sep 2025 18:32:31 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 21/26] thunderbolt: Update tunnel.c function documentation
Date: Mon,  8 Sep 2025 18:32:25 +0200
Message-ID: <20250908163230.2614397-22-mika.westerberg@linux.intel.com>
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

Make tunnel.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 85 ++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 32 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index d52efe3f658c..850d9b107abd 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -121,6 +121,8 @@ static inline unsigned int tb_usable_credits(const struct tb_port *port)
  * @port: Lane adapter to check
  * @max_dp_streams: If non-%NULL stores maximum number of simultaneous DP
  *		    streams possible through this lane adapter
+ *
+ * Return: Number of available credits.
  */
 static unsigned int tb_available_credits(const struct tb_port *port,
 					 size_t *max_dp_streams)
@@ -415,8 +417,9 @@ static int tb_pci_init_path(struct tb_path *path)
  * @alloc_hopid: Allocate HopIDs from visited ports
  *
  * If @down adapter is active, follows the tunnel to the PCIe upstream
- * adapter and back. Returns the discovered tunnel or %NULL if there was
- * no tunnel.
+ * adapter and back.
+ *
+ * Return: Pointer to &struct tb_tunnel or %NULL if there was no tunnel.
  */
 struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down,
 					 bool alloc_hopid)
@@ -496,7 +499,7 @@ struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down,
  * Allocate a PCI tunnel. The ports must be of type TB_TYPE_PCIE_UP and
  * TB_TYPE_PCIE_DOWN.
  *
- * Return: Returns a tb_tunnel on success or NULL on failure.
+ * Return: Pointer to @struct tb_tunnel or %NULL on failure.
  */
 struct tb_tunnel *tb_tunnel_alloc_pci(struct tb *tb, struct tb_port *up,
 				      struct tb_port *down)
@@ -543,9 +546,12 @@ struct tb_tunnel *tb_tunnel_alloc_pci(struct tb *tb, struct tb_port *up,
  *
  * Can be called to any connected lane 0 adapter to find out how much
  * bandwidth needs to be left in reserve for possible PCIe bulk traffic.
- * Returns true if there is something to be reserved and writes the
- * amount to @reserved_down/@reserved_up. Otherwise returns false and
- * does not touch the parameters.
+ *
+ * Return:
+ * * %true - If there is something to be reserved. Writes the amount to
+ *   @reserved_down/@reserved_up.
+ * * %false - Nothing to be reserved. Leaves @reserved_down/@reserved_up
+ *   unmodified.
  */
 bool tb_tunnel_reserved_pci(struct tb_port *port, int *reserved_up,
 			    int *reserved_down)
@@ -1151,7 +1157,8 @@ static int tb_dp_activate(struct tb_tunnel *tunnel, bool active)
  * @tunnel: DP tunnel to check
  * @max_bw_rounded: Maximum bandwidth in Mb/s rounded up to the next granularity
  *
- * Returns maximum possible bandwidth for this tunnel in Mb/s.
+ * Return: Maximum possible bandwidth for this tunnel in Mb/s, negative errno
+ * in case of failure.
  */
 static int tb_dp_bandwidth_mode_maximum_bandwidth(struct tb_tunnel *tunnel,
 						  int *max_bw_rounded)
@@ -1547,7 +1554,7 @@ static void tb_dp_dump(struct tb_tunnel *tunnel)
  * and back. Returns the discovered tunnel or %NULL if there was no
  * tunnel.
  *
- * Return: DP tunnel or %NULL if no tunnel found.
+ * Return: Pointer to &struct tb_tunnel or %NULL if no tunnel found.
  */
 struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 					bool alloc_hopid)
@@ -1648,7 +1655,7 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
  * successful (or if it returns %false there was some sort of issue).
  * The @callback is called without @tb->lock held.
  *
- * Return: Returns a tb_tunnel on success or &NULL on failure.
+ * Return: Pointer to @struct tb_tunnel or %NULL in case of failure.
  */
 struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 				     struct tb_port *out, int link_nr,
@@ -1861,7 +1868,7 @@ static void tb_dma_destroy(struct tb_tunnel *tunnel)
  * @receive_ring: NHI ring number used to receive packets from the
  *		  other domain. Set to %-1 if RX path is not needed.
  *
- * Return: Returns a tb_tunnel on success or NULL on failure.
+ * Return: Pointer to @struct tb_tunnel or %NULL in case of failure.
  */
 struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 				      struct tb_port *dst, int transmit_path,
@@ -1938,7 +1945,8 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
  *
  * This function can be used to match specific DMA tunnel, if there are
  * multiple DMA tunnels going through the same XDomain connection.
- * Returns true if there is match and false otherwise.
+ *
+ * Return: %true if there is a match, %false otherwise.
  */
 bool tb_tunnel_match_dma(const struct tb_tunnel *tunnel, int transmit_path,
 			 int transmit_ring, int receive_path, int receive_ring)
@@ -2160,8 +2168,9 @@ static void tb_usb3_init_path(struct tb_path *path)
  * @alloc_hopid: Allocate HopIDs from visited ports
  *
  * If @down adapter is active, follows the tunnel to the USB3 upstream
- * adapter and back. Returns the discovered tunnel or %NULL if there was
- * no tunnel.
+ * adapter and back.
+ *
+ * Return: Pointer to &struct tb_tunnel or %NULL if there was no tunnel.
  */
 struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down,
 					  bool alloc_hopid)
@@ -2266,7 +2275,7 @@ struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down,
  * Allocate an USB3 tunnel. The ports must be of type @TB_TYPE_USB3_UP and
  * @TB_TYPE_USB3_DOWN.
  *
- * Return: Returns a tb_tunnel on success or %NULL on failure.
+ * Return: Pointer to @struct tb_tunnel or %NULL in case of failure.
  */
 struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 				       struct tb_port *down, int max_up,
@@ -2337,6 +2346,8 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 /**
  * tb_tunnel_is_invalid - check whether an activated path is still valid
  * @tunnel: Tunnel to check
+ *
+ * Return: %true if path is valid, %false otherwise.
  */
 bool tb_tunnel_is_invalid(struct tb_tunnel *tunnel)
 {
@@ -2355,10 +2366,11 @@ bool tb_tunnel_is_invalid(struct tb_tunnel *tunnel)
  * tb_tunnel_activate() - activate a tunnel
  * @tunnel: Tunnel to activate
  *
- * Return: 0 on success and negative errno in case if failure.
- * Specifically returns %-EINPROGRESS if the tunnel activation is still
- * in progress (that's for DP tunnels to complete DPRX capabilities
- * read).
+ * Return:
+ * * %0 - On success.
+ * * %-EINPROGRESS - If the tunnel activation is still in progress (that's
+ *   for DP tunnels to complete DPRX capabilities read).
+ * * Negative errno - Another error occurred.
  */
 int tb_tunnel_activate(struct tb_tunnel *tunnel)
 {
@@ -2438,8 +2450,8 @@ void tb_tunnel_deactivate(struct tb_tunnel *tunnel)
  * @tunnel: Tunnel to check
  * @port: Port to check
  *
- * Returns true if @tunnel goes through @port (direction does not matter),
- * false otherwise.
+ * Return: %true if @tunnel goes through @port (direction does not matter),
+ * %false otherwise.
  */
 bool tb_tunnel_port_on_path(const struct tb_tunnel *tunnel,
 			    const struct tb_port *port)
@@ -2469,9 +2481,11 @@ static bool tb_tunnel_is_activated(const struct tb_tunnel *tunnel)
  * @max_up: Maximum upstream bandwidth in Mb/s
  * @max_down: Maximum downstream bandwidth in Mb/s
  *
- * Returns maximum possible bandwidth this tunnel can go if not limited
- * by other bandwidth clients. If the tunnel does not support this
- * returns %-EOPNOTSUPP.
+ * Return:
+ * * Maximum possible bandwidth this tunnel can support if not
+ *   limited by other bandwidth clients.
+ * * %-EOPNOTSUPP - If the tunnel does not support this function.
+ * * %-ENOTCONN - If the tunnel is not active.
  */
 int tb_tunnel_maximum_bandwidth(struct tb_tunnel *tunnel, int *max_up,
 				int *max_down)
@@ -2491,8 +2505,12 @@ int tb_tunnel_maximum_bandwidth(struct tb_tunnel *tunnel, int *max_up,
  * @allocated_down: Currently allocated downstream bandwidth in Mb/s is
  *		    stored here
  *
- * Returns the bandwidth allocated for the tunnel. This may be higher
- * than what the tunnel actually consumes.
+ * Return:
+ * * Bandwidth allocated for the tunnel. This may be higher than what the
+ *   tunnel actually consumes.
+ * * %-EOPNOTSUPP - If the tunnel does not support this function.
+ * * %-ENOTCONN - If the tunnel is not active.
+ * * Negative errno - Another error occurred.
  */
 int tb_tunnel_allocated_bandwidth(struct tb_tunnel *tunnel, int *allocated_up,
 				  int *allocated_down)
@@ -2512,10 +2530,12 @@ int tb_tunnel_allocated_bandwidth(struct tb_tunnel *tunnel, int *allocated_up,
  * @alloc_up: New upstream bandwidth in Mb/s
  * @alloc_down: New downstream bandwidth in Mb/s
  *
- * Tries to change tunnel bandwidth allocation. If succeeds returns %0
- * and updates @alloc_up and @alloc_down to that was actually allocated
- * (it may not be the same as passed originally). Returns negative errno
- * in case of failure.
+ * Tries to change tunnel bandwidth allocation.
+ *
+ * Return:
+ * * %0 - On success. Updates @alloc_up and @alloc_down to values that were
+ *   actually allocated (it may not be the same as passed originally).
+ * * Negative errno - In case of failure.
  */
 int tb_tunnel_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 			      int *alloc_down)
@@ -2546,8 +2566,9 @@ int tb_tunnel_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
  *		   Can be %NULL.
  *
  * Stores the amount of isochronous bandwidth @tunnel consumes in
- * @consumed_up and @consumed_down. In case of success returns %0,
- * negative errno otherwise.
+ * @consumed_up and @consumed_down.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 				 int *consumed_down)
@@ -2585,7 +2606,7 @@ int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
  * If tunnel supports dynamic bandwidth management (USB3 tunnels at the
  * moment) this function makes it to release all the unused bandwidth.
  *
- * Returns %0 in case of success and negative errno otherwise.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_tunnel_release_unused_bandwidth(struct tb_tunnel *tunnel)
 {
-- 
2.50.1


