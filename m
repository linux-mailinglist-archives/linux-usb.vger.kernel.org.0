Return-Path: <linux-usb+bounces-6155-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F3C84F6ED
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B772E1C23901
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 14:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E7969E09;
	Fri,  9 Feb 2024 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5qLZ56K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1A66A006
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488021; cv=none; b=QlQ228FbSGZfZqO95/pvRc2Zc67oqUG4SsPjnbcmmMBNdJJ+OemE0/tXIyzFNIUUfsstDGGvr8dDxvcXWNt2E278O5Wt+pqyFPalBgLoEfqNoVeilXQccx6Km81Uiwq25SbO5QPeKwgdbB5wu1cCeth4rnd9lPpktIfpVLSOmfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488021; c=relaxed/simple;
	bh=zXFLDOB7E7AgOzhP3mjKzq5D/29krHq+22i76rFNW1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FtcL2aI+O64HVmv2aDewMHyIhkFqZoIvv3Es9nR2l7rKgNoXwn3PmV4F7WE6EGUhGdjufWZoiSiN4Gc5G8/fIyygl5x70Pf3Jn0ozhMZSY9v/4TGCB5HCUs8K/v3xUUo3/z9QdGJABU0Ef30u91Y5AdvJPlu1HKRn5xHChVzAWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5qLZ56K; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488019; x=1739024019;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zXFLDOB7E7AgOzhP3mjKzq5D/29krHq+22i76rFNW1E=;
  b=K5qLZ56KhnNuglTWrc46P2XcJt7Rnh73+seoLkwVkEl5c8VUo0g/Y98q
   ruVHYyn7mAG6JqisIC/P9l2Ssg0MRrMhuCzLOIkaP/idqaIGyhwUOZ5re
   9wdrtWL0wp+pNuAvlYy/vP81948gVI83rNIxawfDauju/5pMhMnvgxBUN
   0U1Q0aid1e0cwHJZcLeHspFseoF6MePWhZLkmzLiUkAEwoFz5Y08v/Sn/
   ybWf2YGk/Sv7yxGyio2ZwLx5sOVy2sAenYkGooPo3O6xIuFJriQkBJEFG
   I/jrIeLI7i9e8lcBCYNdesIEiKixyaNYJZste/nd/8M73ZqyY8ZvdsU7a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12082110"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12082110"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934434410"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934434410"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 06:13:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A3B17159; Fri,  9 Feb 2024 16:13:35 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 00/10] thunderbolt: DisplayPort and bandwidth allocation mode improvements
Date: Fri,  9 Feb 2024 16:13:25 +0200
Message-ID: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series improves bandwidth allocation mode support to follow the
USB4 spec more closely. In addition to that DisplayPort tunneling is
made more robust so that if a tunnel does not come up properly (for
example on a discrete controller the DisplayPort source from the
graphics is not connected to the DisplayPort sink of the controller) we
tear it down and continue pairing.

This series improves bandwidth allocation mode support and DisplayPort
tunneling to follow the USB4 spec more closely.

Gil Fine (2):
  thunderbolt: Calculate DisplayPort tunnel bandwidth after DPRX capabilities read
  thunderbolt: Improve DisplayPort tunnel setup process to be more robust

Mika Westerberg (8):
  thunderbolt: Use DP_LOCAL_CAP for maximum bandwidth calculation
  thunderbolt: Re-calculate estimated bandwidth when allocation mode is enabled
  thunderbolt: Handle bandwidth allocation mode disable request
  thunderbolt: Log an error if DPTX request is not cleared
  thunderbolt: Fail the failed bandwidth request properly
  thunderbolt: Re-order bandwidth group functions
  thunderbolt: Introduce tb_tunnel_direction_downstream()
  thunderbolt: Reserve released DisplayPort bandwidth for a group for 10 seconds

 drivers/thunderbolt/domain.c |   4 +
 drivers/thunderbolt/tb.c     | 898 +++++++++++++++++++++--------------
 drivers/thunderbolt/tb.h     |  10 +
 drivers/thunderbolt/tunnel.c |  96 ++--
 drivers/thunderbolt/tunnel.h |   6 +
 drivers/thunderbolt/usb4.c   |   4 +-
 6 files changed, 596 insertions(+), 422 deletions(-)

-- 
2.43.0


