Return-Path: <linux-usb+bounces-15719-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D53990542
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 16:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 217611C22AC3
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 14:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E90E2101B2;
	Fri,  4 Oct 2024 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIh3Trp2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C72141A5
	for <linux-usb@vger.kernel.org>; Fri,  4 Oct 2024 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050691; cv=none; b=BStlW1wSSKvLE1mOGvBz5OHOqTSUZdwIg4EMrcL1uGDT5D5ZfaYmm3gC1PL32k+ytUbsYYXgD+US2/qUrzCwLFoCqAmEpaTfo/wbYxFt0V7EqOmgPs41IY7MqUaO+8kU6uaK8slSF8l00tOZ5JohLTmBiUaviCNB/D9yRadY63o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050691; c=relaxed/simple;
	bh=bsJVu6U+CWgKuqGdDNSUGylr44XzfVpfOWkjMKwS8oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9patfgDCcEKOrGac1UvGbX1NBxnPEf0Oejl5WpADnCayk6LFIhoaYvsHJqeRvKSEUCJ42EgvpdVsq5fj7YY1Ca394zWcKbz0+I/KopBmOVOErpHPglluW/ar2QMzsWSdCNg/NLXpnKmcWyw9x6P6IvXdjDIuHhcWXAmiP3Wr7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIh3Trp2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728050690; x=1759586690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bsJVu6U+CWgKuqGdDNSUGylr44XzfVpfOWkjMKwS8oE=;
  b=WIh3Trp2UViG/xW7qO7z2fJlN9BiK0LemMOirJ8KYKQM3y0fXeUBxZP7
   K/F1YNXSEcng8Ij+0aOvW/DLOwxD7TGHE97VFCsv41+ZzQzbvuWiE6l5E
   DwiPJ6Y1sciKNrADHu4MH8jL33EuNXPZlB2CWaRuxAaGsKT3hOGA+tm7G
   zn6s4DD2x9mAbe1xEep2e5Sn17AUbp/Arl9F5Ub4nfuP0Upn9mD/mcn+t
   /yK+OEH/BnCoQeF80Wi1fziz61SuE6dY6MJ/k+PsO/C1epR9TVTB8OyHw
   /HgPUMipNtd9Gg3lyB8wiV7QZ+Qk3jnTpPjNCF805Q+36xtvxMBInlo3R
   Q==;
X-CSE-ConnectionGUID: E3+BKLxlS5aSAgkNFoppug==
X-CSE-MsgGUID: HHsg/KEBRjaw/RGzWeLprA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26780810"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="26780810"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 07:04:50 -0700
X-CSE-ConnectionGUID: DIPd7kD0QBeuR7sS6lkcLg==
X-CSE-MsgGUID: SmlXqr5NRwCnypJCnHzFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79144225"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 04 Oct 2024 07:04:48 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 3/4] usb: typec: ucsi: Supply the USB capabilities to the ports
Date: Fri,  4 Oct 2024 17:04:38 +0300
Message-ID: <20241004140440.1882311-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004140440.1882311-1-heikki.krogerus@linux.intel.com>
References: <20241004140440.1882311-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB capabilities can be extracted from the response to
the Get Connector Capability command. USB2 and USB3 support
can be checked from the Operation Mode field, and USB4
support from the Extended Operation Mode field.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 7 +++++++
 drivers/usb/typec/ucsi/ucsi.h | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index e0f3925e401b..13c739d334c4 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1588,6 +1588,13 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DEBUG_ACCESSORY)
 		*accessory = TYPEC_ACCESSORY_DEBUG;
 
+	if (UCSI_CONCAP_USB2_SUPPORT(con))
+		cap->usb_capability |= USB_CAPABILITY_USB2;
+	if (UCSI_CONCAP_USB3_SUPPORT(con))
+		cap->usb_capability |= USB_CAPABILITY_USB3;
+	if (UCSI_CONCAP_USB4_SUPPORT(con))
+		cap->usb_capability |= USB_CAPABILITY_USB4;
+
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 4a017eb6a65b..f6a3287cdc06 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -286,6 +286,14 @@ struct ucsi_connector_capability {
 	UCSI_SPEC_REVISION_TO_BCD(UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV(_f_))
 } __packed;
 
+#define UCSI_CONCAP_USB2_SUPPORT(_con_) ((_con_)->cap.op_mode & UCSI_CONCAP_OPMODE_USB2)
+#define UCSI_CONCAP_USB3_SUPPORT(_con_) ((_con_)->cap.op_mode & UCSI_CONCAP_OPMODE_USB3)
+#define UCSI_CONCAP_USB4_SUPPORT(_con_)					\
+	((_con_)->ucsi->version >= UCSI_VERSION_2_0 &&			\
+	 ((_con_)->cap.flags & (UCSI_CONCAP_EX_OP_MODE_USB4_GEN2 |	\
+				UCSI_CONCAP_EX_OP_MODE_USB4_GEN3 |	\
+				UCSI_CONCAP_EX_OP_MODE_USB4_GEN4)))
+
 struct ucsi_altmode {
 	u16 svid;
 	u32 mid;
-- 
2.45.2


