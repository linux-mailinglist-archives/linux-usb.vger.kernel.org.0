Return-Path: <linux-usb+bounces-18830-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2023C9FD40C
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 13:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B73BC3A10E9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 12:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65E01F2370;
	Fri, 27 Dec 2024 12:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTnj/AKY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0610156F30
	for <linux-usb@vger.kernel.org>; Fri, 27 Dec 2024 12:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300857; cv=none; b=hZ5KyAfPk5XoV2dsN1InHWcT5zfVgvNS8tUi4xbodldKfetRmK4j2AVnVSh62CGpa71RzV8AItRt5+VEz/R5H2dNunF7aOpQ0/4ScWXbiZx3eLk/wbTeaqtMaxgFP+R81AF/PyPFIK2ptxfYUfs6o8XwFlf7YG6HPnecVQmqjBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300857; c=relaxed/simple;
	bh=pRMwYk48x3YwKnRHv35RHEganziIbN+DGCJx+N4kNAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lPZ//o3sx57HXbW84Fy0dKjLK4UWlo9CYHpHZTo4Et9qVfKqCHUIDqme0AOjqzLARF9aOH/jCiPCtAln1oohCgqP0G8ou90a/vB++HacknP5/5DxwIEBxTWuG77lovBGqcFKair3DzhDqxF/vOEz24Q73+9H3Y+43vfPt+7juDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTnj/AKY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735300856; x=1766836856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pRMwYk48x3YwKnRHv35RHEganziIbN+DGCJx+N4kNAs=;
  b=WTnj/AKYBa8wgScumf8nTStymddwVWMm6DmWohRFDTu4p+GybiNEpD+V
   /0utrI26PxGo5rIPrAiJqZ/qWDllbutuDWCml2ctwQwUVRquFqmmUCa7G
   gcCSA/eoi3oRb1LX8v3jJ/ldAJSmJBICCokTeUQ++p5fiLtH8JedNMTR/
   uc88WHmrQC+JX++6WNXk4tVeZ33nrQ3NCc/SFOfNEN9uHOj87IlYbtfKT
   FIo7Ryq5U3pWSmY1bTF1T+jc3pEIKuAO7j+LKKrID5lRie84GbXEl4Tq9
   T/SpOYQTT4+Y0qWLBBXl+LAJMYaWwSaJjAuFNaArTSlmRVn0vwUz5P2sT
   A==;
X-CSE-ConnectionGUID: jDwYNsBeQc606TVwx9zL/w==
X-CSE-MsgGUID: 7kqhvfTIRSCoCmH5LD0VRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35932530"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35932530"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 04:00:56 -0800
X-CSE-ConnectionGUID: POcWN7t4SReOU1fsN8Utig==
X-CSE-MsgGUID: oKu4w0rRSy2Vn+Qmg6XxkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104772453"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2024 04:00:54 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/5] xhci: Add command completion parameter support
Date: Fri, 27 Dec 2024 14:01:41 +0200
Message-Id: <20241227120142.1035206-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241227120142.1035206-1-mathias.nyman@linux.intel.com>
References: <20241227120142.1035206-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xHC hosts can pass 24 bits of data with a command completion event TRB
as the completion code only uses 8 bits of the 32 bit status field.

Only Configure Endpoint, and Get Extended Property commands utilize
this "command completion parameter" 24 bit field.
For other command completion events the xHC should keep it RsvdZ.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 10 ++++++----
 drivers/usb/host/xhci.h      |  4 ++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index da26e317ab0c..18ad33a01d32 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1652,12 +1652,13 @@ static void xhci_handle_cmd_nec_get_fw(struct xhci_hcd *xhci,
 			NEC_FW_MINOR(le32_to_cpu(event->status)));
 }
 
-static void xhci_complete_del_and_free_cmd(struct xhci_command *cmd, u32 status)
+static void xhci_complete_del_and_free_cmd(struct xhci_command *cmd, u32 comp_code, u32 comp_param)
 {
 	list_del(&cmd->cmd_list);
 
 	if (cmd->completion) {
-		cmd->status = status;
+		cmd->status = comp_code;
+		cmd->comp_param = comp_param;
 		complete(cmd->completion);
 	} else {
 		kfree(cmd);
@@ -1669,7 +1670,7 @@ void xhci_cleanup_command_queue(struct xhci_hcd *xhci)
 	struct xhci_command *cur_cmd, *tmp_cmd;
 	xhci->current_cmd = NULL;
 	list_for_each_entry_safe(cur_cmd, tmp_cmd, &xhci->cmd_list, cmd_list)
-		xhci_complete_del_and_free_cmd(cur_cmd, COMP_COMMAND_ABORTED);
+		xhci_complete_del_and_free_cmd(cur_cmd, COMP_COMMAND_ABORTED, 0);
 }
 
 void xhci_handle_command_timeout(struct work_struct *work)
@@ -1754,6 +1755,7 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
 		struct xhci_event_cmd *event)
 {
 	unsigned int slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->flags));
+	u32 status = le32_to_cpu(event->status);
 	u64 cmd_dma;
 	dma_addr_t cmd_dequeue_dma;
 	u32 cmd_comp_code;
@@ -1882,7 +1884,7 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
 	}
 
 event_handled:
-	xhci_complete_del_and_free_cmd(cmd, cmd_comp_code);
+	xhci_complete_del_and_free_cmd(cmd, cmd_comp_code, COMP_PARAM(status));
 
 	inc_deq(xhci, xhci->cmd_ring);
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 4914f0a10cff..8c164340a2c3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -529,6 +529,7 @@ struct xhci_command {
 	/* Input context for changing device state */
 	struct xhci_container_ctx	*in_ctx;
 	u32				status;
+	u32				comp_param;
 	int				slot_id;
 	/* If completion is null, no one is waiting on this command
 	 * and the structure can be freed after the command completes.
@@ -959,6 +960,9 @@ struct xhci_event_cmd {
 	__le32 flags;
 };
 
+/* status bitmasks */
+#define COMP_PARAM(p)	((p) & 0xffffff) /* Command Completion Parameter */
+
 /* Address device - disable SetAddress */
 #define TRB_BSR		(1<<9)
 
-- 
2.25.1


