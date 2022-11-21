Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1218632703
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 15:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbiKUOzA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 09:55:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbiKUOyn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 09:54:43 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 079C4CFA70;
        Mon, 21 Nov 2022 06:44:30 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so12936741wmb.2;
        Mon, 21 Nov 2022 06:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVozTFlQLi4Kq1hQBrMpTSLTEeZeiiwiztBFqH0ZhNA=;
        b=pdu6G3Cn3bz4GyeREeXItkqNLx/zA+/FH8DJ4jKKyQ/JJ6YXBQ5u+MgVTv73oDPuYk
         1Klb9b7wxBhftuHodnPZ3MIYyfHa8XPQ9TBvhc3n1x2T+PIMJkZeC9JbMIo3Lfd8t4tn
         PCcUcUoyqDCJuLLkATKZ43vCy8yOOiLvO8qDyPZEwRJVzTTJfCLrwH+nP41tZHfAfhTa
         dJO9mYsCJfRL3h38HPBLgbA4IJBWBOlt7JE3YyCVAqdKNpVbMNSMTeCK1Rsu/iH5CwHJ
         smsbRlNMdZaHyw379OI90dULUUuJWoFsICrrAZ26FpUd2XKCL1RNDZpfcn19D3vaSuDg
         vXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVozTFlQLi4Kq1hQBrMpTSLTEeZeiiwiztBFqH0ZhNA=;
        b=xS7unXW1avYWaIVUK79J1xio05rt9J2k29H43AYZq+kV45dzmJpLBn6Wj5zhNOSekJ
         EyMR/nuP0vKqjNTUbhY/+s+TPmfBoP56zblLlofBadDDoGJIraTZro4UuKJfpzHyicyY
         WelPAuJxdJoggbWap7Hw/laJLE1Wix/zAH0xHxCzfP+VCyeJM37VE+48xsEMu3rf/BtJ
         2v7YRqYIoiPDlDIyTORh6wyMnRmQp/c3QmW+S9TSFin+M9nk4otSUzr+5uS2Hlo+0r37
         DjsMq/9PwwOM1RervDzy0nj7U++weUcDLv+17S//h/iShrDoh+xpemGgAkNdgTcberm3
         JIPA==
X-Gm-Message-State: ANoB5pnAHfY7QNTDJq5sYjH3YLF0S2uDAKgnN9uQk0H67lJ8Isv0y9XZ
        HZ8fr4mwf0dduaWp8buXpK9hGF8LK6A=
X-Google-Smtp-Source: AA0mqf4+EL/RjHxnD7gXkawZj5Rycvo83iijPrrJWvdfE4x8mTvrzf9niELA3CqbuL/U2BFoE03ORg==
X-Received: by 2002:a05:600c:3b84:b0:3cf:b73f:c062 with SMTP id n4-20020a05600c3b8400b003cfb73fc062mr123748wms.204.1669041867319;
        Mon, 21 Nov 2022 06:44:27 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c4e9300b003cfd4a50d5asm20389354wmq.34.2022.11.21.06.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 06:44:26 -0800 (PST)
Date:   Mon, 21 Nov 2022 17:44:21 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Dan Carpenter <error27@gmail.com>,
        Albert Briscoe <albertsbriscoe@gmail.com>,
        Zqiang <qiang.zhang@windriver.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: function: use after free in printer_close()
Message-ID: <Y3uOxcvowFq75Tzv@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The printer_dev_free() function frees "dev" but then it is dereferenced
by the debug code on the next line.  Flip the order to avoid the use after
free.

Fixes: e8d5f92b8d30 ("usb: gadget: function: printer: fix use-after-free in __lock_acquire")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: In the v1, I just deleted the printk but Andrzej thought it was
worth preserving.

 drivers/usb/gadget/function/f_printer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index a881c69b1f2b..01e842e1ba2f 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -381,8 +381,8 @@ printer_close(struct inode *inode, struct file *fd)
 	dev->printer_status &= ~PRINTER_SELECTED;
 	spin_unlock_irqrestore(&dev->lock, flags);
 
-	kref_put(&dev->kref, printer_dev_free);
 	DBG(dev, "printer_close\n");
+	kref_put(&dev->kref, printer_dev_free);
 
 	return 0;
 }
-- 
2.35.1

