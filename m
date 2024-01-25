Return-Path: <linux-usb+bounces-5507-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE5E83C680
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 16:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08AC128AD0B
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 15:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824E77316D;
	Thu, 25 Jan 2024 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEl0ptql"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BEB6EB6D
	for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196374; cv=none; b=a9LG7KnhXyIImGe2x/6smTLTkI1oxA5ADIecOZpTL9aLxPiIbyjdzKJi+4B80ed0G99JGMAxTIdaRplvSX73gFiwrG5sPZj/uaZy27HeyYxss53lhx+WL5U4NqP27Y+P138si/aMaxnPB6CT55QgbzEdmQLPqWwOhc0y/kV60Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196374; c=relaxed/simple;
	bh=7+2tR3u66bv4GLjuFdnhuZS81nyqklScPyEApxlpV9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZAy4Ku9aYsoGw7QwXCPCaLM5PuA9kqiyHLXiY1hEP9wjt5LMOTsD7EDbqWh+2Hl1F9/CEgL0t8u/uYdHWkspTJ/3KLu6lNPl1B26YBF8A03+bQLT2TK8Nki7xLe0I4VvYpUtdf9+Unjsg3cw87UBuAMdpo99f8/ABWJBybfNrKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEl0ptql; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706196372; x=1737732372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7+2tR3u66bv4GLjuFdnhuZS81nyqklScPyEApxlpV9Y=;
  b=NEl0ptqlv3LVMadVLcp8eKM7XQCgehh/S8IJKA4pfOyBoYauP5wHe5qv
   L/q+yU6v9CvUVnHqQmrEHJGN1WIM+6M8j2m8XWlHdaQkodyKIrQznxIy4
   Xf0NjdWF5B3HdUzjzR2xwPsVYtI+wnrXa13oEyzGg3Urf0BFrAXjTsxM4
   dlBUoWOy8yAtJgFEAcYUI0QkI8P7qcZnYc14mmAz8tmPb3OkddOJPqvvn
   banKtMFgbo0DYKFfwyEDrzxz3Vn3KJQq95eNI2XmkunfmSFCtYk2PAOkk
   zGcoT7VqTjyFTUPygDlS3KVEhB4UxKGYg2qNxz/oSeSbcecrbhJBifltF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="23651353"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="23651353"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 07:26:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="857099928"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="857099928"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2024 07:26:10 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH 2/4] xhci: fix off by one check when adding a secondary interrupter.
Date: Thu, 25 Jan 2024 17:27:35 +0200
Message-Id: <20240125152737.2983959-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125152737.2983959-1-mathias.nyman@linux.intel.com>
References: <20240125152737.2983959-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sanity check of interrupter index when adding a new interrupter is
off by one. intr_num needs to be smaller than xhci->max_interrupter to
fit the array of interrupters.

Luckily this doesn't cause any real word harm as xhci_add_interrupter()
is always called with a intr_num value smaller than xhci->max_interrupters
in any current kernel.

Should not be needed for stable as 6.7 kernel and older only supports
one interrupter, with intr_num always being zero.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-usb/e9771296-586d-456a-ac24-a82de79bb2e6@moroto.mountain/
Fixes: 4bf398e15aa4 ("xhci: split allocate interrupter into separate alloacte and add parts")
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d00d4d937236..a7716202a8dd 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2322,7 +2322,7 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 	u64 erst_base;
 	u32 erst_size;
 
-	if (intr_num > xhci->max_interrupters) {
+	if (intr_num >= xhci->max_interrupters) {
 		xhci_warn(xhci, "Can't add interrupter %d, max interrupters %d\n",
 			  intr_num, xhci->max_interrupters);
 		return -EINVAL;
-- 
2.25.1


