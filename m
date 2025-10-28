Return-Path: <linux-usb+bounces-29780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AEFC1520D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 15:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45CEC6235EC
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 14:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E55217722;
	Tue, 28 Oct 2025 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1rQ1rTj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6062FFDC2
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761660793; cv=none; b=cbgU216HiULaEtptzSjbwhS/AC+xWGcW0nzgtC4SUeleL/qwxaNFbuO4UOkHd6QG+Ks6kJI6iaNULGL0CIz09/W9MzQoLL+KHL2QwhQ7dCxPplRIEKIo416Qk1L7mOYWy6K9Kj4FuPBvCZwBB9Zdxldhg4O+v4nd0ri00Q4YKIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761660793; c=relaxed/simple;
	bh=7MsLtoxQ1FhR9qmFmX+OnKheWoH8qZdUgq8GS540FgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kwx37kot35A2c8lpxJI8pDvSgNUN+Hrz2vrWkEQAT9PkWJl8Z8Gmq8h4rzSRsp9I/VGP8wB1OMHvt0gRaCcB42PqUaFCANIGdSdqh9gIwbZLQGWmKxrz0iQKXi1oHTpOvoll46OqaqH8K+uj3MwRClk1XaE4agZCemhaTsrPmfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1rQ1rTj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761660791; x=1793196791;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7MsLtoxQ1FhR9qmFmX+OnKheWoH8qZdUgq8GS540FgA=;
  b=f1rQ1rTjXi2CaNr3S/ruqy8kMUkOo27cdHI8LwZOgrFNviX/Uai46rAP
   U8IHglu36PhKd8HMismeGRk1CHsiSdmusarfU+8hatTzgbLntfepAQVOO
   ASvoWwPrPosV8AGd7FpIIHmPWvmyXT3Eca/AXAlARLxC1YvVuIbGsjhLS
   cbOoE75XgIOKrIEKtB4BACqtoP13+Jc4C5qqg6FHg1T69QG4tYlllsTVA
   3BYDi6oIo3uf4cXDgj0JEn3OE7y6UuuF1eDD93/oT7Asc07lJ7opPJjAw
   vr+VWMWjHjRTmJfByZ+d4D/0B1d30Wsflid/l0SlDWd/TBf8nqJ5EyjPD
   w==;
X-CSE-ConnectionGUID: jEPAA34fQy2kmdBeBl1APg==
X-CSE-MsgGUID: hTDCkp4wRY+vPYhwzhIq5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89232167"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="89232167"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:13:09 -0700
X-CSE-ConnectionGUID: VpSHvpX+RhKJiMNWxk6AAA==
X-CSE-MsgGUID: +fwaR57ZT/OgoplOFQPxAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185053609"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 28 Oct 2025 07:13:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id B736595; Tue, 28 Oct 2025 15:13:07 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v3 0/5] usb: xhci: add Port Register struct and tracing
Date: Tue, 28 Oct 2025 15:12:37 +0100
Message-ID: <20251028141244.2909808-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The aim of this patch set is to introduce tracing for PORTSC writes and 
implement a Port Register Set struct. This is the first part in a larger
series of changes.

Introduces a new struct for the Host Controller USB Port Register Set.
The current implementation accesses these registers through a single
'__le32' pointer, which, in conjunction with a macro, navigates to the
specific register using (base address + offset).

 Currently, how its accessed	| Register Name
--------------------------------------------------------------------------
 port->addr			| Port Status and Control
 port->addr + PORTPMSC		| Port Power Management Status and Control
 port->addr + PORTLI		| Port Link Info
 port->addr + PORTHLPMC		| Port Hardware LPM Control

 After, how its accessed	| Register Name
--------------------------------------------------------------------------
 port->port_reg->portsc		| Port Status and Control
 port->port_reg->portpmsc	| Port Power Management Status and Control
 port->port_reg->portli		| Port Link Info
 port->port_reg->porthlmpc	| Port Hardware LPM Control

These changes make it easier for future modification and their review.

v3 changes:
 * Rebased on top of 6.18-rc1.
 * Further simplified and generalized xhci_decode_portsc().
 * Changed PORTSC read/write functions names.
 * Added EXPORT_SYMBOL_GPL() to PORTSC read/write.
 * Folded rename patch into Port Register struct implementation patch.
v2 changes:
 * Fix acronym spelling to PORTSC from PORTCS, in all commit messages.
 * Add patch introducing xhci_get_portsc().

Niklas Neronin (5):
  usb: xhci: rework xhci_decode_portsc()
  usb: xhci: add tracing for PORTSC register writes
  usb: xhci: add helper to read PORTSC register
  usb: xhci: add USB Port Register Set struct
  usb: xhci: implement USB Port Register Set struct

 drivers/usb/host/xhci-debugfs.c |   6 +-
 drivers/usb/host/xhci-hub.c     | 115 ++++++++++++++++----------------
 drivers/usb/host/xhci-mem.c     |   3 +-
 drivers/usb/host/xhci-pci.c     |   4 +-
 drivers/usb/host/xhci-ring.c    |   2 +-
 drivers/usb/host/xhci-tegra.c   |  12 ++--
 drivers/usb/host/xhci-trace.h   |   5 ++
 drivers/usb/host/xhci.c         |  48 ++++++++-----
 drivers/usb/host/xhci.h         | 102 +++++++++++++++-------------
 9 files changed, 159 insertions(+), 138 deletions(-)

-- 
2.50.1


