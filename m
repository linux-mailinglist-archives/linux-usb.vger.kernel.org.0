Return-Path: <linux-usb+bounces-21774-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E58D1A61380
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 15:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D6A9883C8C
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 14:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE90D200BBE;
	Fri, 14 Mar 2025 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdB94eUE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1A1FF7D7
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 14:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961947; cv=none; b=qQIrCxKlqHF1YZxdcCNEv3r1+tGHzfjmiiKU+jxy4O9JVDwQixRCfrTZf5mGDRVRd5BJ04rOGtyUQJ9c7SCndKc6GddBSGtD3FrQiEyrTturuWXLPdb1Urp73h2JdLKu3DdBoKtR1YoerlqwgbLokifyTgyptCf5PVA65ruCWUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961947; c=relaxed/simple;
	bh=wzx9Du+jvJ4lqiq8abzV4okgLJmtJZbX7BiopbEFsgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lJ4vgYGGL9TmCDsC1TrGRIHZ7yu8edAZMEEjf+EAizvjjGon0o94iI/2uSycBMFRDs6lz4dwb9NmVVKUIvY66gPJC2JUlP+UnaaS7I/vwScLzkQypYKrD/9SY3fLTIuvbV15pwDwb6zJdPKOZeHzuQOWjKKVL2NnnTdr8zekCYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdB94eUE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741961946; x=1773497946;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wzx9Du+jvJ4lqiq8abzV4okgLJmtJZbX7BiopbEFsgM=;
  b=mdB94eUENPNf0D5wfTB9ZoOjfWu3s7geQpLoOQgXyf/0aeQDAMwdOB2I
   o8gzT/eO6ozBrMBAptBXyw/X2/1xI+OfeYjQ1P1HDj6Afcs7Rb7Z8MT4w
   RVIPcSwpCQ6G9h8hhNr0nyZMiz/fqCNtvq/y1Q0ls3FqiNp4TjQo+e2Gh
   T3PX9jRlS1b1fCP6dquG4cKE1cW3I1ydE3C80E6kqUXv99S6zNCLaL19C
   K2s3chW4zOu7f0oTFf3R+d9UCfN030seQVPKlf8ELId/GXXAf37TgqO7L
   UP0CoJcNGYsm3tcuD0wKtyZahC6Ignv0wv1vYFYWnF/UWMd1/YS79Xv7r
   A==;
X-CSE-ConnectionGUID: rb15ZIw4TjWU4+o1H0lWGw==
X-CSE-MsgGUID: TORZTzWbSGSIJWzBH06d7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54110139"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54110139"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 07:19:05 -0700
X-CSE-ConnectionGUID: 8/QRcnj6Rnal7ogwdzVaZw==
X-CSE-MsgGUID: Wsnf8ThXRKGDMt9pYFRLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126166604"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa003.jf.intel.com with ESMTP; 14 Mar 2025 07:19:04 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	<stern@rowland.harvard.edu>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/5] usb: hub: Fail fast on USB3 LPM requests issues
Date: Fri, 14 Mar 2025 16:19:55 +0200
Message-ID: <20250314142000.93090-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stress testing suspend and resume with several Link Power Management
(LPM) capable USB3 hubs and devices reveal that hub workqueue may be
blocked from handling device disconnects due to slow processing LPM
requests over a bad link.

Enabling and disabling USB3 LPM requires sending four USB requests.
These requests are sent in the hub workqueue. If the link is bad then
the requests need to fail first before other port issues are handled.

Fail fast if these USB3 LPM requests fail.
Don't try to recover a failure to disable LPM with enabling LPM.
This just causes even more blocking requests to be sent over a
possibly broken link.

Mathias Nyman (5):
  usb: hub: Block less in USB3 link power management LPM disable path
  usb: hub: verify device is configured in usb_device_may_initiate_lpm()
  usb: hub: Don't disable LPM completely if device initiated LPM fails
  usb: hub: reorder USB3 link power management enable requests
  usb: hub: Fail fast in USB3 link power management enable path

 drivers/usb/core/hub.c | 74 ++++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 35 deletions(-)

-- 
2.43.0


