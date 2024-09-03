Return-Path: <linux-usb+bounces-14505-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3226F9690FB
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 03:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5949284194
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 01:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3441C68B0;
	Tue,  3 Sep 2024 01:34:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1997C13D51C
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 01:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725327269; cv=none; b=j+1txl54hk0aCQ7icXcTjNIxUIIIKxex/6JWA/3d4bYURBfomE4hNzygwfBYkxQUGTKL151QdnEXCyVkJCjLLbqb9Ws+SCXPpEt4TxFSNRiXC6oxk7Q3b4M5CoD0hUF9zWVC3RuL9JFmF94ZbJJNdqyyw+kKHDejQiHjfs0FbPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725327269; c=relaxed/simple;
	bh=RNhcyOjC145Ca/HEXPwA4H4EtCCvjpvwptxmx1w0ZkQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lLnLyk+H2lhskyrVVHOwnp9HYir91Uek3RQsqXsna3NwFUVmUTHAUAOqK2OGUe048y1p7NF3q2ODMPvVvwYpYWnj/OPL4/blzVR/9XWgLFq5/H0+pzB9EdiE7GZF+pLuOiE14UFar3ZomVP/HX3dZrTCcPapJAaauJsmfclRnsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WySmJ4m9KzpTwP;
	Tue,  3 Sep 2024 09:32:32 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A026180087;
	Tue,  3 Sep 2024 09:34:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 3 Sep
 2024 09:34:22 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
	<sergei.shtylyov@gmail.com>
CC: <linux-usb@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next v2] usb: f_mass_storage: Make use of the helper macro kthread_run()
Date: Tue, 3 Sep 2024 09:42:49 +0800
Message-ID: <20240903014249.3098082-1-lihongbo22@huawei.com>
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

Replace kthread_create/wake_up_process() with kthread_run()
to simplify the code.

Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

---
v2:
  - Change the misspelled word: s/Repalce/Replace/

v1: https://yhbt.net/lore/linux-usb/3b404347-dee0-6dfc-9fac-ec4abedb13f1@gmail.com/T/#t
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


