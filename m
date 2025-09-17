Return-Path: <linux-usb+bounces-28244-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00720B81E4B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 23:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCF187B4029
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 21:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D232F2602;
	Wed, 17 Sep 2025 21:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4Avboom"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84D02882DB
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 21:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143301; cv=none; b=e/Bdmg0NtZmfCe0SO6wkeD1F46h25+7u6ZpNcRpJ2oNmj6bVPz1xRjwxiMk5ZoXukVRMOESti/hbXi/aaookLVryYxofggPrMBDpZ3X3dsovfwcb2T5BAInMr49QHjsV1uHE+zVANE5v5txSfh9b66zwcjzz5tYULdEdxcPA+WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143301; c=relaxed/simple;
	bh=6ly0sqSwUh0yGGI/b/D918G7+jQvqyO3aik27ClV4nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+u/urywsH8soqJeUUHHKjp0OdBSOBuDbOtGuonSoAIgnHBgP9/XKaS85vhdZ+C51oWe9HDaZ0yI07pAOVbgqYlsFU/VCq+AcuaFCryQuZLaf0Yj+3tdeNvJXg1aIINCz79goOvewH+lenfY7H0x2OTPn/TveTV+BydFs2rJ3d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4Avboom; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758143300; x=1789679300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6ly0sqSwUh0yGGI/b/D918G7+jQvqyO3aik27ClV4nk=;
  b=H4AvboomU6RtyUOrED7FrOHLosrq79sObp3imXNEpGtEz1du085cFgZO
   ZARwW9oFpaN18Wz2nN2AbXON3IgwDKDIWkjXqvK9Ig7cIrG/m83nmaTO2
   YIyxeBeMOotr8j914kqDFpdamX6sFpaRBIlgE8DfRll5YQ8jGTM1QOth6
   54twMzo+TSyO5oDzWvgLjeKWH+zSz8WXInuVn8u0lUlAy59Cr1KoDkyl/
   ef6oxqTvviDy/uvjXD3qr7vJu3fA4M23LXVJjGiFlpoeSYaJzaRu0cNEY
   wl74Bm5rgRr6JFUENbFOtOU2GX9/O8zdh1VcfXESfh7DXrsFNLfitjZyP
   A==;
X-CSE-ConnectionGUID: P0eoGOdyRLymPXHLo/pvBw==
X-CSE-MsgGUID: rfdkaj3eQtedk4UWzIuh0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="48038228"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="48038228"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 14:08:19 -0700
X-CSE-ConnectionGUID: ePszvJqkRmSQDQOFA/RbcA==
X-CSE-MsgGUID: EP+KJ1+0RgCKuCbcYoDZdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="175800225"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.42])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2025 14:08:18 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 6/6] usb: xhci: align PORTSC trace with one-based port numbering
Date: Thu, 18 Sep 2025 00:07:25 +0300
Message-ID: <20250917210726.97100-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
References: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

In the xHCI driver, port numbers are typically described using a one-based
index. However, tracing currently uses a zero-based index. To ensure
consistency between tracing and dynamic debugging, update the trace port
number to use a one-based index.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index f303ce600ff5..9abc904f1749 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -550,7 +550,7 @@ DECLARE_EVENT_CLASS(xhci_log_portsc,
 	),
 	TP_fast_assign(
 		__entry->busnum = port->rhub->hcd->self.busnum;
-		__entry->portnum = port->hcd_portnum;
+		__entry->portnum = port->hcd_portnum + 1;
 		__entry->portsc = portsc;
 	),
 	TP_printk("port %d-%d: %s",
-- 
2.43.0


