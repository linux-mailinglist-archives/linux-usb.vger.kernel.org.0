Return-Path: <linux-usb+bounces-26907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 075AEB27F2B
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 13:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B00214E58EF
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 11:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6CF2417E0;
	Fri, 15 Aug 2025 11:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaEFCGIh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C821E15A87C
	for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 11:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755257488; cv=none; b=gdPGkNpZZ5HR7/1LyWbtx7ZkxJASj8CKcyPKKMevcq92W+pJ3pr2IG/KFgQf7iqroVvvpU/CNKbMCzg2/9Nzmn3sJlkvsXZq+EDq0CUJ4qM8JzbkNej4/n5Hscx0/PU5BjPboTlPOxuQmIHw5PGojrNSQBxD1DR76Lf+MlXprzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755257488; c=relaxed/simple;
	bh=JiRiI9UwdbQ/iZAm+WijWac7qDE9SjD8eYdG5aXC1pA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qa8hcKLui3RQ7MvGQ3DJWHBuTu99wOlYo8IQ0iOQ5rr6ChbBWJdiT3O2U6mMzLyivXhElUU3+05cwc7JUh5bttVoJgAdUrCcZiwxQIyMZxzoFJipXaDkH+A7lCss7RGGUWCnNyLdQIxbFynIVKR3mVVoYJQNxQoOs2ttpL+LEKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EaEFCGIh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755257487; x=1786793487;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JiRiI9UwdbQ/iZAm+WijWac7qDE9SjD8eYdG5aXC1pA=;
  b=EaEFCGIhWTQe/adVHygSxdesvQjgbN1KXkwPfaQ5SDuPjto41e8ECdgI
   Oh+Y/Ipn2Dw94WDrO8rX9mUi2uW9ofCa3Q9STiSck1eqJOYJqTbvMOOUg
   efclMaiG9DyEV6hibdNsQp3ORxdF8H0BVi8N6x75Skt6Cup2ecpXxH6kN
   442RxoHW686KZVQ3zvxHnj5GTnH6d8gUQCvk/lVAXVIthWBw3SuuyucEi
   6RbwdDnivth9AqVJaTSt185XfRRg4d4kP8/Rw56Olfd/3lnScWevSBhWO
   RZT1FAtMS1j5DMo8gALB/g2R5l4xFznA4w0SMAJicCmgpMPa7SQhePmUO
   A==;
X-CSE-ConnectionGUID: 7rEVPEmOSuS76mchXUyIgg==
X-CSE-MsgGUID: MTK5vdXQSPmCOTM3wnLuIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="83010784"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="83010784"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 04:31:26 -0700
X-CSE-ConnectionGUID: jLeQEEVHSxa+/3qAH6KgeA==
X-CSE-MsgGUID: TCXeM999TGGbFqC8tc9jYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197847619"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 04:31:25 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5A0AB11FA65;
	Fri, 15 Aug 2025 14:31:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1umseY-003snt-0j;
	Fri, 15 Aug 2025 14:31:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Oliver Neukum <oneukum@suse.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 1/1] USB: Check no positive return values from pm_runtime_resume_and_get()
Date: Fri, 15 Aug 2025 14:31:21 +0300
Message-Id: <20250815113121.925641-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_resume_and_get() always returns a negative error code or zero;
there's no need to check for positive values such as returned by
pm_runtime_get_sync(). Simply drop the check.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Drop Fixes: and Cc: stable tags.

 drivers/usb/core/driver.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index c3177034b779..d4df17b3d7e7 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1723,8 +1723,6 @@ int usb_autoresume_device(struct usb_device *udev)
 	dev_vdbg(&udev->dev, "%s: cnt %d -> %d\n",
 			__func__, atomic_read(&udev->dev.power.usage_count),
 			status);
-	if (status > 0)
-		status = 0;
 	return status;
 }
 
@@ -1829,8 +1827,6 @@ int usb_autopm_get_interface(struct usb_interface *intf)
 	dev_vdbg(&intf->dev, "%s: cnt %d -> %d\n",
 			__func__, atomic_read(&intf->dev.power.usage_count),
 			status);
-	if (status > 0)
-		status = 0;
 	return status;
 }
 EXPORT_SYMBOL_GPL(usb_autopm_get_interface);
-- 
2.39.5


