Return-Path: <linux-usb+bounces-17425-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA189C3B8A
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 11:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3006F281401
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 10:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3E3166F3A;
	Mon, 11 Nov 2024 10:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnHnJrUN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D396013AD20
	for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2024 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731319345; cv=none; b=lYN4xL8gqI4mzCyQ3IJj8GAKuL6bdNFCQCfmZGPyQ1akOmVCLuo5hAhCZNX7deuQ/AjGsrmEJVNaPMilnnByopVHBCgNXNmosthaYcYy2lDG3HYw1LWqinwoMLCDOlbC6Rut95Wb7kehOl/Kf92ksEsvmSbHrSBV7mZ6Xsa8/T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731319345; c=relaxed/simple;
	bh=uJIcu26Gkl9eV5axoi8rb6p+u3ppVhzfFAxMlL9u4mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gH1RUCX+eIKoh+R/VQh+K1LOrOHoilpXALPblPh+31fb8NT+QRXz46AXK1oZV0pYcmjqpdzfPebTRTHE+1pZTFmWTmBpcaUA4Od0ktvGHdi8aK/2NxIMq7rVUYZlEtJ4ySMSOlVKlmztdG7AqNYGB5uC/1PFnhDw9EMhupvEqgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnHnJrUN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731319344; x=1762855344;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uJIcu26Gkl9eV5axoi8rb6p+u3ppVhzfFAxMlL9u4mg=;
  b=cnHnJrUNK1cJTuyxtf2DR9BcYvIUGmq01sQ+wvLvFgT4gB5FD9buuRao
   YC7JchElKaE6cW8HiOmHY6q8abQK5Td4FfLjuJ3wP3K2ARcqMH4zj88sf
   F4kLWfsbO9bHxacX0zvAlhRlTPYuoAmugGg7yxSLTM3AEBdFsnlybbQ7p
   Qus0qE8IvcMpIYDuuX7LWz+xhbIRDvH6VCaT5EOpUwBPA2yocF3DMyed3
   4J3eF1wN8bS7gZ1Q2fNtu/HJ/v24cDH1xbRt2CfJjLTndgWsZKF7RuhW3
   FEC4YA7+CpTYYec9bt/L7Epw7GOHSn3drzCIqNb4Hqne8Ss/CrM7AHJvN
   w==;
X-CSE-ConnectionGUID: 9agyMObzS4en+TZWA5Sv2Q==
X-CSE-MsgGUID: OAMrDtpkSECgug5m95c54A==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="33981455"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="33981455"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 02:02:23 -0800
X-CSE-ConnectionGUID: Tg3sMm1QRSaAWRzm3OM9zA==
X-CSE-MsgGUID: xs07J1SvQy6lJV3sado98w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="87001341"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 11 Nov 2024 02:02:22 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH] usb: typec: ucsi: Fix a missing bits to bytes conversion in ucsi_init()
Date: Mon, 11 Nov 2024 12:02:20 +0200
Message-ID: <20241111100220.1743872-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GET_CAPABILITY size is wrong. The definitions for the
command sizes are for bitfieds and therefore in bits, not
bytes.

This fixes an issue that prevents the interface from being
registered with UCSI versions older than 2.0 because the
command size exceeds the MESSAGE_IN field size.

Fixes: 226ff2e681d0 ("usb: typec: ucsi: Convert connector specific commands to bitmaps")
Reported-by: Abel Vesa <abel.vesa@linaro.org>
Closes: https://lore.kernel.org/linux-usb/Zy864W7sysWZbCTd@linaro.org/
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 974a441155e1..c435c0835744 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1775,7 +1775,8 @@ static int ucsi_init(struct ucsi *ucsi)
 
 	/* Get PPM capabilities */
 	command = UCSI_GET_CAPABILITY;
-	ret = ucsi_send_command(ucsi, command, &ucsi->cap, UCSI_GET_CAPABILITY_SIZE);
+	ret = ucsi_send_command(ucsi, command, &ucsi->cap,
+				BITS_TO_BYTES(UCSI_GET_CAPABILITY_SIZE));
 	if (ret < 0)
 		goto err_reset;
 
-- 
2.45.2


