Return-Path: <linux-usb+bounces-14397-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4796966548
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 17:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 640E71F25231
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 15:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893191B3F1F;
	Fri, 30 Aug 2024 15:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMk6DfMP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1024719ABB7
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 15:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725031476; cv=none; b=N6EdyUo6Vkvo0z6wbfKNKv+togwYU11KDSyjhXEFRii7ZTzJiADOcWQDclzq/A6uIgIhr82lABcfFv3Z/xCXr+42kpsEHMQKvIIhLrmVL9neQGYt1uRsvlH01lvqtxebZleEw0okuvDkFyL/Cng508JCgsnQLm6ojCcoXkp1QLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725031476; c=relaxed/simple;
	bh=ILq39y1hfJVnZNH2yJmHD2F4f9/hMmJvhOS4u87bRP0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pjDfFaXKZomisOPRS60tCUwfCmVcCf7C/GPWIadDtgYDu96lkCOe0k12elMR4192k5cOTK1ka/JiG9mSjbS85BzKhvHA78SZKcqcO0GbZj3aaTlkc2Bqfgo+wyUur8SfKkLQnOYeypcyQqG7HXgnpwyZCHisFueuD2hZdvkYvDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMk6DfMP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725031474; x=1756567474;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ILq39y1hfJVnZNH2yJmHD2F4f9/hMmJvhOS4u87bRP0=;
  b=WMk6DfMPocudMxJH0XruClzTcc21mCQ5EPqDQsfhxFNoRN4iWQkZWRn0
   a7RurUkYvJfkqaKNO3F0TlFKmRZ/PBJm0ww3XMWrBt2ienNDl4/XAHF/H
   LurGWJID/+DldQcyO9vWIzLVCQE1wAEMelIyzda8p/xR34qwpiV3giQz5
   DoAMOb1DDQPzdxbPVueQCweWoJ7xJZLWWEVrm4vluh35L4hjaAS54Q/sV
   Lu+bTF8Qtj37R1/hoZo2UGzkvw3oHBSRc2quBupV60M7e5NUg3SKRtk0C
   n+T/rdsfe9KHWVS9kUFXyw7GUTyAveGadGTFzbbRUHz6e7eGU0lB04YuK
   Q==;
X-CSE-ConnectionGUID: LDFbs2ajT6mgSh42tbRDXQ==
X-CSE-MsgGUID: rrXCcxbTTlaqqqmOChXGyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23861939"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23861939"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 08:24:33 -0700
X-CSE-ConnectionGUID: oNK+epPLQe2gpG9y4CRNnA==
X-CSE-MsgGUID: dt6W7Y9XRCa0FW4A4DOcfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="63981642"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 30 Aug 2024 08:24:31 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	mika.westerberg@linux.intel.com,
	mario.limonciello@amd.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 0/4] Add device links between tunneled USB3 devices and USB4 Host
Date: Fri, 30 Aug 2024 18:26:26 +0300
Message-Id: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The relationship between a USB4 Host Interface providing USB3 tunnels,
and tunneled USB3 devices is not represented in device hierarchy.

This caused issues with power managment as devices may suspend and
resume in incorrect order.
A device link between the USB4 Host Interface and the USB3 xHCI was
originally added to solve this, preventing the USB4 Host Interface from
suspending if the USB3 xHCI Host was still active.
This unfortunately also prevents USB4 Host Interface from suspending even
if the USB3 xHCI Host is only serving native non-tunneled USB devices.

Improve the current powermanagement situation by creating device links
directly from tunneled USB3 devices to the USB4 Host Interface they depend
on instead of a device link between the hosts.
This way USB4 host may suspend when the last tunneled device is
disconnected.

Intel xHCI hosts are capable of reporting if connected USB3 devices are
tunneled via vendor specific capabilities.
Use this until a standard way is available.

v2:
 Create device link by default if xHC host is not capable of tunnel
 detection but the USB3 ports have tunnel capability reported in ACPI
 _DSD object

Mathias Nyman (4):
  xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
  usb: Add tunnel_mode parameter to usb device structure
  usb: acpi: add device link between tunneled USB3 device and USB4 Host
    Interface
  thunderbolt: Don't create device link from USB4 Host Interface to USB3
    xHC host

 drivers/thunderbolt/acpi.c       | 40 ++++++------------------
 drivers/usb/core/usb-acpi.c      | 53 ++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-ext-caps.h |  5 +++
 drivers/usb/host/xhci-hub.c      | 36 ++++++++++++++++++++++
 drivers/usb/host/xhci.c          | 14 +++++++++
 drivers/usb/host/xhci.h          |  3 +-
 include/linux/usb.h              |  8 +++++
 7 files changed, 128 insertions(+), 31 deletions(-)

-- 
2.25.1


