Return-Path: <linux-usb+bounces-18587-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B1C9F49DF
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 12:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BA73188B899
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 11:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C2C1EC01F;
	Tue, 17 Dec 2024 11:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lb9fpWMu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677CE50276
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734434994; cv=none; b=AutanfkTt53xr+547YeznL0GrAFEbClcu7P6NG3C1oAcbJF4CXQ5ngnyjUPF0tvG4E84eGu/6ZKw2F1AUSZKYzzwUQAAg968UhQvmBt6SfsaTcp3z5KmyGNfasd5HWRov8UbYb48ekLRa2LW74XXp0Sca9i3hYm4D6ZOjSNxqm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734434994; c=relaxed/simple;
	bh=CckOOVW9cJ68yIcbVwM1IQ6UxMH7Bg0YIRqtS//QPVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JywDamL6Elt2hHtk9In1HqUPaiAYK0L1IN+az/UfWk1YDGXcKFfmU2TDdtSBfFi/oFKeBs72qS2BDeb5VakC1j5BmT5k3T+OT5p10R4PKjY6KPLKJ9QyUeudco9+n9kwXzDhXt64kno+/CkHnrGVGQ5ZvVARi7XXH0YnHZ3YCeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lb9fpWMu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734434993; x=1765970993;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CckOOVW9cJ68yIcbVwM1IQ6UxMH7Bg0YIRqtS//QPVU=;
  b=Lb9fpWMuIBTI5CtcFuSIbgmt+4b4x1wADCOKxvuT6k4SAttHBgmrL4ho
   TglMZlR0YMVWBFnLnMYgjifjceSzzAh2AXYnIXGtbLC8+0Lb976ZMRWay
   feYk1Fitc0Es28aiYF4Qy4CXehAU1nze0Q1lqQAo/cEWGUFn8Qy5in+Yr
   JT6nSwa5Mf2QUZRJ7y4ohj/K05YTHp5sD8ICIUgAdV2/mqVlZajCIp4q6
   QCrsRQVfC1XL164UjW2XSgz6MRbsfGBuvK+MjjBN9qqbwRtb/aPQ0B7eE
   A6a07SBfbdPqaqXGcvr2b4zMzTYOvlhN8jKkRtTJYTV2NYt6lSeD7atLE
   Q==;
X-CSE-ConnectionGUID: NfFBfL4PSyefb+0AW0vE/g==
X-CSE-MsgGUID: VFUzQ7x8T3ijal9yRbQfcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34146742"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34146742"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 03:29:52 -0800
X-CSE-ConnectionGUID: KnTql//mSdulnXo/O/FBCw==
X-CSE-MsgGUID: p7sNWr6tSHyd4fuokaIOyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120766566"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 17 Dec 2024 03:29:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id B4AAC329; Tue, 17 Dec 2024 13:29:49 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: WeitaoWang-oc@zhaoxin.com,
	mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/2] Possible xHCI driver fix for ZHAOXIN hosts
Date: Tue, 17 Dec 2024 13:29:15 +0200
Message-ID: <20241217112917.623898-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Weitao Wang,

You fixed an issue in the Linux xHCI driver which concerned TRB prefetch on
ZHAOXIN hosts [1]. The fix was to allocate two pages for a segment instead
of one, on some ZHAOXIN hosts.

I recently noticed that the xHCI driver always sets the page size to 4096
bytes, regardless of whether a 4096-page size is supported. This may be the
root issue that your patch fixed.

I do not have access to a ZHAOXIN system, so could you please test the two
patches? The first patch sets the xHCI page size to the size supported by
the xHCI controller, and the second patch reverts your fix [1].

The patches are built on top of Linux 6.12.

[1], commit 2a865a652299 ("xhci: Fix TRB prefetch issue of ZHAOXIN hosts")

Niklas Neronin (2):
  usb: xhci: set page size to the xHCI-supported size
  Revert "xhci: Fix TRB prefetch issue of ZHAOXIN hosts"

 drivers/usb/host/xhci-mem.c | 36 ++++++++++++++----------------------
 drivers/usb/host/xhci-pci.c |  7 +------
 drivers/usb/host/xhci.h     | 10 +++++-----
 3 files changed, 20 insertions(+), 33 deletions(-)

-- 
2.45.2


