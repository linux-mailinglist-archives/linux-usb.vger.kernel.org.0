Return-Path: <linux-usb+bounces-8918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 618CB8986CD
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 14:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9139F1C2608E
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 12:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053F885286;
	Thu,  4 Apr 2024 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewYZ6DaN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF7A83CDE
	for <linux-usb@vger.kernel.org>; Thu,  4 Apr 2024 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712232563; cv=none; b=oTiB8G6o9Hts8wN0/DlxttKIfBqIGCx566YrP6ycftYtqFxTSkKVv8miPN3aoFg+nS89PsXHNQwGxkgN77MJtP31S9tLfDteYmnoPWSYFiDao9jmUmw2F0OdFQ9aYs6YmDEZqGwktUcUJ1BUKcamQM/zosGW733BU/9TmyYUHhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712232563; c=relaxed/simple;
	bh=ysZE8b+PcsJMS5XbBBkjHo9NQ2JlBE9wYp1VkPJclS4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LMWKG2Vi1Cgbiu/u4tFjVeg2oZh/hqL05HTrCvARS8jjo7s/gM31a+/+IhJdrqsfHZt/kXU4eJEvOB7dp5NPlm0vx96b3/D/LaidnwD8Du0pKve7umL/YzBlU4AQinhhf5O1ZmEsaZ0UH82aGrfaWfnueH4ITfAots/2+4AdIX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewYZ6DaN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712232562; x=1743768562;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ysZE8b+PcsJMS5XbBBkjHo9NQ2JlBE9wYp1VkPJclS4=;
  b=ewYZ6DaNg8xhevSeE381dAW3k/bEQeQXjywfK3cublGdTX9sPHb7ruY4
   6a0d7+L0rvcx5OjEWAuLy/PvGNm00YQtYRKV3M2g0S2ELJOjw0oc/CKcm
   po0KPoLeIIxmJ8lL9MTsUr5KuApSNewSSLyb5kydl6XhAyBlb4QNLwTaA
   Zliuh3jcB6a2I1BHlxZaAX10MwU85MUKONFIVnrmOHviLvfugeUnFVKSv
   UqGuXgNz+0FoS6r4c6yk9/NPJchTIJqbUkRkvP9fLWxVnhQiy6jD55Hp7
   4WLvGuNoiY6A/WdHJ8LwTH3OprdQCAmxbV2t3qQpnT0zk+gheuSUmrhWc
   Q==;
X-CSE-ConnectionGUID: My64sEqlSi64P98lJYpBbg==
X-CSE-MsgGUID: fTWqpI0iSNebCEQAVjBu6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18240628"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="18240628"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 05:09:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="937086421"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="937086421"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2024 05:09:19 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@intel.com,
	Thinh.Nguyen@synopsys.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date: Thu,  4 Apr 2024 15:11:04 +0300
Message-Id: <20240404121106.2842417-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

A couple xhci fixes for 6.9 rc
The null pointer dereferece fix solves a regression in 6.9-rc1,
so no need to add it to stable

Thanks
-Mathias

Mathias Nyman (1):
  xhci: Fix root hub port null pointer dereference in xhci tracepoints

Oliver Neukum (1):
  usb: xhci: correct return value in case of STS_HCE

 drivers/usb/host/xhci-ring.c  |  9 ++++-----
 drivers/usb/host/xhci-trace.h | 12 +++++-------
 2 files changed, 9 insertions(+), 12 deletions(-)

-- 
2.25.1


