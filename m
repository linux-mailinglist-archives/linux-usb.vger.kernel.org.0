Return-Path: <linux-usb+bounces-17218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 749DF9BE989
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 13:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B04928567B
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 12:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13C51E04B4;
	Wed,  6 Nov 2024 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoN+qKU4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317A81DFE35
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730896490; cv=none; b=t/KU43EZi5kSLRC66ikhGmdbBITrQ09/R2AD1ASgJcoDsriyukFoFZC9TrcojrWXrRMUmuKxpX0HoFWBGSVGAtxgSlG4gyi+3buuOAuhPqIaBhpx98Z+STd58tWOwINBocKlkqUJAGdVSySw1aW7ogfh+3b0WjgAdrY+DK66MFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730896490; c=relaxed/simple;
	bh=VR8bHnlb53VRD6tqb0PEvNWVYdoYbrkwHHw0yTxMb6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XyGfq7V3vlnPHahfYLQK04zxRX7Wp6XHjqmNZ82o30JKHKkVku3ytuS3ztuV8FpLSpkVyvClLKlj4h0Ym6fF0pP0arflHe+pZUukkX7D9gVONM12IFvjg/fGQhh8Bw4i41aXpSUJE6vnZcUOUrd6ir6x0/gqHy0kABPZhim36zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoN+qKU4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730896488; x=1762432488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VR8bHnlb53VRD6tqb0PEvNWVYdoYbrkwHHw0yTxMb6k=;
  b=VoN+qKU4mka4jyTxFOjqgs7p7Dmuz4UmqYHY6X2lltS99Za3XqvMupux
   JGN0fG/YVDZN7Efi81XCYaglIAK6aH/0AEU+2G76ezoqE+pGvtlUTFjZO
   COcKARJ6CWMGOJ/2JyXPOLbmaYfW0TpdcAuw2oHFVSkQsFG1h3sGdQdt0
   3e3667HPpTBLpu2VIQl4Ryg/EGbocw3Nx7KJt5B0KDHVY9HeNH2DGgBD9
   JfbiXn0JAB/7HpvT1tbsbQzf/8WyDu9uG6hcbELrvkhlORIZmaawQxlne
   UlhXY/LeYq6fm0ly2Nz5vfEmNyEQKcdwxeEYfsdTztUuvherrSqiJgUEE
   g==;
X-CSE-ConnectionGUID: 2/KOR4OeTDK5iJzdgwe1HA==
X-CSE-MsgGUID: Neq34McbTXOZk0S22V5t9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42071831"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42071831"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 04:34:46 -0800
X-CSE-ConnectionGUID: bkKLVYEJSg+t/0cC0a0cnw==
X-CSE-MsgGUID: m7rxneHTTo+eM0D63SGurA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84061827"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.97.183])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 04:34:44 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 2/3] usb: misc: ljca: set small runtime autosuspend delay
Date: Wed,  6 Nov 2024 13:34:37 +0100
Message-Id: <20241106123438.337117-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106123438.337117-1-stanislaw.gruszka@linux.intel.com>
References: <20241106123438.337117-1-stanislaw.gruszka@linux.intel.com>
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
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
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


