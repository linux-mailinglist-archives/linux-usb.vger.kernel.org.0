Return-Path: <linux-usb+bounces-25197-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFBDAEBEE5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 20:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 091875615E9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 18:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3602EBBAC;
	Fri, 27 Jun 2025 18:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTfZEMz4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CF82EAD1C
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 18:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751047833; cv=none; b=r5xqgwaBjfQyHTdJdOuWlYAYIxuLUdr6qI5iwtxAjB8IvNXtvOXQbUnhO5JmN4fJRRaTnPxmCrtux0y5nXPqfNhEpXwV/duw9+4dvaa6B5PGYljpaasRr9lQUD8JgcGxdb4BKi3HsOrq1Nr6IuD2tqQUF8l6kHsfmkWum+fI5f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751047833; c=relaxed/simple;
	bh=bDbz/ZPoMBObmUT69NfXTouCTsejYxWcLT5zvH0G4pk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h/pIAAEM4qDwkaTAtorc6vZ8Et+cQy1rZous33nPkHdBGjdMtPVwfdU7ajxAIfPKmZ7SJ9Bp7HUKg1sL1DRt3AqHRpc3AOnLh3eUiye4jSEy6AalBs2sGwDb1KPOzluEye+f4AXtzN0nxZcHSe1d3OnpxGevmngP/AjuMetz1kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTfZEMz4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751047832; x=1782583832;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bDbz/ZPoMBObmUT69NfXTouCTsejYxWcLT5zvH0G4pk=;
  b=YTfZEMz4p4S+EvoxaLqfrxUhbtujLXfKgt2zK0Bzm8oU6QAx3CriQ30f
   29zvbyG03uSHNQcQ53jUyK7L2d3qHyL+1afkMvBRMmPCOMj+G6E/G6+RC
   Xgy2KgNZxN5sIVKZO5b4il+WWhkwoNxmCg4fmpWYeoydmrRIjlFOZ5D8j
   lh2c6TYd9StnaIDcrNYH5TLYRB0THBKbN8mlynHgsZpOugwyOSYJa5sPn
   9bovEyGUgb7sLweKzoZjJa1wOXnXBHV6HwJBg6hIUhCCwmDWL8AJF2lcQ
   Ktp09x5NgytjkGB44lsLM5kYbmpsXh9J4PxPfvo+FDNO0W7bbVGzVdFmc
   g==;
X-CSE-ConnectionGUID: wCOLfdCWT+S9dWwDqlyqDg==
X-CSE-MsgGUID: qD+MQ2VnQEy78LCN6hO9aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53310007"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53310007"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 11:10:31 -0700
X-CSE-ConnectionGUID: jOhT5ZwXTDuNVjagyTnJUA==
X-CSE-MsgGUID: TvJwC0wKSjWb98reMJ3yxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="183773593"
Received: from pooja-lin-vm.fm.intel.com ([10.80.128.159])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2025 11:10:31 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	dmitry.baryshkov@oss.qualcomm.com,
	pooja.katiyar@intel.com
Subject: [PATCH v2 3/3] usb: typec: ucsi: Add support for SET_PDOS command
Date: Fri, 27 Jun 2025 11:10:12 -0700
Message-Id: <097b5b2c8ea413f05ce24c80c8f6790dce207bb8.1751042810.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751042810.git.pooja.katiyar@intel.com>
References: <cover.1751042810.git.pooja.katiyar@intel.com>
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
Changelog v2:
- Send message_out data as part of ucsi_send_command.

 drivers/usb/typec/ucsi/debugfs.c | 3 +++
 drivers/usb/typec/ucsi/ucsi.h    | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 6058986ea7fd..e6bea273fbd9 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -37,6 +37,9 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_SET_USB:
 		ret = ucsi_send_command(ucsi, val, NULL, 0, NULL);
 		break;
+	case UCSI_SET_PDOS:
+		ret = ucsi_send_command(ucsi, val, NULL, 0, ucsi->debugfs->message_out);
+		break;
 	case UCSI_GET_CAPABILITY:
 	case UCSI_GET_CONNECTOR_CAPABILITY:
 	case UCSI_GET_ALTERNATE_MODES:
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 0d1c39cfe8a9..2504041b7432 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -130,6 +130,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_PD_MESSAGE			0x15
 #define UCSI_GET_CAM_CS			0x18
 #define UCSI_SET_SINK_PATH			0x1c
+#define UCSI_SET_PDOS				0x1d
 #define UCSI_SET_USB				0x21
 #define UCSI_GET_LPM_PPM_INFO			0x22
 
-- 
2.34.1


