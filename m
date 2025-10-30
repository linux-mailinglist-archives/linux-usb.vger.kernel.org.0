Return-Path: <linux-usb+bounces-29903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE159C20B30
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 15:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDBD73B4862
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 14:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D86526FDAC;
	Thu, 30 Oct 2025 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdyjTCdF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CD1277CAB
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761835716; cv=none; b=Y1VKnxm10sXXu40EhmFwx87r3m9GF0a0qGncHw1me+fdujbTmQhSQycSMel91h0t61kF7nEtX/uqf5LzJOS45baDXrUxKP7JPO7nI58iKcrTcZgNnleUBAVReR0XUdFoEXT53O6IHFeSjkfXc7qGt1zYfeji2ECd5LBu6z80BQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761835716; c=relaxed/simple;
	bh=9xYU7hFPm/7+6UmJYaMfb0NbXIjJvPYzzzUK7PYju7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZlCixkvEG3SXAGdnHqkNQq6/HxnKHKN4rzcr3fFz5N+KHNbX0+7CC8oR3ke3DCXSCr/KeM+CzNF08SK187GwHrOVZ3R8PjtTmXnAS2VGSGo+MeECPPYHjVbH1mAZGfe2rjbWpEUhB9Y+8cU0a8NWRYYSSVo67MBSEo836c7ec8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QdyjTCdF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761835714; x=1793371714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9xYU7hFPm/7+6UmJYaMfb0NbXIjJvPYzzzUK7PYju7Y=;
  b=QdyjTCdFAJJUNOcP4S3vQ835Jkp1s+7ulr4yQ2ymzVgpVw3q5nAGHm6/
   XqMLm87+whMU2CW94wURi+5pg2pbZ2r07xz567xBP9pgty+dY7BYcfmdc
   UTgO56RLoKIQoYetK48EzFh97qg9jXT8s+1lVfgS9wTp866eZX4o+C6Tc
   1B5gQXRHuIAVYG/92aXjqK/Jsi+cov+rqgPpdUJLaZwfuODLBuQiOXieq
   ATXxTuzJbu4RGOwvwoMgvuGDHwJ7LQb6RYkbrWlP2W+QmnkY5aN1pLpyq
   4LPkDByQ87FbAIEstMPHaEF9jMOpsWVCkVtp79Q5oryDGWnarpilONt8A
   A==;
X-CSE-ConnectionGUID: /ZD3Riz2Shi76pGzpH5/qQ==
X-CSE-MsgGUID: fzdwbgh2QROLA+1bbeIZHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63679261"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="63679261"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 07:48:34 -0700
X-CSE-ConnectionGUID: eXYIxj1YQt2HaYvdO7qn7A==
X-CSE-MsgGUID: 1njqDfB4SNukfMeV1eBeYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="185631513"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2025 07:48:34 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	heikki.krogerus@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH v5 4/4] usb: typec: ucsi: Add support for SET_PDOS command
Date: Thu, 30 Oct 2025 07:48:58 -0700
Message-ID: <b4ccc1e75746b04a8b48c8998b42b019afb934f1.1761773881.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761773881.git.pooja.katiyar@intel.com>
References: <cover.1761773881.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for UCSI SET_PDOS command as per UCSI specification
v2.1 and above to debugfs.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
Changelog v3:
- No changes.

Changelog v2:
- Send message_out data as part of ucsi_send_command.

 drivers/usb/typec/ucsi/debugfs.c | 1 +
 drivers/usb/typec/ucsi/ucsi.h    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 0693acf04c37..63a5fe791a82 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -36,6 +36,7 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_SET_NEW_CAM:
 	case UCSI_SET_USB:
 	case UCSI_READ_POWER_LEVEL:
+	case UCSI_SET_PDOS:
 		ucsi->message_in_size = 0;
 		ret = ucsi_send_command(ucsi, val);
 		break;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 8c79e6699020..f538a997155a 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -136,6 +136,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_PD_MESSAGE			0x15
 #define UCSI_GET_CAM_CS			0x18
 #define UCSI_SET_SINK_PATH			0x1c
+#define UCSI_SET_PDOS				0x1d
 #define UCSI_READ_POWER_LEVEL			0x1e
 #define UCSI_SET_USB				0x21
 #define UCSI_GET_LPM_PPM_INFO			0x22
-- 
2.43.0


