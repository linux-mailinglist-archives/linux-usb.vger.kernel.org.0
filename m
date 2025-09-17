Return-Path: <linux-usb+bounces-28215-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACDFB7F02C
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF3676255CE
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 13:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F739328971;
	Wed, 17 Sep 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+rozlke"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC17832E735
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113946; cv=none; b=O9yK87h8hGomxFKtikVZ8N3XD2clO7nuLzPiRWqLu8sSACzi1ZPxlTQbHWXJHyQnr/KokZyoOuDVC9zZpyJA4NO3d3HWgQMoH2YWc2BiIJNa614IoOoTLfCN5k4Zo/mS/3rYvBAGXfeW+mghJKwLDoO91mX2ZeOXlURzF5Zw2dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113946; c=relaxed/simple;
	bh=1xfCwgS21Nmk5xo/GSZMjJEZxvsDdvBfapcUqIEiYVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B93tv+8C0VofAD7DiAABmuWSMYsU1v5BFzukUBQWhKMzk6/3xU/lLi64Sd99CETXKt9b/wt6CRkwgb2DpjgmcLfl2i28CV39Sv+hbv2kw5C/C9GwklzrnZBqkTxi/n0RA4YTYoh+vSVO3KEsEk46MaQXqUHTFx76FITJvqDRlps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+rozlke; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758113945; x=1789649945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1xfCwgS21Nmk5xo/GSZMjJEZxvsDdvBfapcUqIEiYVI=;
  b=L+rozlkeyKFcOi3VmtNuDI9gxhEgvQOz0qJQm4aavaTrt+a0o3eFJzI4
   mcrALo4LEn/LE8Zn2/DVQYNa8OVfFC8HaR6PA+HTodLJbRO2kIt5xGgC5
   5AAAgkz/KDGezCjM+2sQaZos08JYXbEhpA11roPrZHHpNd2HE6/rxjqp4
   DGcTftCoRSEb2uWmgxqCUDpB2a8vU3IFO6CDSZS7rB5FTXuOdVWvb8JnA
   S84i6I5dGJPxa6+wqIO47YzqRroS1Xuitl0j7/dQVY0nyCcTgUSWEOtkQ
   vX43alZ2hT07vQLY4dZa/dK8P+bxJ6NY5BZAfFafaJxSzPw+g9tOUyiIs
   A==;
X-CSE-ConnectionGUID: OUUKPj7gSlOeVmc8sxtUCA==
X-CSE-MsgGUID: HzjnzVl0T+ao9YGhO1Ndfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60527411"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="60527411"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 05:59:04 -0700
X-CSE-ConnectionGUID: IxuR6VR0SxekBYWzkOAxtA==
X-CSE-MsgGUID: 6g1ToaSmTeCRxLIuXKXwJA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 17 Sep 2025 05:59:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 734E999; Wed, 17 Sep 2025 14:59:02 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	peter.chen@kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 2/8] usb: xhci: align PORTSC trace with one-based port numbering
Date: Wed, 17 Sep 2025 14:58:43 +0200
Message-ID: <20250917125850.3380560-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250917125850.3380560-1-niklas.neronin@linux.intel.com>
References: <20250917125850.3380560-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the xHCI driver, port numbers are typically described using a one-based
index. However, tracing currently uses a zero-based index. To ensure
consistency between tracing and dynamic debugging, update the trace port
number to use a one-based index.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index f303ce600ff5..9abc904f1749 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -550,7 +550,7 @@ DECLARE_EVENT_CLASS(xhci_log_portsc,
 	),
 	TP_fast_assign(
 		__entry->busnum = port->rhub->hcd->self.busnum;
-		__entry->portnum = port->hcd_portnum;
+		__entry->portnum = port->hcd_portnum + 1;
 		__entry->portsc = portsc;
 	),
 	TP_printk("port %d-%d: %s",
-- 
2.50.1


