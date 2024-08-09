Return-Path: <linux-usb+bounces-13268-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A978694D063
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 14:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D936C1C2153A
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 12:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F68194A42;
	Fri,  9 Aug 2024 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fb7f2SQr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C236A19409A
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723207348; cv=none; b=cxjqRutVxWTTDZXo1FIH+pZu1spxI/eHHxOooGU231u+MRSy+uqkDEtjn9KWpWtgxoMQwN97FpGzYZPbxFjpXTIbhv7cIdyAgeJs/GBz/4GXYw4wRoypeq3vz9dsEgD9CeqKlqDm5RKauYI/8yAg7mB57keqxkDtA9mmcvb5qaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723207348; c=relaxed/simple;
	bh=xavTqaIB02xzDdI/0blNQPlJvZx//EGb4YrZqquF2o4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y2wLMCZesijO28mBEeUnJaNu8D7r3c9woDZTBIZI8W/ZZXVaCCog8dekOg77szAa5Gjqc6aRVp/h9r9/NcvdrG0w0wdQqdjgu8E2itUBuIbiriTCc5rEO88ktvo+SvoMrgABNlQTZlQm3IyOb79xMYB24mpr5gK/emkd2KJn5AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fb7f2SQr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723207346; x=1754743346;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xavTqaIB02xzDdI/0blNQPlJvZx//EGb4YrZqquF2o4=;
  b=Fb7f2SQrEhxdfWnFA643SZ+f0bB8oVA/9wx7GTt2BvjoVruTSpyim2jZ
   BLGcaGleTNGuPf6dM7SDMxuAoneKQvJ+3sMAdPcTZIYhc7Rb6BDvMChCl
   UO3yx/N3vGuBFhN2FYJcbjBD/EDtxkLAH081GCPg4eXH72cuupEJXSgkY
   NSoUVH6S3eNDiDuGXuUT7+dCeAWPeBZHijUxuWY8PjtypkfVOGoSVZz76
   llextxzpIPFqVbABCXhLB1b13xP0eWZjVUwEYOOfagKS+isNSGj7Oxj2f
   Xe+UgJLmlo9rvkxy9AyNw5sVyUYTE9b7u8O0OFUL3G2p6D8z09Fq0KSzH
   w==;
X-CSE-ConnectionGUID: eBiAJKu4TPi5x6CQ99JAhw==
X-CSE-MsgGUID: ydZFGNcXS1Wu76P3bYXKww==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32768605"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="32768605"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 05:42:26 -0700
X-CSE-ConnectionGUID: 6okCsUBwQ+yHYu/zVANzKw==
X-CSE-MsgGUID: izq5b9nBQr6vDNbVvglASw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="57473987"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa009.jf.intel.com with ESMTP; 09 Aug 2024 05:42:24 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date: Fri,  9 Aug 2024 15:44:06 +0300
Message-Id: <20240809124408.505786-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

A couple small fixes for 6.11-rc

- Don't try to free interrupters that failed to allocate.

- Add missing "return 0" lost in refactoring of tranfer event handler,
  this causes extra unneeded check for halted endpoint handling.

Thanks
Mathias

Marc Zyngier (1):
  usb: xhci: Check for xhci->interrupters being allocated in
    xhci_mem_clearup()

Niklas Neronin (1):
  usb: xhci: fix duplicate stall handling in handle_tx_event()

 drivers/usb/host/xhci-mem.c  | 2 +-
 drivers/usb/host/xhci-ring.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1


