Return-Path: <linux-usb+bounces-14717-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC85796DBCD
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 16:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88439285197
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 14:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926A91805E;
	Thu,  5 Sep 2024 14:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmVmbfRI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38D517736
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546686; cv=none; b=f9Y+bYssceChe7PtHlyljdIV5L20s/tRanx2yLnw8Mg3ycxl3LYENyYIiVG5Tb2X10Jd6Di+Ci+/HgM7gGHPK8DECq/tNTa9ApFbSy7bwYX4SpAYqa7Z1vam4SYXCISr5wG8JkcUlYwO0Q3DuZfT/d8h+xMZJY1ZprAbfCey2oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546686; c=relaxed/simple;
	bh=fKmpZxxOtoB7MSVZpavAfmQDOA7o9vprgKXivQNwWFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hqRHbYiNZ2LhsKyaSlELrmdTNWbcNOl2RRiFeYnlTxmVT3Ix8fZvbeofPDhu/9hSDy+vO0EijayuhI8G1h1G8CdpR7a/GNpgIlN0loMH8Owa50tyN5Jc9EO9yeZRIpBoB+jyyRZ+Z5XDA1vTJ7v8t/9N0/3FjH2FngngjToE1Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmVmbfRI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725546685; x=1757082685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fKmpZxxOtoB7MSVZpavAfmQDOA7o9vprgKXivQNwWFY=;
  b=TmVmbfRIVF7RMSxsDeITd0e1mpyijxNpJxM1UFiQ0M329C2ymZNYgKDz
   X90she68B72j+XCUVPfY1tIxOcrhYSYdHXzTpPApYqs7YyKOqIp5lrqCU
   uJ4q7YtmafW7UqwvhSGD4yJ2pBKnhO1EydwYJoeiRfcEWSou8wB9NnY8E
   aLZEW2QpmFvVmSjNETimPnOWy+Lldp0KtI7Ed08aDCEtyMZAInbCKJNzg
   IDr9/mr2fSXbs8AgaPaZbMN2nJtG/il7ajqF9rmuk9yWbPhO7Pq/FJxZK
   ZFgydxCk44I/RoF09k6A7tK4rcR3bsVBtJf6hIqHtOQtNcwDF/eQ7CFsX
   w==;
X-CSE-ConnectionGUID: hXW6kGWUR/WVXncb3fJ1Yw==
X-CSE-MsgGUID: BojbG8KhQt+lRYRXuZMugg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49677520"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49677520"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:31:23 -0700
X-CSE-ConnectionGUID: SyfdwqBCT+6yn3vDDCRuzw==
X-CSE-MsgGUID: tdhttNGRT6OAL33C3i7IkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="88883220"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2024 07:31:22 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/12] usb: xhci: remove unused variables from struct 'xhci_hcd'
Date: Thu,  5 Sep 2024 17:32:54 +0300
Message-Id: <20240905143300.1959279-7-mathias.nyman@linux.intel.com>
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

Variables 'max_slots', 'max_ports', 'isoc_threshold' and 'event_ring_max'
are never set or used. Thus, remove them.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ae4b50b01284..6f8cecc789d6 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1500,13 +1500,9 @@ struct xhci_hcd {
 	/* packed release number */
 	u8		sbrn;
 	u16		hci_version;
-	u8		max_slots;
 	u16		max_interrupters;
-	u8		max_ports;
-	u8		isoc_threshold;
 	/* imod_interval in ns (I * 250ns) */
 	u32		imod_interval;
-	int		event_ring_max;
 	/* 4KB min, 128MB max */
 	int		page_size;
 	/* Valid values are 12 to 20, inclusive */
-- 
2.25.1


