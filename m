Return-Path: <linux-usb+bounces-5931-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4664E84B5E7
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 14:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF1CEB2231C
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 13:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB31130AC5;
	Tue,  6 Feb 2024 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsx5pjKp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4036712FF68
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707224640; cv=none; b=QxNBfFzaNPDCYOtUTFHPQNivvb1FBExiw03g/5qo7mML+u7rIcusCQ3q2of5FwdkaTIEFquGZD8Gz1XET+dHMM1l+tHZ7XqGnmjuchKzJAlfHBAfR0OQvhVLJT83rxOwkgT0/osraECC3jIwAJb7EbR1Lj47S9SnSnFf3WTJrDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707224640; c=relaxed/simple;
	bh=DG2ETpLs4dhZ4JwGEa3PYT8ZwSlOq4693Qx5hX3e8iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbYJTnpSdYkH/R/iFxW/bKcX0FdWs/GHLiGksLik7i4J31tXvDI12hAwaSPVINEkZZOVkVn2cWlcbazT7+rQV7BQQxHarqRxHysqK6bhOis9Z4rt1MXN+E3LbEntQl1GIFHwaNZfITKtN1xtZQ7agPYU+a38KUlBF/iEG+XnVeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsx5pjKp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707224639; x=1738760639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DG2ETpLs4dhZ4JwGEa3PYT8ZwSlOq4693Qx5hX3e8iE=;
  b=lsx5pjKpnio8OgJSmVuwef5D8ufnZXmL8sHlUZ0VtQDO0Jh+Q/xR0yQM
   AlyfJuAPqyaRlqmNMseloVxC08HCEuodkpZqOcSX+lmYDrYTkIjQDg5zH
   thctUIVapF3atqYf1HIqjJSdMmmFlXBGRHWLLQ53QXXUzeTHIlL/cGUOx
   c9nX+I7DV0Ch8FSTA6XsttmLGGbyuH9GSY1zdT2txBue/PO9blUxsHLhE
   iEPcBH3vi9Jx70rrxfSuzLUU3J+CVD/bGuOCbvmXMsKmG2axjfi/8q2Bc
   dX/YI0aQgIUtUnU7YLjZ5O5+J//leTyYY9EKshSoDtNNT+cKJ747O2ogC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="642154"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="642154"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933455849"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="933455849"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2024 05:03:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 17062F4D; Tue,  6 Feb 2024 15:03:55 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Sanath S <Sanath.S@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] thunderbolt: Correct typo in host_reset parameter
Date: Tue,  6 Feb 2024 15:03:54 +0200
Message-ID: <20240206130354.1208816-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206130354.1208816-1-mika.westerberg@linux.intel.com>
References: <20240206130354.1208816-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It should say USB4 now since we reset by default all USB4 host routers.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 91e26b982b0b..7af2642b97cb 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -48,7 +48,7 @@
 
 static bool host_reset = true;
 module_param(host_reset, bool, 0444);
-MODULE_PARM_DESC(host_reset, "reset USBv2 host router (default: true)");
+MODULE_PARM_DESC(host_reset, "reset USB4 host router (default: true)");
 
 static int ring_interrupt_index(const struct tb_ring *ring)
 {
-- 
2.43.0


