Return-Path: <linux-usb+bounces-13506-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C9E952B62
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 12:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53E261F212A1
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 10:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0821C9EA5;
	Thu, 15 Aug 2024 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFI36NOy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822CC1C9DE4
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 08:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723712258; cv=none; b=i8vkdyLD5VfxbEpUOGx22ToT+xJnrl0FoQJBM+FQriXfXVFwhNhhov46ERlrjKy+vjFh7Iw30uCFDmKGTCojWuzw4xxiVKiJZRKr/jWplpiDKR2fOhgcjtWM3WRaL0MW06R7YltqRb9qhPBruOdLRkZiV7sO0IjFRXkJc3IAT80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723712258; c=relaxed/simple;
	bh=ttAEBBMHteYNMKU6zZSTXKXc9wFfw4su+pVjbQWN5Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSxE/9doQMnFvVgFpK7Xw4vkkSTp3nqmB51NEf3//Sv7guavB9/+39d8ET1OKDpzWW/IXIwJ3jwbIy84lqxQi4nD7RLyzcy3fLIduj/dvfZVgzHQB/UARDE0w0rvewJvXbyeCmT3s/k3wFRxZxxJ4HPIG+ctr5aitPxYYKAstlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFI36NOy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723712257; x=1755248257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ttAEBBMHteYNMKU6zZSTXKXc9wFfw4su+pVjbQWN5Zk=;
  b=kFI36NOyanA57lTAR+LvPGRpgsy5XmCVVCC802YwDnRcW5HnekFhhj7n
   RDsUjTTFrdqf1KH8EowtsoTRLKMmrGvHJoVuoq+DOiyDA0+27K/rDGaLJ
   K5P3dhYom3js0up5lP9t7AdilnyS48/z2WIkF0EIv6Udc/yV8Ei8Z+AJA
   1BW9LkLbM+j/iJK/QSZjQ/+l1wDNfnBHs4oaXp9e8fOfb4qfNLDF0JFwn
   ynd59RA9ipKRWDe2XvivUrvQa2Xhb8PFIaHn3N7MeHKsbknx0CLJjeImB
   x9RMSjp7vyMmACoLT/bhOy1lhkK25BAl5d5QxyrYC8BbAPCku3fRorWmH
   g==;
X-CSE-ConnectionGUID: zx4brguWTjqLyK7e476VOg==
X-CSE-MsgGUID: P7M7AGU9Rme4/pZqVPAf7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22094637"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="22094637"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 01:57:37 -0700
X-CSE-ConnectionGUID: J15wsc6vTWa0M9P7zI2MMg==
X-CSE-MsgGUID: uKVvOtorT1CFk7zW+UZVQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="96816957"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2024 01:57:34 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH 3/5] usb: typec: ucsi: Common function for the GET_PD_MESSAGE command
Date: Thu, 15 Aug 2024 11:57:24 +0300
Message-ID: <20240815085726.2865482-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240815085726.2865482-1-heikki.krogerus@linux.intel.com>
References: <20240815085726.2865482-1-heikki.krogerus@linux.intel.com>
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
 drivers/usb/typec/ucsi/ucsi.h | 14 +-----
 2 files changed, 29 insertions(+), 77 deletions(-)

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
index 57129f3c0814..ddacce21cabf 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -375,18 +375,6 @@ struct ucsi_connector_status {
 	((get_unaligned_le32(&(_p_)[5]) & GENMASK(16, 1)) >> 1)
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
@@ -435,6 +423,8 @@ struct ucsi {
 #define UCSI_DELAY_DEVICE_PDOS	BIT(1)	/* Reading PDOs fails until the parter is in PD mode */
 };
 
+#define UCSI_MAX_DATA_LENGTH(u) (((u)->version < UCSI_VERSION_2_0) ? 0x10 : 0xff)
+
 #define UCSI_MAX_SVID		5
 #define UCSI_MAX_ALTMODES	(UCSI_MAX_SVID * 6)
 
-- 
2.43.0


