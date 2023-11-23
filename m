Return-Path: <linux-usb+bounces-3223-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AD47F569D
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 03:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96CBB1C20CEA
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 02:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C42B46BD;
	Thu, 23 Nov 2023 02:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E97101;
	Wed, 22 Nov 2023 18:53:47 -0800 (PST)
X-UUID: 7d5fb57093db448c974e807b2d285c27-20231123
X-CID-O-RULE: Release_Ham
X-CID-RULE: EDM_GE969F26
X-CID-O-INFO: VERSION:1.1.32,REQID:70f420c1-b88e-4ea1-82e4-019a6041019e,IP:15,
	URL:0,TC:0,Content:0,EDM:-25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-15
X-CID-INFO: VERSION:1.1.32,REQID:70f420c1-b88e-4ea1-82e4-019a6041019e,IP:15,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:-5,FILE:0,BULK:0,RULE:EDM_GE969F26,ACTI
	ON:release,TS:-15
X-CID-META: VersionHash:5f78ec9,CLOUDID:9436f872-1bd3-4f48-b671-ada88705968c,B
	ulkID:231123102511SQXRFV44,BulkQuantity:1,Recheck:0,SF:66|38|24|72|19|44|1
	02,TC:nil,Content:0,EDM:1,IP:-2,URL:0,File:nil,Bulk:41,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-UUID: 7d5fb57093db448c974e807b2d285c27-20231123
X-User: shitao@kylinos.cn
Received: from kylin-pc.. [(112.64.161.44)] by mailgw
	(envelope-from <shitao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1164908357; Thu, 23 Nov 2023 10:53:34 +0800
From: shitao <shitao@kylinos.cn>
To: justin.chen@broadcom.com,
	alcooperx@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shitao <shitao@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] usb: Correct misspelling comment word dynamic
Date: Thu, 23 Nov 2023 10:53:13 +0800
Message-Id: <20231123025313.2565268-1-shitao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The word 'dyanmic' on comment of struct tcp_error is misspelled.
Correct it to be 'dynamic', avoiding confusing other developers.

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


