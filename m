Return-Path: <linux-usb+bounces-17454-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 465539C5008
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 08:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90037B21EB8
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 07:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7014420BB23;
	Tue, 12 Nov 2024 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLzFJdR9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC171990AF
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 07:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731398121; cv=none; b=YcecqL1ddLUZHlKRjVXkgqR88w6+emMkRuV4pprZb6z/h0gjBqO3GxdqFp14PUzXMk/Gj/RZx31tINdMZ18CtK2wBS7WIHyDcdLhhnAj6r67g/ZpptEByogbhpbysf3PVcPnOCJNEMWpcVwbFh7Lqid+fQVIMqT5gbCLqPXtjgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731398121; c=relaxed/simple;
	bh=BlH+9tn2R1y+wkh7a/e0MgzMOWgQlmCJcSO5ZHAmeKM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AR1oG8ckdx04UWDVvlFXxPRVWxkKa8FEZtiucP/Lbkj6l+2IYCVc5n5Yy+Ij6AOAXsH8JSY44zr3IoNeKT7JxSEPKTEEGbOHbVAupfW/a/fq3JhOp1naImkGNYXXxgwvR0sT3f/A52Dnd39JnqC5QUdhOgHOZmsqSpFraGSUf3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLzFJdR9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731398120; x=1762934120;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BlH+9tn2R1y+wkh7a/e0MgzMOWgQlmCJcSO5ZHAmeKM=;
  b=QLzFJdR9FLULnzMdtlRXss9Omzp1hO6BiiXmAxZA1uy5LJF02SLXRFUr
   hB21B4lBavmnuCqcohUbY6mvGOUwLJiT71Cn4N7Y1eL7YtA53HyMEvMjQ
   MQBG35PitGimYRxt/aLaF2e1w/QIIFa/7cg7ymgCbogwZG73jIc4nBRl/
   vo6QKWKIlxCdYRsCB18fQWxnPMT/Knbzu91pmJM4u84FCqF9KvLwxfXgi
   vSGU340QL5KV0EvVuu4hVCaWDgfVGmrO1uqgeJEt2PSWuqiXUJlcU9/pP
   aC7xkCgWLCCV+JZYmgyh91JKVHP5yBUvAGy1cQJkUPW0g5zbJhtl3rjej
   w==;
X-CSE-ConnectionGUID: AAWiQH4wQDWKQJMkw1O/vw==
X-CSE-MsgGUID: /Lfg2CZIR4uLEpG6QuCuFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="35003192"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="35003192"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 23:55:19 -0800
X-CSE-ConnectionGUID: tnOfJVLdS9uLrkKuI2ylyg==
X-CSE-MsgGUID: vnwls4wtQxu0LyPJGn4/UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="110597820"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.8.237])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 23:55:17 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 1/3] usb: misc: ljca: move usb_autopm_put_interface() after wait for response
Date: Tue, 12 Nov 2024 08:55:12 +0100
Message-Id: <20241112075514.680712-1-stanislaw.gruszka@linux.intel.com>
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
v3 -> v4: no change in this patch
v2 -> v3: add A-b tag from Sakari
v1 -> v2: fix handing error of usb_autopm_get_interface(),
          add R-b, T-b tags from Hans

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


