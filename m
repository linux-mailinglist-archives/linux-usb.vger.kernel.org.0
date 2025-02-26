Return-Path: <linux-usb+bounces-21092-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD014A46454
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 16:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D5A51889312
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 15:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291A622539C;
	Wed, 26 Feb 2025 15:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxMG0sgY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2B835968
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 15:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740582932; cv=none; b=uPDpqlXvDw5mB1+LUNrMFc14X2ntGvcGvBfkyyM64/8KuWCRtIHcSELgzRTZK9ttAoizd37eAMt1IdRW4Wz148IYZo0Ji5WkeXNDbuXl24ayoVFoi02rhO9bjzLjTNDGDrQcZf36gDIGEyHOassTLxJAvxa03xTkhS+Xv01sCj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740582932; c=relaxed/simple;
	bh=U31wAqg64QP9F9mAjs/mXUAcntAbauQuOQk9vK9WLmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p5RTCn0sWiBEHRa9ZUS5vJ7UWsndBnwNF2XVb+fTBMgiHQjdL8C4tj28haU/1o9bF72VsHf4W92YhJFTmcDwlWS0tVcJU6Ydzd41REtWWe+ljM01NK7tQHBoOmq1rW0Sy4JLZA7iot/fm6lDcwkPe4+AtYLe1aSvHJ5SwdrvbHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxMG0sgY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740582931; x=1772118931;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U31wAqg64QP9F9mAjs/mXUAcntAbauQuOQk9vK9WLmc=;
  b=KxMG0sgYvKcIVAsVb7tGLM93M5SeUkNXGNh85/2Yahun6J3VYFMTKby6
   MunfrDMvNAOEHZokoYUo3R5H4BNSJnVzGb/hjSX8wdCQ9ALzoRjfRvF0F
   iVtWAZYT6uJ90P0pjIn4+l7fYoS7j+unmxiAaqsMOtbyv+oKzBWSKMUhY
   cyKzIbNxy9eg+hli7W9OHQYPnOJOuYpnB8o2r5Q6M2+zNWJ06FvyVDxnF
   LuDwvjzELCj2ofDYB84aiFldXIopdaMB7eB2IfDaPTIQ7na+j/TC5VA04
   XDct+M58WQvS36YTRekhuT+MSMWuqKZD7L8TFhVgjEAStBA3t1CPg979e
   Q==;
X-CSE-ConnectionGUID: +ZSf1PldQ9SZnJBD/qOBew==
X-CSE-MsgGUID: DxDZvlqYT5OGJ41GovIKPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41687020"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41687020"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 07:15:30 -0800
X-CSE-ConnectionGUID: tANCmT2UQwSGlrrMnsjxhg==
X-CSE-MsgGUID: XmZBw4H4SDe2BSaffExvOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121984177"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 26 Feb 2025 07:15:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 757304BA; Wed, 26 Feb 2025 17:15:27 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/3] usb: xhci: improve Endpoint Context Field 0x08 macros
Date: Wed, 26 Feb 2025 17:14:54 +0200
Message-ID: <20250226151458.3871867-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve and utilize Endpoint Context Field 0x08 mask macros.

In multiple places, the Endpoint Context mask values are hardcoded or
include reserved bits. Replacing hardcoded masks with their correct
corresponding macros improves code readability, maintainability.

Niklas Neronin (3):
  usb: xhci: use correct TR Dequeue pointer mask
  usb: xhci: improve TR Dequeue Pointer macro
  usb: xhci: replace hardcoded Endpoint context masks with corresponding
    macros

 drivers/usb/host/xhci-ring.c | 13 +++++++------
 drivers/usb/host/xhci.h      |  3 ++-
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.47.2


