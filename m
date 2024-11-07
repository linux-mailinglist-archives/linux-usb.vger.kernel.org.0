Return-Path: <linux-usb+bounces-17285-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 371C39BFF35
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 08:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68D0B1C220DA
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 07:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2959D19ABCB;
	Thu,  7 Nov 2024 07:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qjx/dnEW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1A61993B5
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730965048; cv=none; b=fdNe2CSK7N3Ex0jDjFQm4LULCYEEQx5lbQWjUGO9YCkWSIld7TCWQhEu7sQHjvGlMtKzOrhegemtN37s57YRHlehHlRaLBDStyxH+4zBAcckMw/NPGyN1RHGFqaLFMZJhry1N/cyF82ckZtJ52OWNsS5buvJYld32bgKXLKuMyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730965048; c=relaxed/simple;
	bh=zLJkrERlnm3UH2W5JevIYMtRjMm03F4UqbP7LYv5JPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZTyZ52lMIF2dp43lD7jMRNX1Cu4r9ilzU+cyVYDiUUiXDEyUFFjGdWp9FVlNiJ9Xm2dTWpBNsKpc2GWDHujXHLkN3Z6i4g3sX+P91WfY+cwonGkXRmPRBx8BXeaZ6C4Du13Z0qaWtBCUnvdLcj5rCp91caQoNlIj9cNnyIOkJJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qjx/dnEW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730965047; x=1762501047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zLJkrERlnm3UH2W5JevIYMtRjMm03F4UqbP7LYv5JPM=;
  b=Qjx/dnEWeoikHkg2lvM1IXYyKkZVkyVsCnSYJoP2yStN8UwAPnV7qXCX
   eQ/oWId1Og3J2TBDt9Xk7e2BlwFrSiYd1IMySb4OpAtRl5ZoUk6d7wgJ/
   fgHQ0otsum3Sh//ZrEjWC4NBsz9it8AoxXmWNoqO0aiY17bZLvdC3i3c1
   Qylq1eXItz8U6bY/U1hggLuWxKLbxUfL3GCeDHCITwlGNb8agXhLft6be
   kVplWWcALfZ0Il6KXetmbuGKvKMoJ5DUPIClqxbJMZgq8XFpy/wwQZD99
   MXtSYMZil3VFxzVUyWCW9hHCitLSMHT84TsrxlA3dcoaBzuLHaInHtXUu
   w==;
X-CSE-ConnectionGUID: 74UYpB6bRbOfEqqKk3LZPA==
X-CSE-MsgGUID: I6umDBXiRBejTMxO/3+1Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34490727"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34490727"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:37:26 -0800
X-CSE-ConnectionGUID: 4IO9WX7fQoOB9EwkszwtKQ==
X-CSE-MsgGUID: ums8omIjSD6YZDBI6zNTsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="122477427"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.83.36])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:37:25 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 2/3] usb: misc: ljca: set small runtime autosuspend delay
Date: Thu,  7 Nov 2024 08:37:17 +0100
Message-Id: <20241107073718.405208-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>
References: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some Lenovo platforms, the patch workarounds problems with ov2740
sensor initialization, which manifest themself like below:

[    4.540476] ov2740 i2c-INT3474:01: error -EIO: failed to find sensor
[    4.542066] ov2740 i2c-INT3474:01: probe with driver ov2740 failed with error -5

or

[    7.742633] ov2740 i2c-INT3474:01: chip id mismatch: 2740 != 0
[    7.742638] ov2740 i2c-INT3474:01: error -ENXIO: failed to find sensor

and also by random failures of video stream start.

Issue can be reproduced by this script:

n=0
k=0
while [ $n -lt 50 ] ; do
	sudo modprobe -r ov2740
	sleep `expr $RANDOM % 5`
	sudo modprobe ov2740
	if media-ctl -p  | grep -q ov2740 ; then
		let k++
	fi
	let n++
done
echo Success rate $k/$n

Without the patch, success rate is approximately 15 or 50 tries.
With the patch it does not fail.

This problem is some hardware or firmware malfunction, that can not be
easy debug and fix. While setting small autosuspend delay is not perfect
workaround as user can configure it to any value, it will prevent
the failures by default.

Additionally setting small autosuspend delay should have positive effect
on power consumption as for most ljca workloads device is used for just
a few milliseconds flowed by long periods of at least 100ms of inactivity
(usually more).

Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
Cc: stable@vger.kernel.org
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
v2: add R-b, T-b tags from Hans
v3: add A-b tag from Sakari

 drivers/usb/misc/usb-ljca.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index 8056c65e4548..d9c21f783055 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -811,6 +811,14 @@ static int ljca_probe(struct usb_interface *interface,
 	if (ret)
 		goto err_free;
 
+	/*
+	 * This works around problems with ov2740 initialization on some
+	 * Lenovo platforms. The autosuspend delay, has to be smaller than
+	 * the delay after setting the reset_gpio line in ov2740_resume().
+	 * Otherwise the sensor randomly fails to initialize.
+	 */
+	pm_runtime_set_autosuspend_delay(&usb_dev->dev, 10);
+
 	usb_enable_autosuspend(usb_dev);
 
 	return 0;
-- 
2.34.1


