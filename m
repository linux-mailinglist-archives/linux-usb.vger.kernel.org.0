Return-Path: <linux-usb+bounces-19512-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2007DA15E32
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jan 2025 18:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7F941886F32
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jan 2025 17:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145D71A7ADD;
	Sat, 18 Jan 2025 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIMPFMXb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A8D1A707A;
	Sat, 18 Jan 2025 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737219630; cv=none; b=ug6HpXJpli0Au599RptK+cI6CJOhPP8PjTKjn7LMAmEWX1DfoevhSPNEABhPXROSkRqd68pesLu6nUKK/t2+ovRYVGiryyEStVKVzY+HRRN3hjHuJpamuaSeA+4ljlDCImE3lK6tRrrx7wAKc/42KyxMVyXreeK0QFMTI94Sc9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737219630; c=relaxed/simple;
	bh=b/ittUrK4jq+UtEgLTEJoPAwfa+7i/L18alMbFigEZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OsHpyeIrCb25aTXA3IBNhI4mn3kq+BgnYfnpU/TjeEoAq/wTNC33JPK3omvOMJm2KzF6qrQdSm1BhMRg3IcGB8aM5SbkdSNgAzMINO283dUn4qaAtBIYNVNrDGdUnO/wlwGH7H5Tdef3L3wBeXz/VCJ/LXOgp8X3nVxLahxcdgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIMPFMXb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737219628; x=1768755628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b/ittUrK4jq+UtEgLTEJoPAwfa+7i/L18alMbFigEZ0=;
  b=TIMPFMXb9A299MS7Vs9RX3WVYcPPMQ5oMZgff+CtoKp5YjPZwBYlqFHt
   FTLxzuhnNnYzid5wqSH3evEv4VTBM85j0ZXJYSizSpuPcwL4LEKqyYmbn
   ynR/0Pv00YZ2BBxMNl1XfStBF5olGA36uTf5WrupFK8DRC61piEr7eumI
   FBd1r2AaR0O+M7XHmbxSxdFZAhKrmq81XJnVzkqyBffaDorC0ycbYxAvW
   fT2ybNunurQMDt9azXO3vetS8T+TBuQMXSThs550UUigxzXow+UsbVnrd
   8DH+juBkd5nuVjz4Kx48z1ni9FeAnU7rcT/pcxWQ9h0e9Ky7vqPUdXgmn
   A==;
X-CSE-ConnectionGUID: gz/DNwFETlORDOlYsJ7Ylw==
X-CSE-MsgGUID: 4FyzWRzUQxu8+G3OADOS6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="49031683"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="49031683"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 09:00:28 -0800
X-CSE-ConnectionGUID: HfvpDQRAQlqKDUXZuVdxIw==
X-CSE-MsgGUID: lYrGn1mGQMONGbDH3WOStw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="136924013"
Received: from madhum.iind.intel.com ([10.223.167.64])
  by orviesa002.jf.intel.com with ESMTP; 18 Jan 2025 09:00:25 -0800
From: madhu.m@intel.com
To: gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abhishekpandit@chromium.org,
	dmitry.baryshkov@linaro.org,
	diogo.ivo@tecnico.ulisboa.pt,
	jthies@google.com,
	bleung@chromium.org,
	pooja.katiyar@intel.com,
	Madhu M <madhu.m@intel.com>
Subject: [PATCH v3 2/2] usb: typec: ucsi: Enable UCSI commands in debugfs
Date: Sat, 18 Jan 2025 22:54:55 +0530
Message-Id: <20250118172455.701348-2-madhu.m@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250118172455.701348-1-madhu.m@intel.com>
References: <20250118172455.701348-1-madhu.m@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Madhu M <madhu.m@intel.com>

Enable the UCSI commands UCSI_SET_NEW_CAM,
UCSI_GET_ERROR_STATUS, UCSI_GET_CAM_CS, and UCSI_GET_LPM_PPM_INFO
support in debugfs to enhance PD/TypeC debugging capability.

Signed-off-by: Madhu M <madhu.m@intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/debugfs.c | 4 ++++
 drivers/usb/typec/ucsi/ucsi.h    | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 638ac41b4b01..eae2b18a2d8a 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -33,6 +33,7 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_SET_PDR:
 	case UCSI_CONNECTOR_RESET:
 	case UCSI_SET_SINK_PATH:
+	case UCSI_SET_NEW_CAM:
 		ret = ucsi_send_command(ucsi, val, NULL, 0);
 		break;
 	case UCSI_GET_CAPABILITY:
@@ -42,6 +43,9 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_GET_PDOS:
 	case UCSI_GET_CABLE_PROPERTY:
 	case UCSI_GET_CONNECTOR_STATUS:
+	case UCSI_GET_ERROR_STATUS:
+	case UCSI_GET_CAM_CS:
+	case UCSI_GET_LPM_PPM_INFO:
 		ret = ucsi_send_command(ucsi, val,
 					&ucsi->debugfs->response,
 					sizeof(ucsi->debugfs->response));
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 431ab4a7e8d8..9d59ad217f7d 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -120,7 +120,9 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_CONNECTOR_STATUS_SIZE		152
 #define UCSI_GET_ERROR_STATUS			0x13
 #define UCSI_GET_PD_MESSAGE			0x15
+#define UCSI_GET_CAM_CS			0x18
 #define UCSI_SET_SINK_PATH			0x1c
+#define UCSI_GET_LPM_PPM_INFO			0x22
 
 #define UCSI_CONNECTOR_NUMBER(_num_)		((u64)(_num_) << 16)
 #define UCSI_COMMAND(_cmd_)			((_cmd_) & 0xff)
-- 
2.34.1


