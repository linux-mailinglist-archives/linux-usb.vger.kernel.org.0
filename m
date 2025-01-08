Return-Path: <linux-usb+bounces-19143-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD37A05E8F
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 15:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FCC91886D94
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 14:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B87B1F8F0A;
	Wed,  8 Jan 2025 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuWINkgh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B844D1514F8
	for <linux-usb@vger.kernel.org>; Wed,  8 Jan 2025 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736346540; cv=none; b=d/aN8y2Y+044F/LTKQAgDx3A/dYEGnyN85xvF4zIl2Um1lGouQEacLBU2jED62eM1B3EOLXOOBz94afqksqjzJdQSBxC8QFT6VlN5mDErBiYxAqMt/A1YX898BT+ellqyaZQ4mNgNBCdR861RAkut1BGVhgtV5bE4PAJgHmDtHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736346540; c=relaxed/simple;
	bh=PT160OPkiYppesjYZuHTD1xw5WXdPulLd4bw4HOEZYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=js2iDeAHhInLpkkbdCVJwJrs1eQLDputRWjMsSftcRbElP5GQKf8WG61M6sYQBQjA0c72+u8fPPj5uIAlsNvnGvGGuw6impq7oPYGz1+eOEMJnn1FUs3oWZrStRSbpzYNhO7TLodx/DG7nEXAEL/LJcQwZQG3PAbwRzEvonW2q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuWINkgh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736346538; x=1767882538;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PT160OPkiYppesjYZuHTD1xw5WXdPulLd4bw4HOEZYM=;
  b=GuWINkghRDsTDbgthiKzQP2vEMaDgu2XfcU/WcXtHGlJoZSrUZdJM2yr
   inVtcSt+2iUDfirOWbnwEZFNjwoixqDPA6Za7aEtAPwtXElYuvYOEPSKQ
   0weFU2m4UxRJx+PM/tIs670vWl77bTxzXbg5TRX8n2B8JGPFpAbJWwcfq
   Oc4Ha318MnC6QoN+dAmhM/0/EsTmXN8WZep7VFRchDwYKBwHuOBnSfIXG
   pWMUKu75AMhfhrxY3Q/8Uo1XnIpcERw4ngQwZ9Q7RUY/mXAk0rXLfqjSF
   QBus1fOCLytVWtOQTuxcd8Z71hDDaDmrzZYX/qr+JY0mKd90GaQWw7x7P
   g==;
X-CSE-ConnectionGUID: W/QhS285QuqTCx1GJGuoqA==
X-CSE-MsgGUID: tSfdOOJURem5xXEpUJS7QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47565134"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="47565134"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 06:28:57 -0800
X-CSE-ConnectionGUID: JERwv2ClT3KA/GAv8XcM1A==
X-CSE-MsgGUID: W5MKmh0oTW+SI2zjVI5heg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="102928925"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 08 Jan 2025 06:28:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id CE17E3C3; Wed, 08 Jan 2025 16:28:54 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/2] usb: xhci: page size improvements
Date: Wed,  8 Jan 2025 16:28:20 +0200
Message-ID: <20250108142822.649862-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct off-by-one page size debug message.
Set page size to the xHCI-supported size, instead of 4KB.

Clarified the interpretation of the xHCI spec 1.9 regarding page size.
The correct interpretation is that only one bit is set, indicating the
only supported page size. This is supported by the following sources:

Section 6.6.1, PSZ:
  The PSZ calculation uses the page size bit and would not work with
  multiple bits set.

Section 7.7, Implementation Notes:
  "This version of the xHCI spec only allows an implementation to support
   a single page size, as reported by the PAGESIZE register."

Niklas Neronin (2):
  usb: xhci: correct debug message page size calculation
  usb: xhci: set page size to the xHCI-supported size

 drivers/usb/host/xhci-mem.c | 28 ++++++++++++----------------
 drivers/usb/host/xhci.h     |  8 ++++----
 2 files changed, 16 insertions(+), 20 deletions(-)

-- 
2.45.2


