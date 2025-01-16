Return-Path: <linux-usb+bounces-19420-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2417CA13DFA
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 16:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D807C16A606
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 15:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B4922C9FB;
	Thu, 16 Jan 2025 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgBgaj1u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F9722B8D7;
	Thu, 16 Jan 2025 15:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737042087; cv=none; b=D+kI1L02P6sE+LLwMqlR6MWDS9HyyNMdoWsvQbigMrCi2QCcm+3Wr5pZD/VvNiVJgZksyBFGVaPNZ/uCdsX1rzjCAd6OnFwhj7G+qA9xcu6SUbckNGEnpaMzDbzv0GPWpe3jUjtzrgwzR1O2WHqHOLUEPpLOkpzIRrVsTqVL7Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737042087; c=relaxed/simple;
	bh=Ur1z7qkySqSygcOIr6YQAdQBnwfZlwJ3Mklwq6MEZKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WSMDftHyq1IIaF2ihn6h4WuKvHzrjql46Dcy5M/KcJg6zs5iOdF6wP/5u4rLx/gJbNwGRfo+OW2vqDvy03ocpJAiBYiac7TLumFRHMoMAYmAZaDuxXgdxoZQnUDgASzo7eF30XuidFb+95p6XK/8UZL4DUitIu970/q5N5mUUow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgBgaj1u; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737042086; x=1768578086;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ur1z7qkySqSygcOIr6YQAdQBnwfZlwJ3Mklwq6MEZKw=;
  b=NgBgaj1ukVDb60yz7LC8iUag42Pct5Z2/qSNJFxe9hIe3WPm1tHSGeeP
   UwtarASowruBfgOBvkur5dgbj15tkxpRTkuXTOM00t7zk2zOCt9pdrNHG
   MRDEXuH5FI+lV0ukvCIjmIgfwnQJ7wKP5dP83QMSqHyxWplgqY5Xh21A+
   YyHUOXb6s8SoQO14f+WbgF1PfzNFYTI9h8pa3hnlJkotl50HpnMADgZNy
   UYFxub/yl9mi/mm5d8935IgwBCg1BDuRY012gYXzQuIETMOaP1qbz+IFl
   6DWsZw5uiIVsn/so8wbD7Yj9LudcHIBrX7wnAS2MZbviDnep60ZHtaSqn
   w==;
X-CSE-ConnectionGUID: juBRjVTiSM6Rl/Koku9kQw==
X-CSE-MsgGUID: iOmyeB79QMmMgQLG4mXM1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37554151"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37554151"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 07:41:24 -0800
X-CSE-ConnectionGUID: N9veU0kiQHOd7C8TxCQBHA==
X-CSE-MsgGUID: l+4A5KJbRgGMH1/xj1y1hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="110512091"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2025 07:41:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 172BE39C; Thu, 16 Jan 2025 17:41:18 +0200 (EET)
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
Subject: [PATCH v1 0/3] usb: dwc3: Avoid using reserved EPs
Date: Thu, 16 Jan 2025 17:40:45 +0200
Message-ID: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On some platforms (Intel-based and AFAIK ARM-based) the EPs in the gadget
(USB Device Controller mode) may be reserved for some special means, such as
tracing. This series extends DT schema and driver to avoid using those.
Without this the USB gadget mode won't work properly (those devices that
"luckily" allocated the reserved EPs).

Ferry already tested the privately sent PoC of this, but I ask him again to
re-test this version which is slightly different.

Andy Shevchenko (3):
  dt-bindings: usb: dwc3: Add a property to reserve endpoints
  usb: dwc3: gadget: Add support for snps,reserved-endpoints property
  usb: dwc3: gadget: Skip endpoints ep[18]{in,out} on Intel Merrifield

 .../devicetree/bindings/usb/snps,dwc3.yaml    | 10 +++++
 drivers/usb/dwc3/dwc3-pci.c                   |  9 +++++
 drivers/usb/dwc3/gadget.c                     | 38 ++++++++++++++++++-
 3 files changed, 56 insertions(+), 1 deletion(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


