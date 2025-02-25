Return-Path: <linux-usb+bounces-21017-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 093A7A43A9B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 11:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C633B2958
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 10:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7AE267738;
	Tue, 25 Feb 2025 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoR7fkww"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB33264A8C
	for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 09:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477517; cv=none; b=tkcmNR3V+d6hndx/8qn4C4Z3TQZWhKxLIxLQJLFCDGfW21Fx7KNzOo0duvXmLDK8h9EWxa9b153snCus5CDfQlGl3vM5ht+htfD8MC+ikkgVvi3HIjGJQYnqkSBiz1BL8mr/mIANtzVea7Z/okFG+Zis2sqZhjYAoe8UMlPXzHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477517; c=relaxed/simple;
	bh=57RR9apWNMsl4eLqFeI+WdzYBGOKQw/8AQWtgJftNHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vGg590kKybEeCXG3Jo+A7MIWhEwpLUZRIu0mi921MQZnJbYCzwlBvjBHnkiTJQnkZod5lzWxocgbveoeWF/WOQNYO64wBYPWGH7KeWbmk6g5J6tYfAYBPEqz2PrqhnSngvVtZuIatZK2H64ZaKhjFtTo+LMDEBHZfzzhFdiG+EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoR7fkww; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740477516; x=1772013516;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=57RR9apWNMsl4eLqFeI+WdzYBGOKQw/8AQWtgJftNHs=;
  b=FoR7fkwwX4IES1ECLTtb2+g+me8I2sIIwx+HJxQEsaLEpfkJfrH3CAc/
   ruP4cNNGkDoOPNQnMe/V3ULWBC2+OQJxrLbDx8O/7NDR5jyrbCHyeosq7
   dqgfaSuFMIp3y62jOM2rkFiSonOkjjEQaoWB98wrp7FvpY2Alcs9SSw99
   PD6qnef0o5dqVfzK0Ro+NImk67MJpf6UhUFe+HqhX4oQHdj0GbezSl6Aq
   VMASIws0jqU+TNjfcIVEX7WH/esYbhuQGa5w1hTwziYxdyND5RK8TaCvh
   EZKR1qwcFHlPjZJk2D9pLJI6ePEbs7+BK+Zw08F142OQuidNbYIAi6riE
   g==;
X-CSE-ConnectionGUID: cXWo2VGXTYe0fdQng5cH9g==
X-CSE-MsgGUID: rQSrKvvcQ6+1gLe1+wB9XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="45059895"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="45059895"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 01:58:36 -0800
X-CSE-ConnectionGUID: 7+YM2YrMSoiFmICjMR4mRg==
X-CSE-MsgGUID: duwCt4mrSHGvJtc4S0OClA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="116966855"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 25 Feb 2025 01:58:34 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci fix for usb-linus
Date: Tue, 25 Feb 2025 11:59:26 +0200
Message-ID: <20250225095927.2512358-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

One small patch to cope with VIA VL805 xHC hosts reading past the DMA area
given to them.

Thanks
Mathias

Michal Pecio (1):
  usb: xhci: Enable the TRB overfetch quirk on VIA VL805

 drivers/usb/host/xhci-mem.c |  3 ++-
 drivers/usb/host/xhci-pci.c | 10 +++++++---
 drivers/usb/host/xhci.h     |  2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.43.0


