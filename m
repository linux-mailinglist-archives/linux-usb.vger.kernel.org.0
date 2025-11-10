Return-Path: <linux-usb+bounces-30275-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF41C469B2
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7CDB84EB0CD
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EBAD30FF3C;
	Mon, 10 Nov 2025 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJPuuYbk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0106030E0E2
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777857; cv=none; b=Fe3v1MIO6mItISDWz6xFnTJz0jS1miAQoK0g5RmuSh2IvDnqas5c+Yna0JhLVm9vH9wEBCuq+ilQPigDRf9P3UeGy2l9TG27TO75+RFB8EA8QEGiVd3Jx5jC/vlwHzXDtQ3cVyszdyMs5RbKgZx11C+tzoABxtJ4r0rqXcDvlKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777857; c=relaxed/simple;
	bh=dBelcOAunk2ZtS1Qt2SZn3fZaZBZx0XcSsTeg/tpXA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGHTZMVFaMfNUBsVLVynFYcd0Sr2CwOsONBuKLmVGBsYwdpXwjnch43e40Dxdc2YySrWFgpuDjyKsHSlm+jvoE70//xmeJiQqExjMMOc81+9kbiUNqffonFZnxsCX92SqT56uHh5GMEFihzwH8JgkXG74uKRWMmuv0jieTJk51c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJPuuYbk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777856; x=1794313856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dBelcOAunk2ZtS1Qt2SZn3fZaZBZx0XcSsTeg/tpXA8=;
  b=nJPuuYbkPVOt03eJNwtVvUQn3R56eMbLf9nnS8Ih+cZyZz0wEV3h4P8J
   RT/v1NblWZrNhSvBsHvrPImADDpKbTPdnONwFzEeK3XoecL8R0wnufTcG
   TI/ODWjVDIPRicMxiksqvFPN97XuubpVw+HoupZqANn4//FuGO5x+EXFB
   b8V0kq+u9mdSV0BlINyWXQisbn4p5e5Ahm68OkzEytxg9dgDz8H52dS3d
   2KHLb0QUSifS4qgoubtS46mym7LQKFZJ3ZJNp4B+9dVXh9JRynf07TV5y
   7R6g2y1pa9YOYW6imyW6yvZU2+cmPETxqidkjM/QqaDYXPB+nP/4z3cUx
   A==;
X-CSE-ConnectionGUID: 7cbDQQM4RPmJbvEP5TKbxQ==
X-CSE-MsgGUID: N999vaFJQ4yUOb5NzZpcww==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64734702"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64734702"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:56 -0800
X-CSE-ConnectionGUID: g9czHs5lQyeZXjGE4RKNzA==
X-CSE-MsgGUID: ulC86/4ZSo6pl33a9ZYhaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="193672529"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 10 Nov 2025 04:30:53 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A73E2A3; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 14/16] thunderbolt: Fix typos in tunnel.c
Date: Mon, 10 Nov 2025 13:30:48 +0100
Message-ID: <20251110123050.3959188-15-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
References: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Fix typos in tunnel.c. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index bfa0607b5574..9fa95c595ecc 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -301,7 +301,7 @@ static int tb_pci_set_ext_encapsulation(struct tb_tunnel *tunnel, bool enable)
 	struct tb_port *port = tb_upstream_port(tunnel->dst_port->sw);
 	int ret;
 
-	/* Only supported of both routers are at least USB4 v2 */
+	/* Only supported if both routers are at least USB4 v2 */
 	if ((usb4_switch_version(tunnel->src_port->sw) < 2) ||
 	   (usb4_switch_version(tunnel->dst_port->sw) < 2))
 		return 0;
@@ -1170,8 +1170,8 @@ static int tb_dp_bandwidth_mode_maximum_bandwidth(struct tb_tunnel *tunnel,
 
 	/*
 	 * DP IN adapter DP_LOCAL_CAP gets updated to the lowest AUX
-	 * read parameter values so this so we can use this to determine
-	 * the maximum possible bandwidth over this link.
+	 * read parameter values so we can use this to determine the
+	 * maximum possible bandwidth over this link.
 	 *
 	 * See USB4 v2 spec 1.0 10.4.4.5.
 	 */
@@ -1783,8 +1783,8 @@ static int tb_dma_init_rx_path(struct tb_path *path, unsigned int credits)
 
 	/*
 	 * First lane adapter is the one connected to the remote host.
-	 * We don't tunnel other traffic over this link so can use all
-	 * the credits (except the ones reserved for control traffic).
+	 * We don't tunnel other traffic over this link so we can use
+	 * all the credits (except the ones reserved for control traffic).
 	 */
 	hop = &path->hops[0];
 	tmp = min(tb_usable_credits(hop->in_port), credits);
@@ -2044,7 +2044,7 @@ static int tb_usb3_consumed_bandwidth(struct tb_tunnel *tunnel,
 
 	/*
 	 * PCIe tunneling, if enabled, affects the USB3 bandwidth so
-	 * take that it into account here.
+	 * take that into account here.
 	 */
 	*consumed_up = tunnel->allocated_up *
 		(TB_USB3_WEIGHT + pcie_weight) / TB_USB3_WEIGHT;
@@ -2605,7 +2605,7 @@ int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
  * @tunnel: Tunnel whose unused bandwidth to release
  *
  * If tunnel supports dynamic bandwidth management (USB3 tunnels at the
- * moment) this function makes it to release all the unused bandwidth.
+ * moment) this function makes it release all the unused bandwidth.
  *
  * Return: %0 on success, negative errno otherwise.
  */
-- 
2.50.1


