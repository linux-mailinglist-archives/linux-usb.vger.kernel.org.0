Return-Path: <linux-usb+bounces-7725-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD66876361
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 12:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2667928301F
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 11:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892E055E7E;
	Fri,  8 Mar 2024 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpiG+ZXJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A933219FC
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709897580; cv=none; b=mdfsF0opvMCQVVU9ybRiqV1QEiBotzlvd1Hdun3S0J5ZU7JC7lejxP+DUkhCxvBb0PjoHKxIHZRvd6mPZRWC3xlyDarPYrlukC1Z+EnmZeqhyvqfhKfKmsXfl8Yp55ygldIKKrbcKHLbb1BawO4mWyYG/pMGilb5PjSOTxtUB6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709897580; c=relaxed/simple;
	bh=4IyKl2wgS0qDlZLtCSFk++pQvCVS/q1avuqiZBvo9PM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bPJ62+oz0JDxQPiC1x7iZeE9RLiWEFMxebA+aUIDCmFnpSmUkDROrkjA+pxo1HvwHE00snel3sJmZQWK5Po3c85cbxgcFF9RjYNgIaOzG31TDa772mCPUvmnyytc6KMkcgaxR7pNZdk1hJPMTD1E/YKRj8M10qa9YSQqCWaFWVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpiG+ZXJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709897578; x=1741433578;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4IyKl2wgS0qDlZLtCSFk++pQvCVS/q1avuqiZBvo9PM=;
  b=lpiG+ZXJjXkAnBmw2ob+73nLpzEEQkI6e/IEEUHbrGt6XdxikJ+xZlNW
   gp3kwvp7m6KAI/gOxqbWkSGVuAeDjTlsEkBZXYxXSNLqHI+hWvVHSpMAu
   Tb6anDYznVPKvy6JuoSY8+FRW7WgRpNJ1N7nh6QfH7KCp7RTMis50pFeZ
   TMt8imiCm45S9SM5HdYWXklfozqgCyaPB/23x9y/3iPWtycAqIjSWfJJr
   5T/sXhOTV6fOsT/ynvzgP6kqh9ejQCNwQBpj6WRgRu808vhNGNZpW3nKC
   61kDAjtpa3q8ad6i78SHTdCyYWeYGn76K2pweVIF56Je4TrU304t4K0LJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="30055255"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="30055255"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 03:32:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="937047500"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="937047500"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2024 03:32:55 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Klara Modin <klarasmodin@gmail.com>
Subject: [PATCH] usb: usb-acpi: Fix oops due to freeing uninitialized pld pointer
Date: Fri,  8 Mar 2024 13:34:25 +0200
Message-Id: <20240308113425.1144689-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If reading the ACPI _PLD port location object fails, or the port
doesn't have a _PLD ACPI object then the *pld pointer will remain
uninitialized and oops when freed.

The patch that caused this is currently in next, on its way to v6.9.
So no need to add this to stable or current 6.8 kernel.

Reported-by: Klara Modin <klarasmodin@gmail.com>
Closes: https://lore.kernel.org/linux-usb/7e92369a-3197-4883-9988-3c93452704f5@gmail.com/
Tested-by: Klara Modin <klarasmodin@gmail.com>
Fixes: f3ac348e6e04 ("usb: usb-acpi: Set port connect type of not connectable ports correctly")
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/usb-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index f250dfc3b14d..7f8a912d4fe2 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -154,7 +154,7 @@ usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
 	enum usb_port_connect_type connect_type = USB_PORT_CONNECT_TYPE_UNKNOWN;
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *upc = NULL;
-	struct acpi_pld_info *pld;
+	struct acpi_pld_info *pld = NULL;
 	acpi_status status;
 
 	/*
-- 
2.25.1


