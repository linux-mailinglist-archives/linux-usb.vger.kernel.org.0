Return-Path: <linux-usb+bounces-17004-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B519BAE8F
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 09:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ECA8285068
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 08:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CAF1AB530;
	Mon,  4 Nov 2024 08:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3IStAwd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C521494B1
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730710265; cv=none; b=DkPEOhvQkvE/SmIYK+3pazJlIwgKXjUN2aZj6LT9jupnxlMKqpcYxLjunJGinguzyApnwCIRzhjv1nC3xgaxyIJP+MRfc1jGWzl3/gjx/OM6H+riQnZrzBB9y6eP0cYQZiKkngJTyLQ/PJFiwzk1xJ7jPf3o59YLVpN8DUpm0uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730710265; c=relaxed/simple;
	bh=TsEJ6ynWkB0jYGdFN81jcDNxz7kmtcx2sp769SOXTOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=trK/gnkUTkNmyG4tNf2UIIPG1x6w14SmWaKTstRJN1cXqFufH9glh0BK4WbTI0BdHn/DCeK/5VIvyQH/PuBkXpZLTfNiDLBlkuX0f6IvQBfkwAvHRv9x60xYpPJrE4W/lK7H3RTioCQjd9gDiQazIoiDtWC7ciw4znyiRwf/rUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3IStAwd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730710264; x=1762246264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TsEJ6ynWkB0jYGdFN81jcDNxz7kmtcx2sp769SOXTOY=;
  b=V3IStAwdw51xPtbiDsNT6oWrY7snkwvp7H8LjYghAgQQvLNFMf4acoiv
   CxpIvE6q92MuqOgQ2JtGaj2V/Sim0LxE7RsU0dBHaKTGqQnGD/A0AsBKZ
   SsmB9MMzXTiraUYSSosKa8embaYHfZTeFiywbmso6sh87ddX+2sAno3Uk
   ynq3hoDEcD00qmdSkNrEPARSB+Yvx0d8U06yR94W6two54917Tv1pw7m1
   +sgRNHMMUBfRm22F5pzZFhWzS/sCSmd1lnE4+ApJZJmUGZpJWLCDq/ytj
   DQx3Yy8xuAlTJa2Gp6Lhnh0CmCcd3lCgKpPe2nVvkzvAlQ2wiBjYSZT42
   Q==;
X-CSE-ConnectionGUID: EAbnAULvTDGDkAH0Cfp61A==
X-CSE-MsgGUID: DSvdAW5MQhiOke3I/Dg1GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30343060"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30343060"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:51:04 -0800
X-CSE-ConnectionGUID: nkO9cwpzS46ODIZpoLglQg==
X-CSE-MsgGUID: /3cEE4LFSKCWEVkZpFwjFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88097814"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.97.183])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:51:02 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 2/3] usb: misc: ljca: set small runtime autosuspend delay
Date: Mon,  4 Nov 2024 09:50:55 +0100
Message-Id: <20241104085056.652294-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
References: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
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
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/usb/misc/usb-ljca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index dcb3c5d248ac..062b7fb47114 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -810,6 +810,7 @@ static int ljca_probe(struct usb_interface *interface,
 	if (ret)
 		goto err_free;
 
+	pm_runtime_set_autosuspend_delay(&usb_dev->dev, 10);
 	usb_enable_autosuspend(usb_dev);
 
 	return 0;
-- 
2.34.1


