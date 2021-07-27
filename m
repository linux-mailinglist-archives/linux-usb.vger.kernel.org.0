Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601EA3D728F
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 12:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236155AbhG0KFm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 06:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236104AbhG0KFk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 06:05:40 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5F2C061757
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 03:05:40 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r2so14546862wrl.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 03:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Aj50P04AHvnNUWvmjhxhomiq5h7kyJzSIwB9k4QqcrQ=;
        b=FQiK5B8I6cuLEdYVKKJu2fURVfzQ149zbr6uDclVhTnuJ43t+E8+iWIIETJUdwCpBQ
         uURHJqr7cZbZSk5GdVIN1T/drYRfq4/Qd4BwMUV5ljMayUQ81w49bHc1PuIuhHj4UXTc
         3Xowzl/aMrz8cS5D6c251+A+FfQY6iJ9XL7YDKcc4xM3AJi1pqF9+DADNWZoSLr+ZFG9
         7GGjzldwggT8/UrgUO0GWkhsQ7sMU/ZYl8fdhVHK3GpwzimgjWeOlKRKwg5nuA+GDJHE
         Q9QioJrl67ByMPdm60RuQEeXoHIf2EWsckyO6cVX9FuitJxC4dEMERrXMBB9pv7nPnc/
         PqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aj50P04AHvnNUWvmjhxhomiq5h7kyJzSIwB9k4QqcrQ=;
        b=Y8JOZ6UJbcb5JdcCkFRgo02xiU/03XrnBsWELWPIgDQj7RqNAbQ+tyReIew6Mcq9kx
         gKKJf/o/smbbnR/hcOGnn+93cWJfKengtSjto+jreImHdVjGO+N2DFx1ohFNkGa55VTw
         VliXYMZShAQj2edNCbrUwiyznrQHCXLysRQPiohwuld5rcI+4Fvv0/sTkJ/rs/s/spwp
         YVkoxT0t33amwWE1Ld2VudwO/cW2MYg4+5VBK0lD8EH6Ju9hZF3HqjJeAVorDB+jvlGz
         n4OVVKAxSzLf2a3LJT/4vHSp4paG8Lb0yRlUAn/pKYIV1cv/MpvpRtp1Fr8hzFtMkuXB
         SHPg==
X-Gm-Message-State: AOAM531Url74Smw9gPmyWwC1KqQCxaXytX6hN0EcDU5O5blAS0q0Q34n
        Jse5tqQqYOEIoYGTu6pAswE+nQ==
X-Google-Smtp-Source: ABdhPJwUkDDWrw1NzUGIFldmVQQ3/D0dMe8QBfy2aTUlIKiaVIVVlpvZzynJn47Z5DmE4N05RoQiWg==
X-Received: by 2002:adf:ed0a:: with SMTP id a10mr15058200wro.30.1627380338637;
        Tue, 27 Jul 2021 03:05:38 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id v5sm2813221wrd.74.2021.07.27.03.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 03:05:38 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 3/3] usb: isp1760: rework cache initialization error handling
Date:   Tue, 27 Jul 2021 11:05:16 +0100
Message-Id: <20210727100516.4190681-4-rui.silva@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727100516.4190681-1-rui.silva@linaro.org>
References: <20210727100516.4190681-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If we fail to create qtd cache we were not destroying the
urb_listitem, rework the error handling logic to cope with that.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-hcd.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index a018394d54f8..825be736be33 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -2527,17 +2527,23 @@ int __init isp1760_init_kmem_once(void)
 			SLAB_MEM_SPREAD, NULL);
 
 	if (!qtd_cachep)
-		return -ENOMEM;
+		goto destroy_urb_listitem;
 
 	qh_cachep = kmem_cache_create("isp1760_qh", sizeof(struct isp1760_qh),
 			0, SLAB_TEMPORARY | SLAB_MEM_SPREAD, NULL);
 
-	if (!qh_cachep) {
-		kmem_cache_destroy(qtd_cachep);
-		return -ENOMEM;
-	}
+	if (!qh_cachep)
+		goto destroy_qtd;
 
 	return 0;
+
+destroy_qtd:
+	kmem_cache_destroy(qtd_cachep);
+
+destroy_urb_listitem:
+	kmem_cache_destroy(urb_listitem_cachep);
+
+	return -ENOMEM;
 }
 
 void isp1760_deinit_kmem_cache(void)
-- 
2.32.0

