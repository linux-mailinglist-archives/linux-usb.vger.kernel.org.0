Return-Path: <linux-usb+bounces-22915-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7A7A84790
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 17:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDAE57AD356
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 15:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF041E1A16;
	Thu, 10 Apr 2025 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHa0Gp9W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA27757F3
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298257; cv=none; b=F/8A4ZiLijNV8s0k5iuScLPklH3OkDqTdNwJFBbnGvHwaEjsSozxW1W2vR5VTUU/2+EhiBhsMnusu+p5wZ2qbvvWtABRn+dU7gWkQGyd3dD5ZZv4l5cNBa8Gyr86m0zXMWxolpblYKKpwo3+eyrfymSyMtlOSNVWoI/ihyqticU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298257; c=relaxed/simple;
	bh=wLHcPuCYqGl8CCmWWY0hIRBsGHul3BUBrl+VdhEtKf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rVRxeVfvT98svZ7AgZXj4vbhxhgWRtpxSKYF7pWi+45JPZqdTBZDrpZWWo45NlAN1XGLax8urjAIIeam5+LGkW399RjCs2d5ifFOeRlLHRakHEhVhFPte42rI4NLoJL7KIv1XK8YckLqWuHjaKbJphLi6MJjOCrLys/rX1wLZVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHa0Gp9W; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298255; x=1775834255;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wLHcPuCYqGl8CCmWWY0hIRBsGHul3BUBrl+VdhEtKf8=;
  b=hHa0Gp9WfkL4bVgjUkcEQ18/OhIcjH81GIiRqqRMcTx/BUcMvX3q4XsK
   M4pru6etwz2jrE44jiOCHLENY3qFLNt+0iIaDFssicvpN5OW9QNLIAkNO
   OwzjW3HcIRVnFLSVU4h9kNCYYjg5bRw91KvqI49axzdfDBrvaKq/i6DUO
   Ib3OO5njH2ihstmWh+pA93DLh+J3JloHNSIpAhMxegh08Wgb2pJuoFcha
   TWPu9kUtnauKkz9GFn1SiBNQw5HmjmWuVVvO9LrdyePjSIo0glaKjD6kc
   VNBxsDfdGlxUnK3200OBha3FAT9lcwLqJY+wvcHO2mZE/di8ecjncEvQU
   A==;
X-CSE-ConnectionGUID: flcDRs+DTAWYFBbeUOHZZQ==
X-CSE-MsgGUID: 6JC7F9YjRYizQrFcCfW4OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="48534954"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="48534954"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:17:33 -0700
X-CSE-ConnectionGUID: PF7++438TEyeR0rKXYFlkA==
X-CSE-MsgGUID: ykHGNWPQTbuBaiXfPhPASA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128913164"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by fmviesa007.fm.intel.com with ESMTP; 10 Apr 2025 08:17:32 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/5] xhci fixes for usb-linus
Date: Thu, 10 Apr 2025 18:18:22 +0300
Message-ID: <20250410151828.2868740-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

A few xhci fixes for usb-linus.
Revert the two patches in 6.15-rc1 that made sure xhci won't start
endpoints too early. Turns out they may now never start after
reset-resume.

Thanks
Mathias

Mathias Nyman (3):
  Revert "xhci: Avoid queuing redundant Stop Endpoint command for
    stalled endpoint"
  Revert "xhci: Prevent early endpoint restart when handling STALL
    errors."
  xhci: Limit time spent with xHC interrupts disabled during bus resume

Michal Pecio (2):
  usb: xhci: Fix Short Packet handling rework ignoring errors
  usb: xhci: Fix invalid pointer dereference in Etron workaround

 drivers/usb/host/xhci-hub.c  | 30 ++++++++++++++++--------------
 drivers/usb/host/xhci-ring.c | 11 ++++-------
 drivers/usb/host/xhci.c      | 18 +++++-------------
 drivers/usb/host/xhci.h      |  5 +++--
 4 files changed, 28 insertions(+), 36 deletions(-)

-- 
2.43.0


