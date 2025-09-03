Return-Path: <linux-usb+bounces-27500-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73011B42780
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 19:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19BAD7B17AA
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 17:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2000B2D47E5;
	Wed,  3 Sep 2025 17:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juwEN6D4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7C73FF1
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756918903; cv=none; b=GVmJVVxW0HknLMWbVqEb5KcyPT020FTz1zMbqnxYg987j2WcKiuRp8yqrhhyYJp84Mb3CW3cbndMLrwc7N4QPhAW+xK00xj/ZWsGSus1vM18WdCIb+47My9WSzNGD5myZjJK/r8pEc34sTvHGP/9fS5LzT+pg7hezFMZH0dXvIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756918903; c=relaxed/simple;
	bh=Ng/jPPoJ+3U2XhdCDPYnipYUWqbfWqcOzI2O/hH0aBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OsPZ1dUuH5SExhif7drQ0Riw7P53ldOsB7ss+VRwLqUkCP08PA/kN1YJuHNMVA4QGpTle1F5n5FV5bpJDT59cRv8h8HD0Xvr5Dn81E7Giv4GV7SuWj+BlnEeE22HDEa+PcTADtrISPzz8Zb18RGGH2tmrW5QY53w2/+fFia5DLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juwEN6D4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756918902; x=1788454902;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ng/jPPoJ+3U2XhdCDPYnipYUWqbfWqcOzI2O/hH0aBY=;
  b=juwEN6D4WIlpk7dx4DX/78GVMQi21gUNi3eOE2vc45dHu38EXoJDB0eu
   BiL/Q05VRP0cQ4pkiCwt+JN5Q9fsFDm0uVbuD/twXSIG6vTR7+2IwHEtO
   xC9YT0CuobJLh9rhLiTr8e2AklamBl2klM7HmyEE02q7GoiQzVnczhgoj
   osPBY3++k7cRBlNhVNiL0pDBNvpqTuoHn0JBf9o87BujcEp5EK5L1nhIi
   T935ziwrrZgja8RT7BXwQl/8cjbSiqNyQmPhmM4ZaZJMbeWncbfi0zD+N
   0LaCE5+Wb0rSuAzzJm2+zk4n8XvvC0uxrKbDZmgK9nrO7N3/0SQpRIYyU
   A==;
X-CSE-ConnectionGUID: LWZFcykVQLmw0eHwIYjtYA==
X-CSE-MsgGUID: 4Arokgn9QRCfAoIH5Cf+XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76687893"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="76687893"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 10:01:42 -0700
X-CSE-ConnectionGUID: GXXI9C+ZQXKFTi5GqVmfCg==
X-CSE-MsgGUID: GQUqcUrDSIaLo8Q4e8iMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="176007483"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2025 10:01:41 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 14A9194; Wed, 03 Sep 2025 19:01:39 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/7] usb: xhci: enhancements to address printing
Date: Wed,  3 Sep 2025 19:01:20 +0200
Message-ID: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DMA Address Printing:
 All DMA address printing is now standardized using the "%pad" specifier.
 This guarantees correct address formatting regardless of the kernel's
 architecture, whether 32-bit or 64-bit.

Address Formatting:
 Printed hexadecimal values can be ambiguous, making it tricky to
 distinguish between values and addresses. To enhance clarity, all
 trusted DMA addresses are now prefixed with the '@' symbol, ensuring
 immediate recognition as addresses.

 However, the printk() specifier '%p' has had its '@' prefix removed.
 This is because it hashes the address before printing, effectively turning
 it into an address ID. The hashing process does not preserve any relation
 between addresses; for instance, if two addresses are X bytes apart, their
 hashed counterparts will not reflect this distinction.

Read 64-bit register printing:
 Debug messages that print an entire register value containing a DMA
 address have been improved. The register fields are now split and printed
 separately, making it easier for users to interpret the information.

These changes collectively improve the readability and consistency of
address printing in the xHCI driver, making it easier for developers and
maintainers to interpret log outputs accurately.

=== Alternative approach ===
An argument can be made for switching from representing a TRB by its DMA
address to using an index, as most printed DMA addresses are TRB addresses.
While this approach offers potential benefits, it also presents challenges.
Calculating the TRB index is straightforward when the segment and TRB are
known. However, when printing TRB addresses read from xHCI registers,
determining the TRB index becomes complex, increasing the risk of producing
incorrect debug messages. Due to these complexities, I have decided not to
switch to TRB indexes (yet).

Niklas Neronin (7):
  usb: xhci-dbgcap: correct DMA address handling
  usb: xhci: use '%pad' specifier for DMA address printing
  usb: xhci: improve Stream Context register debugging
  usb: xhci: improve Endpoint Context register debugging
  usb: xhci: improve Command Ring Control register debugging
  usb: xhci: improve Event Ring Dequeue Pointer Register debugging
  usb: xhci: standardize address format

 drivers/usb/host/xhci-dbgcap.c  | 11 +++++----
 drivers/usb/host/xhci-debugfs.c | 22 ++++++++++-------
 drivers/usb/host/xhci-mem.c     | 13 +++++-----
 drivers/usb/host/xhci-ring.c    | 42 ++++++++++++++++-----------------
 drivers/usb/host/xhci-trace.h   | 37 +++++++++++++++--------------
 drivers/usb/host/xhci.c         | 37 +++++++++++++++--------------
 drivers/usb/host/xhci.h         |  4 ++--
 7 files changed, 86 insertions(+), 80 deletions(-)

-- 
2.50.1


