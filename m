Return-Path: <linux-usb+bounces-29257-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F60BD6ACC
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 00:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9EA5404AC3
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 22:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0528A2EA48F;
	Mon, 13 Oct 2025 22:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="me953ghH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4071C1FCF7C
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 22:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760396163; cv=none; b=XYBwIxvE5opyTd7QFNsdQ2xuJbe0ruZ9F0SvSNneLI6JrNjdtjJzLU4JNBDqOQP3/lkYUv/8Hu7zpup+PYVYWJVnp/6pFq1gUVBmx2kxik7thqBM0Are6FEVhGr+nnCxLJXTUnEY4pr0PIr9EhqZqV+WLLgpJs+TM9G2LnmTVck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760396163; c=relaxed/simple;
	bh=4nYD1fUXbeYkQ220ZNW7W92MQ+JWXBzt9GRNYVwIhqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tXSNiVqHJ3Xg807nZdWKQGklTWv8es36/xUsndeXHCknsRJcX0lIssPQNyczUfxeO6MGtN2GdaZlJu395WbmbThquJXtA0rcb+pbYrK26BaP9a5RSWvHa27yybXUEy4FyLN487jh53BEFz5IELaUf+0SH/BMyl0jEGOycERmvWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=me953ghH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760396161; x=1791932161;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4nYD1fUXbeYkQ220ZNW7W92MQ+JWXBzt9GRNYVwIhqE=;
  b=me953ghHntsiE9sFcdn6S0fAIjpQxAw9uxxPgWi7JrGnzurwgEFVeVlZ
   RpnIYkxSDPM2jhkv4S9B5a/ACqmBcnSpRNp+0CPaJLVyrTYhvrWiNXKa+
   GhvahlFsS9oA3p4NjAawAGwvIj0/UDtHY4KNJX57PMMx7IIDEpGyFMA9O
   2Vfu+OrlROqNj0CCFbCyUfD2Z6qDN60zzEBBL27TgoEJmudpLJfvqD5v5
   nltzjpHoCgNp7LgzQcrgrGigSfu2G3l0NhTEggIJS5NYMB5nD4z5eNZ4t
   rgOvahSp4rbYa6QBWPFKkZ47v62strs094JvRJacNH3YZMIwz7G8omfAs
   Q==;
X-CSE-ConnectionGUID: KURWNtleS4W3fiDRkGq3hw==
X-CSE-MsgGUID: nL1hpQ1BQMSNni0x/JPAwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66202510"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="66202510"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 15:56:00 -0700
X-CSE-ConnectionGUID: n+e8xO90SfW+J7ex9VrtCw==
X-CSE-MsgGUID: mjoRgtfHRneAhWwAWLisuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="185742303"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.60])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 15:56:00 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci fixes for usb-linus
Date: Tue, 14 Oct 2025 01:55:39 +0300
Message-ID: <20251013225542.504072-1-mathias.nyman@linux.intel.com>
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

A few fixes for usb-linus 6.18-rc
Solve an issue in the USB2 only PCI xHCI controller support added to 6.18
Solve two DbC cases that have been around since beginning of DbC support.

Thanks
Mathias

Mathias Nyman (2):
  xhci: dbc: fix bogus 1024 byte prefix if ttyDBC read races with stall
    event
  xhci: dbc: enable back DbC in resume if it was enabled before suspend

Michal Pecio (1):
  usb: xhci-pci: Fix USB2-only root hub registration

 drivers/usb/host/xhci-dbgcap.c | 15 ++++++++++++---
 drivers/usb/host/xhci-pci.c    |  3 ++-
 2 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.43.0


