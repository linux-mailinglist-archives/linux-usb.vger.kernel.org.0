Return-Path: <linux-usb+bounces-19419-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA55A13DF7
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 16:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BA413A2BC4
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 15:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6668922BAB8;
	Thu, 16 Jan 2025 15:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlFyX5hP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFC81DE881;
	Thu, 16 Jan 2025 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737042086; cv=none; b=PfTa7/QBTDwTSr/IRcwwbTmCxTYX//gKiWl+HpO70usRh4exKK/jAih8lfUqOdaEDzYTVGq/RJZAMb0vnLzUqZ/UcsHuo3sgRq9F8U42wHoAjQGhi0O0Fy+4COpfX6b1G8Jbye+j33jvSiAK6oBejwGblVx9UP/hFXp4RC7kqW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737042086; c=relaxed/simple;
	bh=1YRtKdufJ66QRGiHNaq8nFYWhW1PC8Q2ctgm/fk0hGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqe7sn3XtVArk7gFznIp1Wv/CZQavVaUw19aG30pEZ1WfXliUJd9CsItdTgrHGE/g454plJeQhMWeZ1eRt1g1bGTHER5QkJPpFhn/Pzq/8Bcmwd19HVaw/ncOwfUha/llj12cPUmW1pFoVL1GsR5LnKZMRBkx1MkwEbVNKRhsEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlFyX5hP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737042084; x=1768578084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1YRtKdufJ66QRGiHNaq8nFYWhW1PC8Q2ctgm/fk0hGQ=;
  b=VlFyX5hP1wA13KN+veTuWmn0vmJVomLlE4qnSKEnJsixJvTzT0YZtqfA
   NtI1CHNy98HSnICQjpvCiW/25RPWKYieT6udczz7pW7MMtoJ6da9l0Xc0
   fcvFUUQGpYyGEYHvr7wVfxLsFSRYGXYLFMsTBbkg087OsYjWUatMXcimq
   9UXF7Yo+dmVoKDlk1Pn0niV/1kvMs1o3vT+fB44eHsHHvi1tarKFPZMQf
   5Gk8VxpGjc8kzmVZi190U0SIWvFZKhP6hhJJP6cvm6Azzo8Tr4ALW8bZO
   P+AepRSNBI6r6/F56VKsRVKPmwih3cadWqkq28CPwP0CZghJ14rc4wN36
   A==;
X-CSE-ConnectionGUID: 5m9fIdQKQomwTITG2v1xEA==
X-CSE-MsgGUID: L0Q5Sz6wR/maHcyewlcGyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37554146"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37554146"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 07:41:23 -0800
X-CSE-ConnectionGUID: OOHEycQGQ4+qEbOgUdpaPQ==
X-CSE-MsgGUID: ShGynzN0RPCF6cU7VbWyBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="110512090"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2025 07:41:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 31E64478; Thu, 16 Jan 2025 17:41:19 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ferry Toth <fntoth@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] usb: dwc3: gadget: Add support for snps,reserved-endpoints property
Date: Thu, 16 Jan 2025 17:40:47 +0200
Message-ID: <20250116154117.148915-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snps,reserved-endpoints property lists the reserved endpoints
that shouldn't be used for normal transfers. Add support for that
to the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/dwc3/gadget.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 31a654c6f15b..3f806fb8b61c 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3349,14 +3349,50 @@ static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum)
 	return 0;
 }
 
+static int dwc3_gadget_parse_reserved_endpoints(struct dwc3 *dwc, u8 *eps, size_t count)
+{
+	const char *propname = "snps,reserved-endpoints";
+	int ret;
+
+	ret = device_property_count_u8(dwc->dev, propname);
+	if (ret < 0)
+		return 0;
+	if (ret == 0)
+		return 0;
+	if (ret > count) {
+		dev_err(dwc->dev, "too many entries in %s\n", propname);
+		return -EINVAL;
+	}
+
+	count = ret;
+	ret = device_property_read_u8_array(dwc->dev, propname, eps, count);
+	if (ret)
+		dev_err(dwc->dev, "failed to read %s\n", propname);
+
+	return ret;
+}
+
 static int dwc3_gadget_init_endpoints(struct dwc3 *dwc, u8 total)
 {
 	u8				epnum;
+	u8 eps[DWC3_ENDPOINTS_NUM];
+	u8 count, num;
+	int ret;
 
 	INIT_LIST_HEAD(&dwc->gadget->ep_list);
 
+	ret = dwc3_gadget_parse_reserved_endpoints(dwc, eps, ARRAY_SIZE(eps));
+	if (ret < 0)
+		return ret;
+	count = ret;
+
 	for (epnum = 0; epnum < total; epnum++) {
-		int			ret;
+		for (num = 0; num < count; num++) {
+			if (epnum == eps[num])
+				break;
+		}
+		if (num < count)
+			continue;
 
 		ret = dwc3_gadget_init_endpoint(dwc, epnum);
 		if (ret)
-- 
2.43.0.rc1.1336.g36b5255a03ac


