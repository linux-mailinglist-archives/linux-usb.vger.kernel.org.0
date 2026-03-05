Return-Path: <linux-usb+bounces-34098-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPVzMXqZqWm7AgEAu9opvQ
	(envelope-from <linux-usb+bounces-34098-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:55:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EEC213EDC
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55BCC3064F38
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6AF3A874B;
	Thu,  5 Mar 2026 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHj7R5tm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BD039E6F4
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722133; cv=none; b=Hy4U+L1urxUAUm3eTq3utXccEbaeSDFmxk4Y+1vewGZkmORbacW9DHTAbZJ9fLI9pYD5WZNAlWcO954jjdFbE1Go8LIkPRqJNSZ0PdMG4H/2+HIJd4IZmd4kATrK39foVVLdTNOrh2D8448HJzE8n39N+iXLqpRheZiG+Lmy3gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722133; c=relaxed/simple;
	bh=0Uk/XQSyG0J1DZhygl51BmN+liwawL+FVk+evHv/0f4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IzDk66JnGob8LtC4cLwBaFWSZ3oLB8QIYCnNq4aHHKgaKKSacraLIo2JfMF++P5afeKoQukgj8j8Fsy1tnpZm5dN8cN61elTpFPce/KNI9DMCh0rD1/cAm5t8ezDxOHlYCuW5q1zyNmYnnSRGy60BXWcSQu3P043TKKtD4/KcNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHj7R5tm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722133; x=1804258133;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0Uk/XQSyG0J1DZhygl51BmN+liwawL+FVk+evHv/0f4=;
  b=lHj7R5tmxUp8AsgeFI2rcckfvyRKxT7Shy2p4bI+xaGupsh+fuq8mM60
   6Xm+BErWiMreGs11WtAMK/24lzoCZxuj+uZiDfEwWM3J40pBP4R4IulHs
   ce6XOwsvms2s0xDjZzOSzrdCNvSkIsVFukOVqtoiN4HIafmHU5FI88nob
   vZ1l3M1GnVYi35Dc2k31CXBO4TqERkZo1PbGvvtcb4JZHmQvFagboojTu
   C+DWOHT7YmlXV9yAsoVENr7TZnLOgVJvZLF06b0xcdyQMQAznNeEWR4K8
   lbOMTW2pLW1q9BKCnmffFDPiGWMZuThvg8ktaz/ZF4XTLGoqwzvIqslmt
   A==;
X-CSE-ConnectionGUID: 3XwDzuPqTQCVQrEK2Vme1A==
X-CSE-MsgGUID: j1tgRRdxR8a3kq2c05wpjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77411839"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="77411839"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:48:52 -0800
X-CSE-ConnectionGUID: l/UbBPzqQym5TbNFw+l8yg==
X-CSE-MsgGUID: lXmpG45MQauMa+iYNDNgLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218659780"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2026 06:48:50 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 3DEB795; Thu, 05 Mar 2026 15:48:49 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Thinh.Nguyen@synopsys.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH 00/12] usb: xhci: groundwork for secondary interrupters
Date: Thu,  5 Mar 2026 15:48:12 +0100
Message-ID: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 91EEC213EDC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34098-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Action: no action

Prepare the xhci driver for supporting secondary interrupters. It does not
enable them yet, but removes several obstacles in the current design.

Key changes:
 * Avoid freeing and reallocating structures during hibernation resume.
 * Consolidate interrupter initialization into a single place.
 * Add the ability to distinguish different interrupter types.

These changes lay the foundation needed before secondary interrupters
can be introduced.

Niklas Neronin (12):
  usb: xhci: simplify CMRT initialization logic
  usb: xhci: relocate Restore/Controller error check
  usb: xhci: simplify USBSTS register reset
  usb: xhci: move reserving command ring trb
  usb: xhci: move ring initialization
  usb: xhci: move initialization for lifetime objects
  usb: xhci: split core allocation and initialization
  usb: xhci: improve debug messages during suspend
  usb: xhci: optimize resuming from S4 (suspend-to-RAM)
  usb: xhci: add interrupter type
  usb: xhci: prepare for multiple interrupters
  usb: xhci: prepare IRQ handler for multiple interrupters

 drivers/usb/host/xhci-mem.c      |  33 ++---
 drivers/usb/host/xhci-pci.c      |   6 +-
 drivers/usb/host/xhci-ring.c     |  19 ++-
 drivers/usb/host/xhci-sideband.c |   1 +
 drivers/usb/host/xhci.c          | 205 +++++++++++++++----------------
 drivers/usb/host/xhci.h          |  13 +-
 6 files changed, 150 insertions(+), 127 deletions(-)

-- 
2.50.1


