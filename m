Return-Path: <linux-usb+bounces-5352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 031AE836122
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 12:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 990721F26CDD
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 11:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24E13D556;
	Mon, 22 Jan 2024 11:08:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0911B3D549
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 11:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921701; cv=none; b=hgEiA1POkDGASZn1BLfeIJfvSvt4ZD374FJ07WunfHASlCb1xhlCwauYFdqaaFYS/d5v5Q0RYImCpIc20wvgYRXQ1Hos4ZwyyHuy02bvo6FCbOn0NXxyw4DBPk4p/1rSgOynJG9ZT2Fs3oiAKfzmgQKDtQXY+VSKW30F7ZT2xXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921701; c=relaxed/simple;
	bh=oEK8kXP2UigoZExAFOPJb+O6+9yQ6vL1guwZf7m/hxg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tzJKeXfXBF6+a6sL0iDniYYbTKGS11PBL9H0Jl7MqthuRqUSbm+xeO4rfk6AoJblIid6T09Mx9h9LSdMwQ5MQGtLR2/ye6eoK9Z7GNezoDczYUQdhbei4Xf+BEGWe6JjD8KginjN6GeT24gPqZCuYMhjwtzWLv7neik3Bw5Nk4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hihonor.com; spf=pass smtp.mailfrom=hihonor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hihonor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hihonor.com
Received: from w003.hihonor.com (unknown [10.68.17.88])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4TJRqb66nDzYqdt2;
	Mon, 22 Jan 2024 18:51:55 +0800 (CST)
Received: from w025.hihonor.com (10.68.28.69) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Mon, 22 Jan
 2024 18:51:56 +0800
Received: from localhost.localdomain (10.144.17.252) by w025.hihonor.com
 (10.68.28.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Mon, 22 Jan
 2024 18:51:56 +0800
From: yuan linyu <yuanlinyu@hihonor.com>
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, yuan linyu <yuanlinyu@hihonor.com>
Subject: [PATCH v1] usb: f_mass_storage: forbid async queue when shutdown happen
Date: Mon, 22 Jan 2024 18:51:38 +0800
Message-ID: <20240122105138.3759477-1-yuanlinyu@hihonor.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To w025.hihonor.com
 (10.68.28.69)

When write UDC to empty and unbind gadget driver from gadget device, it is
possible that there are many queue failures for mass storage function.

The root cause is mass storage main thread alaways try to queue request to
receive a command from host if running flag is on, on platform like dwc3,
if pull down called, it will not queue request again and return
-ESHUTDOWN, but it not affect running flag of mass storage function.

Check return code from mass storage function and clear running flag if it
is -ESHUTDOWN, also indicate start in/out transfer failure to break loops.

Signed-off-by: yuan linyu <yuanlinyu@hihonor.com>
---
v1: follow Alan suggestion, only limit change in f_mass_storage
RFC: https://lore.kernel.org/linux-usb/5f4c9d8b6e0e4e73a5b3b1540a500b6a@hihonor.com/T/#t

 drivers/usb/gadget/function/f_mass_storage.c | 28 +++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 722a3ab2b337..d5174e066078 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -545,21 +545,41 @@ static int start_transfer(struct fsg_dev *fsg, struct usb_ep *ep,
 
 static bool start_in_transfer(struct fsg_common *common, struct fsg_buffhd *bh)
 {
+	int rc;
+
 	if (!fsg_is_set(common))
 		return false;
 	bh->state = BUF_STATE_SENDING;
-	if (start_transfer(common->fsg, common->fsg->bulk_in, bh->inreq))
-		bh->state = BUF_STATE_EMPTY;
+	rc = start_transfer(common->fsg, common->fsg->bulk_in, bh->inreq);
+	if (!rc)
+		return true;
+
+	bh->state = BUF_STATE_EMPTY;
+	if (rc == -ESHUTDOWN) {
+		common->running = 0;
+		return false;
+	}
+
 	return true;
 }
 
 static bool start_out_transfer(struct fsg_common *common, struct fsg_buffhd *bh)
 {
+	int rc;
+
 	if (!fsg_is_set(common))
 		return false;
 	bh->state = BUF_STATE_RECEIVING;
-	if (start_transfer(common->fsg, common->fsg->bulk_out, bh->outreq))
-		bh->state = BUF_STATE_FULL;
+	rc = start_transfer(common->fsg, common->fsg->bulk_out, bh->outreq);
+	if (!rc)
+		return true;
+
+	bh->state = BUF_STATE_FULL;
+	if (rc == -ESHUTDOWN) {
+		common->running = 0;
+		return false;
+	}
+
 	return true;
 }
 
-- 
2.25.1


