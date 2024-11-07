Return-Path: <linux-usb+bounces-17287-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5959BFF37
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 08:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD6762836EB
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 07:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B9A198A32;
	Thu,  7 Nov 2024 07:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F64eJqn+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D911194AD5
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 07:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730965061; cv=none; b=WXL7GzcujouFpSC4BkQq6VTMkw/K9zkwIRBDFOjtvMWhmdE+9hihHqJAR2MfmiU/x2klmL2n7EJLp8fF733RhpATQ8FYFlroTR+nVKxDp6h1gH9SQYf+tqQxP9NJ+FGT7hem/a2P7PduUsPAjH97nWcWZvvk6N+i10/yuJ+acSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730965061; c=relaxed/simple;
	bh=gXvuCCyfm17JLJyqM7NjWakoDhd0RMGAQTY8yxwGmZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pHs7p4zHL0GeTLY0/l9/cxYx42cG250pwzg05E/xLAMib8QJQg0tkQMExuGbqByR4bwg4QyKfToxYHQsaIiFqxh1M0c57jQCFHFY78eRYTFkYLqe+JW9XJ6ztm05xxwOJzr0vt36LlmNN0raYu/S7gy6CceEJR9Puf8W2kaSW1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F64eJqn+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730965060; x=1762501060;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gXvuCCyfm17JLJyqM7NjWakoDhd0RMGAQTY8yxwGmZk=;
  b=F64eJqn+RcCmttFizrVekQ3UaF9zs7cpJFiTcR10fmivI9vYH8p3dlbk
   NCZ5VQBpMlLKPEzwDzgd0pRpBg8Xiixrv9dM1o0ggv/rCgx52pwpyEGGP
   IezjVK1yWa4lZ+/fUiwuwvN71HUmS5+Vjn4ubJr1/jIKWToq3pkw0aIqB
   fqjGPfRDgX4Rd6L0aIPq6gqPGO4/y3oDMh1D83MI9X6rEj8jNRQMT1MPf
   VW5muROfFkE6/r0yNUCpkkb321ZqhO0PlvXvJegOtV0qfa6YgN3AuIo5v
   +4hXWGQ2/xmdWY9cCsP0gVqOFjKtIySC9h9GY29TnUBzLu/fq+YQl9+gy
   Q==;
X-CSE-ConnectionGUID: OlqKnuhcTMiCptzJgoetag==
X-CSE-MsgGUID: dlaDEL+VS8WAchzUfVPdwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41390543"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="41390543"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:37:22 -0800
X-CSE-ConnectionGUID: PO0lNcpYTa+cPUELzflAQg==
X-CSE-MsgGUID: cVqHe0wKQwi68sy1aJ8WBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85155136"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.83.36])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:37:21 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 1/3] usb: misc: ljca: move usb_autopm_put_interface() after wait for response
Date: Thu,  7 Nov 2024 08:37:16 +0100
Message-Id: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not mark interface as ready to suspend when we are still waiting
for response messages from the device.

Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
Cc: stable@vger.kernel.org
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
v2: fix handing error of usb_autopm_get_interface(),
    add R-b, T-b tags from Hans
v3: add A-b tag from Sakari

 drivers/usb/misc/usb-ljca.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index 01ceafc4ab78..8056c65e4548 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -332,14 +332,11 @@ static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
 
 	ret = usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
 			   msg_len, &transferred, LJCA_WRITE_TIMEOUT_MS);
-
-	usb_autopm_put_interface(adap->intf);
-
 	if (ret < 0)
-		goto out;
+		goto out_put;
 	if (transferred != msg_len) {
 		ret = -EIO;
-		goto out;
+		goto out_put;
 	}
 
 	if (ack) {
@@ -347,11 +344,14 @@ static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
 						  timeout);
 		if (!ret) {
 			ret = -ETIMEDOUT;
-			goto out;
+			goto out_put;
 		}
 	}
 	ret = adap->actual_length;
 
+out_put:
+	usb_autopm_put_interface(adap->intf);
+
 out:
 	spin_lock_irqsave(&adap->lock, flags);
 	adap->ex_buf = NULL;
-- 
2.34.1


