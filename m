Return-Path: <linux-usb+bounces-16085-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A711199A422
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 14:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D64961C21501
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 12:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD7421858F;
	Fri, 11 Oct 2024 12:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4tYe1iD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6055F218588
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728650654; cv=none; b=RiT2x6glflIsHPAMhcQhgiXRMDsVOkULsZC1Fxf9jgw6iXkKC9mkK/gvVG0i3T/lHPrBFdsXBPTSGVJnflTZ8jMwKqxWKUseQ/j/ncVuKSmdnUI3BC/zw0LGUP0OgNKk6QSuKKtAq0Nj8o/rTzOhRy52zu13X8XYU5rZICMfAhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728650654; c=relaxed/simple;
	bh=85QACXgzNQ6JGHtoS1i4jJwSrOKiUFUTIGKAnJ+5yKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lC4VCb+cU2MR/6hhAi4eRdFaxD+ObYErrU+aeZFJz5vosnKZJhPg2FWP1xppvEgaFWfW29ly9uDMM5FSb9upum8Gt9AzYXfOvbrTOhifgrbW2thC1nVtZPOsZhJ1ZY8Neoz/4usVL3o7+C/nj5HpGEiBe6Fv5oulr8rk4iTOvUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4tYe1iD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728650653; x=1760186653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=85QACXgzNQ6JGHtoS1i4jJwSrOKiUFUTIGKAnJ+5yKA=;
  b=i4tYe1iDjlqN7mlviSqNtSnEOQIugOGpWVavtKilk6Qb3y9D6AZgmWPL
   HHAA0wntMCvrhk1Pmh9WDoxL0lO4nPA3vqzkXvs7+JQCVYw8205+dgHXm
   xkz4IvoAnxGlkPAxglvNyvM0eMlx7P6OhNTt1KJ+wmZnoaApZtB5Trpjg
   vCYvAe/afELSdQe8M1YZCMLqUHPo2A1Ocntyre9cX6uKyWpPx7SUR9xP0
   oasECTsLb1xW74G8S4nM+OTH6eAKa+mpkHIqivnQJMarK2lo3EitO6927
   bnsh3vfYEBygsIOsXZfj3bBn7G8z09sLvaYTEHe6f6C4iR6efrc5aZWGJ
   A==;
X-CSE-ConnectionGUID: iD5gnHsiSX6IkGmKOlCeLQ==
X-CSE-MsgGUID: vfLyg2pWS7iPDyKFF6WVZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31957712"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="31957712"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 05:44:13 -0700
X-CSE-ConnectionGUID: hazRoEoNT6ylb9xpX+Ce+g==
X-CSE-MsgGUID: abzGXKWGTL6o42UI7eksGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="77716177"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 11 Oct 2024 05:44:10 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 3/4] usb: typec: ucsi: Supply the USB capabilities to the ports
Date: Fri, 11 Oct 2024 15:44:01 +0300
Message-ID: <20241011124402.3306994-4-heikki.krogerus@linux.intel.com>
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


