Return-Path: <linux-usb+bounces-11676-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF36A91814C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B6F9284148
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF12C185E45;
	Wed, 26 Jun 2024 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TP0ISuf6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1C61850A6
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406008; cv=none; b=Ysmqd5C1lWvQb0mOCG0/48PvXIatQKSAYd2joTNPJMkSr1UoY8J33Mwo3XX5kLUga4pp9lsdlrfi18f8uTNQy51sNmVJ9sCNetnm4La3CFuoaj0eijqKUQimddMupiQn7E+0fq+8Gf/xDB11V4I5Xtul60C6VD5jh2PZPOaOwTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406008; c=relaxed/simple;
	bh=7+iTBEdlfrKFKbc7K7Nyq9pAL6VazWI42smRq6uBE7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kpFogbtfJSnJ20/8RxQ4gnEu1293WeMZwa3oYCd7ybOewAMAL/QbS3Q/pGScvAlQXwNE/TCHBMN5pbk+EtOT23v+OZ10LsPT1GCoi14V4j2v5eeYn6+vKWN4RuY04ym6jiNl1uCvwHkI8wf+mfqCQK8BQZIzDcwypbRlLKbi0Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TP0ISuf6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406007; x=1750942007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7+iTBEdlfrKFKbc7K7Nyq9pAL6VazWI42smRq6uBE7s=;
  b=TP0ISuf6rSKaJDAr+EZVwIf5MPuoBxpyXkMXjtDtaL21v3FK4HTtLith
   T7qkLnzAVs3ccUJw2sZzlNvuJbGynro1m2S/kvBN/ne5ef3UHbhNCsxcM
   mGHzjdjgqaI19vq6W2s4y9x/jywFdlyevRE3bR8ZE+O5m2sxGHUACVcpS
   PV3yXBfWCOXx3IninakvaPIdFolhwtQsPmhd3OvdMtnLr+RK854ety231
   UqOuCwHXV/uAclyYflW3KHAHPYzI4+2KLhMvr0FJavAXDXuoRM4nIXrsN
   VHbByqRkEj+H/pgxDnG0Ifq1wVnoWr5Yehlg8ZgqEd02jYNNE6ipI3jSK
   Q==;
X-CSE-ConnectionGUID: lvF36v6eQQ2cssyY8EINlQ==
X-CSE-MsgGUID: nHXvZ3iYThqx5nx7WWfb+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353370"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353370"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:46:47 -0700
X-CSE-ConnectionGUID: +WkQiUtVQcK7SjGBHU/DVg==
X-CSE-MsgGUID: uSSNAzIkTvaEVlyPdwejgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442576"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:46:45 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/21] xhci: Set correct transferred length for cancelled isoc transfers
Date: Wed, 26 Jun 2024 15:48:17 +0300
Message-Id: <20240626124835.1023046-4-mathias.nyman@linux.intel.com>
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

The transferred length is incorrectly zeroed for cancelled isoc
transfer TDs when the transfer ring stops on a cancelled TD with
a 'Stop - Length Invalid' completion code.

Length was always set to zero in these cases even if it should be
set to the sum of the TRB transfer block lengths up to
the TRB the ring stopped on, _excluding_ the one stopped on.

No issues reported due to this isoc case. Found while inspecting
related case in bulk transfer 'Stop - Length Invalid' handling.

Change this so that 'Stop - Length Invalid' transfer completion
cases always sum up TRB lengths instead of report a zero length.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ffb3ebb72eaa..a12009ed1b36 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2439,7 +2439,9 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		requested = remaining;
 		break;
 	case COMP_STOPPED_LENGTH_INVALID:
-		requested = 0;
+		/* exclude stopped trb with invalid length from length sum */
+		sum_trbs_for_length = true;
+		ep_trb_len = 0;
 		remaining = 0;
 		break;
 	default:
-- 
2.25.1


