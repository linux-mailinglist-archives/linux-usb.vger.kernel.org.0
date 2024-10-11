Return-Path: <linux-usb+bounces-16086-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F96A99A423
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 14:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9254B22CF3
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 12:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA122178FF;
	Fri, 11 Oct 2024 12:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnL8YcyH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23781218588
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 12:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728650659; cv=none; b=pyLkeyGSFhqcSVnNfbhTTyke3B1zqd61TUK0dG5nhH0Ayb0nOkn5yoL3ImwgTxlxPxgSmt+NEBSTB+53z09fywP/QKO6rG55KiWvMfsMd9KcdLGOVSFuU9nlQ10Lx10DUpjDwnZsSWP3juVUzjDnQO/PJGw+8YymV7Tkf7F4/M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728650659; c=relaxed/simple;
	bh=+oqTaLNbD0nIAK3DWOlcr9M1G8NAByjPH9PR2kehoSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nojkhAIJ+LzhaygAiuXbrPg5cBoPt5Iz9helcAfcJKaMJ24PT5HVA/8eT/4+JeShXUh8ZLm3r6VsXK7irZ83LSN/Lkgflpghmcr70JKdew0aSfzxwxhdzvOYSAlg4jFM7BIEIXahpL9ze9aim2bbltUeSGWYjOBlndO9E/hTZT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnL8YcyH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728650657; x=1760186657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+oqTaLNbD0nIAK3DWOlcr9M1G8NAByjPH9PR2kehoSA=;
  b=hnL8YcyH2mRXqhUkYmWXBgglFIfAlM9O9oPBynlVpbXIb624ERgE+11S
   4d4tIAI3PPqiG0FhiBalKKkQHAgNe8qWmpDwy7w1EVb+CKmCVqkH6uiN+
   8QOc2YzKuYML6RonfkPiWuIPWALAwl7ryRHNIk7JEYcAP47/MCHNbdDdM
   SnCpzLyBBh3efgbp5vPK9SU3ldmo1iQUfiO72TqB45OwKWEZJG3y8tRA8
   V95Zsm3PgBRmL8vB3xlEhyOkotSxYfW04SMuPRg1mOIUGVsw0PnwK+7jT
   6f94nRE+Ov5U1vq6dfs7TQLZG4g/2jlTEDjH9yDpg1VHy+CBPsZj+d+WP
   w==;
X-CSE-ConnectionGUID: Tdf7N5kUQS6/BwQLg5LgJQ==
X-CSE-MsgGUID: XF4BCsUlRcamMguueNEJhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31957718"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="31957718"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 05:44:15 -0700
X-CSE-ConnectionGUID: L5gSKwwyQ5umHTnxdM+uPg==
X-CSE-MsgGUID: QGH0FIFrRO27FQfMYkzDpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="77716194"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 11 Oct 2024 05:44:12 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 4/4] usb: typec: ucsi: Add support for the partner USB Modes
Date: Fri, 11 Oct 2024 15:44:02 +0300
Message-ID: <20241011124402.3306994-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
References: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UCSI does not share the contents of the Enter_USB Message
that was used, so the active mode still has to be always
determined from the enumerated USB device. However, after
UCSI v2.0 it is possible to check separately is USB4 the
active mode.

So with USB2 and USB3 the mode is always determined from the
result of the USB enumeration, and when USB4 USB Mode is
active, UCSI driver can assign the mode directly.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 8 ++++++++
 drivers/usb/typec/ucsi/ucsi.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 13c739d334c4..804f7f9b35ea 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1057,6 +1057,14 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 
 	con->partner = partner;
 
+	if (con->ucsi->version >= UCSI_VERSION_3_0)
+		if (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
+		    UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN4)
+			typec_partner_set_usb_mode(partner, USB_MODE_USB4);
+	if (con->ucsi->version >= UCSI_VERSION_2_0)
+		if (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
+		    UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN3)
+			typec_partner_set_usb_mode(partner, USB_MODE_USB4);
 	return 0;
 }
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index a1f4b9b568c8..d850073e8d0a 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -346,6 +346,8 @@ struct ucsi_connector_status {
 #define UCSI_CONSTAT_PARTNER_FLAGS(_f_)		(((_f_) & GENMASK(12, 5)) >> 5)
 #define   UCSI_CONSTAT_PARTNER_FLAG_USB		1
 #define   UCSI_CONSTAT_PARTNER_FLAG_ALT_MODE	2
+#define   UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN3	4
+#define   UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN4	8
 #define UCSI_CONSTAT_PARTNER_TYPE(_f_)		(((_f_) & GENMASK(15, 13)) >> 13)
 #define   UCSI_CONSTAT_PARTNER_TYPE_DFP		1
 #define   UCSI_CONSTAT_PARTNER_TYPE_UFP		2
-- 
2.45.2


