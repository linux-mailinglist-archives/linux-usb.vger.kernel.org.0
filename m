Return-Path: <linux-usb+bounces-21434-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C73DAA54E29
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F05313A8E0B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665AF176ADB;
	Thu,  6 Mar 2025 14:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K8++kpHr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721931624E4
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272568; cv=none; b=amSTEpC7ay2AYOHE2GH0HZIop2oImm6gMPPA5V1+VutXTThw9msurImM2P9QFJU4p3Q2HRRO3v0sGLTdWwRg0x7DwZLPph3McY7Wpkpg4aAGtoQ5u7GFVUQh/Atn/ieIPsSDw8B7U1CakwgMfK4H3b24NE5zj+8lHOI5WBVj16M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272568; c=relaxed/simple;
	bh=nTD0UkiUHT9LHNQczzrsJVllYHYdZIEvl81sro3tMrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ooqABDAHDopPd28JYpH18vpZnOLLf3pa3qRV/LXL/EQZUbq8RJAq/9BV/gMvCu0F3TE+lc7I005ZYOQWk7rNPYIEnq4i8R4rD3OXBTu0HtncflwU7Rv7b6k2F0mMa9x/MvSITGnVhYg95aloAB++D9hjd83HII8fZWUN6sBroLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K8++kpHr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272567; x=1772808567;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nTD0UkiUHT9LHNQczzrsJVllYHYdZIEvl81sro3tMrA=;
  b=K8++kpHrqhGbWLoeg8+NGSLpkO02KePFolnyMQ+FAQsvkAuZA6XAlkcO
   mBbVxC+Fluk7C/IZXIBRxlAXCULjmzOKvhkfpxJogSLJCrq7ciTtNOH8A
   SovmBMlJZZNKMhRBIBSnV9SFTwFahJZCpQLvf7r0QpSAAJCzdjZu68tAg
   WUepmFcMy3EuSq7fnCW1Rc/wa7CXV+pY4yfVqEJ6ExhD9yqpXwsdfQ2I1
   1lBsDUhueJKOiV1cae/C2SVKGRBh3tM70+1Yue7DbFzTLO+eb8D+RsW5Y
   foIShXw6WYppS0tIedbjkMhDMXceZ/l6/wsY0y23X4uWlQFt6tczXHTfS
   Q==;
X-CSE-ConnectionGUID: gRl4PpyHRGWkMD3lzd30sA==
X-CSE-MsgGUID: mCaSwMJCTJKSpCrENRxy+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67657064"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67657064"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:49:26 -0800
X-CSE-ConnectionGUID: HCCSyVmlQIqc4c/c72PaCQ==
X-CSE-MsgGUID: 0GhSinJPSEyAK2MeF0jkfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954786"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:49:25 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/15] xhci: show correct U1 and U2 timeout values in debug messages
Date: Thu,  6 Mar 2025 16:49:40 +0200
Message-ID: <20250306144954.3507700-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
References: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

U2 value is encoded in 256 microsecond intervals, show in microseconds.
U1 value is in microseconds. debug message incorrectly showed "ms"

Unwrap debug messages while we anyway modify them.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 45653114ccd7..3f2cd546a7a2 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4755,8 +4755,8 @@ static u16 xhci_calculate_u1_timeout(struct xhci_hcd *xhci,
 	 */
 	if (timeout_ns <= USB3_LPM_U1_MAX_TIMEOUT)
 		return timeout_ns;
-	dev_dbg(&udev->dev, "Hub-initiated U1 disabled "
-			"due to long timeout %llu ms\n", timeout_ns);
+	dev_dbg(&udev->dev, "Hub-initiated U1 disabled due to long timeout %lluus\n",
+		timeout_ns);
 	return xhci_get_timeout_no_hub_lpm(udev, USB3_LPM_U1);
 }
 
@@ -4813,8 +4813,8 @@ static u16 xhci_calculate_u2_timeout(struct xhci_hcd *xhci,
 	 */
 	if (timeout_ns <= USB3_LPM_U2_MAX_TIMEOUT)
 		return timeout_ns;
-	dev_dbg(&udev->dev, "Hub-initiated U2 disabled "
-			"due to long timeout %llu ms\n", timeout_ns);
+	dev_dbg(&udev->dev, "Hub-initiated U2 disabled due to long timeout %lluus\n",
+		timeout_ns * 256);
 	return xhci_get_timeout_no_hub_lpm(udev, USB3_LPM_U2);
 }
 
-- 
2.43.0


