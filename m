Return-Path: <linux-usb+bounces-25170-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C1EAEB9AA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 16:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EA55188BFDE
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 14:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675FC2E2665;
	Fri, 27 Jun 2025 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndTL7Y9y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936972DE202
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034061; cv=none; b=uzI0LX61z/BEbDh2degpzjdVEXkubHhqUftuyWDCO9NHDoxfAvT8/KTk34uLo6nTk/9k4Q1J0pb374BcsgsozKmf76lKJaDZI0OjWJSjvFE17HiVZ1ckMeqTfZi/PyG/jBnFIEU7/W0q7OuMPcHvPG+lXzUfzb46E3q/jX5568U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034061; c=relaxed/simple;
	bh=JE83heedYK3rZu1pOTLW/+LjshWebqzK8mL8zdEWIVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gAvRKsIQ7t04tN/zuCjnbKVAoV5SJzy1xF1dCyiOPs3GM8B8yHP0et9lfYnfZB88RgAhycHk+dkCmhoBKa4ttHoANO7W8rC40hjcurw0p/HD5WJjhh+auXIGN6tWaqh0cn/bbHgU+5g7CHfIinhbG6c3EcAMuDGHqGxgi/pDBTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndTL7Y9y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751034061; x=1782570061;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JE83heedYK3rZu1pOTLW/+LjshWebqzK8mL8zdEWIVU=;
  b=ndTL7Y9yxctkEaGtHWzwfweQWcPSEmpp9Zh3mFiCKIKjkLbICDO/3sWo
   bF50WF0425DCzTjN0QPuUWMbZK07rA/BV7cBPYttWolY71w1x2Fj2v4i8
   1YRw0bE4fv44NySu+rQSuSUSq3qnfnfyOlk1NuyJdcApfXZioNw+nKF0r
   bA/GVKDElcaLG0x7eHOTAtoRntNKWufV9vjECdE/GvojsoMzleBFo2Usl
   kV55WdR+0whYtSBSB7TOaCkquiQCgsFCZoDCSBHRSNkdGi6ZEQom/GStv
   HMi5QMAtpsuaAl16Z/rzGwRrwG7UAhStNBPh3yfIybRrb8XGm3q9/udKG
   A==;
X-CSE-ConnectionGUID: Qf/CA0hQT76zg//CbUD3wA==
X-CSE-MsgGUID: W4JtZco/Rx2/TTAiKmUiZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53500559"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53500559"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 07:21:00 -0700
X-CSE-ConnectionGUID: WR53AOoOTzqucegIKn9SuQ==
X-CSE-MsgGUID: XN8k/TPOQhSi81EVI5RhXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153531218"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2025 07:20:55 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	<stern@rowland.harvard.edu>,
	oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com,
	broonie@kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH v2 0/1] Fix "detection of high tier USB3 devices" patch in usb-linus
Date: Fri, 27 Jun 2025 17:20:43 +0300
Message-ID: <20250627142044.3872229-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi

This the second attempt on a fixup patch for
8f5b7e2bec1c ("usb: hub: fix detection of high tier USB3 devices behind suspended hubs")
that is currently in Greg's usb-linus branch.

This one would need some additional testing and Ack that it works on
Raspberry Pi 3B+ and QC SC8280XP CRD board before pushing it forward

Thanks
Mathias

Mathias Nyman (1):
  usb: hub: Fix flushing and scheduling of delayed work tuning runtime
    pm

 drivers/usb/core/hub.c | 23 ++++++++++-------------
 drivers/usb/core/hub.h |  1 +
 2 files changed, 11 insertions(+), 13 deletions(-)

-- 
2.43.0


