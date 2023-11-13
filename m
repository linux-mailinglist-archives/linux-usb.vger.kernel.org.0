Return-Path: <linux-usb+bounces-2832-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2632A7EA01A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 16:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC8DF280E17
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 15:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516BE219EC;
	Mon, 13 Nov 2023 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B98221358
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 15:35:43 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F99AD63;
	Mon, 13 Nov 2023 07:35:40 -0800 (PST)
X-UUID: 487f275e4dfa444babf50090781c4288-20231113
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:b64ec300-1827-4b58-ba5f-a43393d2cc7e,IP:15,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-INFO: VERSION:1.1.32,REQID:b64ec300-1827-4b58-ba5f-a43393d2cc7e,IP:15,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:25
X-CID-META: VersionHash:5f78ec9,CLOUDID:18719972-1bd3-4f48-b671-ada88705968c,B
	ulkID:2311132329433XNC9A73,BulkQuantity:1,Recheck:0,SF:44|66|38|24|17|19|1
	02,TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 487f275e4dfa444babf50090781c4288-20231113
X-User: chentao@kylinos.cn
Received: from vt.. [(116.128.244.169)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 616791189; Mon, 13 Nov 2023 23:35:23 +0800
From: Kunwu Chan <chentao@kylinos.cn>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	quic_wcheng@quicinc.com
Cc: kunwu.chan@hotmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH] usb: dwc3: Fix an issue that using pm_runtime_get_sync incorrectly
Date: Mon, 13 Nov 2023 23:35:15 +0800
Message-Id: <20231113153515.751823-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_get_sync() also returns 1 on success.
The documentation for pm_runtime_get_sync() suggests using
pm_runtime_resume_and_get() instead.

Fixes: 77adb8bdf422 ("usb: dwc3: gadget: Allow runtime suspend if UDC unbinded")
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 858fe4c299b7..0330de73cd9c 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2745,7 +2745,7 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
 	 * successful resume, the DWC3 runtime PM resume routine will handle
 	 * the run stop sequence, so avoid duplicate operations here.
 	 */
-	ret = pm_runtime_get_sync(dwc->dev);
+	ret = pm_runtime_resume_and_get(dwc->dev);
 	if (!ret || ret < 0) {
 		pm_runtime_put(dwc->dev);
 		if (ret < 0)
-- 
2.34.1


