Return-Path: <linux-usb+bounces-9903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5968B5ABA
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF11B1C21ED4
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5C87BAFE;
	Mon, 29 Apr 2024 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1OWSWrR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E617BAF7
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399275; cv=none; b=sNsuVqiKKOuTBxCX0t4uvGTyLC1MGk/frhXYXLvvMaLUgeRC6pVF9fDhO+JA77ycsL+JW1LoQPkxQfVDFjfluR5M1a4EgRyRsV7Iv87q6Tva9FYZoo01Yylh/W+QZzcP1tKpAPp/DoqkEiubJ9YOfsZsCY0mVr5oHnerW3x1IVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399275; c=relaxed/simple;
	bh=iee2tMXtIwhrLCpcwk2TZxZxA4tIJpkiuevKkLsnFeg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AXWwn9BWx4EbymdY2X607wu6vQ+Z6oWlPcYUs2RmDZ6+c/A8QOMgATlgpBcFu0pq6EhzVODp3LHCayOrj3/ldqTu32fmZPa2AXlkOk+RyydkiOqKMddknGNZ5L3MRhgLWtVpNC4sDuVHhoiUsJOJOSXleA8o8MFx3/jM77O/lX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1OWSWrR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399274; x=1745935274;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iee2tMXtIwhrLCpcwk2TZxZxA4tIJpkiuevKkLsnFeg=;
  b=l1OWSWrR2L6HW/jCp4MkQKZmdTqHIIneotyRk2gftXv7RAVsHiB+5vh6
   S/MNt2h0k3WcNumhr8zID/NmTwcr08VFBDKQ9iIZEt38BLgX5q9mJzF75
   MlNtaqsnZyR/YCVa2A+8f13Zg/bB3zmauwTrsF6GWqD+rre9dJp71QOk/
   vwV2GraVELySmfCcy3yib4SRUb69cRPsCi1xoMRPNgJjTCYjUSMe+tQxQ
   VHuKMwcL9ydAxBdcMhOBSsIdEY0XChUFvtwmiLrsdhkAU4NIlT/1Wz4v/
   mZ75F0FGVuKXx6f12xdTIhxn3zSaO0gLw3gTon/2LgauqoeIEF194lSVF
   Q==;
X-CSE-ConnectionGUID: BNqjYZTYTP+1Z+Tr7ZuZYQ==
X-CSE-MsgGUID: JSb1MOv4Th2lv5fF5/vbIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911463"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911463"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:13 -0700
X-CSE-ConnectionGUID: 8AnAcF48RkS8EikmNCYZ+g==
X-CSE-MsgGUID: wa8VWWcEQ8OMaka5FOArTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521813"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:11 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/18] usb: xhci: prevent potential failure in handle_tx_event() for Transfer events without TRB
Date: Mon, 29 Apr 2024 17:02:37 +0300
Message-Id: <20240429140245.3955523-11-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
References: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Some transfer events don't always point to a TRB, and consequently don't
have a endpoint ring. In these cases, function handle_tx_event() should
not proceed, because if 'ep->skip' is set, the pointer to the endpoint
ring is used.

To prevent a potential failure and make the code logical, return after
checking the completion code for a Transfer event without TRBs.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 07c529e072c9..00f48dd197ac 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2625,16 +2625,17 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			else
 				xhci_handle_halted_endpoint(xhci, ep, NULL,
 							    EP_SOFT_RESET);
-			goto cleanup;
+			break;
 		case COMP_RING_UNDERRUN:
 		case COMP_RING_OVERRUN:
 		case COMP_STOPPED_LENGTH_INVALID:
-			goto cleanup;
+			break;
 		default:
 			xhci_err(xhci, "ERROR Transfer event for unknown stream ring slot %u ep %u\n",
 				 slot_id, ep_index);
 			goto err_out;
 		}
+		return 0;
 	}
 
 	/* Count current td numbers if ep->skip is set */
-- 
2.25.1


