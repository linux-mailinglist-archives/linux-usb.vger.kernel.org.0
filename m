Return-Path: <linux-usb+bounces-5933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 450B584B5E8
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 14:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F40872875BF
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 13:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7A0130AE3;
	Tue,  6 Feb 2024 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SR4hTwYl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FD812FF9E
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707224642; cv=none; b=h6WIYm4na+WjiNa5bn7/9/FnqHe7IocDfRTVa+a6Cc5FDvsJdmuHDN0tXGGOpfghgOLs05HiJNLviwqUDzZd0/hnNIhXSqqEtyMDGCBjGd5YR/G1M/gM8MRqUb/3Sckcy/OoBWD9jPmfZm7quuFp8Ynyy4Hp/t0wOSbOfobIwL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707224642; c=relaxed/simple;
	bh=38oeMP2ulNcOjSC3UyIQc/wYF5RpspTOqZbQ0TnF5pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=huKL7OFNXhNjpFEEt/N+c9HX80AoIFV2QzMbcFtGpV7A4SLrR+We0JyM7bhHdiHjbdZFLSDwKWjvR4pCp4WiXZm9M/Up0fN8Rn/Ol46TY5Yc0mlrUAZO8OcYQmz0t5L3+JQ0WDh6qbpIQ9dgQOru/FdgJycpS7S/y3Jjr05QcpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SR4hTwYl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707224640; x=1738760640;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=38oeMP2ulNcOjSC3UyIQc/wYF5RpspTOqZbQ0TnF5pc=;
  b=SR4hTwYlwBH9X5ypyj31+7Nu3hENj3q+/BHfrDAbfXVDTnoDAZc3rXsN
   0irKuxUiPwhXHboDjQg1xBzi1Hf6EiQS7CCIrLIZY2D52ocSV+wm/y6YM
   NJdVf+dgeSNwbvNj71q5Cwg45tHMTnvOHyYxVSgFk1PFPf5oLjebH3rCm
   csRY8rD2F9YV7zX8WlRqkuO9rDBF051JT8qrsE1zuryrKBYfCigMgIZdL
   snFgRcP5exMT9umzHzB5qiZswLtGcunQ1Uy33JDGFIgyGrW0sqzcldXo+
   DGS2fE78uefWrncf3ZpTxU3SOrZ6n1NPEelRvS8ATQCzuxS2oCxHzzi2S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26185050"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="26185050"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:03:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="909631991"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="909631991"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2024 05:03:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EB693BA3; Tue,  6 Feb 2024 15:03:54 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Sanath S <Sanath.S@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/3] thunderbolt: Host router reset improvements
Date: Tue,  6 Feb 2024 15:03:51 +0200
Message-ID: <20240206130354.1208816-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series improves the host router reset support for both USB4 v1 and
v2 routers.

Mika Westerberg (3):
  thunderbolt: Reset only non-USB4 host routers in resume
  thunderbolt: Skip discovery also in USB4 v2 host
  thunderbolt: Correct typo in host_reset parameter

 drivers/thunderbolt/nhi.c | 22 +++++++---------------
 drivers/thunderbolt/tb.c  | 19 ++++++++++++++-----
 2 files changed, 21 insertions(+), 20 deletions(-)

-- 
2.43.0


