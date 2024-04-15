Return-Path: <linux-usb+bounces-9334-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B358A4879
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 08:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64506B22E22
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 06:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCD71EEE0;
	Mon, 15 Apr 2024 06:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLkCROF2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACAC3FB9F
	for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 06:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713164133; cv=none; b=Eef9223640kErVGEFEQWzV41eFmyNt3WVLJw3N/Lo61C/yymqHLmDg28+8cxBHXXdOf6FdtuHKZ4jUoKJ9/0g9IIHMzkfQ7G+h84JetmbrSZpf0CWbkm47yL4SQYVTtHUXgJTEjfhHk6zHhj/Asc+CWZDMB2uWYAgw35tKuNAjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713164133; c=relaxed/simple;
	bh=aRYPer9wiK72Gx5TWtF96vBdJRGX98YQARuqhMGab8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uE/iJzTrre6GHddIwWFhZ9BPmk24bqAKXjZeuJ6I/eOICBaPeAXXDQmUntkzFaK4fq8RLocJu9kSufR6QFI+0tZ19XeLqhTpC7NfJR7Rc+lsXurFfNkZx1Qao6FPZiSSqyEj4pRtFdpicoEu2/2cfq6RZryEAI9aB4Xf5x/2sfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLkCROF2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713164132; x=1744700132;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aRYPer9wiK72Gx5TWtF96vBdJRGX98YQARuqhMGab8k=;
  b=JLkCROF2tk7AuhDS0hBDsNhmURVBszpsDP3E4l59yviLEgzUdRvWGf4v
   omz95vztZaQGskvsI7mOrLxk48JADpzNQab1kEmMCZuW4Sz9Uwqe9wKxI
   Qko5hBLpCHrwg9IiFJQnPZ3VOewdqGYf8gsrzFiQMFhwZyyKEdEJEOlDE
   /RoCU/87zWWQBupSgbLn0Uw1avdsnxrD/mRqnZJkO4Kkhc+xTr5xynj0A
   iLsIBrdx9PxLmnrFqVCRJ0FQr5Go4NAvSZQAAM8g/KNIVCvTD1MpG/mPx
   rbxelpmOcJD2O051RS91GrPy/5UdcDLNv/G3wXWdBoL52HqLRH62t396s
   Q==;
X-CSE-ConnectionGUID: Zb4t95Z9QF6OTZ3IC8nYxA==
X-CSE-MsgGUID: T3uHWd0bRqu+MTZzxUvhMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8373177"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8373177"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 23:55:31 -0700
X-CSE-ConnectionGUID: mvU4uF73SEuZu3x2SR0Qjw==
X-CSE-MsgGUID: odi2cTb7SP6Ku3warIDvBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="59262764"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 14 Apr 2024 23:55:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 88D2B21A; Mon, 15 Apr 2024 09:55:28 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Use correct error code with ERROR_NOT_SUPPORTED
Date: Mon, 15 Apr 2024 09:55:28 +0300
Message-ID: <20240415065528.576769-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We check for -EOPNOTSUPP but tb_xdp_handle_error() translated it to
-ENOTSUPP instead which is dealt as "transient" error and retried after
a while. Fix this so that we bail out early when the other side clearly
tells us it is does not support this.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 940ae97987ff..11a50c86a1e4 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -250,7 +250,7 @@ static int tb_xdp_handle_error(const struct tb_xdp_error_response *res)
 	case ERROR_UNKNOWN_DOMAIN:
 		return -EIO;
 	case ERROR_NOT_SUPPORTED:
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 	case ERROR_NOT_READY:
 		return -EAGAIN;
 	default:
-- 
2.43.0


