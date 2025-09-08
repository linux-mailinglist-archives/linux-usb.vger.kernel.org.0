Return-Path: <linux-usb+bounces-27744-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45818B495A1
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00796200AF6
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32A331A07B;
	Mon,  8 Sep 2025 16:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1Uvhl7I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B373191B5
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349165; cv=none; b=JA5uMs61uv+ZWPWgEhHB0/pEh3SyEslr23eCZjdhbPrnNWHLuRfE1cKL6gTGrOBPU7SbEAtGlaGZ6/Jo3FRNGLSN6fUHR348XdmXj4vmjQBDF1bYTZ1GoYTHvajMF5ReRVaOcU6eFzU6Nk0s7/O+9a1XBJBEYZn69cqlwbGVSO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349165; c=relaxed/simple;
	bh=h3lBWjg1bnMglz4I5mJfSN57DdqpaPU18aiBeDQezmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kF/aq/SWK+nm1b5dyGT0VcKWNa+eK1oXyTU+vLrMmKAvFCG/Y8o90uJQZoxQobFizAvYb5csT1gqe4RMDpiMgtC5MHTbK9LPJfZSUJlTyUJAZlHRsZkxA6u+d3nGqIXZGoyXRd9jOIcmzhfz+j2jsLyh/Kz/HTJ05Mdj8xWVcEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1Uvhl7I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349161; x=1788885161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h3lBWjg1bnMglz4I5mJfSN57DdqpaPU18aiBeDQezmg=;
  b=j1Uvhl7IP6gm0bsN/TiW34Fe1AobhJuaAfIRfe7YZud0ja5NJjtSUfh7
   pPOXW/fdEQhZKieX0uTu90teQhal3WVffyVMDX6x/KCFgR7oOnSVB2VK/
   JAlj3p3o+dYKZQpgu/87TTSe9gYGMe7ooOORuJ2Ltu+ymg5up+TUGuhzK
   m5w2JfT0o0AXLWMmwxhj+l5YOQaPzPKhp2HjyNk4i+u3cmlSlB0CzGfey
   T4WPxJBGS0hMjKKP7FERseoVczv+oKzWGCfdJReQYf5r7bbq5j1QP0GsN
   w0W3LFCTimQEF4EXLSTA2eTW/1YNW6zD1LENCTcAZcFrmoNRKpjnS2g93
   A==;
X-CSE-ConnectionGUID: KLDsXCFbT+W2sJPcp3vdpg==
X-CSE-MsgGUID: wo7stZYxQBygJTwfatd/Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443074"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443074"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:37 -0700
X-CSE-ConnectionGUID: Ie+g2yK5TwWiqxCe5P0hOA==
X-CSE-MsgGUID: 58AjfVAgQDSu2ir030LGAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291161"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 15F8DAA; Mon, 08 Sep 2025 18:32:31 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 22/26] thunderbolt: Update tunnel.h function documentation
Date: Mon,  8 Sep 2025 18:32:26 +0200
Message-ID: <20250908163230.2614397-23-mika.westerberg@linux.intel.com>
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

Make tunnel.h function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 5e9fb73d5220..2c44fc8a10bc 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -142,10 +142,11 @@ void tb_tunnel_deactivate(struct tb_tunnel *tunnel);
  * tb_tunnel_is_active() - Is tunnel fully activated
  * @tunnel: Tunnel to check
  *
- * Returns %true if @tunnel is fully activated. For other than DP
- * tunnels this is pretty much once tb_tunnel_activate() returns
- * successfully. However, for DP tunnels this returns %true only once the
- * DPRX capabilities read has been issued successfully.
+ * Return: %true if @tunnel is fully activated.
+ *
+ * Note for DP tunnels this returns %true only once the DPRX capabilities
+ * read has been issued successfully. For other tunnels, this function
+ * returns %true pretty much once tb_tunnel_activate() returns successfully.
  */
 static inline bool tb_tunnel_is_active(const struct tb_tunnel *tunnel)
 {
-- 
2.50.1


