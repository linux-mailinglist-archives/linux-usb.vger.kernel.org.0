Return-Path: <linux-usb+bounces-5247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5F832481
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 07:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8F4F1C23652
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 06:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F3F4C6B;
	Fri, 19 Jan 2024 06:08:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mta22.hihonor.com (mta22.hihonor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED84A0F
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 06:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705644504; cv=none; b=DhWKZEOcPE/SnvaIMb5herJR6Xc+qrTxxUqy9SqZIRbZFjGp/phjhZpdifSqqBCUOTAg/5zdElyqD3M3Eb4iM+6+bHBkn56E7SZucyZIz/s06cCrhyllTcbEOkEOik+rhYiExF3+s/QUG4TQEEF8UFUbpBhPdX/xqThxbI5G8JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705644504; c=relaxed/simple;
	bh=vmFTG4zy92j3FFzGXb7RdXg9ME8+Of7vfRqSq9R5WpQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d7YXeOvauEKbWKMcpKiHi/31Z2Y7q2NxyCkZEn16ZNXkWtn10F8U975uh1Xb2iV+7qHTdbPA03Li+miKojRsoWlVaWfBC0XLlEP+UYUgks0H73OUsqPT1w9LcVLArTbW0ae3dzSg/s52vbmOMxw9EQj10OWJkztmefBlvN92zu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hihonor.com; spf=pass smtp.mailfrom=hihonor.com; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hihonor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hihonor.com
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4TGTDt6782zYm1Cc;
	Fri, 19 Jan 2024 13:48:30 +0800 (CST)
Received: from w025.hihonor.com (10.68.28.69) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Fri, 19 Jan
 2024 13:48:49 +0800
Received: from localhost.localdomain (10.144.17.252) by w025.hihonor.com
 (10.68.28.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Fri, 19 Jan
 2024 13:48:48 +0800
From: yuan linyu <yuanlinyu@hihonor.com>
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, yuan linyu <yuanlinyu@hihonor.com>
Subject: [RFC PATCH] usb: udc: run disconnect callback before pull up zero
Date: Fri, 19 Jan 2024 13:48:13 +0800
Message-ID: <20240119054813.2851201-1-yuanlinyu@hihonor.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-ClientProxiedBy: w003.hihonor.com (10.68.17.88) To w025.hihonor.com
 (10.68.28.69)

When write UDC to empty and unbind gadget driver from gadget device, it is
possible that there are many queue failures for mass storage function.

The root cause is on platform like dwc3, if pull down called first, the
queue operation from mass storage main thread will fail as it is belong to
another thread context and always try to receive a command from host.

In order to fix it, call gadget driver disconnect callback first, mass
storage function driver will disable endpoints and clear running flag,
so there will be no request queue to UDC.

One note is when call disconnect callback first, it mean function will
disable endpoints before stop UDC controller.

Signed-off-by: yuan linyu <yuanlinyu@hihonor.com>
---
 drivers/usb/gadget/udc/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index d59f94464b87..9c48cec89e35 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -774,15 +774,15 @@ static int usb_gadget_disconnect_locked(struct usb_gadget *gadget)
 		goto out;
 	}
 
-	ret = gadget->ops->pullup(gadget, 0);
-	if (!ret)
-		gadget->connected = 0;
-
 	mutex_lock(&udc_lock);
 	if (gadget->udc->driver)
 		gadget->udc->driver->disconnect(gadget);
 	mutex_unlock(&udc_lock);
 
+	ret = gadget->ops->pullup(gadget, 0);
+	if (!ret)
+		gadget->connected = 0;
+
 out:
 	trace_usb_gadget_disconnect(gadget, ret);
 
-- 
2.25.1


