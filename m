Return-Path: <linux-usb+bounces-13550-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76215954B8A
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 15:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F0D92818FB
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 13:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35811BC072;
	Fri, 16 Aug 2024 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhJpKq2x"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131CA1B8E92
	for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2024 13:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723816747; cv=none; b=Ua2GlqjK2eITBmALZcAyyLst725gN27E4n6QFUcbI/tyHndB/iwO3egfjW7YZZ7T2orOOB3D86bIkNey6MOiXPWA0FYiNH4wk+NhPT4DAsJ6+v2TGX+IJ1FfWV/rf3SVMDCWGHMgTBunQ+iiHiw8uLCK6YUxDZzKB/faTCivSIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723816747; c=relaxed/simple;
	bh=EjArrNWVZAsibljlpj4C3taslIyLaRX4F290EmCjBfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUtJweoJgKNgUB2ecj6PyHV3jne1pXV3OEHsSbwhmsJMQtWkQ3QLEL/kvM6kojltabH2qyjlB2VxpDsvmWb5FjVlKV9eG7l6Kuooqkng9VrZbyDUizPuL8Ms9P9oSEk7m+p4Y7vUM2AK2K3+KsgDg+0LK9d4k5QAbMnCnJ6bPLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhJpKq2x; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723816746; x=1755352746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EjArrNWVZAsibljlpj4C3taslIyLaRX4F290EmCjBfs=;
  b=nhJpKq2x7dIh6fsftPEWq0zehkkRYZ/SWt8Kta5FGhyo0R8Es/E8LBZ5
   5tPwGbD/pHP5UOhZmSb5NpqT/Z4pqm113V75hYq2g8SGJ7AwgMXwor3t8
   GVTMj6OsJJXwmbnkTsMFEJiabjj62gty48ISimRHwQNW4NWENzpQaoZdI
   szmYk8ZT4y6LzgMWBRwtwAG8QO02PPT3t57iHe1MciVWDs7Aut2/5umOq
   Ghwd1fJVhXPpefWxLHaCz6XtNsFHntPI/YkxEapG3Rp3HOmuv2gzK4hsr
   PwtLso9BBHOwY0pdihZymp3RVOcW6ayZ7XWS+3yfrGMgxjeugThORnBrO
   A==;
X-CSE-ConnectionGUID: EI7AcdphTfWnwE9Y+VQwIw==
X-CSE-MsgGUID: a2N9f8vSQ86GAtxV4o6CSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21660066"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="21660066"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 06:59:06 -0700
X-CSE-ConnectionGUID: qryt0gEPSmWeJVyKhF94nA==
X-CSE-MsgGUID: 58yXjVgrS2OmfikSyx4llA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="97192388"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 16 Aug 2024 06:59:03 -0700
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
Subject: [PATCH v2 1/6] usb: typec: ucsi: Remove unused fields from struct ucsi_connector_status
Date: Fri, 16 Aug 2024 16:58:54 +0300
Message-ID: <20240816135859.3499351-2-heikki.krogerus@linux.intel.com>
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

The new fields are valid only with the new UCSI versions.
They are at offsets that go beyond the MAX_DATA_LENGTH (16
bytes) with the older UCSI versions. That has not caused any
problems before because nothing uses those new fields yet.
Because they are not used yet, dropping them for now.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.h | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 57129f3c0814..7bc132b59027 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -344,35 +344,12 @@ struct ucsi_connector_status {
 #define   UCSI_CONSTAT_PARTNER_TYPE_AUDIO	6
 	u32 request_data_obj;
 
-	u8 pwr_status[3];
-#define UCSI_CONSTAT_BC_STATUS(_p_)		((_p_[0]) & GENMASK(1, 0))
+	u8 pwr_status;
+#define UCSI_CONSTAT_BC_STATUS(_p_)		((_p_) & GENMASK(1, 0))
 #define   UCSI_CONSTAT_BC_NOT_CHARGING		0
 #define   UCSI_CONSTAT_BC_NOMINAL_CHARGING	1
 #define   UCSI_CONSTAT_BC_SLOW_CHARGING		2
 #define   UCSI_CONSTAT_BC_TRICKLE_CHARGING	3
-#define UCSI_CONSTAT_PROVIDER_CAP_LIMIT(_p_)	(((_p_[0]) & GENMASK(5, 2)) >> 2)
-#define   UCSI_CONSTAT_CAP_PWR_LOWERED		0
-#define   UCSI_CONSTAT_CAP_PWR_BUDGET_LIMIT	1
-#define UCSI_CONSTAT_PROVIDER_PD_VERSION_OPER_MODE(_p_)	\
-	((get_unaligned_le32(_p_) & GENMASK(21, 6)) >> 6)
-#define UCSI_CONSTAT_ORIENTATION(_p_)		(((_p_[2]) & GENMASK(6, 6)) >> 6)
-#define   UCSI_CONSTAT_ORIENTATION_DIRECT	0
-#define   UCSI_CONSTAT_ORIENTATION_FLIPPED	1
-#define UCSI_CONSTAT_SINK_PATH_STATUS(_p_)	(((_p_[2]) & GENMASK(7, 7)) >> 7)
-#define   UCSI_CONSTAT_SINK_PATH_DISABLED	0
-#define   UCSI_CONSTAT_SINK_PATH_ENABLED	1
-	u8 pwr_readings[9];
-#define UCSI_CONSTAT_REV_CURR_PROT_STATUS(_p_)	((_p_[0]) & 0x1)
-#define UCSI_CONSTAT_PWR_READING_VALID(_p_)	(((_p_[0]) & GENMASK(1, 1)) >> 1)
-#define UCSI_CONSTAT_CURRENT_SCALE(_p_)		(((_p_[0]) & GENMASK(4, 2)) >> 2)
-#define UCSI_CONSTAT_PEAK_CURRENT(_p_) \
-	((get_unaligned_le32(_p_) & GENMASK(20, 5)) >> 5)
-#define UCSI_CONSTAT_AVG_CURRENT(_p_) \
-	((get_unaligned_le32(&(_p_)[2]) & GENMASK(20, 5)) >> 5)
-#define UCSI_CONSTAT_VOLTAGE_SCALE(_p_) \
-	((get_unaligned_le16(&(_p_)[4]) & GENMASK(8, 5)) >> 5)
-#define UCSI_CONSTAT_VOLTAGE_READING(_p_) \
-	((get_unaligned_le32(&(_p_)[5]) & GENMASK(16, 1)) >> 1)
 } __packed;
 
 /*
-- 
2.43.0


