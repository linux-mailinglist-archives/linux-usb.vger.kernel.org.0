Return-Path: <linux-usb+bounces-25189-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65669AEBDB7
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 18:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE0143AC13D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 16:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDA22E9EBE;
	Fri, 27 Jun 2025 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Meb66AJm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE33213245
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042644; cv=none; b=D93MqkzIHuyS1wob5UVBjU1gLJ47BY+0v/dCFdIk/CgC3tnPt3PnGkqxk9kjXWdyyQENgUz8ZOKL6r1GO2HRjiDwqNOZIy21XOlGor6P73tBhCAINhP7xOfAgJRz523QC4jMwJCA3mzVgoJzzaaCrNJv1hEafAdOOVw43+YSrVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042644; c=relaxed/simple;
	bh=xnYhq+cT2ityVr/S5WLhkkaAsjU9mzu8pqQnJ/Xf/yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mXI3Lhb/fFOrjKpDazBISEtAN9V5E5FXZF4881bV0QWs/T4usNPgmEnUJkhp9jdvXxcVvblk1h75JXeX3ye71ZYmg0tFWVcYb0BLysvJ/iY1TKWVgElw1yClTvE91iZHvLeUlntZa9mQX/xDBrGgPG7glDotATQrUa3ZG5WshU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Meb66AJm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751042643; x=1782578643;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xnYhq+cT2ityVr/S5WLhkkaAsjU9mzu8pqQnJ/Xf/yk=;
  b=Meb66AJmz8qi9TVbzyN7bXZqLCPd234ZSB5pLIMOm+inZ697d1NgDjhc
   192+a7gwyGv64BpWKcOEwQ/fkiOY9x9ERViwPIy0jise2pY1rvzXq+3f/
   saPPjUqyDLqBZr1kX/7fHT5RqyVPQFSxxRfStG3dXCIAIq3yXinCw8OvL
   KorxdXZzWVDcsA8VHniQQdxCpx2RphOZiaCXYqwRAqHTmEUpemP4Upw8v
   fdd5/Oxbj23943vRiDzdcOVAABSJ5su9+F7fxb3b/3sYtl77quC9Rr11b
   UlXTz7g2aYVP3/mgKSrbnX1Zcf0rk1kpsxL6qFfG9ZpyVOg/0yQH8xkuA
   Q==;
X-CSE-ConnectionGUID: dJhOh0BLQ/Wt1LUr0a54GA==
X-CSE-MsgGUID: CWaNwXXxROCVUy5ZyhOO0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57142541"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57142541"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:44:02 -0700
X-CSE-ConnectionGUID: inokgos0QIiEI2ebhgYJiw==
X-CSE-MsgGUID: n4njyM9zQ5ueeOfBQMyDKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152951892"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jun 2025 09:44:00 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	<stern@rowland.harvard.edu>,
	oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com,
	broonie@kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH v3 0/1] Fix "detection of high tier USB3 devices" patch in usb-linus
Date: Fri, 27 Jun 2025 19:43:47 +0300
Message-ID: <20250627164348.3982628-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi

This is the third attempt to fix "detection of hight tier USB3 devices".
It is rebased on top of the earlier fix attempt:
a49e1e2e785f ("usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm")

The original commit is:
8f5b7e2bec1c ("usb: hub: fix detection of high tier USB3 devices behind suspended hubs")

Both commits above are in Greg's usb-linus branch.

This is a rebased version of v2 with no other functional changes.
v2 was tested by:
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # SC8280XP CRD
Tested-by: Mark Brown <broonie@kernel.org>

Any additional testing is appreciated

Thanks
Mathias

Mathias Nyman (1):
  usb: hub: Fix flushing of delayed work used for post resume purposes

 drivers/usb/core/hub.c | 21 ++++++++-------------
 drivers/usb/core/hub.h |  1 +
 2 files changed, 9 insertions(+), 13 deletions(-)

-- 
2.43.0


