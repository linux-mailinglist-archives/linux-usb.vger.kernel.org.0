Return-Path: <linux-usb+bounces-7540-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088B6871FF6
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 14:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA0152817FF
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 13:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2EA8593D;
	Tue,  5 Mar 2024 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FubuSEdz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809CC5381E
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709644896; cv=none; b=gdI3evx5j4cOOc9wXfJrtHmgiUkBLJfgNXONeRPPoDXzupBYVd+e+Lb+Oknna106LhqEUmYv6pafuWQEFqJoSphq+DULXKQkSaOs4/XrDVTAxNiwHjEqAipQtxITBn8oC3nJ2TcsoxcbW4FHxSIac3/xoVTv5xnj9IuUps6Icn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709644896; c=relaxed/simple;
	bh=aQPGoa0inUNNNCM9QEvKnBtIffnfnFXqbVUXbkFPXzo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cAFgUY7jrpdUrsV+CSn41cNHI90+BNtpoKhAVqPLSa/YckFv1hTsFWDEgRmB4xsFjrcL3XUIl1z4H4s7gf9o2GCWssRzCvo5t/TsBd52RUnF6gzK9qjz4yfBwEk5e+RyPb7JXjzWQ7urKoneS4tT3yqfAydr3/WMjuvbNjcWaMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FubuSEdz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709644895; x=1741180895;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aQPGoa0inUNNNCM9QEvKnBtIffnfnFXqbVUXbkFPXzo=;
  b=FubuSEdzrzkhSlyywJYr+spAEUl+RJMtcNa3cr6Bt2EbZK3frKP7xntL
   3n53v2mnw7c71ok/PVoWH88NDLoEYzWy+DyuSwyoWryGhee4uVPoCSqDW
   AwAPsIGrBI67H5RLV0mdfzpYNEJOmsGItSmR3Z0rmVAgNbedCBbAvFRGw
   jRWf1hRv2r5eeRWptO0gbEVihxKz/hf+BuqZxWERDdQOwi8iss/zDNaZO
   ouPB9Z58OuaOSj9qIEIqrgeVKy6sY6D2S1Qa9gTBZebooNq/WfHPr9hLw
   9bbNlV23fnktAEQtrkE59ooPxLLw1QjC9jnqv88WW4BX3O50Ombg8Xg18
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4357341"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4357341"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 05:21:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="937042310"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="937042310"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2024 05:21:32 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci fix for usb-linus or usb-next
Date: Tue,  5 Mar 2024 15:23:11 +0200
Message-Id: <20240305132312.955171-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

This is a oneline fix for the URB submission failure when
submitting >512 URBs via usbfs

Not sure where it fits this late in the cycle.
usb-linus or usb-next

Thanks
Mathias

Mathias Nyman (1):
  xhci: Fix failure to detect ring expansion need.

 drivers/usb/host/xhci-ring.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.25.1


