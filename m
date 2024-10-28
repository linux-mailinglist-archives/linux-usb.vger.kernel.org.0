Return-Path: <linux-usb+bounces-16752-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C969B23C1
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 04:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D80CA1C210DA
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 03:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26746189BAC;
	Mon, 28 Oct 2024 03:57:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BCAA47
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 03:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087878; cv=none; b=DQDBsRfx6kC/Oo4Lqsh5p2WGsZ26upxm7e8LrOia4rdiTmkg1bHlsRg2SLtMeIvN746yW/Kq0qClwgwwIiNpuQwtqkQbd/gxAbX0y3I6yHn/TTV+MGde071oDwOzPG2fgu3FKvHZ4zcn4npu3C+70JPDiyhgl/DiZyZisnLG2RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087878; c=relaxed/simple;
	bh=U5o+A6FtyhHPI8sB8V2p3G1rscSav/dmg1AQ+1ZmDx4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mrUuW4o3KRVMHXdl81VgYtfL2qdmlsdpVAys6zZmk2Yl6ni8dt4CKxWqtD8RG77yuACsDo9TQ1l1xVXaqjwYAs6ew+J5MEmUyAvDytvT43/XA6aYFLVp2lol1fJf5wEME8Axo46hdlLuxmROS1EI2DmxlY3LBGTFGoXYkc0UnCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XcKLt6my8z2Dbyv;
	Mon, 28 Oct 2024 11:56:22 +0800 (CST)
Received: from kwepemk200016.china.huawei.com (unknown [7.202.194.82])
	by mail.maildlp.com (Postfix) with ESMTPS id 252D5140202;
	Mon, 28 Oct 2024 11:57:52 +0800 (CST)
Received: from huawei.com (10.67.174.78) by kwepemk200016.china.huawei.com
 (7.202.194.82) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 28 Oct
 2024 11:57:51 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <pawell@cadence.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <wangweiyang2@huawei.com>
Subject: [PATCH] usb: cdns2: fix possible null-ptr-deref in cdns2_gadget_ep_queue()
Date: Mon, 28 Oct 2024 03:50:28 +0000
Message-ID: <20241028035028.2657102-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk200016.china.huawei.com (7.202.194.82)

The cdns2_gadget_ep_alloc_request() will return NULL when kzalloc() fails,
fix possible null-ptr-deref by check return value.

Fixes: 3eb1f1efe204 ("usb: cdns2: Add main part of Cadence USBHS driver")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
index 62fce42ef2da..c06a50af268e 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
@@ -1724,6 +1724,10 @@ static int cdns2_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
 		struct cdns2_request *preq;
 
 		zlp_request = cdns2_gadget_ep_alloc_request(ep, GFP_ATOMIC);
+		if (!zlp_request) {
+			spin_unlock_irqrestore(&pdev->lock, flags);
+			return -ENOMEM;
+		}
 		zlp_request->buf = pdev->zlp_buf;
 		zlp_request->length = 0;
 
-- 
2.25.1


