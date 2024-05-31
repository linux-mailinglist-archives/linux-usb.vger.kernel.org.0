Return-Path: <linux-usb+bounces-10728-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEF58D5FEC
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 12:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E7A91C234E1
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 10:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C7E15625A;
	Fri, 31 May 2024 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhBGJQQp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DF4156223
	for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 10:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717152417; cv=none; b=NX2orZ4imPJc9Fhh90p1ZK7ppwjOdGSrIrxr8c+edAHubtP4b/VK6gQZyhQ3MfCSl4Tz3DIbBX07b/NwichigBbx7GuV8jKDKY+m+3vIQ8Ad7rzx88fMQXYok3+TGeG1resHA/3gjnOZUmaINwEioBTkPSqkFhePcPd2jGMWH1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717152417; c=relaxed/simple;
	bh=M07XuSRObOYmRjMcm9IKvHAmPXbaCFtZxDjtTpb+5uM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UeV2K+rQoN4RcJ/bWsVK7xwIFwl2nS2/Dv6srAXg06SW7gJQZ/8fSDvWYblHE1JtuJxzBqNikd2LqtH7BVQcIi2HSTROKIWEiweLeVCGSIUrZmfUApA1Bpmmh3dBFHgPjzW8MQl1POw+4E74Q2jrs3SnIdcVlukwlmhuZguEBek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhBGJQQp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717152416; x=1748688416;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M07XuSRObOYmRjMcm9IKvHAmPXbaCFtZxDjtTpb+5uM=;
  b=BhBGJQQpBvNRgXlmIHT+46AyHUixgfqDFxr/KAOg0dPac2G5XAAB6bPL
   K9lOBJJyFXBKyju2vxeN7gHIoSP3OG5haUUTKVRhYuORdMjJuJN9MBZPT
   TLy8THoBE7nyn7unkioCDbMzab51eLVxspwynasJSAosL/Jb5ozX5vkQx
   N8MXKHety7uGVadX3rHFsli1AfNuPKCcp9oxbFGCqZeBYf4j7ssO9orRY
   FmRdfIRu/eZYH2kRc9/Tqy3K/DG1+xjLNHhkpgnOxsdRSNa6NaNVVSvPl
   TTmsA6aqUtsHTirIwhFvYxYJM+faOmBVW9g5lakDezIYF0hESE/lOEhVx
   g==;
X-CSE-ConnectionGUID: 0sq1jOfISVCm5HBGfh//vw==
X-CSE-MsgGUID: DGKKISMZTpKPNNV4nOyA7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13859353"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13859353"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 03:46:55 -0700
X-CSE-ConnectionGUID: X1mGk+cmQ4uX4jN5+1L8zg==
X-CSE-MsgGUID: /iCRKHjDQPOaKc4VhwCRZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="40685209"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 31 May 2024 03:46:54 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Ack also failed Get Error commands
Date: Fri, 31 May 2024 13:46:52 +0300
Message-ID: <20240531104653.1303519-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible that also the GET_ERROR command fails. If
that happens, the command completion still needs to be
acknowledged. Otherwise the interface will be stuck until
it's reset.

Reported-by: Ammy Yi <ammy.yi@intel.com>
Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
Cc: stable@vger.kernel.org
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3966e555f797..5c57ecbce813 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -153,8 +153,13 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	}
 
 	if (cci & UCSI_CCI_ERROR) {
-		if (cmd == UCSI_GET_ERROR_STATUS)
+		if (cmd == UCSI_GET_ERROR_STATUS) {
+			ret = ucsi_acknowledge(ucsi, false);
+			if (ret)
+				return ret;
+
 			return -EIO;
+		}
 		return ucsi_read_error(ucsi);
 	}
 
-- 
2.43.0


