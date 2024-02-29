Return-Path: <linux-usb+bounces-7341-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED2B86CB15
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 15:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5AD01F23BF1
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 14:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7901361A4;
	Thu, 29 Feb 2024 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNbfnv/6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046191353EF
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709215998; cv=none; b=eM0942RXXPZ4iSaoqHypJJI4zIAMnxxSjnKhKbBmT0+J1UivHHXq9MrEn56IoRP9yd+1Y4h+DfYh8H57lxeFRRKnQ9pjhRvrdJxz/rj5SC324o18LreWAo4UHs+/sJc0PTyHWqw6/zHjdcdqaoc+jsSWh35UB5YiMSpMAlW/RHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709215998; c=relaxed/simple;
	bh=hHWeGAQTWPoQXSQAxPUMZKd9yJ0GwYpYZ7JABJrKnrw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UYW801aaPVB/SE4cz2JqSWto37yoA9O9iZeluoedajLTaLYMohJVdGszPUAi3Lku2AUEJ0r+BPbFYRF0Ikj5Y5BRf3Md2EhS1GAY+MVu9fvDz3Or9oGx5CwOlE3mmc5sFFKplcnkD1v3ANGEmd5QZkBzgc2xWUMSuDN+T82Ov98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNbfnv/6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709215997; x=1740751997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hHWeGAQTWPoQXSQAxPUMZKd9yJ0GwYpYZ7JABJrKnrw=;
  b=GNbfnv/6iQ8wBO446zcn7du+/pb/H2tttqbo9ZsICozUqtMyjY9w5faM
   kWtNEar8HhI1+FBO3IZe3a39UTBlhzt09VDJ+mtE18WOqn1Jy5ROK0S1j
   Fuigv08tRk4xJwjANLP1xnHmdHyvfFrkcM4m3gi7gOJ0b/jZ4kBhQDYeE
   l3ef8jLJRVAsUzzrubwUQMSf3i8IdFPWPDQ/t5bK9vGbXLk+f156kt2vo
   tEBiZHKzaTBC6nkmoAf/2UuBC5fFX3UNa326K0jdE3dUu8qLxYScLGUYc
   ZOSE28kUB0Mf5Br1/7ERxkaK7Ydfo1FktJ5WtWqUp356OjguU5livERAg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3609402"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3609402"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 06:13:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937035993"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="937035993"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2024 06:13:15 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 7/9] xhci: retry Stop Endpoint on buggy NEC controllers
Date: Thu, 29 Feb 2024 16:14:36 +0200
Message-Id: <20240229141438.619372-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
References: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

Two NEC uPD720200 adapters have been observed to randomly misbehave:
a Stop Endpoint command fails with Context Error, the Output Context
indicates Stopped state, and the endpoint keeps running. Very often,
Set TR Dequeue Pointer is seen to fail next with Context Error too,
in addition to problems from unexpectedly completed cancelled work.

The pathology is common on fast running isoc endpoints like uvcvideo,
but has also been reproduced on a full-speed bulk endpoint of pl2303.
It seems all EPs are affected, with risk proportional to their load.

Reproduction involves receiving any kind of stream and closing it to
make the device driver cancel URBs already queued in advance.

Deal with it by retrying the command like in the Running state.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b2116501048c..6a29ebd6682d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1154,6 +1154,15 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 				break;
 			ep->ep_state &= ~EP_STOP_CMD_PENDING;
 			return;
+		case EP_STATE_STOPPED:
+			/*
+			 * NEC uPD720200 sometimes sets this state and fails with
+			 * Context Error while continuing to process TRBs.
+			 * Be conservative and trust EP_CTX_STATE on other chips.
+			 */
+			if (!(xhci->quirks & XHCI_NEC_HOST))
+				break;
+			fallthrough;
 		case EP_STATE_RUNNING:
 			/* Race, HW handled stop ep cmd before ep was running */
 			xhci_dbg(xhci, "Stop ep completion ctx error, ep is running\n");
-- 
2.25.1


