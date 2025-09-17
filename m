Return-Path: <linux-usb+bounces-28240-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A560CB81E3C
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 23:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DDD03A7732
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 21:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267412D8774;
	Wed, 17 Sep 2025 21:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LD5S+0Dj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8EE2882DB
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 21:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143294; cv=none; b=T8uzL5NMUj5aNYr9zB2BQqkJpUNCQShou69BvSR2Qg3p3O2/3bbGpEn0A2xbm7uCz/WW595jAOyyHi0SAzV4cJyH8tWLyIndwhxWTELq7iX8hPzAw1/+VLp0J6BGNskK2advAyJ+DHGVskev35c+3OZGlWaK5brPsdV21qPiDGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143294; c=relaxed/simple;
	bh=BOpAUuezKh9YyeOytrJGgRumLkfXqivZIr7VyBRZEzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b0YrDg4zUrD2dU+qM10CgdcZYGUkgHYUsZgAANBUvHq7ODp9JCF8zu3CgTFKMB7u2KacZ8wkyZZF8ptcmMdqujUdrlaSjGEajrSuNfKMdyEa3bvnIoUe+vIEfyB4QDKi+nrMdj2lwurCBPxa8yLLv49Mab/2mENjeG3l3xKvRuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LD5S+0Dj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758143293; x=1789679293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BOpAUuezKh9YyeOytrJGgRumLkfXqivZIr7VyBRZEzc=;
  b=LD5S+0DjlKlpAqwPOBOEWP8Y2u5MIGGVbCFui+gxvPn8oZeuEICwhrxC
   6w5VoiN/1WmVOmNVopkAGS1zK2Pb/QUxnuz+AbqdUorZ1Sxhz7sOcEgaU
   ++GPQ7+JSMcnOy9fvglXoKvsfyAbOwr2swX+uIsAkzK/KK1q1005eUK1Y
   uNWGmOVuk/lQOvorVBf0C5C76LssaF89e+okX8JFRA4z7IbtEpdmQiBEp
   BAxr/EzS9cfa31BNSKNNdx1ZEvqqicIcgFLu29+kPOG+Q/jZCuyOIIaPd
   72tx2weLTG7hqJVUDOFxHMxKk8+JkOeVNLPqdEg4hfIaCnKZOZLvcrX5y
   A==;
X-CSE-ConnectionGUID: FuWqBGaPTCKDuoVSBOQnAA==
X-CSE-MsgGUID: UZO9oei8QGOX/XiHFpt2IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="48038206"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="48038206"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 14:08:13 -0700
X-CSE-ConnectionGUID: tZ/0crQuSUmCEhpypmrg3g==
X-CSE-MsgGUID: LvxFOx3zRYGnQyy5OXz/VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="175800192"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.42])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2025 14:08:12 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/6] usb: xhci: Update a comment about Stop Endpoint retries
Date: Thu, 18 Sep 2025 00:07:21 +0300
Message-ID: <20250917210726.97100-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
References: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

Retries are no longer gated by a quirk, so remove that part.
Add a brief explanation of the timeout.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 6309200e93dc..e3d0e2e0312e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1262,8 +1262,9 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 			 * Stopped state, but it will soon change to Running.
 			 *
 			 * Assume this bug on unexpected Stop Endpoint failures.
-			 * Keep retrying until the EP starts and stops again, on
-			 * chips where this is known to help. Wait for 100ms.
+			 * Keep retrying until the EP starts and stops again or
+			 * up to a timeout (a defective HC may never start, or a
+			 * driver bug may cause stopping an already stopped EP).
 			 */
 			if (time_is_before_jiffies(ep->stop_time + msecs_to_jiffies(100)))
 				break;
-- 
2.43.0


