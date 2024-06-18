Return-Path: <linux-usb+bounces-11389-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC2490CB00
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 14:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6C8D294B2E
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 12:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B839129E9C;
	Tue, 18 Jun 2024 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvmrVXaY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348B678685
	for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712028; cv=none; b=CYIKLIkP4WQZ+GLM72nX2efFChpImdGhTTs1ut0Qof45lvsnKzrVcW6bkZF6j+dLDC66h5s4D7m5sr8tnoftrw7wSJCGlojyg/PHsG3DU9hX2jKCZEXoaNzn/rPw3J0x6TDxMW2uLoNHzSxBk3cPROavSk0scH1u8UFiPztJRLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712028; c=relaxed/simple;
	bh=PxjX1ciazx60ztsmdmuXTFRdgpohv6BBYo/29wOVmxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YBq7anbraT3dJ19AkETFViY0004sVsyEtqFxZ5xd1zKVZNWHFBS5qC+tSmUPrcJ/2DVZRoyyIZjt5SFs4SqJFCDpbIzxbB7UHod1RsNqpc/0N7X3ZXLnndwGnheXHi3qQG2mI0/PYVSE0ijqVTUPDwRFG8b2WLuBrTZyLog7EBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvmrVXaY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718712027; x=1750248027;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PxjX1ciazx60ztsmdmuXTFRdgpohv6BBYo/29wOVmxU=;
  b=FvmrVXaYN+4430qOeUQ33iESQ3WpC2IRJQ4He2gwaVEiCEeZPmIPi/Mc
   /3zFJXwEjBToYtUNAKycUVqd+GPbO1tj+63EDQg/WMQQWsceRa7F/MyeZ
   98+n/V5i9Ty/OF+B3PgHTVdZTP2DSOBw9io4k2+m+PC35F3MkOkVE1zvL
   5K/y/ly4GVCsflpSd1Ee3o/zXsWsVrTXej3/xWMxUwNAydFyJeF7QSOiY
   2bWcxZ8HoUNSAudEYmqf0VZ6qjN5vYmPMreXEv7Ak+3Safb0VyGma+yuX
   HwNqNxeobCbdRY7iiPXXjaW9IU5R88A1aeLpM9k02p8I+B0Jibrw1ge1b
   A==;
X-CSE-ConnectionGUID: wBT0qidZRSumQHRLDLUsBQ==
X-CSE-MsgGUID: iBl2wm1eRMq75TQZ5XgFpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26702330"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="26702330"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 05:00:26 -0700
X-CSE-ConnectionGUID: rjBWM65hSyas6cl6XnYAuw==
X-CSE-MsgGUID: XpgD1CtmTcaQLX8KEC3YTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="78987524"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 18 Jun 2024 05:00:26 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Changing the driver data type to void
Date: Tue, 18 Jun 2024 15:00:24 +0300
Message-ID: <20240618120024.3384047-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's use the same data type as struct device.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 97eda8cd63df..1280cac314fe 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -395,7 +395,7 @@ struct ucsi_debugfs_entry {
 struct ucsi {
 	u16 version;
 	struct device *dev;
-	struct driver_data *driver_data;
+	void *driver_data;
 
 	const struct ucsi_operations *ops;
 
-- 
2.43.0


