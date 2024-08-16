Return-Path: <linux-usb+bounces-13555-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C068E954B99
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 15:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D188B21F19
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 13:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C511BC9E2;
	Fri, 16 Aug 2024 13:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFlVWdpA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB951BB68D
	for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2024 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723816762; cv=none; b=D8WkVaiJL+w6gtiVaYbbenZ688+hxPJEGv3GeM9hn6InRWMc7cOa2sKQJ3EJC+M8MKi/9Pq5Z44L86DddL22u72jut08Sv4RbCUC1e7ID7Lpl0nntAabzWKKytShtidCLRSZT0gHPQ6XEsQpig43gWE81V17jSJuckYJggSzbXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723816762; c=relaxed/simple;
	bh=G2lurmo+k3UCRLAgigooeszpiMhc7Uh1WD01LPPpFNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pR84tgczQA9VyP+sMRIOWUIEN6tgLyOfKWzFnQX5Y12yqhaf7gUaDiuOfby0CTlXSv6xivxYkoiGXEMzbAasD9n8ii46bYG+7hebfin3UcIC+CJc3xujvOC47EmFf6Sy3BAxSvCqnXXUHnro4p+xFmHSWcdw4prIygdFbxMKSlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFlVWdpA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723816761; x=1755352761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G2lurmo+k3UCRLAgigooeszpiMhc7Uh1WD01LPPpFNA=;
  b=hFlVWdpANUn2F+s2IY/GIvc/pUmofDLSXy8CCDvuzKumrRVuMpKvX46S
   eHgLgiXHjEYFiVjmz1uQUUADwqO1mKHJxVtnNv8SaKEi965xZsEf8T9gj
   SmkInXz+jEvd227bcXGyG0rFtYnBRhmwqdoov40SFghZzMf0HF6q+Bw54
   np/+2nKb+7dcXB+cUNtOVtSUM/MGdYIxRxoA0cdmzV/HPl3IMMXvwchR8
   ejsOruKcNj/luLB9QBAOVhF3DPcwHNvY/1Z1+F4xn/DvdbEwBsAl6Wfr8
   6mqWWdtoD0CEStYrJn0jruf/gAF6VRBD0L9DmkwglDgVmPtONzEghLc7q
   g==;
X-CSE-ConnectionGUID: TDL9yu1FR9WH9OcbT0afjQ==
X-CSE-MsgGUID: gU43l660REOVaaNNCDElVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21660102"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="21660102"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 06:59:21 -0700
X-CSE-ConnectionGUID: HOP5lSC+QmS72wG2K4Gr1Q==
X-CSE-MsgGUID: mX9ij3XlRFurNUoVVVtk8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="97192432"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 16 Aug 2024 06:59:18 -0700
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
Subject: [PATCH v2 6/6] usb: typec: ucsi: Remove useless error check from ucsi_read_error()
Date: Fri, 16 Aug 2024 16:58:59 +0300
Message-ID: <20240816135859.3499351-7-heikki.krogerus@linux.intel.com>
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


