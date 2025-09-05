Return-Path: <linux-usb+bounces-27577-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6C9B453C2
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 11:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6376A60FB7
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 09:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A41A28BA83;
	Fri,  5 Sep 2025 09:49:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2A92777FE
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 09:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757065758; cv=none; b=gXzwKPGmqXWOpjxisRcRHmCUR6WKJerkbN8VdUrNbglB8mRA+2B+4zTOxWMp5XaR8kbMPT1NmjplfuaIggDR8EhlV/DnnslINFfFyWtBhRoimkaME63OMzyYawTX/8gZUHJCZj2TCgIVA+2gOemzsJ6qZLDvasm706KYi0fZtW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757065758; c=relaxed/simple;
	bh=kZ70zfrO6Xb/o+PqCbl2KixYQYlxecOgBAnFmZIBOZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e2PbCcdGCIA9eXv1TaZH1r/7/bkaj4+OyUt0nSr16PhfLbvIWFkcwygUEY3rorDKjZsY+jPUInLpSmmen0/3+TS2heLLH4jiniqkhUbakz5j7ZYwJU7EtXNbnIXWAZ7wjIgXrejRXwLay93Qh0SZE8Jidxgqa/ET7MHhEdnPfEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iie.ac.cn; spf=pass smtp.mailfrom=iie.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iie.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iie.ac.cn
Received: from localhost.localdomain (unknown [159.226.95.28])
	by APP-03 (Coremail) with SMTP id rQCowADn+4UJsrpos2rIAA--.986S2;
	Fri, 05 Sep 2025 17:48:58 +0800 (CST)
From: Chen Yufeng <chenyufeng@iie.ac.cn>
To: pawell@cadence.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Chen Yufeng <chenyufeng@iie.ac.cn>
Subject: [PATCH] usb: cdns3: gadget: Use-after-free during failed initialization and exit of cdnsp gadget
Date: Fri,  5 Sep 2025 17:48:42 +0800
Message-ID: <20250905094842.1232-1-chenyufeng@iie.ac.cn>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADn+4UJsrpos2rIAA--.986S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar43Xw1UXr4fCF1UWF45Jrb_yoW8CFy5pa
	98JFWIkrsrArZ8trnrJr4DZrWrJw4jvrn7KF92kw42vF1fJw1kGF1DAr1rKF4xuFykJr45
	ta1v93W09F4I9wUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUka14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFWl
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUIhFcUUUUU=
X-CM-SenderInfo: xfkh05xxih0wo6llvhldfou0/1tbiDAgQEmi6oeEvOgABsA

In the __cdnsp_gadget_init() and cdnsp_gadget_exit() functions, the gadget 
structure (pdev->gadget) was freed before its endpoints.
The endpoints are linked via the ep_list in the gadget structure. 
Freeing the gadget first leaves dangling pointers in the endpoint list.
When the endpoints are subsequently freed, this results in a use-after-free.

Fix:
By separating the usb_del_gadget_udc() operation into distinct "del" and 
"put" steps, cdnsp_gadget_free_endpoints() can be executed prior to the 
final release of the gadget structure with usb_put_gadget().

A patch similar to bb9c74a5bd14("usb: dwc3: gadget: Free gadget structure 
 only after freeing endpoints").

Signed-off-by: Chen Yufeng <chenyufeng@iie.ac.cn>
---
 drivers/usb/cdns3/cdnsp-gadget.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index 55f95f41b3b4..0252560cbc80 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -1976,7 +1976,10 @@ static int __cdnsp_gadget_init(struct cdns *cdns)
 	return 0;
 
 del_gadget:
-	usb_del_gadget_udc(&pdev->gadget);
+	usb_del_gadget(&pdev->gadget);
+	cdnsp_gadget_free_endpoints(pdev);
+	usb_put_gadget(&pdev->gadget);
+	goto halt_pdev;
 free_endpoints:
 	cdnsp_gadget_free_endpoints(pdev);
 halt_pdev:
@@ -1998,8 +2001,9 @@ static void cdnsp_gadget_exit(struct cdns *cdns)
 	devm_free_irq(pdev->dev, cdns->dev_irq, pdev);
 	pm_runtime_mark_last_busy(cdns->dev);
 	pm_runtime_put_autosuspend(cdns->dev);
-	usb_del_gadget_udc(&pdev->gadget);
+	usb_del_gadget(&pdev->gadget);
 	cdnsp_gadget_free_endpoints(pdev);
+	usb_put_gadget(&pdev->gadget);
 	cdnsp_mem_cleanup(pdev);
 	kfree(pdev);
 	cdns->gadget_dev = NULL;
-- 
2.34.1


