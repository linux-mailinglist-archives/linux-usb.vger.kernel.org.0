Return-Path: <linux-usb+bounces-14244-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BBF962D75
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 18:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBA081C231E9
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 16:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413411A3BB8;
	Wed, 28 Aug 2024 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxgXLpJT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA11A4AD7
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 16:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724861713; cv=none; b=u8FOZFdPzoxcWSDVVbq0MpgbE0wm6n/H3pKwuZKJ9rcF+e+DFvJdibsm6RXPn00otYJ7msH8BQzu0243MHgYKX6kaEykC/2tNNLJ8ulb0fua3S2O44Q9GMyPP1EaYAwKrSxFSUUbceEa81ZO+ixsZUisJ7ah+1rjuNsV6K8RC6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724861713; c=relaxed/simple;
	bh=8kjWOsaOcDfzs/Itxsmr8leFRSXcU8M2wzaBCW7myDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AHINxigosGqN9i/GWYYRCf4/ZSQe4MMqhd4xKQ1fEkcGkLRIvlAwNAIw1voRC5AOac9DRV7AcbxPwm6pr5nJR5vG2lQp4lXHLodjDlVO+jB4eqiIj9TsKgWskD4bE9zTErcFvNqPwxVXm09RJwF2TNVKslmoR4bzy9VIpcvI7s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxgXLpJT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724861712; x=1756397712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8kjWOsaOcDfzs/Itxsmr8leFRSXcU8M2wzaBCW7myDA=;
  b=HxgXLpJThCAo+5U8ONgJxq3suydXqX5YStzfHtPUCahyyaudLolA590S
   rj+26w8k9mm7myX5hB+xMhfUElEpxzQV1Iv3WjXaf74ihz/6XCh0GUheu
   pk37yGmzlnQGlECMWveASEerJUVvLZ1I96ADhifLTTmgAHpkPFgfTeUFE
   tJW/lSpkFA/hdFpd6TkTJND/hkJJ/hRHDEdrHoWmobdMN0Ae45XjpRvdX
   eUrvpbEwjWxK6ag8ZaipHE00NiK6exYW4MWOM+VYz2nYSnEuI3zXeeQhT
   W2mjfpMlvd60glzO+eP3b6WKjYANktsJa5jgGy0nu5rrKibH0cwfCZfP5
   w==;
X-CSE-ConnectionGUID: QvLZgWE3RsuYxeTSiucyyA==
X-CSE-MsgGUID: CV/vTxWJTrGQiYnPgRlY7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23566090"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="23566090"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 09:15:11 -0700
X-CSE-ConnectionGUID: iN6E6dySQneYBfzF62321Q==
X-CSE-MsgGUID: U948zGuKQim4VoboxEtiSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63605534"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 28 Aug 2024 09:15:10 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Bartosz Szpila <bszpila@google.com>,
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>,
	linux-usb@vger.kernel.org
Subject: [RFC PATCH 3/3] usb: typec: ucsi: Helpers for new GET_CONNECTOR_STATUS fields
Date: Wed, 28 Aug 2024 19:15:01 +0300
Message-ID: <20240828161502.2774996-4-heikki.krogerus@linux.intel.com>
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

UCSI v2 introduced new fields to GET_CONNECTOR_STATUS.
Adding a helper for each field. The helpers check that the
UCSI version is v2 or above.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.h | 66 +++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index dfbc0f6c1b9b..adcbfc96dfcf 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -524,4 +524,70 @@ static inline void ucsi_debugfs_unregister(struct ucsi *ucsi) { }
 #define USB_TYPEC_NVIDIA_VLINK_DP_VDO	0x1
 #define USB_TYPEC_NVIDIA_VLINK_DBG_VDO	0x3
 
+/* -------------------------------------------------------------------------- */
+
+static inline enum typec_orientation ucsi_orientation(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return TYPEC_ORIENTATION_NONE;
+	return UCSI_FIELD(con->status, 86, 1) ? TYPEC_ORIENTATION_REVERSE :
+						TYPEC_ORIENTATION_NORMAL;
+}
+
+static inline int ucsi_sink_path_status(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con->status, 87, 1);
+}
+
+static inline int ucsi_reverse_current_protection_status(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con->status, 88, 1);
+}
+
+static inline int ucsi_power_reading_ready(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con->status, 89, 1);
+}
+
+static inline int ucsi_current_scale(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con->status, 90, 3) * 5; /* mA */
+}
+
+static inline int ucsi_peak_current(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con->status, 93, 16);
+}
+
+static inline int ucsi_average_current(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con->status, 109, 16);
+}
+
+static inline int ucsi_voltage_scale(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con->status, 125, 4) * 5; /* mV */
+}
+
+static inline int ucsi_voltage_reading(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con->status, 129, 16);
+}
+
 #endif /* __DRIVER_USB_TYPEC_UCSI_H */
-- 
2.45.2


