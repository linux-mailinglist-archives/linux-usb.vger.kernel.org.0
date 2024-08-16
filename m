Return-Path: <linux-usb+bounces-13553-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7333954B90
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 15:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39271B20E17
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 13:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F121E1A7056;
	Fri, 16 Aug 2024 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkJKf5so"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53241B8E92
	for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2024 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723816756; cv=none; b=R4Dg7yZwIQEJcw+UZgcTTnWV6YOPLPzFr3Nxvg9vwEyJhTt2FTfzdP2hYH/k4KcT8d3KhPrcJCaFM5AGZIe5aRLO5h0WG1MWnmtUJCV7HFOECXIWar2CyQm+4fyH0GyCb+qW7c1yrQlpnqvdorWMsfDWhvR6r7cBZT0BIPla0h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723816756; c=relaxed/simple;
	bh=qSfcfmHFtu7sDRNkOEXrsuJWELUORsyxr9IPc8iJcSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3tkOQPGHr2dLw8FAP22F/MovyAImh+cTwAoIuFI6bGzfqkb0yz+y61ur2aWjdlUev3rzvtP2XbpAiJitUOAJ5x4siuDNFpYWWwA5uI8YX8jAfxxVpEZIdFc7CA6V4JFaJnfT9lFKYzRpSaPkMKQLXHKHEzlwkYbJkwCWHHXOt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkJKf5so; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723816755; x=1755352755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qSfcfmHFtu7sDRNkOEXrsuJWELUORsyxr9IPc8iJcSU=;
  b=OkJKf5somJn6/ENOxZbwO2tRKjlaYQtOZ+zmFm5HCYJ7V7feeGKea8qM
   Zf3dj3DcA2S+uAQ2/J7tpeVGevNGHe2etjvSL7/PdzzvWRb0WNMDJ4Ksm
   bKnZE1q6B5uM+4dnwuQ/04K+weS806ZfNvmEEgc9Nv25vgOPLol/KHJuB
   VX/1U8g1DW7rMqMnqOy3w9zSAeOebfy7A3kd8Ox/t77RJeHWTVcn1qgCR
   DJP75Nsp6afd841Eo8xffd8EPSdHz/vq09ba7qNciOw0DaoF3HnNMmpr+
   tilKPqO2akxNf+RN+E1AMei7ViNxteER5VjpE2VqBAbWDIb5L2+75xUp9
   w==;
X-CSE-ConnectionGUID: h1F1kMnqQiaX5VUrCqk7HQ==
X-CSE-MsgGUID: OJjxujQ9SsC8Eyj9p7uoKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21660088"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="21660088"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 06:59:15 -0700
X-CSE-ConnectionGUID: rDbz6wrCREKLidMYgj7MzA==
X-CSE-MsgGUID: Hq7UU75iQAm5vB55IXAlNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="97192418"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 16 Aug 2024 06:59:12 -0700
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
Subject: [PATCH v2 4/6] usb: typec: ucsi: Common function for the GET_PD_MESSAGE command
Date: Fri, 16 Aug 2024 16:58:57 +0300
Message-ID: <20240816135859.3499351-5-heikki.krogerus@linux.intel.com>
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

So far that command was only used to read the response to
the Discover Identity Request, but it is handled with two
separate functions, which is not really necessary. Squashing
the command execution into a single function. That function
can now also be used to read other messages on top of the
Request Identity response.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 92 ++++++++++-------------------------
 drivers/usb/typec/ucsi/ucsi.h | 12 -----
 2 files changed, 27 insertions(+), 77 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 1f6e3f0d25c1..470c9532b4f2 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -748,104 +748,66 @@ static struct usb_power_delivery_capabilities *ucsi_get_pd_caps(struct ucsi_conn
 							&pd_caps);
 }
 
