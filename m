Return-Path: <linux-usb+bounces-11435-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4FE90EBE3
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 15:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCF42B264E4
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 13:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506D014659A;
	Wed, 19 Jun 2024 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cmiv+3WZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774AF14532C
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718802074; cv=none; b=DmhWK5gb9eoUSTt6eFzGlpIZn+yrnwQc/cBXiCfKIUGYX9ykW6LeY9/spYMIJOYsmwTCxYxOK9CyHC3N5h1aZ2JWOzIukLjf3ZKRXu5KbzeSKORhfbwtO8jID+xBvy8PXuF4iVjYC4ctUMg5qsaGdj/gYLG3YJ37c1DbdLsAaaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718802074; c=relaxed/simple;
	bh=okNxroW9JiGCE51Hfjfe75cDvN6l82+ZMP+boPv6+sA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aSdefGQYCqGWUsxJYw68mqhuZI7UhjBmu/4qN8uNx6zUbhUYpJRTBSpRIXOkJM/epcpZKES4pTg+Xwg1hltOhy463rFZDKFQ2ANzElSmE0xHTgZDsBBc+2ZSo5RdX2xubqzprmtkKj3lFJvmcp9r8FP3LDNGlB/LvogBaCm+TNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cmiv+3WZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718802074; x=1750338074;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=okNxroW9JiGCE51Hfjfe75cDvN6l82+ZMP+boPv6+sA=;
  b=Cmiv+3WZmgE/FnqMv/+y2gnIyY1WTg61AkfN5zlr2GAClitmsXIJIuqg
   3yhtG4Cz1PoNDt6fPLXQjjoD7tw6e/yLuOq+7W3bv4HJBmHZJtbfS9Zyi
   hluJk0XULkB2B9fSpGkIxoYUzuhYNs/+fue3NApanRrvsDulL+X5uWH+s
   RLZSUZYQv4ZxHvSGg0XGU7Rf7K4JWwRZ6hWyVdWZmZ2CtS/slLQsbypHZ
   sTX1AAvTmaY1AjgumBkMKRk5iz/HNhRESot9dT5UP2hPwUq5gzBJ/+2bL
   3IzRB7CKjCvkveoNq/zuwh7f9mASsaOOIk4DF8dnHh6q/xDVJZT02m+XO
   A==;
X-CSE-ConnectionGUID: ump61BHZRKGnh9GlKCUSrg==
X-CSE-MsgGUID: VAR68onKTxOrWsXI8CqWFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15868288"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="15868288"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 06:01:13 -0700
X-CSE-ConnectionGUID: 3suV8Xg8S2SFKx5uIJUm0g==
X-CSE-MsgGUID: kpZcsaMZRU6eF8ojggCVug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="47040457"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 19 Jun 2024 06:01:11 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <linux-usb@vger.kernel.org>,
	<gregkh@linuxfoundation.org>
Cc: mika.westerberg@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] Add device links between tunneled USB3 devices and USB4 Host
Date: Wed, 19 Jun 2024 16:03:01 +0300
Message-Id: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
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

Mathias Nyman (4):
  xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
  usb: Add tunneled parameter to usb device structure
  usb: acpi: add device link between tunneled USB3 device and USB4 Host
    Interface
  thunderbolt: Don't create device link from USB4 Host Interface to USB3
    xHC host

 drivers/thunderbolt/acpi.c       | 40 ++++++------------------
 drivers/usb/core/usb-acpi.c      | 52 ++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-ext-caps.h |  5 +++
 drivers/usb/host/xhci-hub.c      | 29 ++++++++++++++++++
 drivers/usb/host/xhci.c          | 12 ++++++++
 drivers/usb/host/xhci.h          |  1 +
 include/linux/usb.h              |  2 ++
 7 files changed, 111 insertions(+), 30 deletions(-)

-- 
2.25.1


