Return-Path: <linux-usb+bounces-17184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F39A9BE3DD
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A35891C23122
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B25D1DDA33;
	Wed,  6 Nov 2024 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJYUVk5E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6881DD0DB
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887981; cv=none; b=RrP/2yyVG/FCxbYE/mYuvYdfImW8VcB8nQ4oeGECFb0rHfrPkVkeGF9tVQNFaDBIoqa/q8VdaC/ayOLQuVnQYBgneGN6ANf1p+CMDjizB0w6XF6n4jQmqM6E+r+uZgZrcIM40VoG/OONVfNo2VlrQ21mgPAAqNym9jE6EbZQX5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887981; c=relaxed/simple;
	bh=2Z/Ahek/DrgotZ6pVoDttPtts1yWkjqZF/PbnwlMHNA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UtjBOGwlaLF6fqewaAGMPZ4v3CihRRoDHJBWjRgq0HCp4sDBL2NJ5W58Yu7+VDUYgUYCpNm0zkOq6aOePiJcuv17LiqCBu1zAqluSL0d8lMclOQAziRuiIq+8yuz31GyH2tf7FpXLRkyqCIgkLAbk/npcga/5TRIGXKQHL4hSys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJYUVk5E; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887980; x=1762423980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Z/Ahek/DrgotZ6pVoDttPtts1yWkjqZF/PbnwlMHNA=;
  b=KJYUVk5EL0YIRZ2kxfJ82zDddSdbcjTQ9TPpVBGE0NZopZXmVAksI5E7
   G0sYdNeWFqno3r1ynEuVqUcd/n896BfTH6mGzQ3DoyYqlYc+8iQUTyB5s
   7kI7dVB+EuNcKWb2pb81MQmdVMLophf93iowZ8WxQFOG+XbfeKvjIp/Au
   +t4YVXMPHs0dng/BFbGDWD1OEkpn9Q1NOBQiGdqsA8fSn5K+eIs/22LSZ
   dulMeM21C8D41+Pfx3lMAAeV34ScOAZv/SHwFMgaFnp3iXAcBEZGcJmtQ
   WenLDro4qfBzpq8UvchFDBxGM2sXqMik5OVFQ25qbAvzRWX8qfwJPwv/r
   Q==;
X-CSE-ConnectionGUID: 8QLu/AEXR/aZEW0ZhoascQ==
X-CSE-MsgGUID: wu+3jGE4R52NIbEG+I4P0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059392"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059392"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:12:59 -0800
X-CSE-ConnectionGUID: T6U4wM4uQsq9SBqAbyFsMA==
X-CSE-MsgGUID: Rv64L2I4TwWuFQeNYYjRhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813048"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:12:58 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	WangYuli <wangyuli@uniontech.com>,
	Xu Rao <raoxu@uniontech.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/33] xhci: debugfs: Add virt endpoint state to xhci debugfs
Date: Wed,  6 Nov 2024 12:14:35 +0200
Message-Id: <20241106101459.775897-10-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
References: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WangYuli <wangyuli@uniontech.com>

The ring data structure of each xHCI endpoint might stop sending
data due to the virt endpoint state.

Show the virt endpoint state within the endpoint context via debugfs
to facilitate debugging.

Co-developed-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index f8ba15e7c225..35247cd50c74 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -291,12 +291,13 @@ static int xhci_endpoint_context_show(struct seq_file *s, void *unused)
 	for (ep_index = 0; ep_index < 31; ep_index++) {
 		ep_ctx = xhci_get_ep_ctx(xhci, dev->out_ctx, ep_index);
 		dma = dev->out_ctx->dma + (ep_index + 1) * CTX_SIZE(xhci->hcc_params);
-		seq_printf(s, "%pad: %s\n", &dma,
+		seq_printf(s, "%pad: %s, virt_state:%#x\n", &dma,
 			   xhci_decode_ep_context(str,
 						  le32_to_cpu(ep_ctx->ep_info),
 						  le32_to_cpu(ep_ctx->ep_info2),
 						  le64_to_cpu(ep_ctx->deq),
-						  le32_to_cpu(ep_ctx->tx_info)));
+						  le32_to_cpu(ep_ctx->tx_info)),
+						  dev->eps[ep_index].ep_state);
 	}
 
 	return 0;
-- 
2.25.1


