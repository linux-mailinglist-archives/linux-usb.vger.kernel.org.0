Return-Path: <linux-usb+bounces-14711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3174696DBC5
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 16:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42EC71C228EF
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 14:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4546CDDAB;
	Thu,  5 Sep 2024 14:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WmojfdpI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE06FC2C8
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 14:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546675; cv=none; b=Sm8Ctr4w7WSmYn6Ux8jz09RgqBV0U4r935MBX6cBiaRDL2PhV9g/JcgJ5C3tHSBXk0ikkLqT9vBDBbCJ4tMG6OGRYVo6a6L41KkWrPMIKm2xi8Yi3lRL9Leds5X75VFPIxfq+FmimXS3UoOK7Avkj/a5qr5eae9dUnS8qi/k0fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546675; c=relaxed/simple;
	bh=ufkzLXd+F1SBdHgSvN5XjYNQaVMOkkmrp7QE7s9gNfI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Z2RRoxouNdR/0k1R9gjzNLiot7PUKfTXJT4x1foMIXGiscn41zYevG+pYGfi7O7trAiXcjxFLlrGZrUv0ZzQNi2QlgUI1BQv4TdcVWDoETw//9SZORF4dJWfzfj8Fwsi4qbmQDgYATAj5jWiRv2Qhrcg2qGuL/0b1456//LKzi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WmojfdpI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725546674; x=1757082674;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ufkzLXd+F1SBdHgSvN5XjYNQaVMOkkmrp7QE7s9gNfI=;
  b=WmojfdpItSid71Qdj8jkZRDA3dG9wrl6YVxU5G4WtmcnwQzt27MINFAf
   yLbkdOmKSeWGbYNbiDR7fEMMZqH7FTRsOv2KZB3BMCOzh859pIWCdBAjs
   Wa/uHy2mcyoAzdNiyxCLRjXzQyiFcweLLT5hGA+Sjh7WjNivkK4ynnIIy
   1u/tuGs+yODnFWCjGvcjXB1joaranxP5z5J2s2ZpVRhSCI15zfB0JK7x+
   3V9AkWaXCML4NZNOCYjKrh4ibXroKAMZGMu2PI87DHtg9KqSBYKsh386W
   +n1IOdFW46FWbq2MN/wpXTPdk4vbVlc57/R60M9KxLm2r2b2cwCltQw69
   w==;
X-CSE-ConnectionGUID: qWKoV0zcTbGfh59Qkz+ztA==
X-CSE-MsgGUID: lrp//rYwRVeO1rGPK7JeOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49677486"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49677486"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:31:13 -0700
X-CSE-ConnectionGUID: IRyphcKfQi+7m8y4agkVgw==
X-CSE-MsgGUID: 2OEv0hJmTOCds74SvQislw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="88883212"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2024 07:31:12 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/12] xhci features for usb-next
Date: Thu,  5 Sep 2024 17:32:48 +0300
Message-Id: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg

This series for usb-next has several small xhci cleanups, a couple DbC
improvements, one small secondary interrupter feature, and a fix for
setting PCI D3 state correctly during remove callback on older haswell
hosts.

Thanks
Mathias


Mathias Nyman (4):
  xhci: dbc: Fix STALL transfer event handling
  xhci: dbc: add dbgtty request to end of list once it completes
  xhci: Set quirky xHC PCI hosts to D3 _after_ stopping and freeing
    them.
  xhci: support setting interrupt moderation IMOD for secondary
    interrupters

Niklas Neronin (7):
  usb: xhci: remove excessive isoc frame debug message spam
  usb: xhci: remove excessive Bulk short packet debug message
  usb: xhci: remove unused variables from struct 'xhci_hcd'
  usb: xhci: make 'sbrn' a local variable
  usb: xhci: add comments explaining specific interrupt behaviour
  usb: xhci: remove 'retval' from xhci_pci_resume()
  usb: xhci: adjust empty TD list handling in handle_tx_event()

Yue Haibing (1):
  xhci: Remove unused function declarations

 drivers/usb/host/xhci-dbgcap.c | 133 ++++++++++++++++++++-------------
 drivers/usb/host/xhci-dbgcap.h |   2 +-
 drivers/usb/host/xhci-dbgtty.c |   2 +-
 drivers/usb/host/xhci-mem.c    |   8 +-
 drivers/usb/host/xhci-pci.c    |  25 ++++---
 drivers/usb/host/xhci-ring.c   |  58 ++++++--------
 drivers/usb/host/xhci.c        |   4 +-
 drivers/usb/host/xhci.h        |  14 +---
 8 files changed, 135 insertions(+), 111 deletions(-)

-- 
2.25.1


