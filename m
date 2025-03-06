Return-Path: <linux-usb+bounces-21437-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4734A54E2D
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3AE016AD6A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BFC188591;
	Thu,  6 Mar 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmGxu9gF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3600E176ADB
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272573; cv=none; b=k4fxBauHDPUSddcCMAAY/MQ7WweSf3tnnlDHspg0habe7/z5Hvjcc2cCI0mMZY9uRyL3s8R4PHqgGEka0Dg35cLggIKTSVdC7G/wwCMXtpbFJqyc6MtYFHZytN3gP2Rpc5+KO2BD/uIh5ezsUnQPRtGyA41u0tpkvMtWbXtnNnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272573; c=relaxed/simple;
	bh=oVmjP8w0JU6XCm+Dk/U7ONYI2FWa0ax1oTFED//DoSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UmtoG58pV+n46b25lXqk8h72H/2QeDi1bgm5cqUESwSWLR6hkFnVEEN09RFI45kh/AGkoWFsEzKuuRW3TQbIh0zjs5Dw9GwzE1q1CKKBdP7AoJ+rv3qqNC0XaGj4TvAhIGmcoQhZCELn2fhhSLOWNzTVq7oyYRlSdcCXKHOD6IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmGxu9gF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272572; x=1772808572;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oVmjP8w0JU6XCm+Dk/U7ONYI2FWa0ax1oTFED//DoSM=;
  b=SmGxu9gF3gkTBjoyEx6flcXZ4WLknFoH+U/nONhNC5wz3nLIkOWPBSNy
   D107XO1TtbCk4BiRnkvyDu4mpiD/JuPWmQy9M0tU0VrX/IZmeG2wBmLTn
   KccqjRHu9gBleRYZ+/9DbTdTKAMWywXviay7hF+ugcccZlAPlMbGsgyMN
   N0PW2/VCnlXeCs5sJibkjO26ltI/oh11TRi+O1LA6TW/p3Y5Y0/gx4yH3
   DtIJJs07BKOQMS4j762RpcLSSSL/Gz7CAb47FXa16opnFOtbDRlJEk4n5
   xBWt41c8EFhw41z8luI7UMZcz/77UZIdgT4VBhblqGtl3K8o+jTOjF5aA
   Q==;
X-CSE-ConnectionGUID: UMiRtNrkQGmLbVPJgbtedQ==
X-CSE-MsgGUID: Y7VI7IOTSWyxUIiCTScJ1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67657074"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67657074"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:49:32 -0800
X-CSE-ConnectionGUID: s3ox1EpIQ2y4cDFXWH1rrw==
X-CSE-MsgGUID: O/eMaZ7eQ6SPA0w0mMBPgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954798"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:49:30 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/15] usb: xhci: Complete 'error mid TD' transfers when handling Missed Service
Date: Thu,  6 Mar 2025 16:49:43 +0200
Message-ID: <20250306144954.3507700-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
References: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

Missed Service Error after an error mid TD means that the failed TD has
already been passed by the xHC without acknowledgment of the final TRB,
a known hardware bug. So don't wait any more and give back the TD.

Reproduced on NEC uPD720200 under conditions of ludicrously bad USB link
quality, confirmed to behave as expected using dynamic debug.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 6fb48d30ec21..47aaaf4eb92a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2752,7 +2752,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		xhci_dbg(xhci,
 			 "Miss service interval error for slot %u ep %u, set skip flag\n",
 			 slot_id, ep_index);
-		return 0;
+		break;
 	case COMP_NO_PING_RESPONSE_ERROR:
 		ep->skip = true;
 		xhci_dbg(xhci,
@@ -2800,6 +2800,10 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		xhci_dequeue_td(xhci, td, ep_ring, td->status);
 	}
 
+	/* Missed TDs will be skipped on the next event */
+	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR)
+		return 0;
+
 	if (list_empty(&ep_ring->td_list)) {
 		/*
 		 * Don't print wanings if ring is empty due to a stopped endpoint generating an
-- 
2.43.0


