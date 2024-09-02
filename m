Return-Path: <linux-usb+bounces-14496-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA0296889E
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 15:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D8491C223E5
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 13:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBA2201262;
	Mon,  2 Sep 2024 13:22:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E194113CFB7
	for <linux-usb@vger.kernel.org>; Mon,  2 Sep 2024 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283325; cv=none; b=qGMzp+03LbHiujZg4QHnhWOnsAqj3D2vjiaPKK3o792Jt8wI1ty72CkpOtq+zxOWQD0CxIr863SUjLvGq88lRxR2PNzGQRkmxGL5hxXPt0CZadJQUxwRx+sO5bnJ2cYVVUYk+00pRnWBQ/bYnAUK1C2uWdlT1lwv7i85hDt3REw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283325; c=relaxed/simple;
	bh=vHQhynVreLEhBvFxW7ILeNfaXFRSvpYjsD2ETBVYXY0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pkweRVHoZcW34CK8hKUYqqoOOEVELYOC5oPNfI9WzSfLsvCM+hsr2T3gZ3K4CUnx813kX+A8JYhpRjhDYkXCVXOHtUbAtHXvzbDti0GRXHAAh/uQYU/SrFto4ysSOU3EKf+ICqgOYOxiuxeEPdiIZQrEb1wHDcfdvzuzV5dmFyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Wy8Y13yTkz1j81V;
	Mon,  2 Sep 2024 21:21:41 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 48ACA140360;
	Mon,  2 Sep 2024 21:21:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 2 Sep
 2024 21:21:59 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next] usb: f_mass_storage: Make use of the helper macro kthread_run()
Date: Mon, 2 Sep 2024 21:30:24 +0800
Message-ID: <20240902133024.3089400-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500022.china.huawei.com (7.185.36.66)

Repalce kthread_create/wake_up_process() with kthread_run()
to simplify the code.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 drivers/usb/gadget/function/f_mass_storage.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index cfd712fd7452..e11d8c0edf06 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -3050,7 +3050,7 @@ static int fsg_bind(struct usb_configuration *c, struct usb_function *f)
 	if (!common->thread_task) {
 		common->state = FSG_STATE_NORMAL;
 		common->thread_task =
-			kthread_create(fsg_main_thread, common, "file-storage");
+			kthread_run(fsg_main_thread, common, "file-storage");
 		if (IS_ERR(common->thread_task)) {
 			ret = PTR_ERR(common->thread_task);
 			common->thread_task = NULL;
@@ -3059,7 +3059,6 @@ static int fsg_bind(struct usb_configuration *c, struct usb_function *f)
 		}
 		DBG(common, "I/O thread pid: %d\n",
 		    task_pid_nr(common->thread_task));
-		wake_up_process(common->thread_task);
 	}
 
 	fsg->gadget = gadget;
-- 
2.34.1


