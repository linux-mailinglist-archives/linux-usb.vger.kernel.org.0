Return-Path: <linux-usb+bounces-27716-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A89B49276
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 17:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C3933A6ABD
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 15:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB186304BB9;
	Mon,  8 Sep 2025 15:04:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB6E1D514B
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757343884; cv=none; b=GI73nIGhMLesoppVvpT5VuHbQQCGjxJ02Sla12+d9hw6pOWq+7UwSkjjlYxj8z2VnTPj5ZITyVbP88eg0uHZ2wGaHi90eNnTE0Xy7/q8XV/sTBFKQbh8ySnU19ZXFW2rMysuVzHv/HxdEwCoA2SwJ1V0BuLKZiYdvVOUmVJcCwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757343884; c=relaxed/simple;
	bh=M0XzmKqjMWj+UWfQyNN6qIdRzBUokFWDoDTMPUUNw9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=To4Fi5Lvzxwv0s5vn8iZlpErUnGCKJ6+cGfUz9LeIdWy5g8Onzj7LCyr/IrjDbQxrHeLjMZ+1qV1maLrZEN024FiQzOJMJJtaTRqz7JOzQR+jgkmv2FzSudGMMPfRZBhviRKziVM5NwE5ELDX+Dit0CHlk24lnsmXfimjmHyfLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iie.ac.cn; spf=pass smtp.mailfrom=iie.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iie.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iie.ac.cn
Received: from localhost.localdomain (unknown [159.226.95.28])
	by APP-01 (Coremail) with SMTP id qwCowACH4qSE8L5o2n+vAQ--.37773S2;
	Mon, 08 Sep 2025 23:04:37 +0800 (CST)
From: Chen Yufeng <chenyufeng@iie.ac.cn>
To: pawell@cadence.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Chen Yufeng <chenyufeng@iie.ac.cn>
Subject: [PATCH] usb: cdns2: fix memory double free in cdns2_gadget_giveback
Date: Mon,  8 Sep 2025 23:04:25 +0800
Message-ID: <20250908150425.229-1-chenyufeng@iie.ac.cn>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACH4qSE8L5o2n+vAQ--.37773S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZw1xXr1kGrWUXr1kArW3GFg_yoW8Jr1Dpa
	1Iqay0yF4UJrWqqFyvgrn8XF4UJ3y3Cr9rKFWIyr4UZFn0qrZ8uF15KryFgF47AFWkZrW2
	kF1DWwn2vFWF9rJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkS14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_XrWl
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU1uWlUUUUU
X-CM-SenderInfo: xfkh05xxih0wo6llvhldfou0/1tbiCQ4TEmi+8FYAsQAAsH

A patch similar to commit 5fd9e45f1ebc("usb: cdns3: fix memory double
 free when handle zero packet").

As 5fd9e45f1ebc points out, the cdns2_gadget_giveback() function also has
the same memory double free issue when handling zero-length packets.

Add check for usb_gadget_giveback_request() to avoid double free of memory.
If it's additional zero length packet request, do not call 
usb_gadget_giveback_request().

Signed-off-by: Chen Yufeng <chenyufeng@iie.ac.cn>
---
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
index 7e69944ef18a..4f7898c2e364 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
@@ -253,7 +253,7 @@ void cdns2_gadget_giveback(struct cdns2_endpoint *pep,
 
 	trace_cdns2_request_giveback(preq);
 
-	if (request->complete) {
+	if (request->complete && request->buf != pdev->zlp_buf) {
 		spin_unlock(&pdev->lock);
 		usb_gadget_giveback_request(&pep->endpoint, request);
 		spin_lock(&pdev->lock);
-- 
2.34.1


