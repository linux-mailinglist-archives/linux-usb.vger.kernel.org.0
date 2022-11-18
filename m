Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4C7A62F3FB
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 12:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241726AbiKRLrt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 06:47:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241560AbiKRLr2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 06:47:28 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570D0922F6;
        Fri, 18 Nov 2022 03:47:17 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id y16so8837529wrt.12;
        Fri, 18 Nov 2022 03:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=noh2AIIXYOWhOTGjJCQMWSYDUuRgEeAbZcKQ+mwgXHU=;
        b=PHlAnFT3dHdolSwsY/2RLSjQ39K1hJCCzWauvbpXnKIe2xMCoHIT4fFTkNGHP7aa4+
         zqybsmUXC5jJKS5LJAiZglmiMtj9PfWh0nxpM9xQ7zfwwy9aZjoDzwoafrKI+MtbPt2f
         OOwXdojX1EmM859EuTQCzzZHujKOXC0aBaeGu6EIDqEyat8dcwdLJaVeRruVo3hVSV4m
         qQq7sfXsxt/PsXrXjgcr8Yj3FcH/G0F/4FZ9RzS9L7VDuEaYNPCFe6LzXUdYySgmEC2W
         apJLjkk8m/lhA8FH/FOHbdFqzVMy+0708KiYSq+CpUogdsOpKOs8mfdKqB1wUUJDfbR7
         RlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noh2AIIXYOWhOTGjJCQMWSYDUuRgEeAbZcKQ+mwgXHU=;
        b=hdoh1Rxp6QVY/yYIq6FE9idatpkt3VQi50xvGD3TFXpDubG0OeOYF6ZoEmewwR6MJd
         EyLgSy6cqAXmTjTRiyjdWbrBCDE8Mwt8NqzqcgAI5mpkVNNbDnHSPbB6OnFk01Xp9ISg
         9rXZ/W6wIrzhRfkKwnbxfhVGkPZrTrORZP2+10LzS883jRoR3qRpY4qizFyd/Vi+GhJT
         Xqg0NYNFraTfurQwF/MEAA15abddJ53rOJa09lFmehi80lfVaPKUWZJT2SzXhHzXb006
         ekHA1g6K8PLV33V4f3vv8YnhZEQLccjl7iumGHsIFJceWKqNbbQSK5gV0kevDxdDXjuc
         GSIg==
X-Gm-Message-State: ANoB5pmaw5oe4IYYMu87fH3Y9/3c4LfwIs5CVQmhAlmr14BCKf2uMCpp
        QBliBNvxINV5GHtbGKWRDOA=
X-Google-Smtp-Source: AA0mqf7BM2P/jm8FlSiNjId4dPK9MHaSpfSX8lcOqtCMIG51LLlFo4DvRJSYS4aIat6Hk9WwGJkpWw==
X-Received: by 2002:a05:6000:883:b0:22c:d6c7:562 with SMTP id ca3-20020a056000088300b0022cd6c70562mr4063179wrb.8.1668772035824;
        Fri, 18 Nov 2022 03:47:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id fc10-20020a05600c524a00b003cf9bf5208esm9680699wmb.19.2022.11.18.03.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:47:15 -0800 (PST)
From:   Dan Carpenter <error27@gmail.com>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Fri, 18 Nov 2022 14:47:12 +0300
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Albert Briscoe <albertsbriscoe@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Zqiang <qiang.zhang@windriver.com>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: function: use after free in printer_close()
Message-ID: <Y3dwwNlBoS13VcIR@kili>
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
by the debug code on the next line.  The debug printk only prints the
function name so it's probably okay to just delete it.

Fixes: e8d5f92b8d30 ("usb: gadget: function: printer: fix use-after-free in __lock_acquire")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/gadget/function/f_printer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index a881c69b1f2b..7354bfe1e682 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -382,7 +382,6 @@ printer_close(struct inode *inode, struct file *fd)
 	spin_unlock_irqrestore(&dev->lock, flags);
 
 	kref_put(&dev->kref, printer_dev_free);
-	DBG(dev, "printer_close\n");
 
 	return 0;
 }
-- 
2.35.1

