Return-Path: <linux-usb+bounces-14242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E0A962D72
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 18:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBFFBB23520
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 16:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E320C1A4F1F;
	Wed, 28 Aug 2024 16:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="if8Cjfl0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11681A071E
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 16:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724861709; cv=none; b=E5b0+HC/wTCnF5IRCwDmSeKGRPEHLc0myoES+PxUAp+jlSmq5aO7v+ZKADkj6pBqXDoqEa9S6ayIn7p/WSqQeNOnS71/p732mjPSUDYZdLObYvm0p/UHgpuPp9TB/TTolPL2OWtCzKTUPSlTrJiSwhXvEBb7/1g5WjZvYA1XF0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724861709; c=relaxed/simple;
	bh=K4rU/b9rK2keat1V0nuF1P8ymndbLp3PLSl1alj56Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZ6L+d2gLTRHDM/QYmG/ss8nXMB0Q2UZ5ZDV0WPh6q9JC9Iz/rHfREcrexKwt1AVcARS1+g2xQoG2ey7YQ53iDH4Rak3BM0VhyqCTErA7Exc4+BFM7OCiwRxSq4bQECGtMO1BVW1W+BCEDkKaPGJbs2TBkjVNivBq1xA1tahNMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=if8Cjfl0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724861708; x=1756397708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K4rU/b9rK2keat1V0nuF1P8ymndbLp3PLSl1alj56Gc=;
  b=if8Cjfl0bNoWnkEQ3nCrPp9BW7jIKJQC5ao42qTMccP6gT2p/6ijqk3O
   XHxbSEAKR7ROd6q7K9qFm/Y3be8T+m00JzekcHOZfUUZuehkdz6pWFLLu
   KrfBrxLbK51Vhmyh0FPbz4madqwEvrzkKQl5DDAvN50ZsjabXrUkD4mVI
   Ye16uy3osIozbZoztnNuzRCACM2tZdtCrqhedg1ZltFqx6i4DGM1jq+51
   2dYBbo35ldtZhm8HgYfUbrRZFGxfnDjajk/fvMt9sahkJfiweNNi2olRS
   Hj/CIEnF9r/B3oWpS+atMsIblEZr5FxKHX1exH6u9DMiNa7YounafrhYx
   Q==;
X-CSE-ConnectionGUID: IgcGocm4RBi0VATLB6ZQDg==
X-CSE-MsgGUID: Y2st3fytTI2pFA2X2Ss/cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23566076"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="23566076"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 09:15:07 -0700
X-CSE-ConnectionGUID: u72NcH27RHuBKopBpNxNJA==
X-CSE-MsgGUID: lhadA/55TFmBKBcvWcxfmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63605493"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 28 Aug 2024 09:15:06 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Bartosz Szpila <bszpila@google.com>,
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>,
	linux-usb@vger.kernel.org
Subject: [RFC PATCH 1/3] usb: typec: ucsi: Helper for Get Connector Status command
Date: Wed, 28 Aug 2024 19:14:59 +0300
Message-ID: <20240828161502.2774996-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240828161502.2774996-1-heikki.krogerus@linux.intel.com>
References: <20240828161502.2774996-1-heikki.krogerus@linux.intel.com>
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
index f0b5867048e2..2e6773715efe 100644
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
@@ -1113,12 +1123,10 @@ static int ucsi_check_connector_capability(struct ucsi_connector *con)
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
@@ -1610,14 +1614,11 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
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


