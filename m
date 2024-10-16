Return-Path: <linux-usb+bounces-16319-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D70E99A0B42
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 15:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 031A41C222C2
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 13:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC1920C038;
	Wed, 16 Oct 2024 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lA1v7+de"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCDB20C032
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729084727; cv=none; b=Ww6aWh1DMKc59IO4gUKJ6FqUwW8yEo/AvkO0xj7B7m+1B9ROmRUUbvqcLosCLq27pXozdQzYS0+GsW2Dtyo1tk+rsosIpP+mtVpVk3oHnurvTLrhuA4TYTjA/cyKMqEJ8WwT6dwboLlEhTg0IPuYgM6Hh68FZDCD72xloiKLXTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729084727; c=relaxed/simple;
	bh=85QACXgzNQ6JGHtoS1i4jJwSrOKiUFUTIGKAnJ+5yKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbupNJ5yzHNMmOhSM5AU8fL21qedbF7P6b4V/cAo0bTvWrKXycscYLz9hq0XZfuHaegPtK5i/Gygh12LWiJmxLHzi+nTLWk6zslKf8G4z04W6NDYUtdyKszNIx5lGLh/sMOL4o2Vpk8xS+BUKn+/bAA8/OhN9Mdw7JdcsTNiTdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lA1v7+de; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729084726; x=1760620726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=85QACXgzNQ6JGHtoS1i4jJwSrOKiUFUTIGKAnJ+5yKA=;
  b=lA1v7+defuJ/qoIF/kzS3Ei4Ih6rUFxHA2kGCqNU6PeLLTwwmEBZvTbf
   fwZLXhweDrYbR/nwuTSlLK03CZtW+Ce+W4BNAUtCd1Upadgdpcq+CeP1/
   Mm5d/IwyNKOCAsHPoLpKPR8HmnVfsO0l8cSuwQpGm8ONABZIg2oRuIplw
   VXKgUFRGkvbDiCJJ/bvWnRmRA98hnFdryiXaz4USU+rptfkcwFaKidMjL
   El3mq+mjBmTtVYnPY8QLj3iPr2l9i2B7pHq9OnO1jM74mKTIkvUB2Yi0C
   yv/aYfY7uAGVZkRlPn40k20eMRtwmXdpz/YEj9Em5SO7vuvTM6gwGg6TC
   A==;
X-CSE-ConnectionGUID: xOi3p+QYT6SilIRAUQPOig==
X-CSE-MsgGUID: VLAdvim3TX+51HS8Khq5aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39077775"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39077775"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:18:46 -0700
X-CSE-ConnectionGUID: 5mNWOgxIQHWawDCyMzQFfw==
X-CSE-MsgGUID: EdotUp2USra5FWH22jNQWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="83300077"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2024 06:18:44 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 3/4] usb: typec: ucsi: Supply the USB capabilities to the ports
Date: Wed, 16 Oct 2024 16:18:33 +0300
Message-ID: <20241016131834.898599-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016131834.898599-1-heikki.krogerus@linux.intel.com>
References: <20241016131834.898599-1-heikki.krogerus@linux.intel.com>
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


