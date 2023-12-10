Return-Path: <linux-usb+bounces-3947-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2508D80BC6A
	for <lists+linux-usb@lfdr.de>; Sun, 10 Dec 2023 18:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 545D61C208EF
	for <lists+linux-usb@lfdr.de>; Sun, 10 Dec 2023 17:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC981A281;
	Sun, 10 Dec 2023 17:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="NvTFoZCV"
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 460 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 10 Dec 2023 09:44:01 PST
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A34FD
	for <linux-usb@vger.kernel.org>; Sun, 10 Dec 2023 09:44:01 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id CNqQrGkpo4QGMCNqQrBwSr; Sun, 10 Dec 2023 18:43:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702230239;
	bh=2DakXtZBtjglxJAoYvjwjPdRqQfAlWSOjON3AQhn3rc=;
	h=From:To:Cc:Subject:Date;
	b=NvTFoZCVJvQwlvL0Wn2x7DmMrz9pm1f7rxr9S2sRlJ7Ik3bHV4UDmoR2sT1tZ3gcm
	 OGN5dfyRznLHL6WNUcAY4K1d3x/c9RO12yQNzNYKdO2620eUQkpYKn/hBxt3jmCsFY
	 KBUVyR9wjT6ov2dsFLYBZs8HBAnJcraQEtiLDFEaQGaWuyzcAW/w6BagmKh8pcVgL0
	 6+A2QWM5QrASpfVdyUSXqZYIaNdFPHusarZSoUYKLNA8G9lrNfFrhNJMiimVYcs7iv
	 mHgUbufvuYYsUodNXvagfkksysGEPcB8oTy+h87DXsEXhL++wRYWQOsXAYdCIZYMvP
	 SXchW/Uz6p0YQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 10 Dec 2023 18:43:59 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: chipidea: Remove usage of the deprecated ida_simple_xx() API
Date: Sun, 10 Dec 2023 18:43:56 +0100
Message-Id: <8bf382976c0ba0986c0dbe93427266273f0776ef.1702230217.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

This is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/chipidea/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 7ac39a281b8c..0af9e68035fb 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -862,7 +862,7 @@ struct platform_device *ci_hdrc_add_device(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	id = ida_simple_get(&ci_ida, 0, 0, GFP_KERNEL);
+	id = ida_alloc(&ci_ida, GFP_KERNEL);
 	if (id < 0)
 		return ERR_PTR(id);
 
@@ -892,7 +892,7 @@ struct platform_device *ci_hdrc_add_device(struct device *dev,
 err:
 	platform_device_put(pdev);
 put_id:
-	ida_simple_remove(&ci_ida, id);
+	ida_free(&ci_ida, id);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(ci_hdrc_add_device);
@@ -901,7 +901,7 @@ void ci_hdrc_remove_device(struct platform_device *pdev)
 {
 	int id = pdev->id;
 	platform_device_unregister(pdev);
-	ida_simple_remove(&ci_ida, id);
+	ida_free(&ci_ida, id);
 }
 EXPORT_SYMBOL_GPL(ci_hdrc_remove_device);
 
-- 
2.34.1


