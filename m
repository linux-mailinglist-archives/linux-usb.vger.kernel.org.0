Return-Path: <linux-usb+bounces-11673-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEB8918149
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34A571F23EFA
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132291849FB;
	Wed, 26 Jun 2024 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8FPGEVO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53DF181BA0
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406004; cv=none; b=t7XpYrJbgS8wAsJ8WWSX8SURNHeaZzLgrBV6XlQHncS5oiS/x0w/nLYVY4198QP0t8fhZEkNBP9eDcLSqWiM/EVhfpE1+Up0mj70eyiO4ABEa77jkFYqUfnBMB11vWFL05oI5H09IoqA0+RcaMP+XbHSGqwku37eNsVk57yL9us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406004; c=relaxed/simple;
	bh=+WcOy9m/LaNdnw/E3RFTZj/p1kTfDvsoDlADaYNGhtU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f9uh/S66LiPCq67GB3EeR4pDbA9Jkv2idROfSIzYY0hvn50zi8d8ey8rM9qYYDZ1uy9yPE7WZftFMPMwwylhCkEXylb9CBSpO78Dll4r0nU9i1tzC/CEyGjO69cEG7Ty63zRjRCCVX17h3gpyYPa+KflymEKSkM1WrxGW7MsJbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8FPGEVO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406003; x=1750942003;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+WcOy9m/LaNdnw/E3RFTZj/p1kTfDvsoDlADaYNGhtU=;
  b=l8FPGEVOvGkPJQ+XrSqXIpc1J1+RTyD9YY+t/qWWQAvsA2dvIf2txAzS
   1zEo2D2AtoGHDR0y9IBABdhm6CoVJMmHpdygY2FkHni9AKv2F5qTnuWSN
   qLgXH13QUT7xoO+AP+LZ/Eq8svkjeJcIjSWVd1ryHNXLUGeX3KUGBW4KO
   TtAczpIjADgaMiLw4n1aPmBZiOisHcjOD/2V4lyBksaptBy5U1+FkIHHy
   dn4wAiLKsdVPWskKkif/GJVK10wPxyam6SxQJSLYUiIKm3+PvQCchGIeh
   JdeKIqJ+GyjRbK348riVDmaH4lqPL3Kr17zjKcv/Eq9XKinsDf7Yh77YS
   g==;
X-CSE-ConnectionGUID: oyJFiiSVQSu1QMtXe66tFg==
X-CSE-MsgGUID: To66pX+kRMeXwY+qx4c/Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353361"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353361"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:46:42 -0700
X-CSE-ConnectionGUID: F90pM8WpQ1yufLAAFuRJEQ==
X-CSE-MsgGUID: pmwBlrHoSOCa9QSDgF40sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442555"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:46:40 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/21] xhci features for usb-next
Date: Wed, 26 Jun 2024 15:48:14 +0300
Message-Id: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

Just like Mika I'll be on vacation starting next week.
Niklas will help me keep an eye out for urgent xhci issues during this
time.

This series includes some trace output improvents, a new DbC related sysfs
entry, transfer event refactoring part one by Niklas, and other minor
changes and cleanups.

Thanks
Mathias

Hector Martin (1):
  xhci: Remove dead code in xhci_move_dequeue_past_td()

Mathias Nyman (4):
  xhci: show usb device name in xhci urb tracing
  xhci: Set correct transferred length for cancelled isoc transfers
  xhci: rework xhci internal endpoint halt state detection.
  xhci: sort out TRB Endpoint ID bitfield macros

Niklas Neronin (14):
  usb: xhci: remove 'num_trbs' from struct 'xhci_td'
  usb: xhci: remove unused 'xhci' argument
  usb: xhci: remove unused argument from xhci_handle_cmd_config_ep()
  usb: xhci: remove unused argument from handle_port_status()
  usb: xhci: move link chain bit quirk checks into one helper function.
  usb: xhci: move all segment re-numbering to xhci_link_rings()
  usb: xhci: move untargeted transfer event handling to a separate
    function
  usb: xhci: improve error message for targetless transfer event
  usb: xhci: remove obsolete sanity check debug messages
  usb: xhci: ensure skipped isoc TDs are returned when isoc ring is
    stopped
  usb: xhci: remove false xhci_giveback_urb_in_irq() header comment
  usb: xhci: remove infinite loop prevention
  usb: xhci: move process TD code out of the while loop
  usb: xhci: add 'goto' for halted endpoint check in handle_tx_event()

Reka Norman (1):
  xhci: Apply XHCI_RESET_TO_DEFAULT quirk to TGL

Uday M Bhat (1):
  xhci: dbc: Allow users to modify DbC poll interval via sysfs

 .../testing/sysfs-bus-pci-drivers-xhci_hcd    |  10 +
 drivers/usb/host/xhci-dbgcap.c                |  38 +++
 drivers/usb/host/xhci-dbgcap.h                |   2 +-
 drivers/usb/host/xhci-mem.c                   |  35 +-
 drivers/usb/host/xhci-pci.c                   |   4 +-
 drivers/usb/host/xhci-ring.c                  | 306 +++++++-----------
 drivers/usb/host/xhci-trace.h                 |   5 +-
 drivers/usb/host/xhci.h                       |  41 ++-
 8 files changed, 213 insertions(+), 228 deletions(-)

-- 
2.25.1


