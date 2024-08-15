Return-Path: <linux-usb+bounces-13507-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D16952B63
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 12:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAF60B21507
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 10:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27171C9EB5;
	Thu, 15 Aug 2024 08:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gl9MU1CN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DAD1C9EA8
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723712260; cv=none; b=ZkC4vrhz1VIpn7ArwVjzlvZVkRsK8JwQyl59pyGR7aN6WfKJB116UEPnYPseYgpPd/2ixYb0+0oZKgeG/bZ1owG6kurxjCOvir70IiZIVk9cvXvRGvBLc2PIexVdIUu8fAxp/rGzjGuq3D/JMBRKnawEMjF8iHWe11fyASOZuGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723712260; c=relaxed/simple;
	bh=3R2pm5Kuk4wEYjoyM3jFKb/ppgX0RodA/DTz5vhow0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEl+iwOovzuw+BPwZ1rrNj2FYwdNA6Mp8HUTJ8+9jqAb2A7uBIPik6yo8/Fr7pKI4UXmsmEHCqHyd22iRoPgm8nMip6nUTnzEtDfa/aaZVlF83ZIQexwIiWCR5ba1Us71xBjeAwavopuVWwpT9KkAHuSZLBEIvakMT64E7O7qOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gl9MU1CN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723712259; x=1755248259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3R2pm5Kuk4wEYjoyM3jFKb/ppgX0RodA/DTz5vhow0A=;
  b=gl9MU1CNSDNoFs3PuHzUc1PLfuD/vRKhOQsxvDZzQDubD1sUuIrJTC8b
   HdU2io9hqlPlSm9hJRufBN4bgq090jUL1Zeu06N20sXI3iUsrDb613t8r
   lXmrThBO5IpsWNz+gnkQfVvXjs+ej21JvTSqMDv+/d+MfsZVcYRQGVEjt
   DVrlbo2mUSXF4jECchzIFmttiIE10VF63cJafmB7glQtvJaKsVGNx9zXB
   aZVacrxn3adQINIh4v5+4PPSYGK0keu5ZVXmSHH+qNK01dn2IbDJQKHtQ
   CyvefFH664DxEXHmyvlwQ7SWReiSdkUZ6dNwsuTlUXcdEsrZWjnTYuXSO
   w==;
X-CSE-ConnectionGUID: 0Q9QaxAnQVykgbCOEqYH2A==
X-CSE-MsgGUID: ohAkgIXRTE+PikrjxKF2kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22094643"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="22094643"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 01:57:39 -0700
X-CSE-ConnectionGUID: y4WTKTVlQQa1exUjmMQdIA==
X-CSE-MsgGUID: wjIqw0bATP22aszI/szEIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="96816961"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2024 01:57:36 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH 4/5] usb: typec: ucsi: Call CANCEL from single location
Date: Thu, 15 Aug 2024 11:57:25 +0300
Message-ID: <20240815085726.2865482-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240815085726.2865482-1-heikki.krogerus@linux.intel.com>
References: <20240815085726.2865482-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The command cancellation can be done right after detecting
that the PPM is busy. There is no need to do it separately
in ucsi_read_error() and ucsi_send_command_common().

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 470c9532b4f2..64fe59e05b4f 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -111,7 +111,7 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 		return ret;
 
 	if (*cci & UCSI_CCI_BUSY)
-		return -EBUSY;
+		return ucsi_run_command(ucsi, UCSI_CANCEL, cci, NULL, 0, false) ?: -EBUSY;
 
 	if (!(*cci & UCSI_CCI_COMMAND_COMPLETE))
 		return -EIO;
@@ -144,15 +144,7 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 	int ret;
 
 	command = UCSI_GET_ERROR_STATUS | UCSI_CONNECTOR_NUMBER(connector_num);
-	ret = ucsi_run_command(ucsi, command, &cci,
-			       &error, sizeof(error), false);
-
-	if (cci & UCSI_CCI_BUSY) {
-		ret = ucsi_run_command(ucsi, UCSI_CANCEL, &cci, NULL, 0, false);
-
-		return ret ? ret : -EBUSY;
-	}
-
+	ret = ucsi_run_command(ucsi, command, &cci, &error, sizeof(error), false);
 	if (ret < 0)
 		return ret;
 
@@ -234,9 +226,8 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
 	mutex_lock(&ucsi->ppm_lock);
 
 	ret = ucsi_run_command(ucsi, cmd, &cci, data, size, conn_ack);
-	if (cci & UCSI_CCI_BUSY)
-		ret = ucsi_run_command(ucsi, UCSI_CANCEL, &cci, NULL, 0, false) ?: -EBUSY;
-	else if (cci & UCSI_CCI_ERROR)
+
+	if (cci & UCSI_CCI_ERROR)
 		ret = ucsi_read_error(ucsi, connector_num);
 
 	mutex_unlock(&ucsi->ppm_lock);
-- 
2.43.0


