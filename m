Return-Path: <linux-usb+bounces-9827-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C688B2D9B
	for <lists+linux-usb@lfdr.de>; Fri, 26 Apr 2024 01:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E8101C212E6
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 23:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71102156878;
	Thu, 25 Apr 2024 23:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KW+3G8t/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D68153BF9
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 23:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714088112; cv=none; b=CqYLhb5kjFlaxE93QLrAjbpWuICh91mo4J48DzEm6ZCmpYjGxYTBRECbtZaVQMfa0mX6DkO2rHj9JSvDikaVOrv8BLR2CI+iQp/NknO5Mq5C/P7GBZljDZ3hyYOJcntpNVVMkB3Q47JXXIt91y70mwEoCgaHSIemxkvnPRK6Lz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714088112; c=relaxed/simple;
	bh=nmuSLQpGGOKdnxMVHIOoJd9+oRkX51r+/qrd3pHMev4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iMK+cKNHuQi9M1WtPpoGCwnqpJwWJyPn+tlXiUiWKoelBgAFRjVVFXj8MnpEqxRM0sVTm55jIcaJbJl/XZD6HMxxBuK2GO9ShQud4DDcaPmVQpaMpPb9POu4jsdaNL/ZrJU1FiOJsVqowBTIAwcEw9N9K9yMAYDcIVWoaFPm9hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KW+3G8t/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714088111; x=1745624111;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nmuSLQpGGOKdnxMVHIOoJd9+oRkX51r+/qrd3pHMev4=;
  b=KW+3G8t/vwmqsmeWikgEEi34o3xyIAiuhuwxpfJ174eR3pkFwqRNQwYi
   qMI8NhGxH713Tc7Rt32tIvE9fBw7oTFLOqmdckbfeVdkSHvmmvBcEzw0y
   1W6wujcqMcYJzJL+pxcf8CGi28XdUAmfIUbz0YgQ6cC42OwoC9FeahEdq
   v7K+W/0z29FcgoA2tX5DvL0/FGxdso5HowbV9JnxnO03RM1pwY7Nmwwh0
   zNAOETBAXRuziL05zsw/Mqz3nef7JvHnhpCfP841lLNXMv5BI0rp27w0A
   eFhEJv4zSQDqXPj9iZr7aPmwRqWjqSAxHK+NLzIshsUldFPOQMPThLEvE
   g==;
X-CSE-ConnectionGUID: hxgAG826SRWtFPg7bn6Alw==
X-CSE-MsgGUID: 3vFIA4FkT2ueepgY/qjoHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9932345"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9932345"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 16:35:10 -0700
X-CSE-ConnectionGUID: 4UlywywsRWuNm75HsdXKYw==
X-CSE-MsgGUID: QxMoH6nQTrGvrWPH4u5aAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="56414509"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by fmviesa001.fm.intel.com with ESMTP; 25 Apr 2024 16:35:08 -0700
From: Gil Fine <gil.fine@linux.intel.com>
To: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com
Cc: gil.fine@intel.com,
	linux-usb@vger.kernel.org,
	lukas@wunner.de,
	Gil Fine <gil.fine@linux.intel.com>
Subject: [PATCH] thunderbolt: Fix kernel-doc for tb_tunnel_alloc_dp()
Date: Fri, 26 Apr 2024 02:37:54 +0300
Message-Id: <20240425233754.3510505-1-gil.fine@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of no bandwidth available for DP tunnel, the function get the arguments
@max_up and @max_down set to zero. Fix the kernel-doc to describe more
accurately the purpose of the function.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 1a3b197001da..41cf6378ad25 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1435,10 +1435,10 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
  * @in: DP in adapter port
  * @out: DP out adapter port
  * @link_nr: Preferred lane adapter when the link is not bonded
- * @max_up: Maximum available upstream bandwidth for the DP tunnel (%0
- *	    if not limited)
- * @max_down: Maximum available downstream bandwidth for the DP tunnel
- *	      (%0 if not limited)
+ * @max_up: Maximum available upstream bandwidth for the DP tunnel.
+ *	    %0 if no available bandwidth.
+ * @max_down: Maximum available downstream bandwidth for the DP tunnel.
+ *	      %0 if no available bandwidth.
  *
  * Allocates a tunnel between @in and @out that is capable of tunneling
  * Display Port traffic.
-- 
2.25.1


