Return-Path: <linux-usb+bounces-11685-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4774918155
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 860931F22C22
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DA61836C7;
	Wed, 26 Jun 2024 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9YTDtSI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BBF18629A
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406022; cv=none; b=pXHGYjouto9DQx2PtRxsBkKt30lUZjpxBs6GjuPc1xVc5C8PoWQgM8SWo6WKLn9khO9FyYXM4u7o9CZ3VT6HKJYTulR+Lmip9vX0s7oX+9zPC7BYZpMZre6mVRcCeSBGM4RvDtZi/K2F/86fXVHZza49KjwgfGFYzTjN4RV3+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406022; c=relaxed/simple;
	bh=0fHEd6QUDtZVl/cbhF+63TlYYmDfWcI/JNnv82wIwhc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nWQ7wvmBNt8pkuq8f5BMOFI/t3mQ4MkcTUuEwWAEMWMsAAtb0xxcNPK/cWD0GNC3I6XUgc3KOtyhEmyJF6CbRBLBODxHjqWvgsqq+ZBWsG9zqLM+q6Qg6HTjLseDNRaBgljrjt7hzKjx9jTYY2t+yUxQjSW3lnEibV/HRCHa2jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9YTDtSI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406021; x=1750942021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0fHEd6QUDtZVl/cbhF+63TlYYmDfWcI/JNnv82wIwhc=;
  b=G9YTDtSInn4fl0ScCIWo+OkuWGAgvKo5CIZddV985uR1uwopC9i1YWHW
   ZKnVQyiWo17WHqmCU3Wbd1JtO00Y3R0pxU7yy/fBH/lBlldK0AA5+S0Xe
   jyz57PrST90I6Exr4Jh3qGFx4CkloxdvK+jrMpHgQToNsvJyNbui401qW
   Q2YJ/pAZH/YMDyl1VxX5NHPbMcMZ12WMrvCQ8kZxM2hOS5P5yZHHCTrNF
   kXtaxfAtTy/mxpKFctIMip4gSe6tpoe4BzoPZU/VCbnc7IYZbm81tIiTm
   r9KFRiWJclz63J+xCau+IFa/mS/byYFo6ysBCvGGLFvDAi/sVDkVHKHjZ
   Q==;
X-CSE-ConnectionGUID: BMtSCxbwT8C/yIpEc5xINQ==
X-CSE-MsgGUID: B6j47BYxTw6pljkI31G6DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353402"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353402"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:47:01 -0700
X-CSE-ConnectionGUID: o9KcJbXYTpmd744xXR6CRw==
X-CSE-MsgGUID: ZmJ0oxvvRI6lpTlj8adAIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442664"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:46:59 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 12/21] usb: xhci: improve error message for targetless transfer event
Date: Wed, 26 Jun 2024 15:48:26 +0300
Message-Id: <20240626124835.1023046-13-mathias.nyman@linux.intel.com>
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

Improve error message for unknown transfer event without a TRB, by also
printing the event code number. This removes the inevitable question;
"what was the unknown event code exactly?"

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7f40be2a3885..d4e4c1c71f90 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2582,8 +2582,8 @@ static int handle_transferless_tx_event(struct xhci_hcd *xhci, struct xhci_virt_
 	case COMP_STOPPED_LENGTH_INVALID:
 		break;
 	default:
-		xhci_err(xhci, "ERROR Transfer event for unknown stream ring slot %u ep %u\n",
-			 ep->vdev->slot_id, ep->ep_index);
+		xhci_err(xhci, "Transfer event %u for unknown stream ring slot %u ep %u\n",
+			 trb_comp_code, ep->vdev->slot_id, ep->ep_index);
 		return -ENODEV;
 	}
 	return 0;
-- 
2.25.1


