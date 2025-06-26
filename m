Return-Path: <linux-usb+bounces-25122-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E69AAE9E11
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 15:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E264D1C41812
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 13:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9462E5426;
	Thu, 26 Jun 2025 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGYy3Sjr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163002E540A
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750942881; cv=none; b=bPD4LOMc/M346VocOqFRjnJfuxJOdfVEHBwvoGSo5aKjRjfnJBupC52iH+jU5iBvgrHh2zhwlpqIL1/5p2kOw/YmSRZKg0CCRU+r+Qk0dxArQMSCDruC2oe62OC/vp3HpEMdZW4iwnO6Rl645B9yZbaFJ+c8VcdXiihR5hdWySo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750942881; c=relaxed/simple;
	bh=FBmbNo4Tg7vWbeKZ+klQgFWJyf3Z6Cmzo9ip3P7QBRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzwVbI4hfeIjJQDtEaIRfiIajxBSB4qrnfJvVoViF9he9yqJlmwg0uKuMocme59R2Sb451LxN6udxpvY6QyR8cTcDoRUoDTtMXyusiVPW9Rl7DroTwV2OaxGKgIZa9JGr0g0fLfmoE2oySrNBOvXHFYtbiV/LszgMEnJSPI/Jrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGYy3Sjr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750942880; x=1782478880;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FBmbNo4Tg7vWbeKZ+klQgFWJyf3Z6Cmzo9ip3P7QBRw=;
  b=iGYy3SjrXrFO3rYY2AGgZ3cj4pK8vlha/zaCYrOZsJbq7eTeg+spXIzI
   QPova9tvi9qyfRB3+x6Zxd7tZ/cBER/HiWf6OdYHLeO4nrcHzA23urJUi
   iqcBqRmkGVZhnAm12wL4WCereI39p4vTLhNBCZW46EPa0CJ8jzY8UK7JG
   BXLsEN9ANIi7bS+/Ko3LtQqgRuerBmds1IwRRL6iNJPJO3vvz3WfBfeo/
   QTmKmc11g04ihW4mDY7vjLHH9DFaE5o2hQPyoqZBZyWYrTrxM+Sz4zHFN
   qdkw+bsR7x564l3igFIBNySKmBHlQ2sHgJvi65Wk8j1+hf1tBtuJFKdq9
   A==;
X-CSE-ConnectionGUID: SF+H4OIUTxW7K52EBYwLhw==
X-CSE-MsgGUID: vop4ENNvRCaitPl9Ma4Z8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53370663"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53370663"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:01:19 -0700
X-CSE-ConnectionGUID: PV97HFWyTv+5ToXSwlWyuA==
X-CSE-MsgGUID: RAp4QKaBRj2+IYkIToC9dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152140059"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jun 2025 06:01:17 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	<stern@rowland.harvard.edu>,
	oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] Fix "detection of high tier USB3 devices" patch in usb-linus
Date: Thu, 26 Jun 2025 16:01:01 +0300
Message-ID: <20250626130102.3639861-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

This is a fixup patch for
8f5b7e2bec1c ("usb: hub: fix detection of high tier USB3 devices behind suspended hubs")
that is currently in your usb-linus branch.

Let me know if you instead of adding this fixup want to drop the original
and me to send a new 'squashed' patch instead.

Thanks
Mathias

Mathias Nyman (1):
  usb: hub: Fix flushing and scheduling of delayed work that tunes
    runtime pm

 drivers/usb/core/hub.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0


