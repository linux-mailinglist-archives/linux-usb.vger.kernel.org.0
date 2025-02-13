Return-Path: <linux-usb+bounces-20616-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E07A341C8
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 15:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAF07188CC64
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 14:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A6C281358;
	Thu, 13 Feb 2025 14:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeV0kAFk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D413281346
	for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2025 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739456196; cv=none; b=WzcVtkz2Bq5cD/InNmKoCM0Va6pC/yYR5bwNIiB4wWN2GvEI24/bLLcQ1QpTCU4ppN+fuvsWqDg/gbv2NJbv2ZcOOYtOzqop2OPTRXDqHOtzozoTPObIf90HxvSxw8GPjV1+ktKl/svj4+sxmajBLh7gq9m/RFrEDf34TDrj9Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739456196; c=relaxed/simple;
	bh=Nsl28EAZvelpVAETnjUar4PkegEPBoW83SziebYQjcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Itkg6AVieIWgIJzKhtdS/YRK1CbTwTBLZDmwtOUyNhQ3KCtSIb/edgz3lRDpNGgToAg+/CTh/BGse4AJjbYQFZzKJ3ZVaABH7bCl2eVhGaheKcm6SoGX9ZOPRn8lz6gVG+tgosAlGBrvqyneGZJdMrvK+ft58W8tiTzWbRYiEVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeV0kAFk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739456194; x=1770992194;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Nsl28EAZvelpVAETnjUar4PkegEPBoW83SziebYQjcQ=;
  b=HeV0kAFkHR8Ex0bY0ryPbRadX2zAjiiBTYaf2OeRw9OVon6RJK/L2qD0
   7btoim8K3RnQb3JBHYX7lWoXaS1Jd7tn4vexHgAwD5Sy9qDiTbEwRtaqm
   YFeHn9iv0Vj9S60ErAi3f5aLMdSqeRVESJlyS52gWeeFexeNoBjo+zMSo
   y/QvIx7Ty/QiGENFUa8/cwxJoz89DHhwtZX+9nBp0eryGnfZK+us+s3Am
   mx6bHrzjKhc6GVDWyRiSOJOr8VQfi1wxPZg1EGRtcpjTu+NvGLWHk5cSp
   R2uEVXytPGS9j+pSoZPQ/DN3sw+B87c5o92+MuMnlD8V74fkV44XPzvMA
   g==;
X-CSE-ConnectionGUID: bpNKklAiSA6kUhu10vWEVg==
X-CSE-MsgGUID: 1NJDnq2QQvqvSxN003klyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40281463"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40281463"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:16:34 -0800
X-CSE-ConnectionGUID: e+VixGWyS7yXpocfA09OIg==
X-CSE-MsgGUID: QEu2aoUURKeypKhrtoeh1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113684788"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 13 Feb 2025 06:16:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B5B4B1FD; Thu, 13 Feb 2025 16:16:30 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Make tb_tunnel_alloc_usb3() error paths consistent with the rest
Date: Thu, 13 Feb 2025 16:16:30 +0200
Message-ID: <20250213141630.2751958-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Make the tb_tunnel_alloc_usb3() error codepaths consistent with the
DisplayPort and PCIe counterparts.

No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 8229a6fbda5a..072f7e80263e 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -2224,19 +2224,15 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 
 	path = tb_path_alloc(tb, down, TB_USB3_HOPID, up, TB_USB3_HOPID, 0,
 			     "USB3 Down");
-	if (!path) {
-		tb_tunnel_put(tunnel);
-		return NULL;
-	}
+	if (!path)
+		goto err_free;
 	tb_usb3_init_path(path);
 	tunnel->paths[TB_USB3_PATH_DOWN] = path;
 
 	path = tb_path_alloc(tb, up, TB_USB3_HOPID, down, TB_USB3_HOPID, 0,
 			     "USB3 Up");
-	if (!path) {
-		tb_tunnel_put(tunnel);
-		return NULL;
-	}
+	if (!path)
+		goto err_free;
 	tb_usb3_init_path(path);
 	tunnel->paths[TB_USB3_PATH_UP] = path;
 
@@ -2253,6 +2249,10 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 	}
 
 	return tunnel;
+
+err_free:
+	tb_tunnel_put(tunnel);
+	return NULL;
 }
 
 /**
-- 
2.47.2


