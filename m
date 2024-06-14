Return-Path: <linux-usb+bounces-11328-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399A908B65
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 14:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 121EA285787
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 12:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CB0198826;
	Fri, 14 Jun 2024 12:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnoEXgWK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A819319645D
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718367319; cv=none; b=AYYfuvlqJMMiqDdqGcsBdw289r//TJ0HUDSpxehdA44u/CgzvCOi6NvzL78RKry49REXbHBtdVznNvCyo/RXrbZCQZUwOhHiOwpJqonfAyuVauqkGD7Q1KGk0Ijzhwga6dRM6i+duVp/IfIM+m4048JV/xXUEx3D2JPCKFcdCGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718367319; c=relaxed/simple;
	bh=XiF/vloqKfo0Kyint1zueDJmGzvyOLwJqkW499Ggbpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MOE84bDLTODCFwtmFx8WmYoWgCjIlaE2U2d3XGOMLB0lSp6GMbWZS9k7F1O4Gcsnqu+sAkDqgCX9Qs4O5+Otf2q91w4aPHlDTRXpfd2SZotoE9nGmuLlRxgcEkx4qtaVFngBHbhVeq0dM8IUi8YjZWehYkTJKwLNLlhnsmvdlUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnoEXgWK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718367317; x=1749903317;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XiF/vloqKfo0Kyint1zueDJmGzvyOLwJqkW499Ggbpc=;
  b=LnoEXgWKOZmG6jA0EsLMGWk7jpVMOCSSBv0QfZIAdQU19jZflhWKsJNo
   Iaro9/2IrIoYObln7KkeEKmn29BPbNehrpX1GL8x6/wO0hv6AJ795cm2L
   2nGobwGutMoI5Y6ap2FV5IkOQU5TzO668HFZ+8fSScGOfGtXX+OSvE8hl
   XgjU6WkpCCrSCgz8ZmreVJE+SAN1BnzoPdH5gDfXwDsZUlB0GG4j1nFvx
   SbwvK+wwZG+nAR47d9036CUpVBjnfQ4K+6ma9IBNwu+dtdZgPwwYPxKzf
   yQ69G5g9smwxn0zJBq+VgvxnMa53P7HwR2v2pkLJa/991hijtHlvvGSbT
   w==;
X-CSE-ConnectionGUID: l+JQc4/hSS6gLaecfWmcSA==
X-CSE-MsgGUID: EKlkqY12QweuZTCYFNhdRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15409997"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15409997"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 05:15:15 -0700
X-CSE-ConnectionGUID: rhGH7UvlTIOlNQ0D+ISvkA==
X-CSE-MsgGUID: 4JIFJY4jRIiIDroUSaGCvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="45437709"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 14 Jun 2024 05:15:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 413A11C8; Fri, 14 Jun 2024 15:15:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 0/6] thunderbolt: Sideband access and retimer lane margining support
Date: Fri, 14 Jun 2024 15:15:06 +0300
Message-ID: <20240614121512.1361184-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series adds USB4 link sideband access through debugfs. This can be
used to run port operations etc. from userspace usable for example in
manufacturing. The other feature is receiver lane margining support for
retimers with similar use case.

Mika Westerberg (6):
  thunderbolt: Move usb4_port_margining_caps() declaration into correct place
  thunderbolt: Make usb4_port_sb_read/write() available outside of usb4.c
  thunderbolt: Add sideband register access to debugfs
  thunderbolt: Split out margining from USB4 port
  thunderbolt: Make margining functions accept target and retimer index
  thunderbolt: Add receiver lane margining support for retimers

 drivers/thunderbolt/Kconfig   |  11 +-
 drivers/thunderbolt/debugfs.c | 623 ++++++++++++++++++++++++++--------
 drivers/thunderbolt/retimer.c |  53 +--
 drivers/thunderbolt/sb_regs.h |   9 +
 drivers/thunderbolt/tb.h      |  45 ++-
 drivers/thunderbolt/usb4.c    | 183 +++++-----
 6 files changed, 655 insertions(+), 269 deletions(-)

-- 
2.43.0


