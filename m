Return-Path: <linux-usb+bounces-26983-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B6B2A39D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 15:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AC392A7163
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 13:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19E231A044;
	Mon, 18 Aug 2025 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpQ/8p/w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C672E12DDA1
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522056; cv=none; b=A8nuZXL4ky/ZUHEKoBXdKjiVje85hWBNVP6DqWzfTE+Cx7avSs6RQtLGji7YTs8qBXbTEJ+5KrvqjCydbdT6KyOHRXezErC0kw8Dm4hMNrj3IgdTrTeFpkzn7NvaTiIIUe6+HwE+B+FYkkBRKobmuIoMGr715+SpUfft+KqOOeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522056; c=relaxed/simple;
	bh=pfAo2HMu7/Ywh/ZaWTXzNJyRgoqIwnIDfAINUW7kq9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VejEyQm0OORXJcGD0nZ6xEA0wmViCjElI/MYtODyr4/KhqRNtMPmDHjAl1DRqgKdmHH9itqFuE/opToZ73Ag6oVQXxFEynDvyr4MUH/sNbQ90FehP5cjBf4W/3EC9FhkIe8udypATnQ0tnwDDmTO/bYOXrriYbssP9Z4Anw69DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpQ/8p/w; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755522055; x=1787058055;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pfAo2HMu7/Ywh/ZaWTXzNJyRgoqIwnIDfAINUW7kq9A=;
  b=mpQ/8p/wEsBCO+Mn5n+yH+kIpeZK1nN5BFiovobTvyhbKF4flkTVD2N2
   HTQZdHMxGbiumHjj+w8oH1Wq2yQYArsqmxNZe7fcs73wXseYAtU6bkVtM
   68aDw/kXcWHDn/HvQ6AZgv6JCk5MgTNpAw91jettktkp/VVimXOvhqt3O
   hcRqClWa2bbNxf9XW7PJ3Oqq+Hg9o7SJmvJqGg7x5YNzW3I0L2k/o9Bgk
   FKn4H/5stNzncN9GlOjW6qBhg+G3bHu1cjyqoUDkKElJkmJY0Z020Uk+X
   aWP4wvQB3XwMDxt7izC90BZwP2/McN8Iyj1/KzC720XGhi2pVi6OKugiq
   A==;
X-CSE-ConnectionGUID: u6/qsGRXTfSoPM9OrgGZpw==
X-CSE-MsgGUID: ZvxmmmoiRyavSlruBoCbLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68345746"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68345746"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 05:57:47 -0700
X-CSE-ConnectionGUID: kEAgGS7LS26izHrIwq3s9g==
X-CSE-MsgGUID: +pMBOgGuQdKgP43h4K2QVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167479771"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 18 Aug 2025 05:57:46 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 4608E95; Mon, 18 Aug 2025 14:57:45 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/4] usb: xhci: improve Set TR Deq completion error handling
Date: Mon, 18 Aug 2025 14:57:38 +0200
Message-ID: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Set TR Deq command instructs the hardware to skip Transfer Descriptors
(TDs) from A to B. Once the hardware processes the Set TR Deq command,
it returns a completion event indicating either success or an error.

In the event of success, TDs A to B are released, the dequeue pointer is
updated, and if there are still cancelled TDs, a new Set TR Deq command
is issued. Conversely, if an error occurs, a warning is logged, and TDs A
to B are released. This can lead to a mismatch between the driver
and hardware, eventually resulting in an critical error.

When feasible, attempt to resolve errors. Otherwise, retain unresolved
errors as they are and improve the warning message.

xHCI driver issues Set TR Deq commands in 4 places:
xhci_handle_cmd_stop_ep()
  After a successful Stop Endpoint completion event is received.

xhci_handle_cmd_set_deq()
  After receiving a Set TR Deq completion event and there are new
  cancelled TDs.

xhci_handle_cmd_reset_ep()
  After a Endpoint reset completion, Endpoint state is Stopped.

xhci_urb_dequeue()
  If clearing Endpoints Transaction Translator, Endpoint state is Stopped.

Niklas Neronin (4):
  usb: xhci: handle Set TR Deq TRB Error
  usb: xhci: handle Set TR Deq Slot Not Enabled Error
  usb: xhci: handle Set TR Deq Context State Error due to Slot state
  usb: xhci: handle Set TR Deq Context State Error due to Endpoint state

 drivers/usb/host/xhci-ring.c | 68 ++++++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 14 deletions(-)

-- 
2.50.1


