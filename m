Return-Path: <linux-usb+bounces-13279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B0B94D2E3
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 17:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7492C280F31
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 15:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD31B197A65;
	Fri,  9 Aug 2024 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ir2J1chd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1812155A25
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723215827; cv=none; b=YfsVnFWbkhJBjeOeCGX2CTHzjuiVHMHaVdrwnf2IypC5ACquIwjRfoCV+ZYW/i1m1TXGUxq0cpIu9ZZcPMGpEoQvRBW5XxDhd2w7fi+hy87fEBGrD36GQZ8c7XGPpZxvdDCphfJrFj8SfnxIRZL8/7lhexTEBOujFsPRX18VdmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723215827; c=relaxed/simple;
	bh=0x23mSruJ+hJVpt/Nx1b8zoMBMluJRNoW6Fqis0dPFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sndw0k4qI2QnNvEEOEtBvXWJhYcORSn3+0d7RIEm1rKPalGC1mHE9cdLizaYXhQqsouRuNGsZS/Hm0v2jrAdRxJp4DQUkGLQl+fiKIdq0ZwiNClf/93ym8N8TW6yD2JY2MYh5g9Nt1VH3bwAxbcud5bsUJig94we7R3Rt7lkWSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ir2J1chd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723215826; x=1754751826;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0x23mSruJ+hJVpt/Nx1b8zoMBMluJRNoW6Fqis0dPFI=;
  b=ir2J1chdk1evUsIOyV4P+JfMlK6ktnt4U9aM10IksoVXz9SwJ0Y1gZTO
   5oxO30Yrmi36NZ2g9TP65cClb4I2hfL7ziiUGQm4XD1Qj+RahApo7j5pr
   st06vcwSKGNU+f4tWcB6/nwI98e8si7CI2MI/JRAdfefcYtnwP3jns1Xh
   9DqpWJHr1QhhVASNJiXYBUbfbM21st95J2SyJQoGL6MoY5JqA108JVddJ
   23JMZhYKKz3RXHhO398fNaSebTbDQZihm1vUgLKMZDp9bX4YcMlXnkNod
   BNKkHA0TPmaxsuiT1c00vz8eg0uJjj/LdUDfvv9/k8bLXcIfY5AUBjmnQ
   A==;
X-CSE-ConnectionGUID: /sjux4YAQcqnpFiuQ6IgCg==
X-CSE-MsgGUID: u9m1e7UST4GKhUoQ+xIZtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32072803"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="32072803"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 08:03:45 -0700
X-CSE-ConnectionGUID: Xg4bSNi3SLayAitc4CSMYg==
X-CSE-MsgGUID: bPHcFUa7T+qoy4zh7SWA3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="88460423"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 09 Aug 2024 08:03:44 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Fix the return value of ucsi_run_command()
Date: Fri,  9 Aug 2024 18:03:43 +0300
Message-ID: <20240809150343.286942-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The command execution routines need to return the amount of
data that was transferred when succesful.

This fixes an issue where the alternate modes and the power
delivery capabilities are not getting registered.

Fixes: 5e9c1662a89b ("usb: typec: ucsi: rework command execution functions")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 432a2d6266d7..4039851551c1 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -137,7 +137,7 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	if (ret)
 		return ret;
 
-	return err;
+	return err ?: UCSI_CCI_LENGTH(*cci);
 }
 
 static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
-- 
2.43.0


