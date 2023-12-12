Return-Path: <linux-usb+bounces-4024-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F4780E8F9
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 11:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68D5F1F21909
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 10:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04E75B5C2;
	Tue, 12 Dec 2023 10:21:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698A8A6;
	Tue, 12 Dec 2023 02:21:02 -0800 (PST)
X-UUID: 67f0c0c141af49b2b31f65256adb42e5-20231212
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:bb989384-f8f7-4514-935c-f823e8747b45,IP:5,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-10
X-CID-INFO: VERSION:1.1.33,REQID:bb989384-f8f7-4514-935c-f823e8747b45,IP:5,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-10
X-CID-META: VersionHash:364b77b,CLOUDID:12441b61-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:2312121820440JAM3HPF,BulkQuantity:0,Recheck:0,SF:66|24|17|19|44|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: 67f0c0c141af49b2b31f65256adb42e5-20231212
X-User: shitao@kylinos.cn
Received: from kylin-pc.. [(112.64.161.44)] by mailgw
	(envelope-from <shitao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 205230405; Tue, 12 Dec 2023 18:20:42 +0800
From: shitao <shitao@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: alcooperx@gmail.com,
	chunfeng.yun@mediatek.com,
	justin.chen@broadcom.com,
	kernel-bot@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	shitao@kylinos.cn
Subject: [PATCH] usb: gadget: udc: bdc: fix comment typo
Date: Tue, 12 Dec 2023 18:19:55 +0800
Message-Id: <20231212101955.3115267-1-shitao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2023121236-earful-email-ea09@gregkh>
References: <2023121236-earful-email-ea09@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix comment typo in bdc_core.c file.
"dynamic" is misspelled as "dyanmic".

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: shitao <shitao@kylinos.cn>
---
 drivers/usb/gadget/udc/bdc/bdc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 35a652807fca..874122f8baa3 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -361,7 +361,7 @@ int bdc_reinit(struct bdc *bdc)
 	return ret;
 }
 
-/* Allocate all the dyanmic memory */
+/* Allocate all the dynamic memory */
 static int bdc_mem_alloc(struct bdc *bdc)
 {
 	u32 page_size;
-- 
2.34.1


