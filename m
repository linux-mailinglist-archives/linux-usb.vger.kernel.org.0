Return-Path: <linux-usb+bounces-23980-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE554AB8897
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D0461B65377
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA7D1A08DB;
	Thu, 15 May 2025 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyTe9v/d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C247472634
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317391; cv=none; b=uN5l1hl2NCQR4dIOD8HosGK1q6tBgxhJZ28Q4757t42VQrvXZmp6EcVxAkzwYSSUrf9WZvultZUC10JeGW2z6gWpJVhCzisRIpq0T2M/lLXyRQYpZr/XZpuZXLW2VpeU33e1gerEZm/QcPMSNrzPJtKWV326UKR4uUiKXLIXzeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317391; c=relaxed/simple;
	bh=OaUeONDiWztjM+3HgHvZGKWx7NJixojzqnxX9wR7Lb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MJKDdnopmaBUl8CR8Y1yKJF6aGVm2X9Z3lIO6vRZyP9eNxVSkND5dQCLCtaof1SBCjxnHuDxeJRrR3T7CPdGejuFfLzS2H1n84KWC9FF6i+jqx56Dvxa6it3xPopx1V2klplBUnPuu4ZihmkYWwXys5fubQJTopideB52479q/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyTe9v/d; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317390; x=1778853390;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OaUeONDiWztjM+3HgHvZGKWx7NJixojzqnxX9wR7Lb4=;
  b=fyTe9v/dLWWdoYxTe9vffFK8rUWKS35iN/u/YXNNAZO9knegd84woIHR
   RmeOEr6S9D3UbuBSC6yaHuyUiNXQaIsuv2gR8hy6SINxRrhVAdAwEMA29
   zZGxtEF2GF3QcSZsJvrrRg3q2RIVguMk6xtPIXSaa0L5CrU+BCfHQwo/+
   kP3Nk/COWb0tEeXBc8bUs0VxyHXmHFGZD7GjbZDpgx8Q+8gEY4JWfyQhl
   xdOF3+nzLKDbqY9+LHtF0bvMbD7S8uxMYbjbalA688L+3bc3IuR4XbXok
   wxxMqfyRhBeAOIzsGn9qqTP18YyLsFjpn9jEjPh3PIZoj+blEmx2qC1pf
   A==;
X-CSE-ConnectionGUID: nFY+zwfNRfqiyM+p88Gfyg==
X-CSE-MsgGUID: XvM12KMTQmGQx9nG7SH/zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60269981"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60269981"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:30 -0700
X-CSE-ConnectionGUID: JTLVp9XFRxGvmZsTpSFNdg==
X-CSE-MsgGUID: 4RoMmzTSTHaRRbv1w7ep6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372032"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:28 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/24] xhci features for usb-next
Date: Thu, 15 May 2025 16:55:57 +0300
Message-ID: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

A series of new xhci features and refactoring for usb next incuding
  - Debugfs support for showing available port bandwidth
  - xhci parts of eUSB2 double isoc bandwidth support
  - refactoring to decouple allocation and initialzation 
  - other misc cleanups and refactoring

-Mathias

Amardeep Rai (1):
  xhci: Add host support for eUSB2 double isochronous bandwidth devices

Michal Pecio (1):
  usb: xhci: Don't log transfer ring segment list on errors

Niklas Neronin (21):
  usb: xhci: relocate pre-allocation initialization
  usb: xhci: move device slot enabling register write
  usb: xhci: move command ring pointer write
  usb: xhci: refactor xhci_set_cmd_ring_deq()
  usb: xhci: move DCBAA pointer write
  usb: xhci: move doorbell array pointer assignment
  usb: xhci: move enabling of USB 3 device notifications
  usb: xhci: remove error handling from xhci_add_interrupter()
  usb: xhci: move initialization of the primary interrupter
  usb: xhci: add individual allocation checks in xhci_mem_init()
  usb: xhci: cleanup xhci_mem_init()
  usb: xhci: set requested IMODI to the closest supported value
  usb: xhci: improve Interrupt Management register macros
  usb: xhci: guarantee that IMAN register is flushed
  usb: xhci: remove '0' write to write-1-to-clear register
  usb: xhci: rework Event Ring Segment Table Size mask
  usb: xhci: rework Event Ring Segment Table Address mask
  usb: xhci: cleanup IMOD register comments
  usb: xhci: rename 'irq_pending' to 'iman'
  usb: xhci: rename 'irq_control' to 'imod'
  usb: xhci: add warning message specifying which Set TR Deq failed

Xu Rao (1):
  usb: xhci: Add debugfs support for xHCI port bandwidth

 drivers/usb/host/xhci-caps.h    |   6 +-
 drivers/usb/host/xhci-debugfs.c | 108 ++++++++++++
 drivers/usb/host/xhci-hub.c     |   2 +-
 drivers/usb/host/xhci-mem.c     | 282 ++++++++++++++++----------------
 drivers/usb/host/xhci-ring.c    |  40 +++--
 drivers/usb/host/xhci.c         | 222 ++++++++++++++++++++-----
 drivers/usb/host/xhci.h         | 119 +++++++++-----
 7 files changed, 543 insertions(+), 236 deletions(-)

-- 
2.43.0


