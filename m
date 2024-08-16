Return-Path: <linux-usb+bounces-13552-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28566954B8F
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 15:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C41651F235BF
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 13:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22701BB6B7;
	Fri, 16 Aug 2024 13:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lM1NE7BR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91CA1B8E92
	for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2024 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723816753; cv=none; b=dx0EOmPFusLbRsKM3AzgKsiRtdv2ASkS3fV+mZNd4b+rqDk/Du+QUwSXGWBqCGnxOF+qi3YsV29+v0zSEnZnaee+qWrf1PI+0z92sBsOjmz+etgE1p9Gjk03BuDG71k0V7cdQm0EM4uyRjLqe6ioWhGEm4QDxg4aqr4J87LXCMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723816753; c=relaxed/simple;
	bh=TE7c8VVSjm4laoQSHm/9MpjOwYlJekw9z/Vh/WVESBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obnaCdeOedBlhqn3ww2IlvwZ7KkLV9DGvZZMPxBJJsvxdYyLyoGKyAf1JksoWQeKmPArjHfIvbJNVMSLhMwKXQ9HZ9JpAWh/FezUWveQjX8U/he5jtkShC9NPMs0MPcgEo9mjR3n8pxMaPi4TXurIhdqkHuAav73Gnq9qA7Sbic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lM1NE7BR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723816752; x=1755352752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TE7c8VVSjm4laoQSHm/9MpjOwYlJekw9z/Vh/WVESBA=;
  b=lM1NE7BRkXa5iQCVhxV3PDmdK8VOjHeiGpUEmEECQQR52648ZHAF/OG/
   BxJRsDbpIlaQG8qOTHu6cXtekRAJJIOj3Y30yiad5zlv+JSLYVgJcT9W9
   mq+NbkRynEdlBqc/o+MD4fXZcwIXDtfYnUWN59dywvcd7V5BuhJ7sDVh0
   nlfZ6BDiQfiq+FpOxFkGwXiyUvaSACR7tysf3pOOlGsWzhwAInIWfsBTl
   ySESdnJxL6G1RQnlvxMNKPrmj6nuTBxvmUNvlkK9ifXK+bBju9bosISYp
   Ajn4DYpJd+RzxIBMCpBKdDqFZJjQzThzBMwnmdUUdikDnTru2DDMZ1Rve
   A==;
X-CSE-ConnectionGUID: rlfl3CtNTryWrQDQLUO7yA==
X-CSE-MsgGUID: m06/0oQxRViAv/6PYtn0/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21660081"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="21660081"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 06:59:12 -0700
X-CSE-ConnectionGUID: Yf5QVPxpTm28ty8j5yLSQw==
X-CSE-MsgGUID: zbDcAnJCRcWcvHzdh1oWHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="97192408"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 16 Aug 2024 06:59:09 -0700
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
Subject: [PATCH v2 3/6] usb: typec: ucsi: Only assign the identity structure if the PPM supports it
Date: Fri, 16 Aug 2024 16:58:56 +0300
Message-ID: <20240816135859.3499351-4-heikki.krogerus@linux.intel.com>
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

This will make sure that the identity sysfs attribute files
are kept hidden if the UCSI interface doesn't support
reading the USB Power Delivery messages.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 96ef099a6f84..1f6e3f0d25c1 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -979,7 +979,8 @@ static int ucsi_register_cable(struct ucsi_connector *con)
 		break;
 	}
 
-	desc.identity = &con->cable_identity;
+	if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
+		desc.identity = &con->cable_identity;
 	desc.active = !!(UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE &
 			 con->cable_prop.flags);
 	desc.pd_revision = UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV_AS_BCD(
@@ -1058,7 +1059,8 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 	if (pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD)
 		ucsi_register_device_pdos(con);
 
-	desc.identity = &con->partner_identity;
+	if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
+		desc.identity = &con->partner_identity;
 	desc.usb_pd = pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD;
 	desc.pd_revision = UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->cap.flags);
 
-- 
2.43.0


