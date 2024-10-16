Return-Path: <linux-usb+bounces-16321-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 836919A0C07
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 15:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43B161F2433A
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 13:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304A120C001;
	Wed, 16 Oct 2024 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mApjr1eB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575A2207206
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729087079; cv=none; b=eiJr2acJLCt+CvCTS44TmKDAzmNfpnT3T6CrtjVbe/APqiSM5SeWgTI1MUIoiwQDju2daHm35OvNj+F8Agw4s05hq3te0VwAdH0xw2eJE4REOsnZrPgtxQDd/AozpqM+k6zHRXH2GmrVaIFmx5jRCFPlGo02TJJy2U9IaU9nIc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729087079; c=relaxed/simple;
	bh=ky3+SIK38F6Q6hFBQ0d3wKL9RYQvTKuHpEqpuGpwDpA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=eRWU1pN6K+gS5k/KDIG5sw5Oybhxs5+JafBv5WN53HHtbxyUks+jT8YdPWipMZnw6/xAKuxrfhp1NwUgmMdjK2u5eIb3bwIUBd0kgFd1jsbcy7KSY3lEd6ZxFlPSfXbEEN+06VPnC5tXJNxTZaowme/nwvMZGYKdG21aE7TG5RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mApjr1eB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729087078; x=1760623078;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ky3+SIK38F6Q6hFBQ0d3wKL9RYQvTKuHpEqpuGpwDpA=;
  b=mApjr1eBlsR3arVCmItxGxP8j2b5wCcSvHCDT+N2NuH0v0Mr6PjnQiG0
   oyZ2Y7J7BSa0G1HkTCz5ECVLdWRNKnuMEwL+Mf4mk/LeIjqWx3J5jjJ02
   vMQvDpYxDCucJMIHwRvClPrRuDBuAGfhO3MOW3nYUrWyDAMLPMJcJoKXs
   l/9vyXiBzV1Qno4x6SBu/kIXUSNhvwZxOOBovm+n090jSgFuVeg30TDQ1
   1nMYOeUBv2FL51+fSX0jC28UcHc4d9n1ZkI0WoF1k/0l1L/d0Kx5m+YlQ
   8rvYIay78fVBvGEgDMCWI3TXqu4G93e1lnzrUTtHN5P9YgT8dU/mZwVyG
   Q==;
X-CSE-ConnectionGUID: P8NXg7L8RxieMMezbe5UDw==
X-CSE-MsgGUID: iWFSNdPzRk2O6LINy+CSAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28664015"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="28664015"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:57:58 -0700
X-CSE-ConnectionGUID: IvjPGxQMQWqc4qmqbf7MjQ==
X-CSE-MsgGUID: sOgMFUkBQBmm0/OsmeaH/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="82776214"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 16 Oct 2024 06:57:56 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci fixes for usb-linus
Date: Wed, 16 Oct 2024 16:59:56 +0300
Message-Id: <20241016140000.783905-1-mathias.nyman@linux.intel.com>
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

A few xhci fixes for usb-linus to better handle errors during transfer
events and URB cancel.
Also fixes an issue in how DbC might squash data inteded to be separate
bulk transfers into one single transfer.

Mathias Nyman (3):
  xhci: Fix incorrect stream context type macro
  xhci: Mitigate failed set dequeue pointer commands
  xhci: dbc: honor usb transfer size boundaries.

Michal Pecio (1):
  usb: xhci: Fix handling errors mid TD followed by other errors

 drivers/usb/host/xhci-dbgcap.h |  1 +
 drivers/usb/host/xhci-dbgtty.c | 55 ++++++++++++++++++++++++---
 drivers/usb/host/xhci-ring.c   | 68 +++++++++++++++-------------------
 drivers/usb/host/xhci.h        |  2 +-
 4 files changed, 82 insertions(+), 44 deletions(-)

-- 
2.25.1


