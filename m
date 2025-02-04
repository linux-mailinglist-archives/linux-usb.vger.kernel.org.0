Return-Path: <linux-usb+bounces-20097-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEDDA27238
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 13:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C5667A14F4
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 12:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED0B211A04;
	Tue,  4 Feb 2025 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bajIi58d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7099D20FAA9
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738672991; cv=none; b=BBAdWJFKO4rOIIevzNYocG2jVbMdb+TPOFnyqVUrgW+cRh3xPyXsTrh0Y4KLPwxN+dFFVC6T4BJWYP6TT+8dhsvzegWpjSu39cE6NFJFQdUsO9Ta6f0Dpy7E3RCIcuuuaF9tuJJt5X0Xd3BxYHa4xH4rey8d9uKwOIJvx5f5uy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738672991; c=relaxed/simple;
	bh=dLQYmWmgkr5nfovi012GKK6Jqa9cnZC8n3P4Mqg4NXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VdAoTHZ5JAS9GsXuORKKfIESfNFVwO3ritAWXNOM62WyqW2VteEBzflFMgF8vgMA3jfdgUmSbsg3rlgYxuU4CX3FmW9irFaEFFP7q1+AL2b1RoZZFqC7VzInIjC/X0drH+vcCcQ/uKFm2QryQXUhChiUCl6S44PEChis4g0NDLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bajIi58d; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738672990; x=1770208990;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dLQYmWmgkr5nfovi012GKK6Jqa9cnZC8n3P4Mqg4NXw=;
  b=bajIi58dcGyVXcOxuz+vUU6Nbk8ge02/eO/sZdoZ43ztnO9KSC0oWiBv
   31MDCx3RQvTYMBLeh/B8jle3YaRNf7Uj8PIMArvQf04wEipH2jbSn1TAK
   wwOVWdzlRwlA2/7K3vNvTFYe6ycyBH/VDPO8zr/OIelQ9//4kx8X08b4i
   GHNZF7k5GAND5wAhyTSBbaLV64WvZUFoauLR7JW7/7+YvQimdgiOHNmPH
   NqQ4R+WLtRU4ifQUxIbjeS/GZGAkW6n4CderGI0Wm/KUcWq46ALDzsyLo
   lHCr4JEJAgleOw8Y2juB8YGZF4PQ0CUS3I+ZWBATKbBrZx0BAtVZoMqn+
   A==;
X-CSE-ConnectionGUID: aWX4CKrBTKSmIdSVrFGg6g==
X-CSE-MsgGUID: krTn3qe+SZW7qC5BwaI3RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56734068"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="56734068"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 04:43:09 -0800
X-CSE-ConnectionGUID: dr0LLECSSIiDjNF0pT1F2Q==
X-CSE-MsgGUID: CUkl09MYQ3yC9tqJAdSkCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="111158488"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 04 Feb 2025 04:43:07 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 581E7299; Tue, 04 Feb 2025 14:43:06 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v3 0/2] usb: xhci: page size improvements
Date: Tue,  4 Feb 2025 14:41:42 +0200
Message-ID: <20250204124145.3998098-1-niklas.neronin@linux.intel.com>
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


