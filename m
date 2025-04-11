Return-Path: <linux-usb+bounces-22950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B5EA8579B
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 11:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4DDD7A78B4
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 09:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5D32980BF;
	Fri, 11 Apr 2025 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFbAOnMv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB7815D5B6
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362758; cv=none; b=RS6xBCpOpJwWX9Q/9XTFIuCCiKgc9bnFwI6WKMZG8Eg+QDAkNFg6Zjet1ZqXaGJ9a94ycmS4UaIh5d+3d4E4W2JUx/YBzXJ/VkJRKbpr1DmCFYr3l5N7G+7QcJhimLAKibf465pi81dd8uqYiBHHzqqHU1YCKmKjpJjR+ZeUkJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362758; c=relaxed/simple;
	bh=pQ988reGHkHfVnv0gCNglPbPOS14YcjpbUQGzavKiD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GNnIpgOaNfGuOZk/9jYYWfpqZdDMdqoMMbjMccmpcma6VJC1qC183YB3JXICko5ond4GZryBdVK/XS7m8iUiElFJWln43RD04jsN/dndAul9XHBSrevoTVzVJ7EKE/ITjDve2kFyETUm0VDDrEzo+b6wRhQAk03hShLuLKuysvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFbAOnMv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744362756; x=1775898756;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pQ988reGHkHfVnv0gCNglPbPOS14YcjpbUQGzavKiD0=;
  b=ZFbAOnMvJbgnh1kE47hl7e3qPisJjkN4uEg/oh0XmLP4jC2kh3Kw7vEi
   p8oNNNcha+uOHbCxJ+kW398SOXUJQb400aX9hm8LF44M9WHM93geN7IV1
   ZMdZWFN34z/yU9Q3yHgRloI7zrxnyhiqNWxjCrwIH+9hVV90dy5LZDEeY
   L8dtmbflpTvW3w0WLwLyhE8PqVCLGAvXRSadiRXrRM9/Daq1Fp+k6XuRl
   BSxzsNsMWzjO05m0Uw4jmatdYzHD1IIN4cTpMUaL+YC6EsQPhY0yUZKTZ
   03SUOZV413S2Q8DnYdd9C7kC8Tpw7CHQf5UAWfIL+VbypnvMXwNXPofbh
   A==;
X-CSE-ConnectionGUID: 9xdmkQhwS5GjLs03WBTYqQ==
X-CSE-MsgGUID: gzHruRf+SoiI6yGU810uHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="71295704"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="71295704"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:12:35 -0700
X-CSE-ConnectionGUID: /axfVcaOQwebthKaRjgMyw==
X-CSE-MsgGUID: YEQB9o8OSqK7rTfQHUdUhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="129986202"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 11 Apr 2025 02:12:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 753C357F; Fri, 11 Apr 2025 12:12:33 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 00/11] usb: xhci: decouple allocation and initialization
Date: Fri, 11 Apr 2025 12:11:44 +0300
Message-ID: <20250411091155.3386971-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, after hibernation (S4 state), the xhci driver frees all its
memory and reallocates it from scratch, which is inefficient. Instead, much
of the memory can be simply re-initialized.

The proposed changes begin the process by decoupling initialization code
from memory allocation code. Specifically, the initialization code is moved
from xhci_mem_init() into separate functions, which are then called from
xhci_init().

By implementing these changes, future patches will be able to call the
initialization functions directly after hibernation, thereby improving
efficiency and enhancing code structure.

Niklas Neronin (11):
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

 drivers/usb/host/xhci-caps.h |   4 +-
 drivers/usb/host/xhci-mem.c  | 164 +++++++++--------------------------
 drivers/usb/host/xhci.c      | 126 ++++++++++++++++++++++-----
 drivers/usb/host/xhci.h      |  12 +--
 4 files changed, 155 insertions(+), 151 deletions(-)

-- 
2.47.2


