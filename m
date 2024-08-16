Return-Path: <linux-usb+bounces-13554-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E96C954B94
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 15:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE445B213D5
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 13:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6D41BC9F9;
	Fri, 16 Aug 2024 13:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTebGpIy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1971BC9E7
	for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2024 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723816759; cv=none; b=lfJr4X+uNdThEsOPjbdNz3QQCm8osDw5r3FwhjsMVMP+bSCCX8LeJ4yK8nSRYBRMmCjClJTZ1PQj7mni8V9xDFqI1plNpo0lG4RAlvpL6tbHuuEEQL+uZibskNMnE/W5hWgHGNx+ZwPaVgysr9LWctP83z/y/flJLJVlT0fi8tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723816759; c=relaxed/simple;
	bh=3R2pm5Kuk4wEYjoyM3jFKb/ppgX0RodA/DTz5vhow0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rw6mR3MRRm8E2PfCUOx0O6ZgO+slodeC/cqQsymGRgAWROYOYIiIHRVO15+byoYlX3A+3RAezOiINKAAFOnR3O9+V6fkpXSIsLX9eWENgfLBv2OX3X6L0F/hMnXuK74n5DJwl1ShzvU78xslXhXQBMy6jBrcm9mpqOlyz3LLKrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTebGpIy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723816758; x=1755352758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3R2pm5Kuk4wEYjoyM3jFKb/ppgX0RodA/DTz5vhow0A=;
  b=eTebGpIyw4l/22gdZFNssp7oP3Paqv/bT5o3Wk6u/sWFbwXOhYZ7y2NL
   RC1QSUjvuKFHJveMh3XvgY/t2PapiSaBltkTqJUnD4NKanGm5ZQJX5FEG
   mSAd6ODSM+7FBa3bveOu0cRxirTVdQTzbVL4LqcSArE05MN3hETVPfxEL
   pZHxzu92M9HbI2VJoKhqMgMpH5kxhz8S6NLbpPGCD2icUaa6A3g3KHgvv
   JCHG3dT9dIa9cmp+Zln2kOhYWPmfFL6jFLSyQyKjukq6RSRgttXD7GlZj
   I7fjEDiKMKALL1SXwHDShRuVo/G7Qv3Vzoxue94Lq+XWsvFWbQNT+kJsF
   Q==;
X-CSE-ConnectionGUID: sTcRM6/hRSSKaJ8yKbWxGQ==
X-CSE-MsgGUID: Pef7i8DUQe6+voHCCv0V6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21660095"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="21660095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 06:59:18 -0700
X-CSE-ConnectionGUID: 8JkX4/GVT0yW2ne8ZcHTjA==
X-CSE-MsgGUID: bjVewc46RwGZP7Kp+tSJEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="97192425"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 16 Aug 2024 06:59:15 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org,
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@google.com>,
	Bartosz Szpila <bszpila@google.com>
Subject: [PATCH v2 5/6] usb: typec: ucsi: Call CANCEL from single location
Date: Fri, 16 Aug 2024 16:58:58 +0300
Message-ID: <20240816135859.3499351-6-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816135859.3499351-1-heikki.krogerus@linux.intel.com>
References: <20240816135859.3499351-1-heikki.krogerus@linux.intel.com>
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


