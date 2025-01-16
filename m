Return-Path: <linux-usb+bounces-19424-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B85A13EC2
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 17:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CCFA7A376F
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 16:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E01A22BAD7;
	Thu, 16 Jan 2025 16:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0Mzh91c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D97F35968;
	Thu, 16 Jan 2025 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043623; cv=none; b=Yg+zjWeN6gHFppgh/ugmL3ZyrNetRbErR+FuzjKJmxuX3OcQSqcaZ1I3cDdLZzGIqo8PoW5zcYQ1wweojNQf5hspHwgX3ygYhUxLiEfnDj425BR6OUyomT4ADwuMO4YDKztxbi/CbrbCYgDkjRaxhDOh2LUO5IP3/DVwE6QqaU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043623; c=relaxed/simple;
	bh=jLJGlS2wxsWzA5wl2pSETW/k3D4p1AdB49jdgklDew4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DCOTPxx5pc2mA6uxB2YRC9B/94wMNOaeN4NjipNYjOea1SHcDAiO9Ttz5XMpWctKGpG/pmWkGWNSPxIEgWRZ3eUjaBNqnrNE/1J9rI7mzcYirkdFT5F3F55LOCo8OuM1w0wAo+LLktLzUX0TnfttLGkIbAbAx9VDitfBiRdyqRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0Mzh91c; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737043622; x=1768579622;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jLJGlS2wxsWzA5wl2pSETW/k3D4p1AdB49jdgklDew4=;
  b=N0Mzh91cKtYTNP7X8ohZM9t48z2h4HcD2ZMLVdJEBp9a4JMEBn9AmjAo
   swxDsObZpLFH/On5BPDfUuMsfLPUfSJDq8juJ3S5XL8XTwzg+28mKYYPf
   HYhvACYhaauK9m+nDSgy6Kv9CD2cNct8v99OGIuQxfxrszuzCdkxkei6c
   7SDHIbrq5mdYfcnmMZ1N2xgymMV2vWPrNHIu2wPx4d2IT2p9d/3LDvldk
   BxNqXTJduVNJfZLcsYA4ibso1SbjivFF0b3MHAlgSEP/XLWoK6sRK1E2W
   kWC2vQ3CypQegOKDE3krCejV/OUB7GsCGX5bV/RRdfPEFu3NW3gWGqfoy
   g==;
X-CSE-ConnectionGUID: XlvaqDXcRe6rYoCADQvhZw==
X-CSE-MsgGUID: ONYD7NYsSK2AhO0a+yA5MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="36721031"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="36721031"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 08:05:52 -0800
X-CSE-ConnectionGUID: qClAROq2SFO9bhefhfj4dw==
X-CSE-MsgGUID: OR8GYZD6RbyRf8OR34zTqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="106119340"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2025 08:05:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 26D7F39C; Thu, 16 Jan 2025 18:05:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] usb: hcd: Bump local buffer size in rh_string()
Date: Thu, 16 Jan 2025 18:05:43 +0200
Message-ID: <20250116160543.216913-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC is not happy about the buffer size:

drivers/usb/core/hcd.c:441:48: error: ‘%s’ directive output may be truncated writing up to 64 bytes into a region of size between 35 and 99 [-Werror=format-truncation=]
  441 |                 snprintf (buf, sizeof buf, "%s %s %s", init_utsname()->sysname,
      |                                                ^~
  442 |                         init_utsname()->release, hcd->driver->description);
      |                         ~~~~~~~~~~~~~~~~~~~~~~~

Bump the size to get it enough for the possible strings.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/core/hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 0b2490347b9f..a75cf1f6d741 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -415,7 +415,7 @@ ascii2desc(char const *s, u8 *buf, unsigned len)
 static unsigned
 rh_string(int id, struct usb_hcd const *hcd, u8 *data, unsigned len)
 {
-	char buf[100];
+	char buf[160];
 	char const *s;
 	static char const langids[4] = {4, USB_DT_STRING, 0x09, 0x04};
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


