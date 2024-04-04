Return-Path: <linux-usb+bounces-8920-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 699988986D0
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 14:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 236E028CCF9
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 12:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA05486244;
	Thu,  4 Apr 2024 12:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrM1UpFp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D349284D35
	for <linux-usb@vger.kernel.org>; Thu,  4 Apr 2024 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712232567; cv=none; b=aekDq0rsFad4L6lUEJ3bUAVJurpXLpPgR82ZY2uA6qaftEX57g5JBPAkYHZT9NJh7A0yCErDfF5Ab7iJOngOlzpEiPOHEACKoN0Cd65KRgPKMMQWkLOKqwYlnNGULK0O9D3kPBTsgz/DIYAMyC5PcwuhUzjJMnmcYpuV+9po068=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712232567; c=relaxed/simple;
	bh=g4d8KzhHonSVDOgQJ7Tbuom6AzzNathrJGIa6HeYMSA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e30sPbTi4JkMpPWLh/tr+UHBlDAp/PDuUMpeaHX1tZx5WdCq5HMXbb0URoDHjJ/q1CS7F71qcfMI9DuSAurcmPA8IGug9gqJHxs3dS7OVdN+kI3UR9KR3mjm5CZ2UdemhQXs03a6g6MciUas9PQ/WSgSvN0t2IhTTdQdgMaJ9ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrM1UpFp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712232565; x=1743768565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g4d8KzhHonSVDOgQJ7Tbuom6AzzNathrJGIa6HeYMSA=;
  b=WrM1UpFp/8EL8BzAB5/ArN/9VUCyTkQAG2ezxlt4XWMLkhPgy6I8+kMY
   QLLeVfzOqZfGf/WP5OLGuO2fa3QQ04hkB5f2M5+a5B33zKE9ingGg6s9I
   u94sZ7+3GE/qb5WcrpIAtLwP/mM/RgvEHz+Ad3/diP82DyYTD8RiRAniV
   M2Z6lXmPM29wRBOz/v09H/lR9/jb97cOfSXRo8FtT/yYS5kO3FpJethXW
   /9zVovnEZTdiuKU5t3iHlP3R6FUTDU+kUAM0R65qkk0QBM6+AIbj0cDT9
   1EcWBo0ymTOH7wUNOt+OGqifpvVO6YcQF0sjC/DrtozNtIDgtN7gaOUNg
   A==;
X-CSE-ConnectionGUID: dWKvarxxTBq9ZJeLSp0tqA==
X-CSE-MsgGUID: TNVcEg7TS5KlCqqmaA9YwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18240651"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="18240651"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 05:09:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="937086427"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="937086427"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2024 05:09:23 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@intel.com,
	Thinh.Nguyen@synopsys.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/2] xhci: Fix root hub port null pointer dereference in xhci tracepoints
Date: Thu,  4 Apr 2024 15:11:06 +0300
Message-Id: <20240404121106.2842417-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240404121106.2842417-1-mathias.nyman@linux.intel.com>
References: <20240404121106.2842417-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pointer from a xhci usb virt device to its root hub port
(vdev->rhub_port) is set later when device is addressed, not while
vdev is allocated.

Tracepoints dereferenced this rhub_port pointer when freeing the virt
device, which causes null pointer dereference if tracing is enabled
and device is freed before addressed.

This can happen if tracing is enabled and xhci driver is unloaded before
a device is fully enumerated, or initial enumeration fails and device
is reset and freed before retry.

Don't dereference the rhub_port or show port numbers when tracing
xhci_free_virt_device(). This info is not very useful anyway.

Print the more useful slot id instead

Fixes: 06790c19086f ("xhci: replace real & fake port with pointer to root hub port")
Reported-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Closes: https://lore.kernel.org/linux-usb/20240402005007.klv2ij727fkz7rpd@synopsys.com/
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-trace.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 1740000d54c2..5762564b9d73 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -172,8 +172,7 @@ DECLARE_EVENT_CLASS(xhci_log_free_virt_dev,
 		__field(void *, vdev)
 		__field(unsigned long long, out_ctx)
 		__field(unsigned long long, in_ctx)
-		__field(int, hcd_portnum)
-		__field(int, hw_portnum)
+		__field(int, slot_id)
 		__field(u16, current_mel)
 
 	),
@@ -181,13 +180,12 @@ DECLARE_EVENT_CLASS(xhci_log_free_virt_dev,
 		__entry->vdev = vdev;
 		__entry->in_ctx = (unsigned long long) vdev->in_ctx->dma;
 		__entry->out_ctx = (unsigned long long) vdev->out_ctx->dma;
-		__entry->hcd_portnum = (int) vdev->rhub_port->hcd_portnum;
-		__entry->hw_portnum = (int) vdev->rhub_port->hw_portnum;
+		__entry->slot_id = (int) vdev->slot_id;
 		__entry->current_mel = (u16) vdev->current_mel;
 		),
-	TP_printk("vdev %p ctx %llx | %llx hcd_portnum %d hw_portnum %d current_mel %d",
-		__entry->vdev, __entry->in_ctx, __entry->out_ctx,
-		__entry->hcd_portnum, __entry->hw_portnum, __entry->current_mel
+	TP_printk("vdev %p slot %d ctx %llx | %llx current_mel %d",
+		__entry->vdev, __entry->slot_id, __entry->in_ctx,
+		__entry->out_ctx, __entry->current_mel
 	)
 );
 
-- 
2.25.1


