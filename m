Return-Path: <linux-usb+bounces-15827-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B549938AE
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 22:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5A7D1F23833
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 20:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943D51DDA3F;
	Mon,  7 Oct 2024 20:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NprxcflE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703F71DD86A
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 20:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334782; cv=none; b=lNKNVK+kdCW4+XBZ4B5vpk9yqK8aL2+w64zXeXJJB0mRLkzmCiL9cW12KVFobh3hFW3unMv8Zcs5X/zg1r3By5D4B7STl5BsXBv5bqUH2PRrZtVoIXpfItVeO+Ee5j6lnhVsr0Rcmwcbhh9tk6Rmcy/DCl2OfvxdmCpJMoeu5h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334782; c=relaxed/simple;
	bh=06Jp7tXfa7V0pALdG29xTdQwtOFLwp0c7iCRsoyVokc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I4R5Ow7MAXPlDdCCbUOdD0TMQ46YUSyfrUrM7psvrAojlWzpaJ0AK1C1LHjWDrb4ohwCGe7Tn6Hj9vRDQp3Z7uVYRKFwbCC3sWtkT+EG4VhXKLWfmy7y2D8WEkU+EJ6XJrVs8WALpjZgDREhlbt9L2Y5t9QTqVev+iwz14FUBCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NprxcflE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728334781; x=1759870781;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=06Jp7tXfa7V0pALdG29xTdQwtOFLwp0c7iCRsoyVokc=;
  b=NprxcflEaSLYTslKYP40ji/Ef9NmOzq1Z0NCxw09PB9v+Q5dNfLg+T3N
   yeffEd3/OlD91dqzeq5otFbAPDwCSCTGjSqWsqVxVm8+mGJMLFgJ22BW4
   6sismx1NO1F0xM53giWRKMch+K/Gny83QnXMpzqitCJYlw+PaBYIXiz3U
   jC/l+HK3kuHWjuDvzdut7GHkzpX0yx+LAwQQ6w1SCRLEJpMulOabqZKyB
   epw/HaGmhnl9NxOVK2YDWE64C906hA/4RquUjlUfvOFpxLCLQsSIEcYQO
   cEke8ZS/JG0QLjleuVEOJn/RIZzRNri6X+vlvBEYKWYpiaykmQ9H4/Id5
   g==;
X-CSE-ConnectionGUID: ++5RNeBUQniYi800XUgNtQ==
X-CSE-MsgGUID: pIP8fkIjTM20lpITf4i6pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38864827"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="38864827"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 13:59:40 -0700
X-CSE-ConnectionGUID: 1T/gcVDBQACzHBEV5VTBlA==
X-CSE-MsgGUID: IUse7+49RKWSJLZGgHIpOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75853934"
Received: from pooja-lin-vm.fm.intel.com ([10.80.128.159])
  by orviesa006.jf.intel.com with ESMTP; 07 Oct 2024 13:59:39 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH] usb: typec: ucsi: UCSI2.0 Set Sink Path command support
Date: Mon,  7 Oct 2024 13:59:47 -0700
Message-Id: <20241007205947.1591402-1-pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for UCSI 2.0 command Set Sink Path to enable/
disable sink path on type-c ports

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
 drivers/usb/typec/ucsi/debugfs.c | 1 +
 drivers/usb/typec/ucsi/ucsi.h    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index f67733cecfdf..83ff23086d79 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -32,6 +32,7 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_SET_UOR:
 	case UCSI_SET_PDR:
 	case UCSI_CONNECTOR_RESET:
+	case UCSI_SET_SINK_PATH:
 		ret = ucsi_send_command(ucsi, val, NULL, 0);
 		break;
 	case UCSI_GET_CAPABILITY:
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 4a017eb6a65b..13fc8f2b4e78 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -115,6 +115,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_CONNECTOR_STATUS	0x12
 #define UCSI_GET_ERROR_STATUS		0x13
 #define UCSI_GET_PD_MESSAGE		0x15
+#define UCSI_SET_SINK_PATH		0x1c
 
 #define UCSI_CONNECTOR_NUMBER(_num_)		((u64)(_num_) << 16)
 #define UCSI_COMMAND(_cmd_)			((_cmd_) & 0xff)
-- 
2.34.1


