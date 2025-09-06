Return-Path: <linux-usb+bounces-27613-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE6B46906
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 06:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFF063BBC2A
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 04:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45E826057C;
	Sat,  6 Sep 2025 04:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLGQyzud"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76E22397BF
	for <linux-usb@vger.kernel.org>; Sat,  6 Sep 2025 04:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757133053; cv=none; b=OuaQu4KO+KMpaHTEBJiTnzOVlgoTlejZ7MJn+ksMlJbRq7gWD0ZiP812djxRDQNWa5XtUPJfLlHrVAgnt/I2XolBWb0DrR2cAAiAvmvdodwyauQAE7ty+pSzy2JFIj2rihOX13MY5BHCblMthGi0XO++C5rV9GsrtfTkRRvFMnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757133053; c=relaxed/simple;
	bh=/JvYGo8wio9b1WEq67ViyQiaAJ9oX/hOljx8zUDo+rU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TnYfKr58rFk6zyTDUjkDnPNqJMkZx/1CicNyMCVAW/l2mDf8XQG3Cow/zpu3P2hREPJDbmpbsmgLH/es0kRuJtZMr5p2YTMcjwGywk/TTOA2sp1qSD8aKVE3tmlsa7giR3p1CrTVVS5pY7fxkAH7WbtvgluJxdeC5D0h9uiIUPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GLGQyzud; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757133051; x=1788669051;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/JvYGo8wio9b1WEq67ViyQiaAJ9oX/hOljx8zUDo+rU=;
  b=GLGQyzudSZju7sLHEcDi90PojPguyn+0U1KWvcJZ23JstCW8O50Q5nK8
   ija3kPxocPCl84RawHyyUeMrU5PCL1IwRSn2CWjoJrLK9uIfwnI7gV9Mu
   E9JRwoUBJNc+2rJTek1H0Dg0HqhCuD2eNqK4FXPCw26U0oIkuxSYiQwq6
   iBBeFbJbGjXpp4Vkqt7ph58WSjkD5+tXRnrQSGKdB8fVFb28hyScgCQ3g
   ZbSdjNjVYuZBXZqmfJojb1tc58YRldzyWrjZENIjTF4FQ10fsmQKhrpZU
   j3bQlGDDpgrawc54QcyEVixZfMXzKDLrroChze4HGhMfsKUXQkTuPNWAR
   g==;
X-CSE-ConnectionGUID: dvzOX6JAReeIkLR163kviQ==
X-CSE-MsgGUID: v4l0PU2bSUKK+BsQwQzYxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="63307757"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="63307757"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 21:30:51 -0700
X-CSE-ConnectionGUID: J3TQF+EuTLqlbvHYEWfKxg==
X-CSE-MsgGUID: /VQRLjdWTnGXwmERMP0kXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="173128874"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by fmviesa010.fm.intel.com with ESMTP; 05 Sep 2025 21:30:51 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	pooja.katiyar@intel.com
Subject: [PATCH v3 0/4] usb: typec: ucsi: Add support for SET_PDOS command
Date: Fri,  5 Sep 2025 21:30:57 -0700
Message-ID: <cover.1757024530.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements support for UCSI SET_PDOS command. It provides
interface to send message out data structure and update source or sink
capabilities PDOs on a connector over debugfs interface.

It also updates UCSI structure to have message in and message out fields
instead of handling them as separate parameters.

Pooja Katiyar (4):
  usb: typec: ucsi: Update UCSI structure to have message in and message
    out fields
  usb: typec: ucsi: Add support for message out data structure
  usb: typec: ucsi: Enable debugfs for message_out data structure
  usb: typec: ucsi: Add support for SET_PDOS command

 drivers/usb/typec/ucsi/cros_ec_ucsi.c |   5 +-
 drivers/usb/typec/ucsi/debugfs.c      |  36 +++++++-
 drivers/usb/typec/ucsi/displayport.c  |  11 ++-
 drivers/usb/typec/ucsi/ucsi.c         | 118 ++++++++++++++++++--------
 drivers/usb/typec/ucsi/ucsi.h         |  22 +++--
 drivers/usb/typec/ucsi/ucsi_acpi.c    |  25 ++++--
 drivers/usb/typec/ucsi/ucsi_ccg.c     |  11 ++-
 7 files changed, 165 insertions(+), 63 deletions(-)

-- 
2.43.0


