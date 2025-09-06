Return-Path: <linux-usb+bounces-27616-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E27FB46909
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 06:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED1617C09CE
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 04:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA9726A1C1;
	Sat,  6 Sep 2025 04:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqV57YYj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4CA267F4C
	for <linux-usb@vger.kernel.org>; Sat,  6 Sep 2025 04:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757133057; cv=none; b=NYatwKJMGnR5a/OIyZHW/uK0DvNihBNCt4GG+FDBwft3eH8rh5lgKsKU62CP7hD59qC/fBQM1gkdAtuGxTXzZeyZHcuufebeVBT02zlpt5pMe5xQJsJxJRyopquIoPKLL4RaFY8I4QUeMYL1pWqMLbLcGi60BLql6S9UB4et2rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757133057; c=relaxed/simple;
	bh=zViD1bT24dofmsj09s5B0s6/+wNts0hFNU67QrwUpfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AizvFgorXEityHgkLxVLsc23nBDHg4+7bVPdBT8JGyQ9duQfV49vqTrQzBTrSEPj/X/yZaosUv6kKKxWvOEy+rbh/W3hjECx6KNigzwJQhX1dovcgXnTqcVMWcobU4ONS1pfpPaVq8Fm0qNe5RMyQkjMHhccdmmHVN0qGmgo9Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqV57YYj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757133056; x=1788669056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zViD1bT24dofmsj09s5B0s6/+wNts0hFNU67QrwUpfE=;
  b=hqV57YYjAARWdSYgOsAhofoPd9dTsJLd/3L1BhUKmSzizPpelyPah/ly
   qMA2vdb2mBmsG1VWbhgDXZ07+3/R3IE1QNipycbIJlTc3yFLF8tlOQGP3
   nBNHU6ebNGh4D65Z8b/aEprcn5ryFN3QTPcOaWrV2Xu7HfiuFd0969uKb
   2iZT1mRtm425wH1G3LpRngdJUC6XNoleNBmTy4D+RI3b1b5q2BTYNOg0R
   UzTnw/qT9Fo0QjqwkoBoR0eYeArapzJgQeURY9Ke1uXJvms5irxnHT0Lb
   NmeW4rTsbQkOZyZI+AZixqLUiK6xW+CBfZ2TS+h5MPryAIqESM9C5rIzE
   Q==;
X-CSE-ConnectionGUID: F00GJ8RBTluvjRoF/C0Srw==
X-CSE-MsgGUID: 3erurgX5Tni6fpis9z0SvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="63307773"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="63307773"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 21:30:55 -0700
X-CSE-ConnectionGUID: 8e+xd0FnSaS3FXOgxHWktQ==
X-CSE-MsgGUID: XjfyNlZdQBqwc230FVZbag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="173128899"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by fmviesa010.fm.intel.com with ESMTP; 05 Sep 2025 21:30:56 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	pooja.katiyar@intel.com,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v3 4/4] usb: typec: ucsi: Add support for SET_PDOS command
Date: Fri,  5 Sep 2025 21:31:01 -0700
Message-ID: <4c23341cc0bad7ce3d4cb63d96f8169ca0302663.1757024530.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757024530.git.pooja.katiyar@intel.com>
References: <cover.1757024530.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for UCSI SET_PDOS command as per UCSI specification v2.1 and
above to debugfs.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
 drivers/usb/typec/ucsi/debugfs.c | 1 +
 drivers/usb/typec/ucsi/ucsi.h    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 6904722790ba..ecc453ec8218 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -35,6 +35,7 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_SET_SINK_PATH:
 	case UCSI_SET_NEW_CAM:
 	case UCSI_SET_USB:
+	case UCSI_SET_PDOS:
 		ucsi->message_in_size = 0;
 		ret = ucsi_send_command(ucsi, val);
 		break;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index d932fa1a40b9..b1273a394bc9 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -136,6 +136,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_PD_MESSAGE			0x15
 #define UCSI_GET_CAM_CS			0x18
 #define UCSI_SET_SINK_PATH			0x1c
+#define UCSI_SET_PDOS				0x1d
 #define UCSI_SET_USB				0x21
 #define UCSI_GET_LPM_PPM_INFO			0x22
 
-- 
2.43.0


