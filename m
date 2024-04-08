Return-Path: <linux-usb+bounces-9060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F24F89BFD9
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 15:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496C7283AFD
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 13:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860C77BB13;
	Mon,  8 Apr 2024 13:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vi1PKeDR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838E37BAF7
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712581290; cv=none; b=dxY1be96d2gMImAY29d9m5gpgkPG43WOCt5ijrhzIJwUH/843FrUccrwhemkDP9aP0LkM69OA/ZArFnAOHzG7pdGNXnMdv6N1+0Zvi2us+tmx52eo2V+J/wIWWGG5JuZG31Mk+cxJpgSljRwdLWgi53d72gpaloe6pUCkgzF7vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712581290; c=relaxed/simple;
	bh=WswkIFO0ig2Sn6KRG1ink79eLsSAWWf8lE3yZEvy9sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYDHHL9Rr587feqtPMJ7hq/d7/nmDwGjxPtq8mpCA9YeTHRNJ9KYiUueze88U8Hb/yqgEnZRw6nk4ixfSc0PR1uqWgpIjVjwABPSr2FTY30P5qbdM15nwUam71s6qHefXmaKQqgOI6/RKZw6LDRVDnh6F9pKLYfiTkLtTov01So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vi1PKeDR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712581288; x=1744117288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WswkIFO0ig2Sn6KRG1ink79eLsSAWWf8lE3yZEvy9sg=;
  b=Vi1PKeDR5LazMAwUGvMEN/7YeWCjl6RaI2xZA9df2tc2sDwR2HfKjZOc
   5OJN/cVS4W1nJwixiwPD1vwUkRqGOdORzbo8+gXFDveExc7yHYnx4aLps
   FBpBtTov6b3UMAHU7q4C61Sy6svZTlpkj3PvEJ3n/etm1lFoT+0uvNi7s
   MwAJXcicxrS+GZ2ZIZOeKhRmoIMMtI8+T4b5ukGlYWJ1EMNGYDg3JdjGw
   v2AyuGXDKDdBPGld1YgwdBk/IfSljQ3YnKkfKeleBZYA2VWtCcjmftNIA
   T8DMOFY3z8J/boPotLSJ7QYhRhHFP2lYeCkK0YvK+SSuiMSMHHWgULukg
   w==;
X-CSE-ConnectionGUID: PsI3ZKJLQe+Oi4wu6QKPvw==
X-CSE-MsgGUID: yag0as7CSY6bJtTjTxVN6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11630689"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="11630689"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 06:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="937091485"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="937091485"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2024 06:00:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id DEFAD194; Mon,  8 Apr 2024 16:00:31 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Gil Fine <gil.fine@linux.intel.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] thunderbolt: Allow USB3 bandwidth to be lower than maximum supported
Date: Mon,  8 Apr 2024 16:00:31 +0300
Message-ID: <20240408130031.51616-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240408130031.51616-1-mika.westerberg@linux.intel.com>
References: <20240408130031.51616-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gil Fine <gil.fine@linux.intel.com>

Currently USB3 tunnel setup fails if USB4 link available bandwidth is too low
to allow USB3 Maximum Supported Link Rate. In reality, this limitation is not
needed, and may cause failure of USB3 tunnel establishment, if USB4 link
available bandwidth is lower than USB3 Maximum Supported Link Rate. E.g. if we
connect to USB4 v1 host router, a USB4 v1 device router, via 10 Gb/s cable.
Hence, here we discard this limitation, and now we only limit USB3 bandwidth
allocation to be not higher than 90% of USB3 Max Supported Link Rate (for first
USB3 tunnel only).

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index cb6609a56a03..fdc5e8e12ca8 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -2064,26 +2064,21 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 {
 	struct tb_tunnel *tunnel;
 	struct tb_path *path;
-	int max_rate = 0;
+	int max_rate;
 
-	/*
-	 * Check that we have enough bandwidth available for the new
-	 * USB3 tunnel.
-	 */
-	if (max_up > 0 || max_down > 0) {
+	if (!tb_route(down->sw) && (max_up > 0 || max_down > 0)) {
+		/*
+		 * For USB3 isochronous transfers, we allow bandwidth which is
+		 * not higher than 90% of maximum supported bandwidth by USB3
+		 * adapters.
+		 */
 		max_rate = tb_usb3_max_link_rate(down, up);
 		if (max_rate < 0)
 			return NULL;
 
-		/* Only 90% can be allocated for USB3 isochronous transfers */
 		max_rate = max_rate * 90 / 100;
-		tb_port_dbg(up, "required bandwidth for USB3 tunnel %d Mb/s\n",
+		tb_port_dbg(up, "maximum required bandwidth for USB3 tunnel %d Mb/s\n",
 			    max_rate);
-
-		if (max_rate > max_up || max_rate > max_down) {
-			tb_port_warn(up, "not enough bandwidth for USB3 tunnel\n");
-			return NULL;
-		}
 	}
 
 	tunnel = tb_tunnel_alloc(tb, 2, TB_TUNNEL_USB3);
@@ -2115,8 +2110,8 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 	tunnel->paths[TB_USB3_PATH_UP] = path;
 
 	if (!tb_route(down->sw)) {
-		tunnel->allocated_up = max_rate;
-		tunnel->allocated_down = max_rate;
+		tunnel->allocated_up = min(max_rate, max_up);
+		tunnel->allocated_down = min(max_rate, max_down);
 
 		tunnel->init = tb_usb3_init;
 		tunnel->consumed_bandwidth = tb_usb3_consumed_bandwidth;
-- 
2.43.0


