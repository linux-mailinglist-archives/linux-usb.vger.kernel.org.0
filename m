Return-Path: <linux-usb+bounces-18826-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9899FD407
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 13:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B5777A10EA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 12:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670D3156C79;
	Fri, 27 Dec 2024 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgoCmfTe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60271805A
	for <linux-usb@vger.kernel.org>; Fri, 27 Dec 2024 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300851; cv=none; b=mzjUUdHtg4kxGG1tzW55ctLSREneofDZdxf/PR/eMccdS4JzYZ47mhZWjY0tdwPL+3zxN1md+hogGQ8j6brzdn/TsFlxyy+fR2sIowYtd5cQgFbBghcHX3eSAAKzwWmfdZZ7jnyZReQuhq8RGtuk3P5XEBvsiFLvs/BH1bqbMZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300851; c=relaxed/simple;
	bh=MFYHJ/bqOlku6QgboDZcNIJJYZy6Rlk6CxB3tBQH+ZA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=cWnOam8KEQ20VmGRS7JpXQYDxD9lvuhXd6A4if3s6q1fWdgN+ArUQAsrrLRocQGRg+JA9I8a1POoebixB8EWmv7Wi7CEq1ltYjOA4dOJP0VRoo+Y3RvPLbCMVz9U/+kHQVx69apcCt5UecWOM98QxSet7+PWvsOo4Jzaheai3/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgoCmfTe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735300850; x=1766836850;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MFYHJ/bqOlku6QgboDZcNIJJYZy6Rlk6CxB3tBQH+ZA=;
  b=FgoCmfTe98DhLh0nNS9PlIxRT7AnZXbgrGc0Gr080kKvwZHSpnWNuZZo
   dQf97RndFZ9rqeaSjN+vSv5OdIxbT/Qr7VyLE2mHi4bGsWII4iezi+vQ1
   IFTzKmhCQtm5iZeHdMURgzUPT/FmI32gajLcwKE0GNvMyI1OnlUAHal+E
   Hwk+xhor4LQLjTjHpTFfVWxLtdfrJ3YuhXO2GyReAgxXAP+LmkM08CS/a
   OWMA8voBs3BIN5cUzzCGogHhz4ONrBkGpsM6cnb0lkMbE69Z8YtdTA1Vf
   OOCUYX31iw9n8yCte6t4PZom+5gbqRlfZVBxnuLBwHZHhsE1JB9mk8rKS
   Q==;
X-CSE-ConnectionGUID: C7rwZa/PSKaiNtC3bSFxpQ==
X-CSE-MsgGUID: d/MIzrWRTYel+GsFxTYM4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35932512"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35932512"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 04:00:49 -0800
X-CSE-ConnectionGUID: dpdsiufcSNmErhwwMtLopA==
X-CSE-MsgGUID: u8CdSJfiQte6SupIYfZvCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104772430"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2024 04:00:48 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/5] xhci features for usb-next
Date: Fri, 27 Dec 2024 14:01:37 +0200
Message-Id: <20241227120142.1035206-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg

Some xhci features and a fix for usb-next, improving DbC performance and
defining a few missing bits in xhci spec

The NULL pointer fix by Michal solves a rare, 10 year old issue.
I don't want to force it into 6.13/usb-linus at this stage over the
holidays. Adding it to 6.14/usb-next and stable should be fine.

Thanks
Mathias

Mathias Nyman (4):
  xhci: dbc: Improve performance by removing delay in transfer event
    polling.
  xhci: dbgtty: Improve performance by handling received data
    immediately.
  xhci: Add command completion parameter support
  xhci: Add missing capability definition bits

Michal Pecio (1):
  usb: xhci: Fix NULL pointer dereference on certain command aborts

 drivers/usb/host/xhci-caps.h   |  6 +++
 drivers/usb/host/xhci-dbgcap.c |  2 +-
 drivers/usb/host/xhci-dbgtty.c | 98 ++++++++++++++++++++++------------
 drivers/usb/host/xhci-ring.c   | 13 +++--
 drivers/usb/host/xhci.h        |  4 ++
 5 files changed, 84 insertions(+), 39 deletions(-)

-- 
2.25.1


