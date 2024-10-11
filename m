Return-Path: <linux-usb+bounces-16082-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B3799A41F
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 14:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EB9B1C21582
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 12:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7503821733F;
	Fri, 11 Oct 2024 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPGnvz9q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F55820FA9A
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728650647; cv=none; b=bVZWm6KBdbzA8XGXJi0DhipzCxQtEJUxF+XoUy+1iPbtVhlNSVROsZoxf1AMFs1dLAWS6w8v7Ljd3s+uOP4M85UBRjjSdld/Gh5q65vRDGQtCA+RympmHcu+X4NnV9SwvJuSycRloRGXk8/YPBCBWV2m+VrIQWcfs2+tj/pWdd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728650647; c=relaxed/simple;
	bh=xddYN/SEysPkcyJ4TT83TXSa5VrFYBLncMg61oWCv1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kuceHh2pbuPxRRkA7XQOja3NVdhp1P4aSvV025F5caitKHHoOGJVLo7q5Rqn9cxeDTWQvraH3lewZ79t/3bBi4oRJ15szOqrPLguEPo6EPzoU7ztPhsxCmyswmSi5wViF9rQ/AxY7Mdwm9zYLZpSFsqlAJRf+o9OJmUwe/hsgCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPGnvz9q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728650646; x=1760186646;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xddYN/SEysPkcyJ4TT83TXSa5VrFYBLncMg61oWCv1A=;
  b=RPGnvz9qJYKySOQHgvDycL2oOM7Q8yHVeC1QKD+UdQK6gOTC+5jRR7OP
   nf7+Ds8xzT8CtmZeN+e5LhE0isS7kdMu8tnM7SyZs1p8fVOlHpvtONJUo
   fs1qp/N+3q9FPFxs0Tr6IqKz/8+AS3ZxHAuEfZIMISo0piUYShl8Lad5R
   wACPKVJj0K5QHq5dvQdhFfAsOwrmrtMfOyKwaHK3UoiWIKbd77h2xfSzX
   kdiOonAf6o0D42gkKC8JzcbR0EvNP3x4iGKsPyiYAXn9zIKQcxo8pHIg3
   S/rgiJTQc+4f5gen0S0W8/7Z7bnlByl+EeLTMcnB3kMZ5UYOg2qs3P9Pk
   A==;
X-CSE-ConnectionGUID: xKGxQIO+ShCLIUhS2kuoLA==
X-CSE-MsgGUID: MxJaswlYQjKrAiT8j/3RRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31957687"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="31957687"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 05:44:05 -0700
X-CSE-ConnectionGUID: fMGrBEs/TOaRknWSI1UP6Q==
X-CSE-MsgGUID: 2cDhWJ4hQoCMg0/qYQDTiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="77716127"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 11 Oct 2024 05:44:03 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 0/4]  usb: typec: USB Modes
Date: Fri, 11 Oct 2024 15:43:58 +0300
Message-ID: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changed since v2:
- Renamed the callbacks - Abhishek


Changed since v1:
- Leaving the usb_mode file hidden if the usb_ capabilities are not known - Dmitriy
- Fixed kernel doc warning - kernel test robot


This was originally a proposal of mine that I posted back in 2019 as
an RFC [1].

The goal is to expose the USB Mode - USB Mode as defined in the USB
Type-C and USB Power Delivery specifications - to the user via sysfs.

With ports the mode will show the supported and the default USB Mode,
which is the mode that is (or should be) used in the next Enter_USB
Message.

With the partners the mode will show similarly the supported USB
modes, and also the active mode. Changing the active mode should cause
Data Reset (as described in the USB Power Delivery spec.). This should
happen even if there is no active USB Mode (in Alternate Mode).

I've modified the original RFC patches based on comments I've received
(offline). The major change is that I renamed the sysfs attribute file
for the port from "usb_mode" to "usb_capability".

I'm taking the USB mode in use in the UCSI driver with these, but I
did not add support for the "Set USB" UCSI command yet. I have no way
of testing it. Also, I don't really like that we have to construct the
Enter_USB Message from the abstracted information that UCSI supplies.
The interface should supply the Enter_USB Message that was used as is.

[1] https://lore.kernel.org/linux-usb/20191230152857.43917-1-heikki.krogerus@linux.intel.com/

Heikki Krogerus (4):
  usb: typec: Add attribute file showing the supported USB modes of the
    port
  usb: typec: Add attribute file showing the USB Modes of the partner
  usb: typec: ucsi: Supply the USB capabilities to the ports
  usb: typec: ucsi: Add support for the partner USB Modes

 Documentation/ABI/testing/sysfs-class-typec |  27 +++
 drivers/usb/typec/class.c                   | 204 +++++++++++++++++++-
 drivers/usb/typec/class.h                   |   3 +
 drivers/usb/typec/ucsi/ucsi.c               |  15 ++
 drivers/usb/typec/ucsi/ucsi.h               |  10 +
 include/linux/usb/typec.h                   |  22 +++
 6 files changed, 277 insertions(+), 4 deletions(-)

-- 
2.45.2


