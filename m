Return-Path: <linux-usb+bounces-16688-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A39AFA5A
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 08:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84A29283C42
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 06:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E7D1A7ADE;
	Fri, 25 Oct 2024 06:52:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEED1175D5D
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 06:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729839141; cv=none; b=HzgrbX/TesSC5bfX3VehwXFk/eSwX0i85QRM0HsmWKzu9jafNN+uS5VW2m8n+JyjmoTKD3vN3tTQ3IRvpK9HM8YGEfhB2C2edG0Y7QApQOteSvSLuSs78/w8qkqGhCQhvzl/asfzrawFRrBWtcUBqUZVTj0YiV9YyPNMXDAeNAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729839141; c=relaxed/simple;
	bh=iCWj6sVUqOXbsNqNixtvvkdSWeqwOsoWqDpFi9QlmsM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iTP/fAVihBtI/YbnQeqWlA9IX0QPYzkbGHNyeHW30q6cEjL835oN0z9cutjZKHmKYkn0747SjhoGLt57UX4d8jMo0ndtNCnnc4V11irihNllVOvpzdBS5qZwlZZ47pDDDCq4M/mqjnW4lb4sec3VhH8C/z22b0B4HXiPwIajumY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XZYNp4Db8z4f3lVx
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 14:51:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id E142E1A018D
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 14:52:12 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP4 (Coremail) with SMTP id gCh0CgDHRsMQQBtnr2RAFA--.62886S2;
	Fri, 25 Oct 2024 14:52:12 +0800 (CST)
From: Chen Ridong <chenridong@huaweicloud.com>
To: peter.chen@kernel.org,
	pawell@cadence.com,
	rogerq@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	chenridong@huawei.com,
	wangweiyang2@huawei.com
Subject: [PATCH] usb: cdns3: avoid possible null_ptr_deref in cdns3_gadget_ep_queue
Date: Fri, 25 Oct 2024 06:43:31 +0000
Message-Id: <20241025064331.1049538-1-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgDHRsMQQBtnr2RAFA--.62886S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw17Xry7tF4fuFW8Xw4ktFb_yoWDXFX_Cw
	18uwnrKrW5X34kJw15C343Cry0kFsrZ3WDXFsrKa43A34jgrs7Cry8Zrn5CF17ZF4xGr1k
	A34rKanxuFnxtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUwxhLUUUUU
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/

From: Chen Ridong <chenridong@huawei.com>

The cdns3_gadget_ep_alloc_request functions may return NULL
when memory is out of use. To void possible null_ptr_deref,
return ENOMEM when cdns3_gadget_ep_alloc_request returns NULL.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 drivers/usb/cdns3/cdns3-gadget.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index fd1beb10bba7..982e8e0759e8 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -2657,6 +2657,10 @@ static int cdns3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
 		struct cdns3_request *priv_req;
 
 		zlp_request = cdns3_gadget_ep_alloc_request(ep, GFP_ATOMIC);
+		if (!zlp_request) {
+			spin_unlock_irqrestore(&priv_dev->lock, flags);
+			return -ENOMEM;
+		}
 		zlp_request->buf = priv_dev->zlp_buf;
 		zlp_request->length = 0;
 
-- 
2.34.1


