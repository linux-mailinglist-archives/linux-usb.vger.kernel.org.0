Return-Path: <linux-usb+bounces-14714-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF64196DBC8
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 16:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9672B284B73
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 14:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD0E1754B;
	Thu,  5 Sep 2024 14:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iF7pbz1s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A52A171AF
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546680; cv=none; b=jFJe+mTsM/B6ZGJwZ7FJ7w5Nq2mnINMlklPr9k3IcIFzbQ/VXOr1XvY2ZesFhhXkFqzpIwjMRviq8kWvWaZu4QHuASRwGbSuxXxDZSBJVhIeXLeAbeslA1u85GX5kzSkIiGlYJqad0HzQX+mtez7QFpsSDTWKwJhCjtZSzDVmKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546680; c=relaxed/simple;
	bh=mOyvzH86quUGn1zroWBj1Drw6Y+UGpsCxFWlBatQ7lM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GMiwjQQ6YCpKCRubfkA0LI/YJOg2gWye9bZ9pSyOl+jz1wiM/SM97d83a35mBwJmvilZd2tsohczUb20eygIjdsYpJtUzOmPJhgc5Vd5zCwSEhyUmlhvnDhYE/I14ephYphdyLCyWU9Qxjlfm8f+dKpTOZ13gV0x8ED0RhHcxHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iF7pbz1s; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725546679; x=1757082679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mOyvzH86quUGn1zroWBj1Drw6Y+UGpsCxFWlBatQ7lM=;
  b=iF7pbz1sDitwkZ0e+IUqG+mjb1YhVgPuEIBOYAzI/23LGvKDnvcl6siK
   AifoG3tRZk4Gkkfy9qEf0VRZwgII2ovng0c869b5yaJNfn2yDC1cWDUU+
   pOYEqRvC01RHrCmnIgQXdRJcB1lSzxcb1eV2u9kcOWCx5Hv5fD6dxYqyY
   qsV3jPEDExu0jWytCtvuHlQ+0lwZfg6SumK8zMNk7YHsNT/4AMPlmDl1E
   nX8c3BQTNEu/7xQnu6MB/5ll4H+EVl/YYEj24qisbZ171lGfmkC3LqZfU
   JNCEe85Ibaj5VIjH+icENrzTf4Ew7tZnKl4q6wCQWjitBxvnVnvuIxn2/
   Q==;
X-CSE-ConnectionGUID: QwAwgFqiR+WI1IGNeLr3SA==
X-CSE-MsgGUID: +hJpq5ixThGtbnzJNGclPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49677502"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49677502"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:31:18 -0700
X-CSE-ConnectionGUID: /CPv48lpQGCXg0RD9e/mNA==
X-CSE-MsgGUID: qmcJz1oYQIGa+RIK5q6xew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="88883216"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2024 07:31:16 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Yue Haibing <yuehaibing@huawei.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/12] xhci: Remove unused function declarations
Date: Thu,  5 Sep 2024 17:32:51 +0300
Message-Id: <20240905143300.1959279-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
References: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yue Haibing <yuehaibing@huawei.com>

Commit 674f8438c121 ("xhci: split handling halted endpoints into two
steps") removed xhci_cleanup_stalled_ring() but left declaration.

Commit 25355e046d29 ("xhci: use generic command timer for stop endpoint
commands.") left behind xhci_stop_endpoint_command_watchdog().

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 40aebdfb37c9..ae4b50b01284 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1904,10 +1904,6 @@ int xhci_queue_reset_ep(struct xhci_hcd *xhci, struct xhci_command *cmd,
 		enum xhci_ep_reset_type reset_type);
 int xhci_queue_reset_device(struct xhci_hcd *xhci, struct xhci_command *cmd,
 		u32 slot_id);
-void xhci_cleanup_stalled_ring(struct xhci_hcd *xhci, unsigned int slot_id,
-			       unsigned int ep_index, unsigned int stream_id,
-			       struct xhci_td *td);
-void xhci_stop_endpoint_command_watchdog(struct timer_list *t);
 void xhci_handle_command_timeout(struct work_struct *work);
 
 void xhci_ring_ep_doorbell(struct xhci_hcd *xhci, unsigned int slot_id,
-- 
2.25.1


