Return-Path: <linux-usb+bounces-5505-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 340A183C67E
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 16:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 676481C2395D
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 15:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5A06EB71;
	Thu, 25 Jan 2024 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9sRQIbl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAB44F5EC
	for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196372; cv=none; b=ZNKESaPqd6vJHleHwgphH9IgHYCEHg7MjwDK6zXM//WEV/mFvWQNBwIi5nl60i2MEMZFHIBbEu4chKEsBfuSb20wN2jdjDekSFroKZBa2mhTmkXBHJ0hqajeJ7rgfiMyUkIcRn4Mxs+ynbPvRkwEkOvOVjQquoKHrHtxCAjJgzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196372; c=relaxed/simple;
	bh=eyrRsLa+IeZSZYEWD1Q5CmR3Y6EDHc0XWK+J3OmXS4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Y+m97jFPxmsa/+a1U3h0fPLi9oln6rJRFL0YB1fetByD4yt64xR7w+//Wx3RBNjw6CWpBAxs12eG7JyfnootQOld9OmuZx7wbUb5WElPZcSmRYrdrS2XRlwXtqq3Ec8lScwgEU+I2/GU3vxzZ44dK8DW5E2lVdCeJVHBvpRQnmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9sRQIbl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706196370; x=1737732370;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eyrRsLa+IeZSZYEWD1Q5CmR3Y6EDHc0XWK+J3OmXS4o=;
  b=O9sRQIbln1NVIbPxDuObWW1w/qJOOnNo6sCH/881XEAu1XCAgX72XYuE
   UYAxeJnxEyNSFJdJQaq1wHf0DXAN2/0DlgYHu+gp27EQ6cOyEEj0rtJE2
   4+R2g8k8k2ZwMB2UbasBW3vq84lrQQmRbbdwb+jEgYf+OqGYc5srVGBfB
   c25/Mf+mo8N2sDoOlI7l78HxFcMhZLeahen7CD0knsStG8s21hbeLlAL+
   XPyUPRx2tBbbuIFQD7EXt05GLrKLrcW8+WC00gXCex75RbVUn/nPuj1dD
   CdP/OqNRgeYk6CaxQ/4SLNZRIOV0mpXhM0EIILzrY03B0UhazW5ZSdBcm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="23651323"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="23651323"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 07:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="857099924"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="857099924"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2024 07:26:07 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci fixes for usb-linus
Date: Thu, 25 Jan 2024 17:27:33 +0200
Message-Id: <20240125152737.2983959-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg

This series fixes gaps discovered in isochronous transfer error
handling, and a couple small issues in the newly added secondary
interrupter code (6.8-rc1).

Thanks
-Mathias

Mathias Nyman (3):
  xhci: fix possible null pointer dereference at secondary interrupter
    removal
  xhci: fix off by one check when adding a secondary interrupter.
  xhci: process isoc TD properly when there was a transaction error mid
    TD.

Michal Pecio (1):
  xhci: handle isoc Babble and Buffer Overrun events properly

 drivers/usb/host/xhci-mem.c  | 14 +++----
 drivers/usb/host/xhci-ring.c | 80 +++++++++++++++++++++++++++++-------
 drivers/usb/host/xhci.h      |  1 +
 3 files changed, 73 insertions(+), 22 deletions(-)

-- 
2.25.1


