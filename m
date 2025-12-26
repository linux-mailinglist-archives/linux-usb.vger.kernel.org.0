Return-Path: <linux-usb+bounces-31768-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3B1CDE46F
	for <lists+linux-usb@lfdr.de>; Fri, 26 Dec 2025 04:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB94D3007FC1
	for <lists+linux-usb@lfdr.de>; Fri, 26 Dec 2025 03:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6257B3E1;
	Fri, 26 Dec 2025 03:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oW79Qg0n"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB8A8821
	for <linux-usb@vger.kernel.org>; Fri, 26 Dec 2025 03:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766719077; cv=none; b=KQQbAX3EMmbIZvtiBcOpHlJgoCwLeDkU3mKR1vh247V4zEF8ubKmGWwmdllk5tsTx5wvObkpTG/1LoiQo+nrTpQto7V7Ah7HRgRPdfxkMgY6/jzyqjxa7/oElv43hJv8oELa3XkwkiC5sTQTsq+IdDVgGP+0ovwjHp9+fPbCKL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766719077; c=relaxed/simple;
	bh=HAark2KmPrjJqMHw4vcsExP+B9fd8yHC8nQO25sHLfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VVB02sPKxw6h6Yw7Bpzas0oPM04CtxCY8WhP65WNcXhvLSOHguCQzhBztc8aHtAWzRo/Nn1bxoTMcPMi2ZCvUMUG/Nl9NM5AR+/UyutBoRSW6nfKzvK6EMWCTpxIK22AKM53davD3/iZLiPtXHquqkSTKxuB9nb1vQ3YdMqBHCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oW79Qg0n; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=O9
	CO84HkbOqBlGx+HBxEPfR91l98quh4dUnGK5lCpN4=; b=oW79Qg0nfY0Cw6uhLs
	TXVhooVKS2JrhTCUm5N3+5EkVsWtvIv6PU88L4T024YmlQx8yHtdz19EvsZmwAID
	ykVLCgqlvJknkuchc7Bhn4FuVU5HWsnsTA5q11moWRJiaufso+6ZDzVgZD4w6rjL
	7LXTrhj7b+eniV8RuILDHkxJA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wB3F7VS_k1pP3iOCQ--.291S2;
	Fri, 26 Dec 2025 11:17:40 +0800 (CST)
From: ReBeating <rebeating@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	ReBeating <rebeating@163.com>
Subject: [PATCH] usb: cdns2: fix memory double free in cdns2_gadget_giveback
Date: Fri, 26 Dec 2025 11:17:13 +0800
Message-ID: <20251226031713.1682-1-rebeating@163.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3F7VS_k1pP3iOCQ--.291S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZw1xXr1kGrWUXr1kArW3GFg_yoW8Jr17pa
	18tay0yF4UXrWqqFyvgrn8ZF4UA3yxur9rKFWIyr4jvFn0qrZ8uF15KryFgF47AFWkZr42
	kF1DWwn2vay09rJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRPPE-UUUUU=
X-CM-SenderInfo: 5uhevtpwlqwqqrwthudrp/xtbC0RWCk2lN-lWpVgAA3l

A patch similar to commit 5fd9e45f1ebc("usb: cdns3: fix memory double
 free when handle zero packet").

As 5fd9e45f1ebc points out, the cdns2_gadget_giveback() function also has
the same memory double free issue when handling zero-length packets.

Add check for usb_gadget_giveback_request() to avoid double free of memory.
If it's additional zero length packet request, do not call 
usb_gadget_giveback_request().

Signed-off-by: ReBeating <rebeating@163.com>
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


