Return-Path: <linux-usb+bounces-15946-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E871997093
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 18:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0DA3B233AA
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 16:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AAE1E284B;
	Wed,  9 Oct 2024 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ft5D7r3f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BE31E2840
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 15:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488769; cv=none; b=ESR27iToHYIQNEh7ZLZd80JRT+DMnLRMvBTRPcYjvtp4QPaauJvmtO5Eho8PhXLDk4njKmRlQQCxX6mi3UFCGJO6ZhrkOhScoElJ1jq6StavZS/UANIPBWmpeMDIK6jTK3XOGPjsYNGKg3fihNxQb2Ls+mDpTr/j0SmA3vHm5Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488769; c=relaxed/simple;
	bh=qUJ4mwtxLTTj5YWbOdXJhxWi2bZLA/sLdRbuA7Gtmvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HW+3gawZgwUVEtpdY6bzSMKs9s/POdE99OqjhziakxJk37MtMyGQMxSUiYUl9Ne8khkvgHxnucSafTEnpWMjqPvofcOcG8cp8G0+XcIQ3VvWu5Y+l/e2aPCGpuKQGEaKSb9K7F3ONO+a6v27WJ2RQJEWCR0THiuFOEepDKPdQaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ft5D7r3f; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728488768; x=1760024768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qUJ4mwtxLTTj5YWbOdXJhxWi2bZLA/sLdRbuA7Gtmvc=;
  b=Ft5D7r3f4JE46fz1pRPUxh2oyvdDaQ+POJMq5C+u+KHbiSpHF1KorAjW
   6xsDgjLYOFtJFiz1E6biP+Ksc2eB/scD8B0tUD4SoFfdGJ1C+R6BB/CGu
   8WyMLHcI3kbjZDkvG94dL9eLhfUQaR8Lhtm3adCrfaemaAcH6evYWAKtW
   oF74LUmhNtNfo57mLD8LebJeruwh0QJdcmhDzFoAh2RxJUh6IoMTtCffJ
   w/ZgfOhc3FeDZSFNQyGfLNDITEqlownT6V2CiIXNIhJN2sriPRxcUlXGh
   uIZ3Ce50TdF0U+mjuCjkEtacM2bXlBfnp+YSvQgwAV5aqP2LAoVaJYcp0
   g==;
X-CSE-ConnectionGUID: 9tXS8GwfRQG3q+5CxvYvOg==
X-CSE-MsgGUID: l68+yBfDRQCXFaRjR2n5qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="50334641"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="50334641"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 08:46:08 -0700
X-CSE-ConnectionGUID: C4ke8aAYTKy5puF9aTOJIw==
X-CSE-MsgGUID: 8YuMHnaKTbWMQ91FRkdRlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="81102526"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 09 Oct 2024 08:46:06 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 3/4] usb: typec: ucsi: Supply the USB capabilities to the ports
Date: Wed,  9 Oct 2024 18:45:56 +0300
Message-ID: <20241009154557.2836656-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009154557.2836656-1-heikki.krogerus@linux.intel.com>
References: <20241009154557.2836656-1-heikki.krogerus@linux.intel.com>
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8450-HDK
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
index 1cf5aad4c23a..a1f4b9b568c8 100644
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


