Return-Path: <linux-usb+bounces-13505-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176F952B61
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 12:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B5071C20959
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 10:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B359E1C9DED;
	Thu, 15 Aug 2024 08:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDpUF0Cy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993F61BA895
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 08:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723712256; cv=none; b=McSJ0PZb4+9DSyqjJhbASfq5y06cuA0rH6kwO58AMjYVKZPuhLLOIdpHQC4TM/mnMbEt5pQl7yZcVtL+pwkxuUIcWGzXset1J3L2MyroDGvqaLcrP9A1OLQRLwGQbBtaKNw+4s5Rks9o0CCv4NjrBN1keqWTaDjwRWdNiXEZPQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723712256; c=relaxed/simple;
	bh=TE7c8VVSjm4laoQSHm/9MpjOwYlJekw9z/Vh/WVESBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9MFbwW18KJe3hJnhDy89tE+wZWJpI/XWFBhhsu5Hyr7LrnVaDxxzgRFKoB/wXPIt+gwqZRhDnJ2fTISIfBOtS2HYlIEptElGXk3x0ytw9mp118wu/976IIJCFe+RwiyN0iTNLwpcc/KlIv2lVfolnzEc3KZqcaERspt75k374g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDpUF0Cy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723712255; x=1755248255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TE7c8VVSjm4laoQSHm/9MpjOwYlJekw9z/Vh/WVESBA=;
  b=KDpUF0CydJJC7G3es9t6lgfTU0veYwgpCPpQdY33LgxsHfI365bdbkLG
   Gi1YbfKSKybREe0SHjt3l/M6dYO8sP+h3sTix1NBc2EvIgK6T3xouxbjI
   Rte9MjsTIsqWCzfntn2fxbqmfg7TOXjGG7ni7w+vbflAS5zzb0y5MUn9Q
   VbG+OS8o2StL3/CEAqPTGcK/6SXw6hjfI5KjnDAv8Hqf0zwJKmC/6xjq1
   BpMuhi3Wp9j8H9okBauZ6gXlUj/Mx3OyNc5ieCwDkOKDFKT87JVDbGBkp
   iVr25wmHWKLRT4FGodFixm2WMUzPFxPmeZSIDQcZXIeuBtk/mVYxaqiDY
   Q==;
X-CSE-ConnectionGUID: TX5QCS+JQny13Na9Kv+4ig==
X-CSE-MsgGUID: 8huyyKjqS1uyteasdaTgfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22094632"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="22094632"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 01:57:34 -0700
X-CSE-ConnectionGUID: vIJJ5o7xT9Wp6FlXbFiq4w==
X-CSE-MsgGUID: xGHy3UMQT5eAXKSoR5Ub/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="96816952"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2024 01:57:32 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/5] usb: typec: ucsi: Only assign the identity structure if the PPM supports it
Date: Thu, 15 Aug 2024 11:57:23 +0300
Message-ID: <20240815085726.2865482-3-heikki.krogerus@linux.intel.com>
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


