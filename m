Return-Path: <linux-usb+bounces-9442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 652518A9241
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 07:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964B91C21F2E
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 05:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8C654913;
	Thu, 18 Apr 2024 05:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibw5hbC/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE382E62C
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 05:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713416788; cv=none; b=DB2MfUFBP6VmFfXyJSeoWLpZY3cakUEaaAmNfiao6E1riz/8KozbScFsGebLcizFctA9cGLADKrDXWFTI/bM0+mDbpdHK2jRihkLq7rvye4zq5XWgKfnLbcDRm/8K3RnaYIcOv8M+zZmiOOr3o7OcOFZ+59Zx9sWqKU2XlHO5Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713416788; c=relaxed/simple;
	bh=hJWZUGOENnOzFEF7zWRtTo5qryPDnOfTmDK+xXAHgSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuDt9hOtFWnPtInqoeD0fLprcswVjqGkrtjL267y1IpySx/5ivm/CegUBDgvZ45cBo40a/C2hka4JiyXZi3JYHA6RxRDlO3ASW/qq2MWvmWucjxLnlP1j8aWShU5HocZdbvDDPj4kJznjkcedwtwRTJ8mIJ60XrvKIui97+B/uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibw5hbC/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713416787; x=1744952787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hJWZUGOENnOzFEF7zWRtTo5qryPDnOfTmDK+xXAHgSg=;
  b=ibw5hbC/7vecEjBpVKlHeZWAR46a5t5BZ2+2t8BuLtqIxal18X1wlN2H
   zlHJojWw0ULPfWF2lXeeP1YKGQwL7McxXPDiLANSwZOi82/1CaPmMJjka
   UqEfgxibARrgImALRrw8DDifAxEFCctcbz+A6PFFJJ9ZyrHzCWN33Vm/N
   w5epj8p5sJEnBgs3voYTic0LUWJUSm8Woozgt8GVgZ7V8vElUoW9nVN46
   NNacguVQkkzFhp6xBY+iOwsyE3ka74766evfnfbKWk64YUc0NOVHWv+IU
   Y2uVzMMalxMNsCR8JZfqrhdvjm2/lRnvWglkElhd2zoIkeW+7gocp/BEr
   Q==;
X-CSE-ConnectionGUID: Q7iOCCWeSHi+9+UWGLdz9w==
X-CSE-MsgGUID: 2j0gd9tzSvSoOB+t5ZrOCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9108480"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="9108480"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 22:06:26 -0700
X-CSE-ConnectionGUID: /yMy2JagQ6WVHSuOK60ITA==
X-CSE-MsgGUID: 2WAKd+laS1OF5bm7HmMhEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="60285962"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 17 Apr 2024 22:06:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 2CE6086; Thu, 18 Apr 2024 08:06:23 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] thunderbolt: No need to loop over all retimers if access fails
Date: Thu, 18 Apr 2024 08:06:22 +0300
Message-ID: <20240418050623.3157002-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418050623.3157002-1-mika.westerberg@linux.intel.com>
References: <20240418050623.3157002-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When we read the NVM authentication status or unsetting the inbound SBTX
there is no point to continue the loop after first access to a retimer
fails because there won't be any more retimers after this anyway so bail
out from the loops early.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 6bb49bdcd6c1..6eaaa5074ce8 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -199,8 +199,10 @@ static void tb_retimer_nvm_authenticate_status(struct tb_port *port, u32 *status
 	 * If the retimer has it set, store it for the new retimer
 	 * device instance.
 	 */
-	for (i = 1; i <= TB_MAX_RETIMER_INDEX; i++)
-		usb4_port_retimer_nvm_authenticate_status(port, i, &status[i]);
+	for (i = 1; i <= TB_MAX_RETIMER_INDEX; i++) {
+		if (usb4_port_retimer_nvm_authenticate_status(port, i, &status[i]))
+			break;
+	}
 }
 
 static void tb_retimer_set_inbound_sbtx(struct tb_port *port)
@@ -234,8 +236,10 @@ static void tb_retimer_unset_inbound_sbtx(struct tb_port *port)
 
 	tb_port_dbg(port, "disabling sideband transactions\n");
 
-	for (i = TB_MAX_RETIMER_INDEX; i >= 1; i--)
-		usb4_port_retimer_unset_inbound_sbtx(port, i);
+	for (i = TB_MAX_RETIMER_INDEX; i >= 1; i--) {
+		if (usb4_port_retimer_unset_inbound_sbtx(port, i))
+			break;
+	}
 }
 
 static ssize_t nvm_authenticate_store(struct device *dev,
-- 
2.43.0