-static int ucsi_read_identity(struct ucsi_connector *con, u8 recipient,
-			      u8 offset, u8 bytes, void *resp)
+static int ucsi_get_pd_message(struct ucsi_connector *con, u8 recipient,
+			       size_t bytes, void *data, u8 type)
 {
-	struct ucsi *ucsi = con->ucsi;
+	size_t len = min(bytes, UCSI_MAX_DATA_LENGTH(con->ucsi));
 	u64 command;
+	u8 offset;
 	int ret;
 
-	command = UCSI_COMMAND(UCSI_GET_PD_MESSAGE) |
-	    UCSI_CONNECTOR_NUMBER(con->num);
-	command |= UCSI_GET_PD_MESSAGE_RECIPIENT(recipient);
-	command |= UCSI_GET_PD_MESSAGE_OFFSET(offset);
-	command |= UCSI_GET_PD_MESSAGE_BYTES(bytes);
-	command |= UCSI_GET_PD_MESSAGE_TYPE(UCSI_GET_PD_MESSAGE_TYPE_IDENTITY);
-
-	ret = ucsi_send_command(ucsi, command, resp, bytes);
-	if (ret < 0)
-		dev_err(ucsi->dev, "UCSI_GET_PD_MESSAGE failed (%d)\n", ret);
-
-	return ret;
-}
-
-static int ucsi_get_identity(struct ucsi_connector *con, u8 recipient,
-			      struct usb_pd_identity *id)
-{
-	struct ucsi *ucsi = con->ucsi;
-	struct ucsi_pd_message_disc_id resp = {};
-	int ret;
-
-	if (ucsi->version < UCSI_VERSION_2_0) {
-		/*
-		 * Before UCSI v2.0, MESSAGE_IN is 16 bytes which cannot fit
-		 * the 28 byte identity response including the VDM header.
-		 * First request the VDM header, ID Header VDO, Cert Stat VDO
-		 * and Product VDO.
-		 */
-		ret = ucsi_read_identity(con, recipient, 0, 0x10, &resp);
-		if (ret < 0)
-			return ret;
+	for (offset = 0; offset < bytes; offset += len) {
+		len = min(len, bytes - offset);
 
+		command = UCSI_COMMAND(UCSI_GET_PD_MESSAGE) | UCSI_CONNECTOR_NUMBER(con->num);
+		command |= UCSI_GET_PD_MESSAGE_RECIPIENT(recipient);
+		command |= UCSI_GET_PD_MESSAGE_OFFSET(offset);
+		command |= UCSI_GET_PD_MESSAGE_BYTES(len);
+		command |= UCSI_GET_PD_MESSAGE_TYPE(type);
 
-		/* Then request Product Type VDO1 through Product Type VDO3. */
-		ret = ucsi_read_identity(con, recipient, 0x10, 0xc,
-					 &resp.vdo[0]);
-		if (ret < 0)
-			return ret;
-
-	} else {
-		/*
-		 * In UCSI v2.0 and after, MESSAGE_IN is large enough to request
-		 * the large enough to request the full Discover Identity
-		 * response at once.
-		 */
-		ret = ucsi_read_identity(con, recipient, 0x0, 0x1c, &resp);
+		ret = ucsi_send_command(con->ucsi, command, data + offset, len);
 		if (ret < 0)
 			return ret;
 	}
 
-	id->id_header = resp.id_header;
-	id->cert_stat = resp.cert_stat;
-	id->product = resp.product;
-	id->vdo[0] = resp.vdo[0];
-	id->vdo[1] = resp.vdo[1];
-	id->vdo[2] = resp.vdo[2];
 	return 0;
 }
 
 static int ucsi_get_partner_identity(struct ucsi_connector *con)
 {
+	u32 vdo[7] = {};
 	int ret;
 
-	ret = ucsi_get_identity(con, UCSI_RECIPIENT_SOP,
-				 &con->partner_identity);
+	ret = ucsi_get_pd_message(con, UCSI_RECIPIENT_SOP, sizeof(vdo), vdo,
+				  UCSI_GET_PD_MESSAGE_TYPE_IDENTITY);
 	if (ret < 0)
 		return ret;
 
+	/* VDM Header is not part of struct usb_pd_identity, so dropping it. */
+	con->partner_identity = *(struct usb_pd_identity *)&vdo[1];
+
 	ret = typec_partner_set_identity(con->partner);
-	if (ret < 0) {
-		dev_err(con->ucsi->dev, "Failed to set partner identity (%d)\n",
-			ret);
-	}
+	if (ret < 0)
+		dev_err(con->ucsi->dev, "Failed to set partner identity (%d)\n", ret);
 
 	return ret;
 }
 
 static int ucsi_get_cable_identity(struct ucsi_connector *con)
 {
+	u32 vdo[7] = {};
 	int ret;
 
-	ret = ucsi_get_identity(con, UCSI_RECIPIENT_SOP_P,
-				 &con->cable_identity);
+	ret = ucsi_get_pd_message(con, UCSI_RECIPIENT_SOP_P, sizeof(vdo), vdo,
+				  UCSI_GET_PD_MESSAGE_TYPE_IDENTITY);
 	if (ret < 0)
 		return ret;
 
+	con->cable_identity = *(struct usb_pd_identity *)&vdo[1];
+
 	ret = typec_cable_set_identity(con->cable);
-	if (ret < 0) {
-		dev_err(con->ucsi->dev, "Failed to set cable identity (%d)\n",
-			ret);
-	}
+	if (ret < 0)
+		dev_err(con->ucsi->dev, "Failed to set cable identity (%d)\n", ret);
 
 	return ret;
 }
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 5e3c6cb822c8..c8c87377909d 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -352,18 +352,6 @@ struct ucsi_connector_status {
 #define   UCSI_CONSTAT_BC_TRICKLE_CHARGING	3
 } __packed;
 
-/*
- * Data structure filled by PPM in response to GET_PD_MESSAGE command with the
- * Response Message Type set to Discover Identity Response.
- */
-struct ucsi_pd_message_disc_id {
-	u32 vdm_header;
-	u32 id_header;
-	u32 cert_stat;
-	u32 product;
-	u32 vdo[3];
-} __packed;
-
 /* -------------------------------------------------------------------------- */
 
 struct ucsi_debugfs_entry {
-- 
2.43.0


