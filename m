Return-Path: <linux-usb+bounces-22906-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F11A843C5
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 14:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BEE61B847C1
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 12:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87692857D2;
	Thu, 10 Apr 2025 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xtxs1O1J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE6C2857D1
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744289770; cv=none; b=Bp2vb1d9ghWXpzWzdITPnQRwXi3WO1jyMvcv3+kl8pJzy3MV4Qarb7ttRICVhmwjQTjWuUP52Hjht6oouNhL/ogvwbdS3nZhfmPR9K1sICYy+CvbjiMrmB9wu9hy1/zbIZBNuicnNmjOj0LoLqPmTl52kYB+EpopFgVsDJg4ZmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744289770; c=relaxed/simple;
	bh=uqo//ww1+eVfFl0cqh10n05335qMkWb3f+QgIBee8jY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HXbl0xJCft2owOJnh0YuFHvSUXI7yuV+T8Paxzoha7uomxmvkxFUQV1mpQiEqZY6+4TRZQaMUmEXWNGxZbE+uHPXKxElDJBf4NHGsKf9zH7ZI6Na1XfBoiQMO4iBdHyWJ32FuNC36hN9nX2kyhLpq9d2V3BL7jVVRFmF8iH+16Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xtxs1O1J; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744289769; x=1775825769;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uqo//ww1+eVfFl0cqh10n05335qMkWb3f+QgIBee8jY=;
  b=Xtxs1O1Jm3+xRQt4/q440gvmklNt/IXptJFsMKqmEavMyayZkoDwx9A6
   iXqwn2i/Qc2gYfh7tdb8ruCFW+23HgTOrjUw48O96kYrBvyKwMu6ejLga
   1AZxZKgudJrqM7NzOMj2xisAJ9ly+fLAlgkrAKCNnxNb/jmSfjo9s6R6R
   MKHn8PEeLfAl+z9J5EnfxGPjd/OQxBeDyoSbe3RfQYhuxmQGEPyKMRsGP
   uJO7Wt0gZTUpCpBi7NmDSnofFaTGYxiyeNopBzBUP58gG/Gh0jEdBP1Pu
   +I2aIi32prjhbDaLcH3Q0Fs9h+hjM10qWoisu69hFvGpHckVGBRLL/HHe
   A==;
X-CSE-ConnectionGUID: 0KqzQhZWTUip3WqKIH5CLQ==
X-CSE-MsgGUID: 2CR5SRiRQRWIuZDWlPzE+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="33417011"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="33417011"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 05:56:06 -0700
X-CSE-ConnectionGUID: /t4W//BgRbyXKreReK5T7w==
X-CSE-MsgGUID: mH2pyLd+T5iZ7jR8E8b+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128812868"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 10 Apr 2025 05:56:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 96D2B1A4; Thu, 10 Apr 2025 15:56:00 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/3] thunderbolt: Notify userspace about tunneling events in the domain
Date: Thu, 10 Apr 2025 15:55:57 +0300
Message-ID: <20250410125600.3074417-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series adds support to sending uevents to userspace about changes in
tunneling such as creation, removal and bandwidth related.  One intented
use-case for this is an upcoming USB-C daemon developed by Saranya that
then notifies user for example if there is not enough bandwidth for
DisplayPort requirements. We also added debug tools [1] support for these
(currently it just updates various screens on event but we are working on
add event log there too).

The Firmware Connection manager side is kind of limited though since there
are not that many notifications we get.

[1] https://github.com/intel/tbtools

Alan Borzeszkowski (3):
  thunderbolt: Introduce domain event message handler
  thunderbolt: Notify userspace about software CM tunneling events
  thunderbolt: Notify userspace about firmware CM tunneling events

 drivers/thunderbolt/domain.c  |  2 +-
 drivers/thunderbolt/icm.c     | 36 +++++++++++++-
 drivers/thunderbolt/tb.c      | 22 +++++++--
 drivers/thunderbolt/tb.h      | 13 +++++
 drivers/thunderbolt/tb_msgs.h |  1 +
 drivers/thunderbolt/tunnel.c  | 92 +++++++++++++++++++++++++++++++++--
 drivers/thunderbolt/tunnel.h  | 23 +++++++++
 7 files changed, 179 insertions(+), 10 deletions(-)

-- 
2.47.2


