Return-Path: <linux-usb+bounces-5392-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EE5838629
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 04:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 303BA1C2764C
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 03:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4040F17FE;
	Tue, 23 Jan 2024 03:48:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E5417CA
	for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 03:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705981720; cv=none; b=Wms9Rf8YIuj1EUoQDHPssUQB5BtNpEFShv6jPwd7RCMsyfIYoxPH/vot1cp+cy6ogwwYZextxXalJYFJIYnQ2BQhptzGaTixdJl9tQnQvvw0YIlDw0kEqsXLEI+cj3gFuW+1cicwAsggs/bbDYzd5nKiF4nHkgBszcGcUcNL6oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705981720; c=relaxed/simple;
	bh=yK6w78PCAB7c6lXxCOumjOjASWiEVrOa6pCqmIxZPOo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cVlz/Q9rwadtXyJGu/A4RVdIcxcl3JdmJg6B7RO9eqNdK6TNiHcQWAm8XenxJhy7gUmzNtkBQkZ1QkVN2pSaichSQN+6xkNYyIaUIf6DTIGuirwnA6e1OLqPzoYPJSvuEaK4U4TApwk1W6/lxMi0ntrWaXwItU8Na68KO9aauuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hihonor.com; spf=pass smtp.mailfrom=hihonor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hihonor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hihonor.com
Received: from w013.hihonor.com (unknown [10.68.26.19])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4TJtNf2cj6zYkyMG;
	Tue, 23 Jan 2024 11:48:34 +0800 (CST)
Received: from w025.hihonor.com (10.68.28.69) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Tue, 23 Jan
 2024 11:48:35 +0800
Received: from localhost.localdomain (10.144.17.252) by w025.hihonor.com
 (10.68.28.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Tue, 23 Jan
 2024 11:48:35 +0800
From: yuan linyu <yuanlinyu@hihonor.com>
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, yuan linyu <yuanlinyu@hihonor.com>, stable
	<stable@kernel.org>
Subject: [PATCH v3] usb: f_mass_storage: forbid async queue when shutdown happen
Date: Tue, 23 Jan 2024 11:48:29 +0800
Message-ID: <20240123034829.3848409-1-yuanlinyu@hihonor.com>
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

Cc: stable <stable@kernel.org>
Signed-off-by: yuan linyu <yuanlinyu@hihonor.com>
---
v3: add Cc: stable <stable@kernel.org>
v2: fix comments, only change coding style, no function change
    https://lore.kernel.org/linux-usb/20240123032641.3846713-1-yuanlinyu@hihonor.com/
v1: follow Alan suggestion, only limit change in f_mass_storage
    https://lore.kernel.org/linux-usb/20240122105138.3759477-1-yuanlinyu@hihonor.com/
RFC: https://lore.kernel.org/linux-usb/5f4c9d8b6e0e4e73a5b3b1540a500b6a@hihonor.com/T/#t

 drivers/usb/gadget/function/f_mass_storage.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 722a3ab2b337..c265a1f62fc1 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -545,21 +545,37 @@ static int start_transfer(struct fsg_dev *fsg, struct usb_ep *ep,
 
 static bool start_in_transfer(struct fsg_common *common, struct fsg_buffhd *bh)
 {
+	int rc;
+
 	if (!fsg_is_set(common))
 		return false;
 	bh->state = BUF_STATE_SENDING;
-	if (start_transfer(common->fsg, common->fsg->bulk_in, bh->inreq))
+	rc = start_transfer(common->fsg, common->fsg->bulk_in, bh->inreq);
+	if (rc) {
 		bh->state = BUF_STATE_EMPTY;
+		if (rc == -ESHUTDOWN) {
+			common->running = 0;
+			return false;
+		}
+	}
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
+	rc = start_transfer(common->fsg, common->fsg->bulk_out, bh->outreq);
+	if (rc) {
 		bh->state = BUF_STATE_FULL;
+		if (rc == -ESHUTDOWN) {
+			common->running = 0;
+			return false;
+		}
+	}
 	return true;
 }
 
-- 
2.25.1


