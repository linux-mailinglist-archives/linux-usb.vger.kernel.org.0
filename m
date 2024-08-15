Return-Path: <linux-usb+bounces-13504-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FB1952B5F
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 11:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05CCC1F21210
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 09:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5AB1BA87B;
	Thu, 15 Aug 2024 08:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKBz5p1w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59103224EF
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723712253; cv=none; b=SN9AkadlETfxQNUdye3c8guLkzShj7xf1GGtMywYdQ4r+EV80d3msULDIkc17Or7soycmG27u3UO06Xc6xdYB6C/Dv3Kz9Cu8ZDXqVyjcJjh0H4m/aWKfiis18MntoHa9yRjKOod6x74Lw7Ki9UhPxEVWPZ0ljK6Q5Z3iTuqk54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723712253; c=relaxed/simple;
	bh=/z1O6sxhAD+1JW5Zk+q8BJxcWMYP48XEeXaQvDIHEkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JrOZEvcF4DKmO5rb6MOtgrk1DfCh9xpt44Jpvjf9J+I8iPf2pRCiHQpzLPTeu8V+S3mEHMMrJwvYEN3HCI8BSuXN4kPo3zEjYr3YVn3BcqXkUAG3+buvo4P9/bro3drS/Tt8R8bBZMFh9JaAUlVhY9c1yeCF+xsWo9OzyOFoIxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKBz5p1w; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723712253; x=1755248253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/z1O6sxhAD+1JW5Zk+q8BJxcWMYP48XEeXaQvDIHEkY=;
  b=iKBz5p1w4NNe4mKcojLf2++kaxeXTfT0kGIO+rZt5HMjok5PxJ2vc+rF
   4QUvn4jvNY2Sxl9zxW7M6JT14D+NpGNypu0r39la8Pz147+GOIjzXCCq8
   yQ+p6geDe+6LDzKMo0ZAc8skrGuAN0olM8Do/ttfFeBC4dLV6D1NYWKO7
   crNxcO4exr6Ymk0aC5srrrLX15lAMugGdwE/K5CU4wbiKKY42GZ4E+vM4
   y7nsgsF25khDZPU3Ivej/n7vFrLkCZtzXYyD9IP9fJRYCBU9rAunsUCJv
   w9Fy6Xxvi0qgSIsQidOLMx/NsbBxvOl4YFPg9eRilD8QF7/IcG9ArWNxr
   A==;
X-CSE-ConnectionGUID: J9VPUij1RMartpA8iZbCxA==
X-CSE-MsgGUID: amV02Tz9SvKBtxTQJBcZzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22094622"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="22094622"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 01:57:32 -0700
X-CSE-ConnectionGUID: fJlmeUfASlaYfsskBHQsOA==
X-CSE-MsgGUID: J7KVDNiIRA+7CDOiUTgbrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="96816949"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2024 01:57:29 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/5] usb: typec: ucsi: Don't truncate the reads
Date: Thu, 15 Aug 2024 11:57:22 +0300
Message-ID: <20240815085726.2865482-2-heikki.krogerus@linux.intel.com>
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

That may silently corrupt the data. Instead, failing attempts
to read more than the interface can handle.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 4039851551c1..96ef099a6f84 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -99,12 +99,8 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 
 	*cci = 0;
 
-	/*
-	 * Below UCSI 2.0, MESSAGE_IN was limited to 16 bytes. Truncate the
-	 * reads here.
-	 */
-	if (ucsi->version <= UCSI_VERSION_1_2)
-		size = clamp(size, 0, 16);
+	if (size > UCSI_MAX_DATA_LENGTH(ucsi))
+		return -EINVAL;
 
 	ret = ucsi->ops->sync_control(ucsi, command);
 	if (ret)
-- 
2.43.0


