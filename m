Return-Path: <linux-usb+bounces-25967-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D17B0AE0F
	for <lists+linux-usb@lfdr.de>; Sat, 19 Jul 2025 06:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0B7F3A9451
	for <lists+linux-usb@lfdr.de>; Sat, 19 Jul 2025 04:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E3821D3C0;
	Sat, 19 Jul 2025 04:56:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF51F3B89;
	Sat, 19 Jul 2025 04:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752900979; cv=none; b=UdG5d0rAfNOLzUt8UJrddDR0bdSLjgLgGsrYarRCZV7Wh1iUS4T+Yx15jMGS9yQnukeSVeaqPtEY66VkuESZi4L3nZQ12Wc8UftRS1lp+yIiltvUWgsBozJw7N2WYPZSvQHGxWm/Tzt7rXOiXiRxVu8CaYukEe7e1YS5+8mLf1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752900979; c=relaxed/simple;
	bh=1OlVkAKdGNnvMEPx92h5uqRH+WN5++SDwId91M9R8BI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qxn6aFiFxwW6yNNGlFef7paG2bTZLIgHowaZhSwlGVhQUUfQ7fDM7ImXSfGwSI5j7ZSJ7yAXwo7N69m4w3Xvc5p9rptFVN4UbeIFT3PMu3pSTSGwX57fUNY1wWejce+33pxYc0OYY01QDtdBZKq31Mel+9JtFl3DyTHSrSAv0Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bkZ4Z0XcBz14LxM;
	Sat, 19 Jul 2025 12:51:26 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F44D14020C;
	Sat, 19 Jul 2025 12:56:14 +0800 (CST)
Received: from vm7-217-32-6.huawei.com (7.217.32.6) by
 kwepemk100018.china.huawei.com (7.202.194.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 19 Jul 2025 12:56:13 +0800
From: Tao Xue <xuetao09@huawei.com>
To: <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
	<prashanth.k@oss.qualcomm.com>, <m.grzeschik@pengutronix.de>,
	<Chris.Wulff@biamp.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <caiyadong@huawei.com>, <suzhuangluan@hisilicon.com>,
	<weiwenwen3@huawei.com>
Subject: [PATCH] usb: gadget : fix use-after-free in composite_dev_cleanup()
Date: Sat, 19 Jul 2025 12:56:12 +0800
Message-ID: <20250719045612.10739-1-xuetao09@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk100018.china.huawei.com (7.202.194.66)

The pointer cdev->os_desc_req need to be set null when kmalloc failed in
composite_os_desc_req_prepare(),otherwise the use-after-free issue will
be encountered in composite_dev_cleanup()

BUG: KASAN: use-after-free in composite_dev_cleanup+0xf4/0x2c0
Read of size 8 at addr 0000004827837a00 by task init/1

CPU: 10 PID: 1 Comm: init Tainted: G           O      5.10.97-oh #1
 kasan_report+0x188/0x1cc
 __asan_load8+0xb4/0xbc
 composite_dev_cleanup+0xf4/0x2c0
 configfs_composite_bind+0x210/0x7ac
 udc_bind_to_driver+0xb4/0x1ec
 usb_gadget_probe_driver+0xec/0x21c
 gadget_dev_desc_UDC_store+0x264/0x27c

Fixes: 37a3a533429e ("usb: gadget: OS Feature Descriptors support")
Signed-off-by: Tao Xue <xuetao09@huawei.com>
Signed-off-by: weiwenwen <weiwenwen3@huawei.com>
---
 drivers/usb/gadget/composite.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 8dbc132a505e..385398a039ea 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2489,6 +2489,7 @@ int composite_os_desc_req_prepare(struct usb_composite_dev *cdev,
 	if (!cdev->os_desc_req->buf) {
 		ret = -ENOMEM;
 		usb_ep_free_request(ep0, cdev->os_desc_req);
+		cdev->os_desc_req = NULL;
 		goto end;
 	}
 	cdev->os_desc_req->context = cdev;
-- 
2.17.1


