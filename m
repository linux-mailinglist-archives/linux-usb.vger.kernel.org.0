Return-Path: <linux-usb+bounces-14573-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C04D96A13E
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 16:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA6281F22B70
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 14:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B174F15B11E;
	Tue,  3 Sep 2024 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQZivUoV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C01155743
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375229; cv=none; b=oZVQBnIY+POPbU0pX6asUFysvDJYQ/yQLdLVwTpXayni/fyD/rwgqXGC0ZRLK5EPIpLh7zpBq8Ks/c54vEK1z4Y+N3ePFPJwO5VrdIps4QhmxjA0F68woBkG798IaVkSn31uxNI/gauDKvgwWCJMuuPW0E4gvOVk8v6fQPvO8Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375229; c=relaxed/simple;
	bh=rjBM+DLF7TRKF2RJ6/KRhiSc7n8oM0sHcgFC7eIIDuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvQ4uRxV+rjub4PmAgvsrZMhSgjHuV80xiX6DqzNC8Dzsbkk7GDtj57Z7yms+9z5DDMbnCS9UbsrWRB/g4F6odHjJiDXH9jsXTDtXapcXXNl3jkLN7qns99FzEBhdiiQlIkf64r/JwWmSzMk3xKDUVC0xYim0qPH94MPtMzVd98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQZivUoV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725375228; x=1756911228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rjBM+DLF7TRKF2RJ6/KRhiSc7n8oM0sHcgFC7eIIDuM=;
  b=gQZivUoVK1VhtYRMSAU3HD/rRMdol2Q6TH4lVzvU2ilUBEi1z1dP+KBl
   /zsfll7zF9un/oJGeOVjn8FLGvRPsJbxossfR43OYoBmKYVEe3Ll1X6VX
   K6AKGtzbxeBmuWrLp44qpl69Fo1So81cqpduCY7aQrA6TtwVBnvNeiC+z
   qas6Gj7/M4j/0AONTCa+BVJOPaoyVOwUexW/zgE/IBFuQ2yO28HkdJb2W
   AchaAy5piS32xW8zo/TuZwgxl8KpYzkmzv3sPZXf+rVLDRySrNL7moil4
   5sLhnc5RTLzf6k5Fg+c+m4QsExlAroEFlm+Xl6TzDHED8+dZQ4MM43+Rr
   Q==;
X-CSE-ConnectionGUID: 27cy5kb2RfC9N+UvperA1A==
X-CSE-MsgGUID: yX+zHGrjQCKcFMYz2ROFjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41474071"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="41474071"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:53:47 -0700
X-CSE-ConnectionGUID: 8KAsVmIARo+EdftRy5usVQ==
X-CSE-MsgGUID: XGqN3U1IQWqSY9up6gpmQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69564333"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 03 Sep 2024 07:53:45 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Bartosz Szpila <bszpila@google.com>,
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>,
	linux-usb@vger.kernel.org
Subject: [RFC PATCH v2 1/2] usb: typec: ucsi: Helper for Get Connector Status command
Date: Tue,  3 Sep 2024 17:53:41 +0300
Message-ID: <20240903145342.3449969-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903145342.3449969-1-heikki.krogerus@linux.intel.com>
References: <20240903145342.3449969-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

That command is executed from several locations in the
driver, so providing a dedicated helper function for it.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 35dce4057c25..71cf64a424d9 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -646,6 +646,16 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 	}
 }
 
+static int ucsi_get_connector_status(struct ucsi_connector *con, bool conn_ack)
+{
+	u64 command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
+	struct ucsi *ucsi = con->ucsi;
+	int ret;
+
+	ret = ucsi_send_command_common(ucsi, command, &con->status, sizeof(con->status), conn_ack);
+	return ret < 0 ? ret : 0;
+}
+
 static int ucsi_read_pdos(struct ucsi_connector *con,
 			  enum typec_role role, int is_partner,
 			  u32 *pdos, int offset, int num_pdos)
@@ -1123,12 +1133,10 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 static int ucsi_check_connection(struct ucsi_connector *con)
 {
 	u8 prev_flags = con->status.flags;
-	u64 command;
 	int ret;
 
-	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
-	ret = ucsi_send_command(con->ucsi, command, &con->status, sizeof(con->status));
-	if (ret < 0) {
+	ret = ucsi_get_connector_status(con, false);
+	if (ret) {
 		dev_err(con->ucsi->dev, "GET_CONNECTOR_STATUS failed (%d)\n", ret);
 		return ret;
 	}
@@ -1192,16 +1200,12 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 						  work);
 	struct ucsi *ucsi = con->ucsi;
 	enum typec_role role;
-	u64 command;
 	int ret;
 
 	mutex_lock(&con->lock);
 
-	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
-
-	ret = ucsi_send_command_common(ucsi, command, &con->status,
-				       sizeof(con->status), true);
-	if (ret < 0) {
+	ret = ucsi_get_connector_status(con, true);
+	if (ret) {
 		dev_err(ucsi->dev, "%s: GET_CONNECTOR_STATUS failed (%d)\n",
 			__func__, ret);
 		clear_bit(EVENT_PENDING, &con->ucsi->flags);
@@ -1611,14 +1615,11 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	}
 
 	/* Get the status */
-	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
-	ret = ucsi_send_command(ucsi, command, &con->status, sizeof(con->status));
-	if (ret < 0) {
+	ret = ucsi_get_connector_status(con, false);
+	if (ret) {
 		dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
-		ret = 0;
 		goto out;
 	}
-	ret = 0; /* ucsi_send_command() returns length on success */
 
 	if (ucsi->ops->connector_status)
 		ucsi->ops->connector_status(con);
-- 
2.45.2


