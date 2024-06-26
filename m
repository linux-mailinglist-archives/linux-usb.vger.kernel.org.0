Return-Path: <linux-usb+bounces-11680-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 916E0918150
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A8B21F2491A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576E9186281;
	Wed, 26 Jun 2024 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ux+e29sh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EF4185E74
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406014; cv=none; b=HBYoXQcaICGoOoNW9/mvHYChtTcZg48EAp+L9oCqrwaXzqle0znyYtFoeMEXgqLgbcHgV9rcwxhjC8lYyf9Rw/CTAOxtQAF5pP2tX6kuBSYXyk2M91J8/z+qsLbSWKYxj8UhZbWWyrmusk45G7yRpK1fhyKDTAyi+/nEw3JS1Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406014; c=relaxed/simple;
	bh=rfAAQGB5R2HBy5HOhB5HCGGepa7BJWw6hAipjm4DFS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G8fqbb5VpjhYNBb5w5IEXBn2spLTyTlcef4yrAtEl4RUCxGLvPK6s3vgASTK2DtXPyjAWCT1984UW+QRzi+/6OUhGZHeKGuoLW1mzDlYVAIBosU/fYtSLU2ndG3YqDXpUsEbQOyX11VTRxiQUj80cg8lFq1Z6frzYuvaTtMLCxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ux+e29sh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406014; x=1750942014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rfAAQGB5R2HBy5HOhB5HCGGepa7BJWw6hAipjm4DFS4=;
  b=Ux+e29sh66xyaTuLv8IQa5J20yTGnpFcbCAbEfO7Gp6iIjkMfmo1Hik0
   16Xp37L5jKXmEnjeCZCoUwaKn2ME0ryEnzdWdmZtnYHa2CuzfY7zYavEj
   0iDwdavvV60wxEMAzDHxxH8TKjkLvZfmd9zLzwmzZu/FBTpzW3zRvraa/
   GPIVRTr0+7Vn9xdRwF2q1ora09jSwQxO7x8cBGM9eFNLtgTjQ4hmXs8uf
   1mG4UFd+QVF07rRz9qoKiGNDBoEnsgjUl5PWgbVG9IjHt4c8XqSfPUdfy
   MU20NKKHkYRLEpbQEMSpcJgjpUGjlZbQ2dZhY2zdGdkAgLW15XgpJ5gVM
   w==;
X-CSE-ConnectionGUID: dNWfaWcOS5mrhVnqvKUwwg==
X-CSE-MsgGUID: ueQ6CdGmRcu3oXywR1dVrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353384"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353384"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:46:53 -0700
X-CSE-ConnectionGUID: i2HpsXAVTpCJBPrAMDpR9Q==
X-CSE-MsgGUID: UFugE2HrT2uIp3tS9elb0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442626"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:46:52 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/21] usb: xhci: remove unused argument from xhci_handle_cmd_config_ep()
Date: Wed, 26 Jun 2024 15:48:21 +0300
Message-Id: <20240626124835.1023046-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
References: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Argument u32 'cmd_comp_code' is not used, and as a consequence
is removed.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index c528dc97dd9a..c2605e89adb0 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1516,8 +1516,7 @@ static void xhci_handle_cmd_disable_slot(struct xhci_hcd *xhci, int slot_id)
 		xhci_free_device_endpoint_resources(xhci, virt_dev, true);
 }
 
-static void xhci_handle_cmd_config_ep(struct xhci_hcd *xhci, int slot_id,
-		u32 cmd_comp_code)
+static void xhci_handle_cmd_config_ep(struct xhci_hcd *xhci, int slot_id)
 {
 	struct xhci_virt_device *virt_dev;
 	struct xhci_input_control_ctx *ctrl_ctx;
@@ -1766,7 +1765,7 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
 		break;
 	case TRB_CONFIG_EP:
 		if (!cmd->completion)
-			xhci_handle_cmd_config_ep(xhci, slot_id, cmd_comp_code);
+			xhci_handle_cmd_config_ep(xhci, slot_id);
 		break;
 	case TRB_EVAL_CONTEXT:
 		break;
-- 
2.25.1


