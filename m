Return-Path: <linux-usb+bounces-13089-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350A94783A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 11:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02BF41F217ED
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 09:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB9B154429;
	Mon,  5 Aug 2024 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Us925CNo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0062A15380B
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722849649; cv=none; b=swBnVEjybhe4QTjB1tv/UTe0ZYxlcHJDn9/YuFE1+hcjt/dL98vOTqWX8M8kIJqtWNuyZ2huv/eit8fgBQK1mw6dsrbvhW0LHARLt/KCfc4tbueEd308C9dF8c8qCNwOVH3HTUw6jkyxBAhr4BsE1TEX2Bk2VT+3y7ZI+i8CusA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722849649; c=relaxed/simple;
	bh=E9FVutUtTCRBGIjFC1rOMGPYvN0IuQP6U+VVEAAVrl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G1qXJFqlrydOforYISAdLxgaHStPHBQEiOo3dbZpgDwNGBceR2BVcs/HyvYQuY0NhAogb8Y/qKUDhRilvC9FdBBuozM3jTmcLARRsAWHMGYjBDitdTjNWt2xnq+kRZPpqeuG09mU+XGquATOgDem7Wk7H5n6jWEUvS0BV7hyWFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Us925CNo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722849648; x=1754385648;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E9FVutUtTCRBGIjFC1rOMGPYvN0IuQP6U+VVEAAVrl8=;
  b=Us925CNol3tVhtrp5EkHtPMIjh9YhdUb/h8Gmqlh8aMyvTjU9Ewg7OeF
   oGCpfStPh5d3zaBKlyS6MVJOtI4cBjRxAkSGE69/BhniWiyF8+VcQOeSz
   hg/lfwW3cLb8wihMM27YtyVT4k9N1i5K/TfhVumRCBn0uMewdZ5sgi8SQ
   cKU+R3JreRn41IN0WKYNcWUrtCZ5XJIVexJEiJs+0co4R6x1ov5mO+RJM
   kUwAeXhnIsB0zh9Cz3RkWRkH+K/2Xq/U2qZPRX9cBw9I4ta897acehthW
   5oCpCZtP5XeDPse0uZfFL5eKIN786Iawm+///z7KnsuDXNXrWd/QRPrQr
   A==;
X-CSE-ConnectionGUID: jVWxUVNhRy64kV51YG77mQ==
X-CSE-MsgGUID: InyO5mT+RuGXdbpQYSF9nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="31953163"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="31953163"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 02:20:38 -0700
X-CSE-ConnectionGUID: ozjFDnwdROi95L2GWSJojg==
X-CSE-MsgGUID: 6hwDKuJyS/WKniMMqMfAYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="60732006"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 05 Aug 2024 02:20:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 30BD23A8; Mon, 05 Aug 2024 12:20:34 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Michal Pecio <michal.pecio@gmail.com>
Subject: [PATCH] usb: xhci: fix duplicate stall handling in handle_tx_event()
Date: Mon,  5 Aug 2024 12:17:27 +0300
Message-ID: <20240805091727.1827806-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stall handling is managed in the 'process_*' functions, which are called
right before the 'goto' stall handling code snippet. Thus, there should
be a return after the 'process_*' functions. Otherwise, the stall code may
run twice.

Fixes: 1b349f214ac7 ("usb: xhci: add 'goto' for halted endpoint check in handle_tx_event()")
Reported-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b7517c3c8059..4ea2c3e072a9 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2910,6 +2910,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
 	else
 		process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
+	return 0;
 
 check_endpoint_halted:
 	if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
-- 
2.43.0


