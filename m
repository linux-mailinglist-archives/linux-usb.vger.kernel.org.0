Return-Path: <linux-usb+bounces-16711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C02239B0154
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 13:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83DE72846B2
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 11:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE84F1FCC63;
	Fri, 25 Oct 2024 11:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvikoYDj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B87B1FDF90
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855667; cv=none; b=mRJaCvaI4mqEsBqqjmwny/l1JED/dzXmALGXapMlOP9hEc/N37z6gJFJFBNT/oTSpUvzz9hcCDkIoxvl2VJBQrVHgeqJy4r9SFLzvtkWeYKKZVIOVDkvZT5uQTXpfX67o3Cc90RqX+3BD+y3vUiwHI88rTKwt+OU4aD5QC+df8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855667; c=relaxed/simple;
	bh=tH5DSwlqXfFYdGDjMRzDSFt3MoJpB/PsfT1/7qrtdSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n+oBYO2pk4fl22WfCCiEa3eXRJglLdQhbra4ZFSCepOBS8B1/ytExEeoViYODO7toA5kKUjQ1W8USNhUpnAZ01BIBT/Kxna9X9gu1/ikSt9TJ+Rxpo6sl0wORPCQbVLkZs1AJy1z2vUK9Ay2homvJ5v9RtDiLNbNv6Uc7iBuTVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvikoYDj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729855666; x=1761391666;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tH5DSwlqXfFYdGDjMRzDSFt3MoJpB/PsfT1/7qrtdSE=;
  b=WvikoYDjHZ49ioO205DiE95h7PUtsjqadawyJanl3k0owtKqVdsQFBq6
   GLk8A3BWUOKff1mMlqwWwc879HKLgi7JG+fW450wj0iHFI/BF4WygK9Di
   W/V4lMheR8gmXfYs7YpqLoALm2gIDaRTealU3OQV8P+/Gn1DhgvPoGDNc
   eYUGC/CyJPdk7rlBxOyB+jgwxx2KD7PQXhSUnx1mKmRpCqgPBgC2ebiEW
   4MIOoVcXUA2PNlBi73OtSDn9cSAysTXmKHYUahOFnDhfN+h0ZSihDrpmA
   gJnCUXRDzfDqYDfVqkDpV6TOxTNWK2jjYQm4vgrfgJXG4eviIm98tw0x3
   g==;
X-CSE-ConnectionGUID: bgdiSE/TRxm6PsR0D8vf4A==
X-CSE-MsgGUID: 4XmGMsBvQX+LWBHQvlTjhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40075589"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40075589"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 04:27:45 -0700
X-CSE-ConnectionGUID: Z6dKTQVbRWSglFRgHuoqxg==
X-CSE-MsgGUID: nxcRxHk1T2SnZCmVejX+Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85657116"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 25 Oct 2024 04:27:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id DC97735B; Fri, 25 Oct 2024 14:27:42 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/2] usb: xhci: improve HCD page size & IMODI
Date: Fri, 25 Oct 2024 14:26:59 +0300
Message-ID: <20241025112701.303035-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improves HCD page size validation and move it into its own function.
This function is built so that the page size can be set to any valid value.

Improve the interrupt moderation interval (IMODI), by removing the error
case, and instead setting the IMODI to the closes valid value.

All patches were applied and tested on v6.12-rc4.

Niklas Neronin (2):
  usb: xhci: improve HCD page size validation and setting
  usb: xhci: improve xhci_set_interrupter_moderation()

 drivers/usb/host/xhci-mem.c | 45 ++++++++++++++++++++-----------------
 drivers/usb/host/xhci.c     | 25 +++++++++++----------
 drivers/usb/host/xhci.h     | 13 ++++++-----
 3 files changed, 46 insertions(+), 37 deletions(-)

-- 
2.45.2


