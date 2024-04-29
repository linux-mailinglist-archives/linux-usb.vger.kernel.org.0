Return-Path: <linux-usb+bounces-9901-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D54E88B5AB8
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89ED31F2206D
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6766676405;
	Mon, 29 Apr 2024 14:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtCOAvSe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747875810
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399272; cv=none; b=uWPwvnttv7LdtxSAdj6eMGrNuEYSpQ9Z6dB8NFAY6Rk/eUX1oPn8YVAA0nfYR9m+aa2XcuEVy6OttUqhEI5fKidhDMK/y+h3NED6NprQ+35mQXfDUoHSymSJjIgK1LCSG1OltmupQCVaaT86ppNedxZxkrG3KYQEoh8fQk+/awI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399272; c=relaxed/simple;
	bh=xBl/L+VXB8RBzVqO/J3S6IPFK+4HVCi+ovnKlUTawHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TG/UMS/o7BfPX0P1cXqoR0uk/tugOIf0JJoDn7YhPbop3yKV04ddL1UzJyeToIfUBdOX8+EMF5Os2owWmstFt03VtmKJvoZPbLmbR9LAMU/DMDrEwPInKwZVa88WLupVTh2YaNgrIP9T85En2jBvg3NdEPy5+Rpd0v60TMu84PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtCOAvSe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399270; x=1745935270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xBl/L+VXB8RBzVqO/J3S6IPFK+4HVCi+ovnKlUTawHc=;
  b=DtCOAvSeNX8DUyTLZs8kgu8lK6tE+V/8Fk0aYwODy7MBWa4xkNQkyeKq
   +wprBs4O9NqrcXF4T46nI2Jmvec+ta2f3lKP1F/EX/wH/eDtcCe7v1aEN
   25zRBzBGURKxSjweHFNlBIA0toLG4hvABqk8wsIgBKu3LqbBxwXcgoOWD
   xdJZVTE4fiWZyodlAVlqCkY/VkUbc5vMHHy2kLvh7qZzZ79jzyq5pNcRH
   kzmh5UB1+yD9FJ9D0Eji1oDt/xXinXuRmZAWUiF6WyVWrxpvrGu2SOkQ0
   D7AXL5nNXhO6i1uzFVPlG926xxrmDgx7L9/3Amc/R4vBt/PQ2JFq0qsTX
   Q==;
X-CSE-ConnectionGUID: uVNV40PmTTK53kikxr6LcA==
X-CSE-MsgGUID: 9t+bqOACRpWAfgaVPccUuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911443"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911443"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:10 -0700
X-CSE-ConnectionGUID: 8ld7ByqpTF+P/VeuD5+CuA==
X-CSE-MsgGUID: YVWAOG5kT6qt3A6A1PpOUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521794"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:08 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/18] xhci: improve PORTSC register debugging output
Date: Mon, 29 Apr 2024 17:02:35 +0300
Message-Id: <20240429140245.3955523-9-mathias.nyman@linux.intel.com>
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

Print the full hex value of PORTSC register in addition to the human
readable decoded string while debugging PORTSC value.

If PORTSC value is 0xffffffff then don't decode it.
This lets us inspect Rsvd bits of PORTSC.
Same is done for USBSTS register values.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 10805196e197..8c96dd6ef3d4 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2336,7 +2336,12 @@ static inline const char *xhci_decode_portsc(char *str, u32 portsc)
 {
 	int ret;
 
-	ret = sprintf(str, "%s %s %s Link:%s PortSpeed:%d ",
+	ret = sprintf(str, "0x%08x ", portsc);
+
+	if (portsc == ~(u32)0)
+		return str;
+
+	ret += sprintf(str + ret, "%s %s %s Link:%s PortSpeed:%d ",
 		      portsc & PORT_POWER	? "Powered" : "Powered-off",
 		      portsc & PORT_CONNECT	? "Connected" : "Not-connected",
 		      portsc & PORT_PE		? "Enabled" : "Disabled",
-- 
2.25.1


