Return-Path: <linux-usb+bounces-11675-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E2891814B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 531381F23AC7
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972261850B4;
	Wed, 26 Jun 2024 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJUYZNTc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFAC181D0C
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406007; cv=none; b=at692yxkMz+lrYN+jXRIwzMsn1SSNAcqN8LeADA4jgMzE2j6CgMHx1AJcj2/sZ3sFmu0wFgTUKNBIuJrkk7qOsaig7TP3/KxMiGRdWU/gRriY0nSuP7jlCdshoq89Ar7h7bwvzb+lLKF/ZEEt5/RB61Jlf39GxJNe7AzlE5JR8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406007; c=relaxed/simple;
	bh=ohlAzMIQfHAngwU+KcVNCQULz7kEC3fCYbAb9V+d1Ns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AsF78Su6HU54TOTOpYNEo8hTRon17hJJ8djSFU8rR4FMsjCZSqWaqEAV3Wzq2SGYqJsWsB/XB16ye9rEcf+WJ+PegxUkwJp9cB6+auLReT4xyPT6DMnRDFCUNOsoc1x6e/aE68JQyp3wFpy+XVUAEMCIgZHs+suljqUg6wQB1nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJUYZNTc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406005; x=1750942005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ohlAzMIQfHAngwU+KcVNCQULz7kEC3fCYbAb9V+d1Ns=;
  b=EJUYZNTcOt8JIsJkE3Rp7IbTF+q+3fRJ1cWNSiZo0wh10Lo4zooKbPGH
   G5hLJO3ZlrgkfVlkVSYZbxDplBoYij3MZfNUKjU5kYLQIUcxnCpLWbJDn
   jVytMT7HfOB4Vr7HENdu2ccJHf6rL8FhV+XBaLSomkxNHygOCqICMuxPY
   Y6gbCFkauQF58VjJaAKNo21MDb8T/XIF/B9b/HG7DEJTTHc2DepVQJDKY
   6rENmlbeA1FTp8OzYy6wRLdZezgnFz360xZowpI3HSHWYW3EvchTIZ9XR
   4uheRgo266IMOTavSU2WzimSHHPcNxyYEsLLo6ot9NmQe4FKsqLSKz2rZ
   g==;
X-CSE-ConnectionGUID: z0FzgCiWTwq6f4U5+kgnlg==
X-CSE-MsgGUID: 6A2Mm1BbRn6jgZwzQn7KuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353366"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353366"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:46:45 -0700
X-CSE-ConnectionGUID: XB/VL4cvSRmzt9fBnSpFPw==
X-CSE-MsgGUID: OrqvaRefSdazLypb0exMmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442569"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:46:44 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/21] xhci: show usb device name in xhci urb tracing
Date: Wed, 26 Jun 2024 15:48:16 +0300
Message-Id: <20240626124835.1023046-3-mathias.nyman@linux.intel.com>
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

parsing xhci traces on systems with several xHCI controllers and connected
usb devices is difficult as entries are all interleaved.

showing usb devname in urb tracing reveals both which device, and which
bus/controller the entry is for.

old:
xhci_urb_enqueue: ep2in-bulk: urb 0000000039224498  ...

new:
xhci_urb_enqueue: 3-9.4 ep1in-bulk: urb 0000000013bf21e7 ...

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-trace.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 5762564b9d73..24405315ffe6 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -250,6 +250,7 @@ DECLARE_EVENT_CLASS(xhci_log_urb,
 	TP_PROTO(struct urb *urb),
 	TP_ARGS(urb),
 	TP_STRUCT__entry(
+		__string(devname, dev_name(&urb->dev->dev))
 		__field(void *, urb)
 		__field(unsigned int, pipe)
 		__field(unsigned int, stream)
@@ -265,6 +266,7 @@ DECLARE_EVENT_CLASS(xhci_log_urb,
 		__field(int, slot_id)
 	),
 	TP_fast_assign(
+		__assign_str(devname);
 		__entry->urb = urb;
 		__entry->pipe = urb->pipe;
 		__entry->stream = urb->stream_id;
@@ -279,7 +281,8 @@ DECLARE_EVENT_CLASS(xhci_log_urb,
 		__entry->type = usb_endpoint_type(&urb->ep->desc);
 		__entry->slot_id = urb->dev->slot_id;
 	),
-	TP_printk("ep%d%s-%s: urb %p pipe %u slot %d length %d/%d sgs %d/%d stream %d flags %08x",
+	TP_printk("%s ep%d%s-%s: urb %p pipe %u slot %d length %d/%d sgs %d/%d stream %d flags %08x",
+			__get_str(devname),
 			__entry->epnum, __entry->dir_in ? "in" : "out",
 			__print_symbolic(__entry->type,
 				   { USB_ENDPOINT_XFER_INT,	"intr" },
-- 
2.25.1


