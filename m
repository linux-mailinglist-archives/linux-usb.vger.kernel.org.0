Return-Path: <linux-usb+bounces-18582-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1519F48B9
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 11:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E0851695CD
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 10:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC091E47B7;
	Tue, 17 Dec 2024 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dX+ainty"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328101E3DEC
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 10:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734430744; cv=none; b=BSokTxsjUsmlfs1IslG2rNV4D76X3UO8gHvWMJbYmmWbKHkwXqe+jrq406bzd2xjWukPbwXOff4gVu4XBAcZ7qys2yI+oHuCdp8YvnBUY9z33QAZiT2koQVe6eiW64K+j/CM2WHgQpkoTguKKkK4R5sQ3dM9Yr1saQaRn55kpZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734430744; c=relaxed/simple;
	bh=tz+8Au9UoDZmhjl3s7IwGDHM6jLEmR2liwfrZIW4hsU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tkUOEfdrHwyLxuOA+2m2vBO9RLoqsuzDOY+5Fqr1GoY4ar0vmW+RuVoBmmWXj1k4EGITNrZXPB/E2+kFJnO0HhKUAVY1aUsBWhVfStmBUpPAdqknhY5qjvHONvt++hC+F4MRLuxCcIxO0o243eiQ8sC/FGRur05nJEp94xsiqGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dX+ainty; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734430742; x=1765966742;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tz+8Au9UoDZmhjl3s7IwGDHM6jLEmR2liwfrZIW4hsU=;
  b=dX+aintyfznUwNsXo6NBQvnYZjUORdYQrekNeolnG5Sxiv+zPthyDqWU
   pvYBnl9lEyzQZxDU0fK2V4aRPImTfdPT/qhQvqATO8OVREKw/briCd9cd
   txSQKGujQjCw4qOIYLB4FnUoer8NJgRM6mO9VgVRJ34YiwyKw4RPzYAgN
   YOzBFSo7yxexwdYZhMAJnoaqrRGKfyBcTyJBm2dV1yOaEo3ysicEJv19q
   D7iPpowqSZiRqHTmbqwUgeUbmouWht9onC3arl1vn7GpkYAAKEBKG4ply
   aJak6ZH129FT56dtgWDlkeQoY0Hr0DHeEJDjDzY2tivrc4CkKNwGdY0+p
   w==;
X-CSE-ConnectionGUID: cm7847H1SqaWhiMz5VJ7fg==
X-CSE-MsgGUID: 1op3/r83TAKYIufEt8UjHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="60236807"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="60236807"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 02:19:01 -0800
X-CSE-ConnectionGUID: EXEudbEbSQecQ9zgd+hIyg==
X-CSE-MsgGUID: b1gnjTbTQISeEXyCb/5OiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97335956"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa010.jf.intel.com with ESMTP; 17 Dec 2024 02:19:00 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date: Tue, 17 Dec 2024 12:21:20 +0200
Message-Id: <20241217102122.2316814-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

A couple fixes for usb-linus 6.13-rc, resolves a ring expansion regression that
snuck into 6.13-rc1, and turns a NEC specific workaround generic as it seen on
other vendors xHC as well.

Thanks
Mathias

Mathias Nyman (1):
  xhci: Turn NEC specific quirk for handling Stop Endpoint errors
    generic

Niklas Neronin (1):
  usb: xhci: fix ring expansion regression in 6.13-rc1

 drivers/usb/host/xhci-mem.c  | 2 +-
 drivers/usb/host/xhci-ring.c | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

-- 
2.25.1


