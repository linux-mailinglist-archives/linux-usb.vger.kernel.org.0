Return-Path: <linux-usb+bounces-29899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C32C20BE7
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 15:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5625D1A60F57
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 14:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45F12773DA;
	Thu, 30 Oct 2025 14:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4ANacT/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0942E23EAB8
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 14:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761835701; cv=none; b=aP/VA1dDWSFJ9dSDQbaoYR2kEAAYfRjp5SYYkYk5qTTJ4dUeGb4e6VfDCGURzkNh8oI5rvKlNg0cFqZHHgkNvRtXSd2AjqpKFvZq9U1HSioaoU/+TKa72QKOpdJLVjKA/6+9jujb9YTYApk1Clb3JiPXPb3cNjG0oBDS6yD0EWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761835701; c=relaxed/simple;
	bh=mOOVuURFRAEnxhSIHd1MR4u3FDrI2XwD56DmAPVWfPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XcgYJeOh4Uvyr6cOLtf41ePde67ouAcQglWlByvj6o8NMIQ7LI8HcFvAy2ITsf8ehfKdZs7GGKV4dhIEH6IhQKpvPGw3Rpx8HquwP6VXFmQ4wq8XZKd8sLAJc5Hff8lVZz9SKfcESzDDW9xqF9rikGxju+hNufDtdx0ECJxAOqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4ANacT/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761835700; x=1793371700;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mOOVuURFRAEnxhSIHd1MR4u3FDrI2XwD56DmAPVWfPU=;
  b=W4ANacT/9wlGtFfCmOSsmglkvaUuXs8SyMbMKKoPnncCJLjEPaZRQHnB
   26IvU8AVSq8hbqpb0J3LCmYhui0r+b9Su6FLLKeKj9IFfvQScN3adxtmR
   DOuxZYZy5o18MAad+RSOApyR5Xmfy1qLOU+4uwBuwSsvmBib1ZYNa1kr+
   EYJ9vpNAo7c6DfTa9506cqD7f+yF8XHBKdQcgoGEA2iPDbwFxGt+kKF1d
   X95MALVmqTThFE2lqNDNP6RFEwP8HKu+2N3UuzOmvbbpqLFVRjHwtVfg+
   TvAR1dSAn0q4DT9fdYZMSSOfMxKWM4bzngkCAzUgRqNkI4/z8tAG+Ee6y
   g==;
X-CSE-ConnectionGUID: K1gtQl3ORbKa1a6OTWjUGg==
X-CSE-MsgGUID: H9hWxROGQrOxZHb9aE0a3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63679220"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="63679220"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 07:48:19 -0700
X-CSE-ConnectionGUID: g7Rja1ueQcCdD2nopk7QAA==
X-CSE-MsgGUID: //kPLsXlQIirM3C2z051Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="185631428"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2025 07:48:20 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	heikki.krogerus@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH v5 0/4] usb: typec: ucsi: Add support for SET_PDOS command
Date: Thu, 30 Oct 2025 07:48:54 -0700
Message-ID: <cover.1761773881.git.pooja.katiyar@intel.com>
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

Changelog v5:
- Rebased patches to v6.18-rc3.

Changelog v4:
- Fixed build errors reported by kernel test robot.
- Added changelogs.

Pooja Katiyar (4):
  usb: typec: ucsi: Update UCSI structure to have message in and message
    out fields
  usb: typec: ucsi: Add support for message out data structure
  usb: typec: ucsi: Enable debugfs for message_out data structure
  usb: typec: ucsi: Add support for SET_PDOS command

 drivers/usb/typec/ucsi/cros_ec_ucsi.c   |   5 +-
 drivers/usb/typec/ucsi/debugfs.c        |  36 +++++++-
 drivers/usb/typec/ucsi/displayport.c    |  11 ++-
 drivers/usb/typec/ucsi/ucsi.c           | 118 ++++++++++++++++--------
 drivers/usb/typec/ucsi/ucsi.h           |  22 +++--
 drivers/usb/typec/ucsi/ucsi_acpi.c      |  25 ++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c       |  11 +--
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  15 ++-
 8 files changed, 172 insertions(+), 71 deletions(-)

-- 
2.43.0


