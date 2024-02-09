Return-Path: <linux-usb+bounces-6164-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D897C84F6F7
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DBB9B23143
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 14:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B997473181;
	Fri,  9 Feb 2024 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c676u/ex"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773046A8A2
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488028; cv=none; b=b3uR2+EpoeRbmlaUDlmNskOg7SU1K6mTju7y3f7zfY1a1n1i+OMltZzzMTf/gT1OcXYxedpUy+s9gVNsUna1AA77eO8bulR5p8rZkhgWtQYN7juQZ1iAS6ZNlvHw0ODOlPI8ip1RFx3impenRyRSxIVxNzRzc+H8e6Htj8agBYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488028; c=relaxed/simple;
	bh=antzI5cxyctRSp9XaM5d1CCzMssgryozW9f3L9pwDCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ev+PjVx8wbdHPeJ0PNgREbVsAvr4BKvy8HUL1ePtszncpQeIdIDhZ3JNb1LYw6l1oX/2i8+3/ku05FYDNnv8YrmV7KpvUwp0iIYIDM3/e8oEpSWyHEnY7mIX1JOSerRC2o/nqWDBhfdpQllZAjJqZCa3tC25Us2EVs+Sj5pya0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c676u/ex; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488026; x=1739024026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=antzI5cxyctRSp9XaM5d1CCzMssgryozW9f3L9pwDCc=;
  b=c676u/exPmA9/fQHEYs41tNCtDEI+PFjRhD2/OeeYdYqZGAkDbFyjIVP
   mfV0L6pTESHGCRXCBeDTQs9JSX6v8C7Hs4ZIyago/PLX69/Iu/bTTgrm/
   et6Aphkjph3Xbj2NqNsziJB57DxqtUV0NdQPE1Ywr81r0VEkMyni6AIub
   KB8b/5eHSV6dJm2TnmVxCz1ShjKrx0bsR4TVkWxva/V4hkz7sJrTIhQ6T
   /9tNnAgyej6OI+J+Lf5kF/5ySj/GzuPU/FNOzqpqdyZv1NIxetEAIoxCo
   baarLuag5HX+Dpgnfo+PbXgTU2fsmCelo/fHQJePIKuuMdBChUXY0pk5g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12082135"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12082135"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934434450"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934434450"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 06:13:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 06FC7B84; Fri,  9 Feb 2024 16:13:36 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 09/10] thunderbolt: Calculate DisplayPort tunnel bandwidth after DPRX capabilities read
Date: Fri,  9 Feb 2024 16:13:34 +0200
Message-ID: <20240209141335.2286786-10-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
References: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gil Fine <gil.fine@linux.intel.com>

According to USB4 Connection Manager guide, after DisplayPort tunnel was
setup, the DPRX capabilities read is performed by the DPTX. According to
VESA spec, this shall be completed within 5 seconds after the DisplayPort
tunnel was setup. Hence, if the bit: DPRX Capabilities Read Done, was
not set to '1' by this time, we timeout and fail calculating DisplayPort
tunnel consumed bandwidth.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index e02b34654d29..cb6609a56a03 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1184,17 +1184,13 @@ static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 		/*
 		 * Then see if the DPRX negotiation is ready and if yes
 		 * return that bandwidth (it may be smaller than the
-		 * reduced one). Otherwise return the remote (possibly
-		 * reduced) caps.
+		 * reduced one). According to VESA spec, the DPRX
+		 * negotiation shall compete in 5 seconds after tunnel
+		 * established. We give it 100ms extra just in case.
 		 */
-		ret = tb_dp_wait_dprx(tunnel, 150);
-		if (ret) {
-			if (ret == -ETIMEDOUT)
-				ret = tb_dp_read_cap(tunnel, DP_REMOTE_CAP,
-						     &rate, &lanes);
-			if (ret)
-				return ret;
-		}
+		ret = tb_dp_wait_dprx(tunnel, 5100);
+		if (ret)
+			return ret;
 		ret = tb_dp_read_cap(tunnel, DP_COMMON_CAP, &rate, &lanes);
 		if (ret)
 			return ret;
-- 
2.43.0


