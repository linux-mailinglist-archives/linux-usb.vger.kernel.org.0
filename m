Return-Path: <linux-usb+bounces-14716-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F796DBCC
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 16:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCCDF1F22A54
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 14:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED6317BBE;
	Thu,  5 Sep 2024 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bIdoCO/X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5308117736
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546683; cv=none; b=agZ0JwZbVSCUuBkBXwcIangoYplE81UdwFp9eDcODK6PHlaxzTNdtWZWt+nW1QmG1AhC53k982GDzlZsXGGFUnWq884/Fnmx7eGOsJeOh3u/b8QRf0pBhj5DL2kIFMd+CwqpQz/azoWdZvbvzlZaCvyE1tp6uHy3DrSNRWlZBVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546683; c=relaxed/simple;
	bh=u9mc28OYRpsO7s/iOl9pmEDJG/WbGYWclELkvMbB4FI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G+jtvRYbauaQ8JjFH4RHCOK3sUtulb6CnAkfHEABMvOMmgIk5YsN3ZGbhSxXRxT6kyYLVKsVb5VgwLyc0P8ccjM2Fh3TaRVBUgK3W/bytW/0qRjhVYrGMRGUBdY/5b40ykxVNRYcIsE/RLreXX47hUekKaOyM5rIGs+ZYMDW1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bIdoCO/X; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725546682; x=1757082682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u9mc28OYRpsO7s/iOl9pmEDJG/WbGYWclELkvMbB4FI=;
  b=bIdoCO/XyDk4GrqsZpUSW0ErdOpIt2+vnAkQERnWdSArPDqWeykerKzb
   lP6t+eEtYCaqtos+KhVnFrsZ+XbCRJI2DcEUJrZXByipWh505Z6s4lpXI
   ThkAoK9gtJZlyRgKeKH0XvnZz6389+AgKuZljqbiJpS+E0iVXOfqVXu3q
   6xl6BKr5fO72OpU/nOIddlm+YutQCsjGsfLmNOnu64shJ9l2jH/ePouDP
   5/Fdjq2Fnq3BLIIZEI3OT9gkvYx49Q4xu2gub0zL5Jeyw9uHsqrL+9C80
   +H8CCYEsZGLga2SieY0AlBnJrTH8YlIRKqIpm0AL8IJN1+k0KNM4OgvB5
   A==;
X-CSE-ConnectionGUID: D3XeboFuR6SlhTUYZ/eT/g==
X-CSE-MsgGUID: HD1oyrmBTyCOsUBwnVbhBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49677511"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49677511"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:31:22 -0700
X-CSE-ConnectionGUID: n3Yb7Tk4QYa6sOCO/vxxXA==
X-CSE-MsgGUID: Kmh8kUDKRQKEWj2blBb98g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="88883219"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2024 07:31:20 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/12] usb: xhci: remove excessive Bulk short packet debug message
Date: Thu,  5 Sep 2024 17:32:53 +0300
Message-Id: <20240905143300.1959279-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
References: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Completion codes 'COMP_SUCCESS' and 'COMP_SHORT_PACKET' are the most
frequently encountered completion codes. Typically, these codes do not
trigger a default debug message but rather a warning that indicates a
potential issue. This behavior is consistent across all transfer types
with the exception of Bulk transfers. To reduce unnecessary log clutter,
remove the Bulk 'COMP_SHORT_PACKET' debug message.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e1c9838084bf..d37eeee74960 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2521,9 +2521,6 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->status = 0;
 		break;
 	case COMP_SHORT_PACKET:
-		xhci_dbg(xhci, "ep %#x - asked for %d bytes, %d bytes untransferred\n",
-			 td->urb->ep->desc.bEndpointAddress,
-			 requested, remaining);
 		td->status = 0;
 		break;
 	case COMP_STOPPED_SHORT_PACKET:
-- 
2.25.1


