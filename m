Return-Path: <linux-usb+bounces-7334-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8398786CB0E
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 15:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5C641C20948
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 14:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B11812F5AA;
	Thu, 29 Feb 2024 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCHsr31q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACEE12A177
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709215988; cv=none; b=HPbhD58chtyPxtaqmZH7j0+njnWeuyPC7TXuXI2RBPJ+KENXrAjcQGGYCZYaFOtJ5pRjge7urcKCLpcWfr3yMjbTATRS7ZvghotqtUm4maVaunXKSPzmtA4mnY2b09ctfFhcfUHDOX5S0uOWprgUHiGcBiLi15L9+zQ7h95GGtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709215988; c=relaxed/simple;
	bh=cXNgND004hv17kJmLqNLQ51Ffa+z6wPPv5z6l7dPuSo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nbV587i3Y+zdwcdXEnaBBVEMPy0FZdSOcs9eCKwNEn0JRlTXlKZYyMdJ+jXP8zL5pLLMuK8bgMQ+m11aSbRvc3gLT/tsIycs5Aj/qJbhTW/rlHYps2h9RU+AnmqPqNGJ5LQZapnlUXV9s2dHTl6tyKEvWM9P/RnuqWcHTSjPWpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCHsr31q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709215986; x=1740751986;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cXNgND004hv17kJmLqNLQ51Ffa+z6wPPv5z6l7dPuSo=;
  b=NCHsr31q+1qZXElGkw5Nm9fcGsU27o+F/c6HST1Y1U1ClGv1N2E4M1hZ
   C4/TT9gXdU3OCpiHEt0ZA77ucKT2bpmupjLzUO09NDEK9zKsvPrmgSjFh
   /VJADq3/8c57SpUi2MgP09Ws7ZfdrY5WIMbLlqlR7+slu9RFdwbBJiHH9
   0zKyNNuH6c5tYpM2WNv36WBAufsbmZBEnkyRvRTmrcBGeI79yBQsnUUg7
   L6YTrXSqJkok1zpQOmljmeF564//8rXeX+bbmReMFFLBVYDKld0gfM98u
   xCDLYBy0YkiSLVYKdh909hqVGcQJJGeKgQZLBPbvmFBPhciqg7hpUK3fz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3609362"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3609362"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 06:13:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937035980"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="937035980"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2024 06:13:04 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/9] xhci features for usb-next
Date: Thu, 29 Feb 2024 16:14:29 +0200
Message-Id: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

Some xhci features for usb-next.

Includes minor xhci port refactoring, improvements to dbc event
polling, and a couple transfer event handling changes that are
almost fixes.
I'd still only add those to usb-next as they are improvements
discovered while fixing other issues. No real world bugs.

Also includes a small kzalloc failure check tagged for stable.

Thanks
Mathias

Mathias Nyman (1):
  xhci: dbc: poll at different rate depending on data transfer activity

Michal Pecio (2):
  xhci: fix matching completion events with TDs
  xhci: retry Stop Endpoint on buggy NEC controllers

Niklas Neronin (5):
  xhci: rework how real & fake ports are found
  xhci: replace real & fake port with pointer to root hub port
  xhci: save slot ID in struct 'xhci_port'
  usb: xhci: remove duplicate code from 'xhci_clear_command_ring()'
  usb: xhci: utilize 'xhci_free_segments_for_ring()' for freeing
    segments

Prashanth K (1):
  usb: xhci: Add error handling in xhci_map_urb_for_dma

 drivers/usb/host/xhci-dbgcap.c  | 13 ++++-
 drivers/usb/host/xhci-dbgcap.h  |  2 +
 drivers/usb/host/xhci-hub.c     | 69 ++++--------------------
 drivers/usb/host/xhci-mem.c     | 93 +++++++++++++++------------------
 drivers/usb/host/xhci-mtk-sch.c | 14 ++---
 drivers/usb/host/xhci-pci.c     | 10 ++--
 drivers/usb/host/xhci-ring.c    | 27 ++++++----
 drivers/usb/host/xhci-trace.h   | 12 ++---
 drivers/usb/host/xhci.c         | 28 +++-------
 drivers/usb/host/xhci.h         |  7 ++-
 10 files changed, 107 insertions(+), 168 deletions(-)

-- 
2.25.1


