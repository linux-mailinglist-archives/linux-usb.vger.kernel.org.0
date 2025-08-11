Return-Path: <linux-usb+bounces-26671-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9287DB1FF52
	for <lists+linux-usb@lfdr.de>; Mon, 11 Aug 2025 08:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C20963B83DE
	for <lists+linux-usb@lfdr.de>; Mon, 11 Aug 2025 06:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5557A2877F1;
	Mon, 11 Aug 2025 06:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+8H59jm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF5E28505A
	for <linux-usb@vger.kernel.org>; Mon, 11 Aug 2025 06:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754893448; cv=none; b=Lk2GRJ0JdESIH6q9OYXlhX47eK5nBvDZXNW/j3nvwZdNZeV3vNJ+BgPuHYwbfbX7s19Oei6BxCWCmFSZgS6OXS8VmQ/4qxx6Uff8JaMe3HZ57F7pttLyT7yrQa7+IDFDmGrUTgBhFOpYwh6sOGcKk5Cc/ny2yU0qShEPz+kd0Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754893448; c=relaxed/simple;
	bh=qaF61QsHyLcNB5y1q+y3jXQ94n/Q0TQmsCJ0UKTNVtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kbLhsiV7LnFWxL3CUOuVDMucisv2VWUBpx2+rQT6zzoA2zg4sIGwyfEnLbcB/j099+7sX3l3ejnwqln5xNpyu0H9766Tg7WzOjEmmK/mLufmm7fdZ9eReHrcVLRf/iVC/AmbHxc7Ll3j3areOkUMofdj0/XDDSAiW87OzTRMskE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+8H59jm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754893447; x=1786429447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qaF61QsHyLcNB5y1q+y3jXQ94n/Q0TQmsCJ0UKTNVtQ=;
  b=e+8H59jmQFD8nbnzgmHGh8ogWqiJfct3zOBuVGG71L/B7uz9cif6F4Ms
   vwNoBx10qugY0L71/JRUOOaL++28oJIcCyVl0SdyrAhyJFYtq4ClDAKR1
   G4lNdHixFJa/MPJOvVuAOmI1haD1LCUOwHkBbF+M9sUcM+9oSGVEfvhYV
   Tev4wLfTeYDFFhPh/PsXqOZL8ghn1T6Wai5dy52OZD/TkZtQO5hPHtKSW
   LTl/MeqMibDxgzYUaPoZaqQUvaPyUi7OHQFB+ThSBUEjjwS4JCpFHD4u5
   Bf0RwFII3o7zB3d3V52Ppc6yZAHgewVVeT4sYIbTaDUcaAApZNPdJ1iVb
   A==;
X-CSE-ConnectionGUID: tycaKXu0T/+dNPZ4V9B8FA==
X-CSE-MsgGUID: SJPz0FhfRdqG9PJip7W4CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56169444"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56169444"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 23:24:06 -0700
X-CSE-ConnectionGUID: s63XKcZXT8KewNzj7xpUwg==
X-CSE-MsgGUID: Z+SdAx5eR2iQrCpyn8Insg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169943792"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.87])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 23:24:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AC95511FC22;
	Mon, 11 Aug 2025 09:24:02 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ulLwx-008sai-1L;
	Mon, 11 Aug 2025 09:24:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Oliver Neukum <oneukum@suse.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 1/1] USB: Check no positive return values from pm_runtime_resume_and_get()
Date: Mon, 11 Aug 2025 09:24:03 +0300
Message-Id: <20250811062403.2116464-1-sakari.ailus@linux.intel.com>
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

Fixes: 7626c52b6b46 ("usb: usb_autopm_get_interface use modern helper")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/usb/core/driver.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 460d4dde5994..21a732e052cf 100644
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


