Return-Path: <linux-usb+bounces-16735-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 361439B1719
	for <lists+linux-usb@lfdr.de>; Sat, 26 Oct 2024 12:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD626B2310E
	for <lists+linux-usb@lfdr.de>; Sat, 26 Oct 2024 10:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4FC1D0E23;
	Sat, 26 Oct 2024 10:35:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C1018787E
	for <linux-usb@vger.kernel.org>; Sat, 26 Oct 2024 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729938910; cv=none; b=MUWuRSyLv7FttBdKG/jrTqdR5f6jrK9bMhztcZiVIQjjiSAzK09Vrat0By2bqcIMbhDWGsKt7GH57ICtUICDotJKVr7LPuPJdqfolPErX5S4PKoLHvlhgvDyPev4meD8tIVbbR/WcjIRgZyQRu04QUqk9YVzShqsUuazRqFIeO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729938910; c=relaxed/simple;
	bh=b112FW0Hc46ec0x8GLfCTwX0RIWbfrae+g7NOKjZtXo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OtdqVsk+UojKcPWxJdvg6ldOI1zD6S3S8QhvSaBWvk1jRzkT2a+NbkezOfinr8E4797r3Kla0540plR8845/mChD0enH3Sm+pXROegNadE/zQVPO4ddiVJH2UH/mHo/d5EqB/hpGNk31PIZkBPq3K6UCBQpQcgIRDcgaAlYHRkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XbGG86bBZz1SD9S;
	Sat, 26 Oct 2024 18:33:36 +0800 (CST)
Received: from kwepemk200016.china.huawei.com (unknown [7.202.194.82])
	by mail.maildlp.com (Postfix) with ESMTPS id 7D7381A016C;
	Sat, 26 Oct 2024 18:35:04 +0800 (CST)
Received: from huawei.com (10.67.174.78) by kwepemk200016.china.huawei.com
 (7.202.194.82) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 26 Oct
 2024 18:35:03 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <gregkh@linuxfoundation.org>, <kees@kernel.org>, <justinstitt@google.com>,
	<u.kleine-koenig@baylibre.com>, <yuxu@marvell.com>, <balbi@ti.com>
CC: <linux-usb@vger.kernel.org>, <wangweiyang2@huawei.com>
Subject: [PATCH] usb: gadget: udc: fix possible null-ptr-deref in mv_u3d_req_to_trb()
Date: Sat, 26 Oct 2024 10:27:40 +0000
Message-ID: <20241026102740.2653458-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk200016.china.huawei.com (7.202.194.82)

The mv_u3d_build_trb_one() will return NULL when kzalloc() fails, fix
possible null-ptr-deref by add check for mv_u3d_build_trb_one().

Fixes: 3d4eb9dfa3e8 ("usb: gadget: mv: Add USB 3.0 device driver for Marvell PXA2128 chip.")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
 drivers/usb/gadget/udc/mv_u3d_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/udc/mv_u3d_core.c b/drivers/usb/gadget/udc/mv_u3d_core.c
index 062f43e146aa..c882c377c4f4 100644
--- a/drivers/usb/gadget/udc/mv_u3d_core.c
+++ b/drivers/usb/gadget/udc/mv_u3d_core.c
@@ -417,6 +417,8 @@ static int mv_u3d_req_to_trb(struct mv_u3d_req *req)
 	 */
 	if (length <= (unsigned)MV_U3D_EP_MAX_LENGTH_TRANSFER) {
 		trb = mv_u3d_build_trb_one(req, &count, &dma);
+		if (!trb)
+			return -ENOMEM;
 		list_add_tail(&trb->trb_list, &req->trb_list);
 		req->trb_head = trb;
 		req->trb_count = 1;
-- 
2.25.1


