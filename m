Return-Path: <linux-usb+bounces-25175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0509AEBA0F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 16:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 665143AECCE
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 14:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410F22E54A2;
	Fri, 27 Jun 2025 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICxNbefK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34123234
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035293; cv=none; b=SkH+WZDiYN54rgJqkMLjHA2Ri2RWKkIv04+9panlBy1/t8whZaaIuruxc2W2ijDO/vg3u1WtVh3fVf72TXONeNGABkOI/k5PyeMoN4J0Mv9gQyEK8DLyuv85Yh0QbZnJAtXYvN6WeXEX+/l0rLXlRTZXgI2yXonpfVTY1mJQM/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035293; c=relaxed/simple;
	bh=2kwclU33oRuhvT30GhK4lBNi8L1ZNaTlpbiYiDDPGlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BDy9YaofK5oy8glVQ6rnnyFXcunqJVM89r6qiTdy9T6qNX+XCvswVaxNGmjkOC5OlEhXXgeL+Ecoa4VhyKf29b0bI1OPtAW/92EZrSH3kxJjuSlbnmquBGwaCNl+AjcHU62z5RPF8SlIesM1DGNK+UowtEg8Dy48i5BlnhBobfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICxNbefK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751035291; x=1782571291;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2kwclU33oRuhvT30GhK4lBNi8L1ZNaTlpbiYiDDPGlk=;
  b=ICxNbefKomxlkse/vCBE8+FwUDiV4dJOGTQVIFMCjoWj9lbyWQKv7d80
   ga+Lf0Q6PfY2dGNqQ6uWj+2BSBoA1VDgw4ppS9VM0RwhAxGpD15brJyJR
   pkEATrFuIAjmgruLtjYAKIZx0+/DFoUfBJxUAWAYX0xllPNHpTwJgvzfo
   tM19YNTZiHtPZCvCrAV/MNSMwA6a4nUccmSdB3u9swajgrfXVafxu/Fqo
   lQuu2mK6X9XPCDgWraSb6r4BcfigxcY4/F53T1ynPgDFEsdBaqMYG6hw5
   0dCWo2DUXH3Fd9oAuT1nuqpdB8ENGO/QB7Kk/gaTvStKtfbifdB6m28Dw
   A==;
X-CSE-ConnectionGUID: plMM3QXZQjChamJeGdvNrw==
X-CSE-MsgGUID: M1u3Dy/BTFeYve0kdLVOhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53444925"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53444925"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 07:41:31 -0700
X-CSE-ConnectionGUID: /JkTUh1SSO2/5z3Wa1+3dw==
X-CSE-MsgGUID: U7NxQFZUTSu8hHiXNErbgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="156872893"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jun 2025 07:41:30 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci fixes for usb-linus
Date: Fri, 27 Jun 2025 17:41:18 +0300
Message-ID: <20250627144127.3889714-1-mathias.nyman@linux.intel.com>
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

A few xhci fixes for usb-linus, fixing DbC issues and some vendor specific
quirks.

The "usb: xhci: quirk for data loss in ISOC transfers" Doesn't have a Fixes
tag, but based on commit message it should go as far back as it can.

I'm planning on taking vacation next 3 weeks, but will take time to sort out
issues with patches I currently have pending on the list.

Thanks
Mathias

Hongyu Xie (1):
  xhci: Disable stream for xHC controller with XHCI_BROKEN_STREAMS

Mathias Nyman (1):
  xhci: dbc: Flush queued requests before stopping dbc

Raju Rangoju (1):
  usb: xhci: quirk for data loss in ISOC transfers

Łukasz Bartosik (1):
  xhci: dbctty: disable ECHO flag by default

 drivers/usb/host/xhci-dbgcap.c |  4 ++++
 drivers/usb/host/xhci-dbgtty.c |  1 +
 drivers/usb/host/xhci-mem.c    |  4 ++++
 drivers/usb/host/xhci-pci.c    | 25 +++++++++++++++++++++++++
 drivers/usb/host/xhci-plat.c   |  3 ++-
 drivers/usb/host/xhci.h        |  1 +
 6 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.43.0


