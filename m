Return-Path: <linux-usb+bounces-16357-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA41F9A1DE0
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 11:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1FF61C22790
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 09:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02F91D88BB;
	Thu, 17 Oct 2024 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RM3dm9jW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C6C1442F6
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 09:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156282; cv=none; b=kQKrYQiekEq1p7f18bxMSO1+gfPcau3Nh4Tly9mAe8xRpOLzUyMzrThsYikKMHUHWklQ7TqQe+b7pWu0IUlBjsmsolp63dWYsucNfSmdkwO2Y1fGpOqnj7SpS8yA3bjNKLFL+HpbouH1kv/xt6E+XrDzMHmZHf6i9asawdzsgHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156282; c=relaxed/simple;
	bh=3tGKZcz3blj7Pd3/D+7qCJXBMAfbfkdlHpiyCpXEDo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bKn0WrguWCk+hyG3cRTcTgKJnLbDlckPeukTIuTzxlhU0uepC+PnDCzD561XMWAggDGim6m+zyncdu0UwGxDNnaXEUi2gpd6zuB4y9/YfOrcFCjoAbJtWCgIEK8PMxxDyr298ETqKjaQBp6cOsgKvUDIV6E+IpfZXNztMbNMobk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RM3dm9jW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729156279; x=1760692279;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3tGKZcz3blj7Pd3/D+7qCJXBMAfbfkdlHpiyCpXEDo4=;
  b=RM3dm9jW0ppeXiDPwXLvg5WCVpghQ+k5vXLUUZwV9s6tqPP0UwR2JCZj
   zTGFbKL5/aXmyy8B1/j2T3hGkB1OZ+Rw5FJZKK7XC6uRc9UpyRm0cAsvc
   uyp8s88VKuEMbrUcDSCLe1sT+nG33zGmhW5FgZt4uDuFf2rHaDEXGrvjE
   +JKiX/8UbCFu523QBSkprF8tg7WJipyczL7X03OLlh/xZlXPbovw9ypbs
   AF7DsrLKOKwB8Dvz4l9ak9crKZoZ5S5uKNzRC/ZjDs5O0oUdClhcVI3pZ
   z+lEFKDKTyZmal5FfG8a3qu1XTTrAtav8kZ8k123kKsv5Me8qiLdMs2Yw
   w==;
X-CSE-ConnectionGUID: rs+0Jg0CT1yscbeLxAi82Q==
X-CSE-MsgGUID: BxU3kP1oQsa4uL5nVO9vKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="40031281"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="40031281"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:11:18 -0700
X-CSE-ConnectionGUID: zXBccawGTzO3oDpFDytC+A==
X-CSE-MsgGUID: 1VTqtkPTRE+q2jJGgQg4dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="109236611"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2024 02:11:13 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v1] usb: typec: ucsi: Helper for Get Connector Status command
Date: Thu, 17 Oct 2024 12:11:12 +0300
Message-ID: <20241017091112.1178509-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

That command is executed from several locations in the
driver, so providing a dedicated helper function for it.

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Hi,

This is originally from here (RFC):
https://lore.kernel.org/linux-usb/20240903145342.3449969-2-heikki.krogerus@linux.intel.com/

Thank you
---
 drivers/usb/typec/ucsi/ucsi.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index d03f04556ab7..e430a0ca4a2b 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -648,6 +648,16 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
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
@@ -1134,12 +1144,10 @@ static void ucsi_partner_change(struct ucsi_connector *con)
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
@@ -1203,7 +1211,6 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 						  work);
 	struct ucsi *ucsi = con->ucsi;
 	enum typec_role role;
-	u64 command;
 	int ret;
 
 	mutex_lock(&con->lock);
@@ -1212,11 +1219,8 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 		dev_err_once(ucsi->dev, "%s entered without EVENT_PENDING\n",
 			     __func__);
 
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
@@ -1633,14 +1637,11 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
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


