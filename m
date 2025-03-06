Return-Path: <linux-usb+bounces-21440-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F9A54E30
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBB0A188DE70
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BAA18B47D;
	Thu,  6 Mar 2025 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIVBXftL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACE918A6A8
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272578; cv=none; b=dI114uRD800hoF8Jzlu3Bmt+Tjvo/mrhuvCnbU8jrAJn0ApbHScldFS7q+XFODFOVeZhVEPKAO/pRgiAaOXca+7UCvoIjjVhEF8CDBfE9hINkDOadsCxswqjGa2dJ0DKQuJROrMtkqF/kimEGGuhy76Qc0qFDiFCeGCypOSVZv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272578; c=relaxed/simple;
	bh=yJRzzo5/COsmxeegx4DFYRPoycqUAjf4h3FW7G+oWYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEXGHBGmkka9EL+IJuWroB6x4Z2sxBE31KlqQ+oJ+nbqPxqMK70isgRHilMKOvJoDAH4xP9YCfVjmv6Fdlbl6RZx1ZBpX+HPa7h5w7XIqRp41m6U0DcnD0+YJuCX3yQwUPVecARPyBbWW5QeIH1ymHsW9nyrpbpVOcmDDu6pRf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIVBXftL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272577; x=1772808577;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yJRzzo5/COsmxeegx4DFYRPoycqUAjf4h3FW7G+oWYA=;
  b=BIVBXftLN/g1PqGi/n0WZ9y+kk2w+rc8TtYaFobTqs4jkU82KpCO+NqX
   gbYsBbUUTifsECoeCXwgsKxvJKlhNi9BXI0nUY6rgua+k6PxFTu8VPjS+
   F+k5/qswGQ+4Zt9HyUFWXf8mfszE7coQ1WmbsbkVTJ4YWQmo0wN+x4cR5
   /JS+S/Af0zIPuEMIYMpicsWZYkOG+qb+uOcD28eYXOj1fTUbZNSrYtLBN
   cQu9+FdgH4Hybuii6Xbnm0zWn5s3CiltShZ+8By8GihZrgrzyEQ7D+4xx
   CuKstwx5kgphlqG0AY1wVKNAK+ot0UO8n+Py/ep3kQwQPUvZuwYVtd+PE
   g==;
X-CSE-ConnectionGUID: tZyz8qRoQ8qGh0Xw5nrjTw==
X-CSE-MsgGUID: F4BotkQzRg+VKyDDBvE/zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67657092"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67657092"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:49:37 -0800
X-CSE-ConnectionGUID: OeKUdtGARsaHTtR6qdpW9g==
X-CSE-MsgGUID: PnmDb1mhSwaopPvpfn4buQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954825"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:49:35 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/15] usb: xhci: Skip only one TD on Ring Underrun/Overrun
Date: Thu,  6 Mar 2025 16:49:46 +0200
Message-ID: <20250306144954.3507700-8-mathias.nyman@linux.intel.com>
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

If skipping is deferred to events other than Missed Service Error itsef,
it means we are running on an xHCI 1.0 host and don't know how many TDs
were missed until we reach some ordinary transfer completion event.

And in case of ring xrun, we can't know where the xrun happened either.

If we skip all pending TDs, we may prematurely give back TDs added after
the xrun had occurred, risking data loss or buffer UAF by the xHC.

If we skip none, a driver may become confused and stop working when all
its URBs are missed and appear to be "in flight" forever.

Skip exactly one TD on each xrun event - the first one that was missed,
as we can now be sure that the HC has finished processing it. Provided
that one more TD is queued before any subsequent doorbell ring, it will
become safe to skip another TD by the time we get an xrun again.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e871dd61a636..70b896297494 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2843,8 +2843,21 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 					return 0;
 
 				skip_isoc_td(xhci, td, ep, status);
-				if (!list_empty(&ep_ring->td_list))
+
+				if (!list_empty(&ep_ring->td_list)) {
+					if (ring_xrun_event) {
+						/*
+						 * If we are here, we are on xHCI 1.0 host with no
+						 * idea how many TDs were missed or where the xrun
+						 * occurred. New TDs may have been added after the
+						 * xrun, so skip only one TD to be safe.
+						 */
+						xhci_dbg(xhci, "Skipped one TD for slot %u ep %u",
+								slot_id, ep_index);
+						return 0;
+					}
 					continue;
+				}
 
 				xhci_dbg(xhci, "All TDs skipped for slot %u ep %u. Clear skip flag.\n",
 					 slot_id, ep_index);
-- 
2.43.0


