Return-Path: <linux-usb+bounces-17455-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED3E9C5023
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 09:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12365B2CA04
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 07:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BBE20A5E2;
	Tue, 12 Nov 2024 07:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnG2xbT5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACD91990AF
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731398126; cv=none; b=GSZllG6yiLPSTyCf2EoC17B7Wgcp80+OB87h6l1J+vbTSQ6KNatgvn4C3apVFKpoYHUZvtym+h5LKlh7nI2Dnr6T8HlgJS6EqrJooENnT/YBSju+MSU//t9c8xFItZ5b4bmCbAy0I862ZvqJXVTuadyrRJunUaBVk1nN7WeapmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731398126; c=relaxed/simple;
	bh=8VxSQRcDnrhCOEVwLwHQkdlznsGu+FCajYsaALnrWf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EIh7pmTQY1lLWsHey6RmP91NreXR2AvgWlV8aHXGsT/1X+Zc3uhuxG2QrxUdL5Ysdoba5xyl8pIWnZAInJ/PcMHwlfN0dILkvQ8eE3uvFCT7aRrVDcE/ln2DFIMukpId6YsK88XV4ek61aKz6BUQFXuLISzIz84+0uN2h5bfRjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnG2xbT5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731398125; x=1762934125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8VxSQRcDnrhCOEVwLwHQkdlznsGu+FCajYsaALnrWf0=;
  b=JnG2xbT5QitTS9yvu7kctEG4pkLhvbwZSwm0ng6t97VQCHTar+EtMlfb
   eLqzZPY0nKnGiO6mrRUkySqR9bNvwZVbv4nN2xvJTr3R3QipO+pgmKxTY
   TEELu2hrr55R3cQEU0whnesxj+Kkbw74qbO02rNl1xLH4zPuEkroZoyd6
   c9nWNHUP0hMT7K0nHCaWWqlivcAQyAVeFudbl3e6bI4DKw4RZhr13ZZWt
   m0ZY4/Lnpw7NEalZIobRrdD5ux/vBeJbhcIxsd1WKenhe+P6nxKHxokSb
   YlQxOyGLCJaqMHfZM8x15iVnwe4Db5OrE4LnIn70fgPkumwtqjlx9K0au
   Q==;
X-CSE-ConnectionGUID: YB3WsstATQGdPK9TNfggSA==
X-CSE-MsgGUID: vxGfPhCuS+qEvJMQefcUOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31092711"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="31092711"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 23:55:25 -0800
X-CSE-ConnectionGUID: 6XR+du3ISsWduS4vJtvyBw==
X-CSE-MsgGUID: Us+pYUmhQOuLVhzj7mmt9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87215359"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.8.237])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 23:55:22 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 2/3] usb: misc: ljca: set small runtime autosuspend delay
Date: Tue, 12 Nov 2024 08:55:13 +0100
Message-Id: <20241112075514.680712-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112075514.680712-1-stanislaw.gruszka@linux.intel.com>
References: <20241112075514.680712-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some Lenovo platforms, the patch works around problems with ov2740
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
v3 -> v4: no change in this patch
v2 -> v3: add A-b tag from Sakari
v1 -> v2: add R-b, T-b tags from Hans

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


