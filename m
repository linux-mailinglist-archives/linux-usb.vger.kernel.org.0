Return-Path: <linux-usb+bounces-25899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E51B086BD
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 09:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5842516E970
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 07:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EE3262815;
	Thu, 17 Jul 2025 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5nE6Kbo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE7520A5DD
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 07:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737484; cv=none; b=oc6xdVvOVv/eXKO/GeJr2Od94LCEiD8L4pp9+Jqd6KrT1hWoc5cFf77JJq11vNSU0J6f7cYImPKsrBWvUrLYr8q6G2DqJtInm85UD/Xbo9F7Y+MgafCwZBDtkKPcUF3KrlgMYvLQFxm0mbK7Fo13bd1vUku23MCFX3mmZx0D6SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737484; c=relaxed/simple;
	bh=Zv4J4zwTH6HKNsqS2lrEzPnZcuvHK4GpfzvPPl21BRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZJVSe5dAdJqkPQm7CJF7jbax4OYcoL496llZ8wrjz26Vk3GxPkeiXr7sxbbgvymT/aDseInfo26WSsd7d8ipMtZEzyy+MsuC29Jb64R5bDPkpdRWmpcqLheMFYpgjmNuEP8CWidraHk5B5RtbWIdHgKy4sWtBdMEvFWtJ5sFKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5nE6Kbo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752737483; x=1784273483;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zv4J4zwTH6HKNsqS2lrEzPnZcuvHK4GpfzvPPl21BRs=;
  b=D5nE6Kbo8RMqpWWVv1jsOv/Y5pQjqrTHnzRCzThKQlKu/PlysRrZIe99
   evfHhxQIlFqATYzzbRid0l5R86Z7cUVHhPFmLQcil5msdO3cnwNKiQI8v
   vls3XyYisVWorcTuoi+sLK/tchpbNKHlU0SfSuF0N5e2wtrvET4OkQxMN
   1tmQJGZ1+3soPu3vtCuwkyARsHhFW312JqqjJzEYbeZfrXyxzfP8LXe/V
   nRE3oz6K+UNM7VaZJIFSumN+DLs3UBKLcw6lL/QrMG2B/GVx+ZA9cJWod
   qgpvUEI5WCUBih8taYeUfp2KM0ER0wmof9yEyhdZbaQep5cZGyh9qbQPe
   w==;
X-CSE-ConnectionGUID: /AgjcK1ISvSOKFbEnXTnrg==
X-CSE-MsgGUID: 4SFC8BiDTP6ybqSMy/F9PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="80449318"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="80449318"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 00:31:20 -0700
X-CSE-ConnectionGUID: 3aThhtiYQhaWIrY5GSJ04Q==
X-CSE-MsgGUID: FU3V6bFjT1yVSkNKdP7eYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="188721571"
Received: from ettammin-desk.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.50])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jul 2025 00:31:19 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci features for usb-next
Date: Thu, 17 Jul 2025 10:31:04 +0300
Message-ID: <20250717073107.488599-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

A few small xhci changes for usb-next that have been sitting in the list.

The "avg_trb_len = 8" patch is not marked for stable as it only helps a
company with their custom virtual xHC hardware development.
They have a stricter interpretation of an ambiguous part of the xHCI spec.
I don't object to their interpretation, but other existing xHC hardware seem
to work with either way, so skipping the stable flag for now.

Thanks
Mathias

Jay Chen (1):
  usb: xhci: Set avg_trb_len = 8 for EP0 during Address Device Command

Mario Limonciello (2):
  usb: xhci: Avoid showing errors during surprise removal
  usb: xhci: Avoid showing warnings for dying controller

 drivers/usb/host/xhci-mem.c  | 2 ++
 drivers/usb/host/xhci-ring.c | 7 +++++--
 drivers/usb/host/xhci.c      | 6 ++++--
 3 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.43.0


