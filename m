Return-Path: <linux-usb+bounces-18827-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB239FD408
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 13:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0EA31883346
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 12:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20F01F130F;
	Fri, 27 Dec 2024 12:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApZY/Q7D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7579CD
	for <linux-usb@vger.kernel.org>; Fri, 27 Dec 2024 12:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300853; cv=none; b=UE3uo7QdepaAJH/4+x/bUE5hR70o0y6KlcwLjIDT/aIee6MxrMqX7Vh7phbir7HzCDBNPpmabp/6b8Z9mdOPzxsprZzH8K0YemWY/BYdq9S2p7SPxVN2z0DCOZalbxjVEX2nL/Lg1vlvOXiMBv6YFMcPwQNvKgSxkXuCnguIquE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300853; c=relaxed/simple;
	bh=p/r9M775DijYgWVNHs9Bp2oFksL/LIo1ralk2l27zro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GH8h3I+JVP2Ru+i44wou1WUNMQKydP7nysv+bmJetxEx34ILDhnr6LY2HkdAsmjY0WQENtUx7W0992X/6Rqk7HFa4AaC4dpbgnqGKiX/UxWO6ZgQ3IDpVHodZLR/FrADoVYrN/bQNDMIdaORl55MVNfV76iq25hpHFR7cP7MJxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApZY/Q7D; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735300851; x=1766836851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p/r9M775DijYgWVNHs9Bp2oFksL/LIo1ralk2l27zro=;
  b=ApZY/Q7DGlo2L7nN4g5zpbnMKHSNWu9hYfvFQA6SpOuulkXQIoEGJrWk
   s+J08bQM2x9vJQaCVPa48BRstFCQ/lq1IxJEsJXgQ0YkIeK/ZrGwjH2au
   0oSrzMraHddQ3ycOA7Q7uLkAdl8D9Tl88iQzR1b+Q8YG8qeiFf/PzglLz
   bRZZ5KVyr7r21q13VIdup8jyselBinoHkE0D8MPDAPHMPER2hZFLGY/Rs
   3oL16QHjQuwLaYo2+TpYbKZPk0R59ECU28+e938OLn6QfufyHLQWatX0n
   X5lL0GBfKc3GHrvdDRkBQmCqbYN/dEtFR3P05sW+1vwbTeefQh4QwAhUH
   w==;
X-CSE-ConnectionGUID: BwkKhVkWSSa5WT+oBfWn8w==
X-CSE-MsgGUID: dqiI7qqVT9uHOKKPPL6lvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35932517"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35932517"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 04:00:51 -0800
X-CSE-ConnectionGUID: Tgyd5c0iRDus1SWEGbGRcg==
X-CSE-MsgGUID: EOD52C0SQC+PKH5H3QKMaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104772437"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2024 04:00:49 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH 1/5] xhci: dbc: Improve performance by removing delay in transfer event polling.
Date: Fri, 27 Dec 2024 14:01:38 +0200
Message-Id: <20241227120142.1035206-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241227120142.1035206-1-mathias.nyman@linux.intel.com>
References: <20241227120142.1035206-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Queue event polling work with 0 delay in case there are pending transfers
queued up. This is part 2 of a 3 part series that roughly triples dbc
performace when using adb push and pull over dbc.

Max/min push rate after patches is 210/118 MB/s, pull rate 171/133 MB/s,
tested with large files (300MB-9GB) by Łukasz Bartosik

First performance improvement patch was commit 31128e7492dc
("xhci: dbc: add dbgtty request to end of list once it completes")

Cc: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 227e513867dd..fd7895b24367 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -957,7 +957,7 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 		/* set fast poll rate if there are pending data transfers */
 		if (!list_empty(&dbc->eps[BULK_OUT].list_pending) ||
 		    !list_empty(&dbc->eps[BULK_IN].list_pending))
-			poll_interval = 1;
+			poll_interval = 0;
 		break;
 	default:
 		dev_info(dbc->dev, "stop handling dbc events\n");
-- 
2.25.1


