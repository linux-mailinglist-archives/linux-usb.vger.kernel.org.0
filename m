Return-Path: <linux-usb+bounces-11678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E445391814E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21A3D1C21962
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C32185E66;
	Wed, 26 Jun 2024 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JlK9ysY+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25C31850B6
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406012; cv=none; b=C1bes5oiYFCIrNPAjnwWMqtgzrm+X/3Xjbqy63c6SoUfO6jAvykXFw2Ixs1NbjJMGTpD2zowC9Ah7VLOkWpao0oUQ8uA3mCj5g+TFOS1bA8ipDExOYWHtssX6VLJhDe9Co6OTObNJtzbR1QECkDYTLN+0zz+GTOQKYUJBtR+57I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406012; c=relaxed/simple;
	bh=qnF1aabk6XmCDSWp1a9CS0xzmmTt7z/1KA1e+pqx+kc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CSg8xZ8EWWuXY6g3PGz233UWtkSeRFC8kew8vfjhScNMg2RPZHchNEpWGXF7LV9SOJ7nwtzAUMoqvxejrf7ajDXsYUWBkcwMOHkkTlh0H392hoTo20W5+ud1j9eT8jE4ShrBRvnBuvQlrwtTgLoat46T0x42twqat3WIxXcsXLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JlK9ysY+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406011; x=1750942011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qnF1aabk6XmCDSWp1a9CS0xzmmTt7z/1KA1e+pqx+kc=;
  b=JlK9ysY+vnwrxDxAK1IyzlOfHg+Qd+fcdwrUC/CRdJAN1BZMaQGTVBUd
   w76mngxoWEfXGCu9+F1VYjVhEiqZUYk6EZD3sXsphSuX6JbFPRHEO9Qy0
   N4fxJJYcqtALfMmQzue3f7SdxB/kPIKsaFlKZ28vm/nilWv3D+OfiDSAW
   jRyDr5POwfEWVdXnqwUtwaViCzaBZ68EIXOX+9mt5Tvt7NN8h+/BMBnwt
   qgudyCGTUv81BFjo6FTWOsobB/S7nv586hvUF0KLUmepp5xQwIzckhNyz
   BOuvJd5TyA4V1kHycxGKrzMhXFFp5uxfm5s4MAzTC6TuGYzfXFswU2z59
   Q==;
X-CSE-ConnectionGUID: /O6tMqxOQf67b5hcahxCJg==
X-CSE-MsgGUID: N+ta9O4WTCqWJMZq9Legkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353376"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353376"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:46:50 -0700
X-CSE-ConnectionGUID: lYhcuFpyR7KVIHzq4sZhMg==
X-CSE-MsgGUID: DlawZkd2QqG7X6UkasMmPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442610"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:46:49 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/21] usb: xhci: remove 'num_trbs' from struct 'xhci_td'
Date: Wed, 26 Jun 2024 15:48:19 +0300
Message-Id: <20240626124835.1023046-6-mathias.nyman@linux.intel.com>
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

Remove 'num_trbs' from 'xhci_td' as it's no longer used following the
removal of 'num_trbs_free' tracking in commit 2710f8186f88 ("xhci: Stop
unnecessary tracking of free trbs in a ring").

Tracking of 'num_trbs_free' is still performed in xhci DbC, but it does not
utilize 'num_trbs'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 4 ----
 drivers/usb/host/xhci.h      | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a12009ed1b36..dfde9d3cca02 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3704,7 +3704,6 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				upper_32_bits(send_addr),
 				length_field,
 				field);
-		td->num_trbs++;
 		addr += trb_buff_len;
 		sent_len = trb_buff_len;
 
@@ -3731,7 +3730,6 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		urb_priv->td[1].last_trb_seg = ring->enq_seg;
 		field = TRB_TYPE(TRB_NORMAL) | ring->cycle_state | TRB_IOC;
 		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(0), field);
-		urb_priv->td[1].num_trbs++;
 	}
 
 	check_trb_math(urb, enqd_len);
@@ -3782,7 +3780,6 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 
 	urb_priv = urb->hcpriv;
 	td = &urb_priv->td[0];
-	td->num_trbs = num_trbs;
 
 	/*
 	 * Don't give the first TRB to the hardware (by toggling the cycle bit)
@@ -4103,7 +4100,6 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 			goto cleanup;
 		}
 		td = &urb_priv->td[i];
-		td->num_trbs = trbs_per_td;
 		/* use SIA as default, if frame id is used overwrite it */
 		sia_frame_id = TRB_SIA;
 		if (!(urb->transfer_flags & URB_ISO_ASAP) &&
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 78d014c4d884..4298513f0f71 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1294,7 +1294,6 @@ struct xhci_td {
 	/* actual_length of the URB has already been set */
 	bool			urb_length_set;
 	bool			error_mid_td;
-	unsigned int		num_trbs;
 };
 
 /*
-- 
2.25.1


