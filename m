Return-Path: <linux-usb+bounces-30210-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BF520C40E32
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 17:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B1374F3B17
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 16:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE30328C5DE;
	Fri,  7 Nov 2025 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkPfrPh2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F902882B7
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762532919; cv=none; b=QFf5kkuhhpt2yCYRUrGYdfyX3D7GLgZlYBDnAjA3z1LlUtKxJMCCtzPt82decE1RKAigPJ0mNL5cCDvlYDeuNU4RdtQwbGlZ1zpfO8gRRKMEcqgNoLxqZLnfHgsGU+2NY9eE4ZeBD2mwrVn2ruHE24fExBKYjOr5CvJHg1szXjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762532919; c=relaxed/simple;
	bh=IhDjkrf+1ZHlyP6Apw/ZZRgXiCLipbqKEb9ziat4E7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HDUt4UmRKRn1vO+MbwIWPDuEZWbYpxLDGBTk98QlPm4e3o6JVkwJP9dKMKbsBL0v70SdtahuZB9YlIosOAshQTA5UaxtSWdj8D92FcvryxYC39osTw+7V4inK/zEw6f+9hXi95nJE+ShnWGEGLE6qW9TTxBzodrzJchxHL9E29M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkPfrPh2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762532917; x=1794068917;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IhDjkrf+1ZHlyP6Apw/ZZRgXiCLipbqKEb9ziat4E7w=;
  b=bkPfrPh2UXz1RtnyM7oSCJfsY6HlYbuj6dTR4WIpYT+m2b8RBIHBUoJ3
   hQRQD5HOa/+rqyocXcXa8wL1K+6g7RD0kChNeThutirc7f4zaaWuoElPJ
   7QQFIumwNvid1c3wq+aD5KbyD730a2D3CQVdbF4zWVUqhzLggi67AyYzj
   pOxKUiXUpsWxrayuQY+fN0ELVQfynQKvQVQTHYa3AlBN9QYVP6gaIqFme
   gYAPLN0J/+xv1ve5blqv5+mQhuDIQeO4xy4Q8m9S2FDMGtfA5X4TxNeq5
   uPFWQ9WEX78vameqY6NxIceO4fnWNhSFzkwsXlnglC9q2qHsF9cqakUDJ
   g==;
X-CSE-ConnectionGUID: IrkVTVpRTZShHFTxPBs2Hg==
X-CSE-MsgGUID: nBG911g6Q7KWJXm9GNtf4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="74979450"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="74979450"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 08:28:36 -0800
X-CSE-ConnectionGUID: 8Yw+28hhS7SVVahBuzlnnA==
X-CSE-MsgGUID: m8WZ+KjLTXqqyLPv972e8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="187328930"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.61])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 08:28:35 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci fixes for usb-linus
Date: Fri,  7 Nov 2025 18:28:15 +0200
Message-ID: <20251107162819.1362579-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg

A few more fixes for usb-linus 6.18-rc
Includes the xhci sideband locking fix and a DbC data corruption fix

Thanks
Mathias

Mathias Nyman (3):
  xhci: fix stale flag preventig URBs after link state error is cleared
  xhci: dbgtty: Fix data corruption when transmitting data form DbC to
    host
  xhci: sideband: Fix race condition in sideband unregister

 drivers/usb/host/xhci-dbgcap.h   |   1 +
 drivers/usb/host/xhci-dbgtty.c   |  17 +++++-
 drivers/usb/host/xhci-ring.c     |  15 +++--
 drivers/usb/host/xhci-sideband.c | 102 ++++++++++++++++++-------------
 drivers/usb/host/xhci.c          |   1 +
 5 files changed, 86 insertions(+), 50 deletions(-)

-- 
2.43.0


