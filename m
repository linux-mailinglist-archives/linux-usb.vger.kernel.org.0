Return-Path: <linux-usb+bounces-13367-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C775695032B
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 13:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E1951F22D6C
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 11:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E9D189911;
	Tue, 13 Aug 2024 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPM4QQ3R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FF8186E3B
	for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723546902; cv=none; b=loIK6OTQHWwKHaeSm01oHWMGUpCuoUJvfVO0YkJqMM0RSiNx+rejO+IpYsOkaxUftH04nVApkLb7Inc4Rfc8sPUSNR8zhiE2cI9/C5dPymxJ2s4f9Ewr/KhAA6a5BgtT4BJsxX5iT1wKn4pNJ+TOugkea7tTqNHH48BgF8oKkR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723546902; c=relaxed/simple;
	bh=seQeTxD7oHyHXmDwV0jhoLhXjafK6LvYLmF9xPmBsi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4QYPnb+00IC9nmm5jvsDzXryn7QlWufvmqj49cAzRn++OfbEsq2HTlqnEFP91afBjS9osYVKyVE0egx8YZzSL3QEg4bUvmcFoYZY3Tf9kyi/4Prk3rx92SETFEH0IDkhbCrZr+Puf/BTvaCelVAMsVWg4lSWBVsfKa8XWQ6BIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPM4QQ3R; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723546900; x=1755082900;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=seQeTxD7oHyHXmDwV0jhoLhXjafK6LvYLmF9xPmBsi0=;
  b=lPM4QQ3Ri7a8aR9tWuqlBavHQSb0a7dT8/y5kob11o9buUT1t9k/l+UE
   OyhfU08nLIS0mby1yPjEfByAAaLExN8pa/Zi7aIwmQZ95axt0aRCzJQpE
   uhL7KtC37t7mrsmEMCb1n+642UAbJ2pC53O9li3u7mPvA/Q8Nd0dzgVFY
   OzLLW4r1neHzK9Tr/ELGF0h7eoqc4pbOhCzXwXB+NYRrP0ebM1r0AWTsN
   Kll1paIwVnxY8NriDBrGHfpvo8/337SFaEjbi0FKyK6MeSFWYyHh18ex4
   AxLxJqMSMUa2phavCCP0gJqw3q/oE4G64ofBxpUze6EjVpIUZjHe6Eo59
   g==;
X-CSE-ConnectionGUID: j3JcMwVfSoWtltGl3mv7rA==
X-CSE-MsgGUID: 23lmg729RRalVioaN89V0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="33104389"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="33104389"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:01:39 -0700
X-CSE-ConnectionGUID: VuxrpBlcRKyZq8kFTsUaUQ==
X-CSE-MsgGUID: INShOYcJTu2+CuWTuGWKbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="89291141"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 13 Aug 2024 04:01:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A94AF18F; Tue, 13 Aug 2024 14:01:35 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	R Kannappan <r.kannappan@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/4] thunderbolt: Improve software receiver lane margining
Date: Tue, 13 Aug 2024 14:01:31 +0300
Message-ID: <20240813110135.2178900-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series improves the software receiver lane margining support in
debugfs so that it should be more usable now.

Aapo Vienamo (1):
  thunderbolt: Add missing usb4_port_sb_read() to usb4_port_sw_margin()

R Kannappan (1):
  thunderbolt: Improve software receiver lane margining

Rene Sapiens (2):
  thunderbolt: Consolidate margining parameters into a structure
  thunderbolt: Add optional voltage offset range for receiver lane margining

 drivers/thunderbolt/debugfs.c | 381 ++++++++++++++++++++++++++++++++--
 drivers/thunderbolt/sb_regs.h |  18 +-
 drivers/thunderbolt/tb.h      |  42 +++-
 drivers/thunderbolt/usb4.c    |  62 +++---
 4 files changed, 451 insertions(+), 52 deletions(-)

-- 
2.43.0


