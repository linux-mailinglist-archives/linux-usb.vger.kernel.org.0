Return-Path: <linux-usb+bounces-20875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FD0A3DD3F
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 15:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C65F73BAA1D
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603E51FCF45;
	Thu, 20 Feb 2025 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvVa1DoJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C3F1FBEB7
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740062512; cv=none; b=nrcIdfwq/5krY8ruhmrYb52Xgc4Ryq8F1fT2QEBA4bxJXinF8Ns78UieT30OidGy0u3xeZm1bojPilzp/9+lsxo8X0vthISjEPnpMQswic4migeX6TJ8dXdqxuhvWvqfYhkwEho7HTZRLmaTwnR0/oLe4PRVLgqIbm+B2EpkBSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740062512; c=relaxed/simple;
	bh=9xhPN2Dq1xefu0LKZ1+Thk5SLlgmDgwjMvIOwgM3Dcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L2+EQKFp/m9Yn+5q4Xi3hsH7LCGZc0zuiT9Y8yFA0KCe6IKytDo35T2nwdjCrl/Usdgin4UtgjcFBVH25HEmuefWWCCnaUGfcYeiRIpWW7yvTIYJHAgnFiP0EPCzSu4jLqY8nI4qRKuInUnUGZ2FkwUhfb7KHhsXIl8vYPlJz+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvVa1DoJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740062511; x=1771598511;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9xhPN2Dq1xefu0LKZ1+Thk5SLlgmDgwjMvIOwgM3Dcw=;
  b=XvVa1DoJrazMo0Dz9ghpjt0LMWOgH6N9JekD0aOOLrbzeYJUz3L/h+b2
   vu3cHfVbIC+LmVmGzHlOxkFsr5ip/YwjBHqWW2dtEbdYGfQnKYJu++qKn
   QaT/B0eAhlJu2ZoB29GXreVGpvrLxZBRiN0qhiTpnQsEbmg+6iUGxnH6k
   svWurN+FmqhF65N935L/GlgwLNOZKQIjpPOAE2/QDYZafGNonyc2LZ9Zz
   xoJKshpnWauwmawn+xX9fis5ce2dg+WbeEaB6FTTXEMleFroq5UU5xW/g
   0YqWb6GsNI4lJiUGqoobiX5pwaCWuxcHy5QPFEdjQMam02VdtC3no4FCS
   g==;
X-CSE-ConnectionGUID: W5YPdW0aTwKwzR2wgyC6Ng==
X-CSE-MsgGUID: g/zSsF89Rn2os9gR0S3c4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41049645"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41049645"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:41:51 -0800
X-CSE-ConnectionGUID: HT1FkqRsS6SznFj7PVVYbQ==
X-CSE-MsgGUID: 9L4Fa6J4RcifR5ZQVA1Yiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="138260504"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 20 Feb 2025 06:41:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 307B3123; Thu, 20 Feb 2025 16:41:48 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v4 0/2] usb: xhci: page size improvements
Date: Thu, 20 Feb 2025 16:40:35 +0200
Message-ID: <20250220144037.2723533-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct off-by-one page size debug message.
Set page size to the xHCI-supported size, instead of 4KB.

Clarified the interpretation of the xHCI spec 1.9 regarding page size.
The correct interpretation is that only one bit is set, indicating the
only supported page size. This is supported by the following sources:

Section 6.6.1, PSZ:
  The PSZ calculation uses the page size bit and would not work with
  multiple bits set.

Section 7.7, Implementation Notes:
  "This version of the xHCI spec only allows an implementation to support
   a single page size, as reported by the PAGESIZE register."

Version 4 changes:
 * Replace manual power of 2 check with is_power_of_2()
Version 3 changes:
 * Rebase agains Linux 6.14-rc1.
 * Repalce variable int 'i' with unsigned int 'val'.
 * Rename temp variable 'page_shift' to 'page_size'.
Version 2 changes:
 * Added handling for invalid page size register values.

Niklas Neronin (2):
  usb: xhci: correct debug message page size calculation
  usb: xhci: set page size to the xHCI-supported size

 drivers/usb/host/xhci-mem.c | 34 ++++++++++++++++++----------------
 drivers/usb/host/xhci.h     |  8 ++++----
 2 files changed, 22 insertions(+), 20 deletions(-)

-- 
2.47.2


