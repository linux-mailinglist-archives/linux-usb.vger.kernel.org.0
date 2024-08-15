Return-Path: <linux-usb+bounces-13508-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7200952B64
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 12:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B4451F21D34
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 10:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68AF1C9EBE;
	Thu, 15 Aug 2024 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2yPGx0L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF751C9EB7
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 08:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723712262; cv=none; b=jkxe8d4MMmaLFKAfCGqOyBgjA733Hk3ryTINzrSe7JKDgqn2iP7+XERHo1wJr8NJ2+Pp6fXuNJQOeENkbHi5xKzND58MUp98pQB+5dNTH2XaKAvwgdYXiGO91+w4ak4ZIIIuzveXkej9pnS7MYhjRsY0w5GaUo167t0akHSZ8oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723712262; c=relaxed/simple;
	bh=G2lurmo+k3UCRLAgigooeszpiMhc7Uh1WD01LPPpFNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JA84Wrnr89mJ214Cm29yYvjEsTP8RqmnkmrYyohevOOd/EbN00kIJZlA1hXMh/npFkrweQ43XGZ/1GoMJIoeooc5vhgZPaTjlRP81YaBR7Rvgg8XTzsN/MX7tzkv5jHy1be5lkPdps62yVryaaKofberSrg+ksdfAY5ij0jl6/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2yPGx0L; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723712261; x=1755248261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G2lurmo+k3UCRLAgigooeszpiMhc7Uh1WD01LPPpFNA=;
  b=B2yPGx0LVSsVUj7Ud1v7W4AD6fWFSKaPkrcd9DfFMPTihIY0ltssy6UO
   39ygq5M8XXFPR4AAlDU6HFbEuqjh4UQs6UOxJeXT7eefmWpBBrkL/ONCW
   cPSj2lyIZ7k9pqHU4XltmLkV81mTmQ0hpqrV2IeOLgvsYdIV+gfKtqgNZ
   949TY4SmFOk4Ey1oez5c2fi9XFElh2qR60QxHML0tpJ5yMSIpOU5vFlSS
   +5lduBqYWhe4jpG9kd15oeE4owSGdxcIRFcRfu+y4VcYvcaA//uCoXOXG
   LIdVnRqJDz9EIWROXIhC4NdLOb9FcIHylHGp94sW3cI4Vzp2Vw2RTC7a6
   A==;
X-CSE-ConnectionGUID: CTqxkxtNTjuwGwoxKNj8nQ==
X-CSE-MsgGUID: ZIkGqT6ASaW57AHGM3UKyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22094650"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="22094650"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 01:57:41 -0700
X-CSE-ConnectionGUID: UsisgDi4TvabopBEekV2/Q==
X-CSE-MsgGUID: HhJpaF1oQp+W+hcdzkTh0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="96816966"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2024 01:57:39 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH 5/5] usb: typec: ucsi: Remove useless error check from ucsi_read_error()
Date: Thu, 15 Aug 2024 11:57:26 +0300
Message-ID: <20240815085726.2865482-6-heikki.krogerus@linux.intel.com>
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

If the GET_ERROR_STATUS command fails, ucsi_read_error() can
not reach the condition where the CCI error bit is checked,
because ucsi_run_command() has already checked that bit and
returned an error.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 64fe59e05b4f..927007230cb8 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -148,9 +148,6 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 	if (ret < 0)
 		return ret;
 
-	if (cci & UCSI_CCI_ERROR)
-		return -EIO;
-
 	switch (error) {
 	case UCSI_ERROR_INCOMPATIBLE_PARTNER:
 		return -EOPNOTSUPP;
-- 
2.43.0


