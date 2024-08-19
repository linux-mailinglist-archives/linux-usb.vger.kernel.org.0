Return-Path: <linux-usb+bounces-13621-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2852956981
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 13:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B60E1C216DE
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 11:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6A2166F31;
	Mon, 19 Aug 2024 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRQznldw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AD614A4F7
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 11:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724067660; cv=none; b=t3rZojoJ6ckqYRBXkvxeooHvY3DStLWLFAIfhcygaaICaIE9NPOCUueTNir48K2YGCAkxXH0EZ3v7k/lgE67Xn8ZT2+tmljP72J8dEixzHe8eWScZNqgY0S7L4Pkw0wC8EjudnWTszJUAppUzfVHW9WCqhr7le9G9Eud4ylC5zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724067660; c=relaxed/simple;
	bh=kCiMUZshM22Yfrn1jBXCXMYCRvUeOA+R3PkG4vk6BFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XsVB7NSoJNSShu26VOH0Hr8RzymyWtlrKIj02udC4RfT4YCgeRKqtxNuIE7sd06Ruhv/3Jbwja9ryIffZNQdwqFH0vEWv3/wGtGYRKr+qSI2J9lTvr9RO6pAlJNJRmZ9mGCWBFqXuDD+Sd9oItPDyYIbLRR21tGtaVk0L0HszpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRQznldw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724067660; x=1755603660;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kCiMUZshM22Yfrn1jBXCXMYCRvUeOA+R3PkG4vk6BFg=;
  b=XRQznldwmOnSRvUUIqdFAYWeiMqWvqRpU27qyNvMkeTOEVX3W8mTwu1r
   cq6hIBwX04XPfvOlduH0fsIeV+4ONtPaJXzcqMYxIZBJjboyIu+5blyls
   itdpHQmz/DUGh/O6lwcMtLfdv+c7m0CfGYtGXleW2XErl7dsM83ka3y69
   Pslp52OFcZt442Bk5oWsrNEQlVZGnLFMI+gltCfO9dutQIntBMxgoB4Z4
   DY4gPnsYFBibAxjdBy7IfH+bl3glvB+SuyG12LbzONh1S1DVS0m2crnR7
   kv4UCr6PA0WybTj4Ejv5hy0R3oLNZ2PU41VUEKBpzvp/aM9La8da+WPjm
   Q==;
X-CSE-ConnectionGUID: KRYIxvSUQoqeJ/tnw4l/tQ==
X-CSE-MsgGUID: e604UkypTV+ueDdcCHEg4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="33688819"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="33688819"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 04:40:59 -0700
X-CSE-ConnectionGUID: o/JMLDl3SdiufouWhYaHcw==
X-CSE-MsgGUID: MnnyiB6vRuu5GXmVNWd/nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="83566109"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 19 Aug 2024 04:40:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 854FF2D8; Mon, 19 Aug 2024 14:40:54 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	R Kannappan <r.kannappan@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 0/4] thunderbolt: Improve software receiver lane margining
Date: Mon, 19 Aug 2024 14:40:50 +0300
Message-ID: <20240819114054.4139941-1-mika.westerberg@linux.intel.com>
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

Changes from the previous version:

  - Initialize 'errors' in margining_run_sw() as pointed out by Dan
    Carpenter.

Previous version of the patch can be found:

  https://lore.kernel.org/linux-usb/20240813110135.2178900-2-mika.westerberg@linux.intel.com/

Aapo Vienamo (1):
  thunderbolt: Add missing usb4_port_sb_read() to usb4_port_sw_margin()

R Kannappan (1):
  thunderbolt: Improve software receiver lane margining

Rene Sapiens (2):
  thunderbolt: Consolidate margining parameters into a structure
  thunderbolt: Add optional voltage offset range for receiver lane margining

 drivers/thunderbolt/debugfs.c | 382 ++++++++++++++++++++++++++++++++--
 drivers/thunderbolt/sb_regs.h |  18 +-
 drivers/thunderbolt/tb.h      |  42 +++-
 drivers/thunderbolt/usb4.c    |  62 +++---
 4 files changed, 452 insertions(+), 52 deletions(-)

-- 
2.43.0


