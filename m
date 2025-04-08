Return-Path: <linux-usb+bounces-22739-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 824E9A80401
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 14:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9BA81B60A87
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 12:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D89C269D1B;
	Tue,  8 Apr 2025 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHGzC+yv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381D426982D
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113576; cv=none; b=r6M/WHVROPyGbJPhN/HviFgDCSYQ14PMh+nBsdcLuxKRi8Qn86BpbvaNDiF6EOOX2mwo3NnM0ows8ieS1JQlVQEcBu3nk7iP3Z4+tMIMbO1xN7rV/I013YUCPdYJGQM4Pbh0cWD8vqhBiXmUZJlln3Mp5noAQOZ0F3BoaIGSf80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113576; c=relaxed/simple;
	bh=RvAqplcPOjf81oeqid6N0U0get6UAO/VvsLsuzvGZTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SG0uvbufpgN0cic8XjO3v00VgXF8brO7yD969yva1D+KmjFkpI/RcaGR9ViP0HOIVmnCZmq1fjFIKy8wyCieKVQVO1LvQ+8FaUiFfHR+AabyKsRmSym2/icq9k5c5oKSCZp6oCK/G7awfLlcpAzc3cTdsHgyGZmiQ2GyYvbUHSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHGzC+yv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744113574; x=1775649574;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RvAqplcPOjf81oeqid6N0U0get6UAO/VvsLsuzvGZTM=;
  b=NHGzC+yvgGVF0e7sRgFSCEc5/1zwTlwG1v6GA3weBQ5aQyXe+rwfNVEr
   lKPWXds/JBkIJlPJSZYUg1+TFjjKt2j1YRxmuet+1heX6yNfycIpRBB+F
   4fVmnk/BYJz4JQPlz8Kt2vKgY6kP53tq/46DgZw0Siozx2oTkfTB+QVuU
   tO5viNfnatnk4jmUxuEEQsPQAdD28FFIDAJOhHrcweLrnqJnnHqqOk51b
   snIZF2DblrzQCUb2SBpw9ysyH+TcliI8fvkdV0cwvk+wXv6kl268tFxuO
   4unWkQl+/9y4Zo/yeB35C+3f0XGT4CmcFa7xdKOHqeJm8vruyFM6/Z/1J
   g==;
X-CSE-ConnectionGUID: Lw3zrzTfSMal/eQY4jc6Mw==
X-CSE-MsgGUID: WBuYBkKvTtCqyi6z3qwAUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44681718"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="44681718"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:59:34 -0700
X-CSE-ConnectionGUID: wvmVkCXWQKy7UXiu1i9VwA==
X-CSE-MsgGUID: 1s3qzc4uRiWoy1scVbUK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128114683"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2025 04:59:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 59679398; Tue, 08 Apr 2025 14:59:31 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/9] usb: xhci: enhancements to Interrupt Register Set code
Date: Tue,  8 Apr 2025 14:57:43 +0300
Message-ID: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes were inspired by reading the xHCI specification and
searching for the corresponding code within the xhci driver.

Key improvements include:
 * Adjusting the names of Interrupt Register Set values to better match
   their counterparts in the xHCI specification, facilitating easier
   cross-referencing.
 * Simplify bit masks to ensure they only cover their relevant bits,
   reducing complexity and potential issues.
 * Reword and add comments.

Niklas Neronin (9):
  usb: xhci: set requested IMODI to the closest supported value
  usb: xhci: improve Interrupt Management register macros
  usb: xhci: guarantee that IMAN register is flushed
  usb: xhci: remove '0' write to write-1-to-clear register
  usb: xhci: rework Event Ring Segment Table Size mask
  usb: xhci: rework Event Ring Segment Table Address mask
  usb: xhci: cleanup IMOD register comments
  usb: xhci: rename 'irq_pending' to 'iman'
  usb: xhci: rename 'irq_control' to 'imod'

 drivers/usb/host/xhci-mem.c  | 13 +++----
 drivers/usb/host/xhci-ring.c | 11 +++---
 drivers/usb/host/xhci.c      | 43 +++++++++++++---------
 drivers/usb/host/xhci.h      | 70 ++++++++++++++++++------------------
 4 files changed, 73 insertions(+), 64 deletions(-)

-- 
2.47.2


