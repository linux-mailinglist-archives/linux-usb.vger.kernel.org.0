Return-Path: <linux-usb+bounces-27841-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA53B50A84
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 03:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF6463A7EAE
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 01:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DBA223DED;
	Wed, 10 Sep 2025 01:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXqbxOaU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE132033A
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 01:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757469114; cv=none; b=Pp1yFln7Ct8ma6HFpsvnM7CPVQR+3cb9oWovVlmVUXiBm7k1c2ZNrBiuKSSGsL0R6ONZV731ymI9W5YXRiaE+NcwJLhkKSDQYK8OpPNW1GfwJPPuBEIsRl1ysTMILFNsWHErpC99sYYPz7LCJYYax8mx+RssKbKH/AWTQmjhslw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757469114; c=relaxed/simple;
	bh=S9zn/LPyQMVotN+jp0JgiDtkeseuxoypalRPt+roQkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TAECZ8ATjoWN46P712rRPKZykSGq1TnvMi40/lsKlPEhD+5EgzO0JzrCUijWMW6iZTCpuYAd+VzqcKEE3QMgfz7ttmFm9BXW04d7y+di5JRmj46TRBjwcXQvL1fpq5znrisTycOOHgOnrR57dbJ9yGShhpf5wmyQBKWvcUuuGnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXqbxOaU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757469113; x=1789005113;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S9zn/LPyQMVotN+jp0JgiDtkeseuxoypalRPt+roQkU=;
  b=BXqbxOaU+jpVeorwIf84llOPwAkdSR4pXWgrv2aNamPP8izkvF1Rd/Zy
   zNWn+WZGnlJh8lbbVKW5eR++1uyEKg6ortDCwzloz4wBUsI7m5L+7XiTL
   zAE/aMFW5x+iV4cUNFa7WxHP6qSsyyKQmOJp0nEtotv8/kI5A3PU/TWuD
   xnZEyViiuVSYKKekrV5dyhYQSBvb72n/6oLiRaFYONa8pm0TFb/XDXw83
   ZYIpjWucVY5q/8n9DOwCGK3r7IVUyb8G82Q6BYhUP0w5kj7Hia4UyluFB
   IF7Yz4F/Ooiu3xwFrgE5bEynEtDF5Mwgh1XdLC+aQ4LEa3saW2uz9/R4E
   w==;
X-CSE-ConnectionGUID: 8ujHjs8GRVGoZ87wrzY27A==
X-CSE-MsgGUID: uqP7JaQETTOOTL2PAhk40g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59692216"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59692216"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 18:51:52 -0700
X-CSE-ConnectionGUID: tfc+ebKIQHGKi/Jyyl07Cw==
X-CSE-MsgGUID: 7o6nO11wTY6MLJ9ieS5NHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="174039168"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2025 18:51:51 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	heikki.krogerus@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH v4 0/4] usb: typec: ucsi: Add support for SET_PDOS command
Date: Tue,  9 Sep 2025 18:52:03 -0700
Message-ID: <cover.1757374784.git.pooja.katiyar@intel.com>
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


