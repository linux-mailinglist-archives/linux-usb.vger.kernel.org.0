Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 821B4679D48
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 16:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234434AbjAXPU5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 10:20:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbjAXPU4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 10:20:56 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E5323666;
        Tue, 24 Jan 2023 07:20:54 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so11201838wms.2;
        Tue, 24 Jan 2023 07:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EeY3mydnmkjq4oq4mpT6nBCvReQwvjW/TRWTsrG5dww=;
        b=MiCGsTV1CJdTC7jL90S+sxYGtakI2pErlJNhp0d1W0tvmca1PH9Bu/qn20NtUTQCp/
         jqLZVl/ivQIp5AipalvjZ4FQLAl4qRhLcG6LcEblZQwi1Z2ld6WzKasbwiQ7Qikkm444
         7DU22+hZw0M8wjix+kt4tL2Ww+zZ+ogZVDQy0E6oFNu0U4oG/lIYLFafJm4iZPSdZvAY
         cWks9qf80d44kbpokQLA9alpTMu63LvvJaiVzBG2tsRmvYbd9V6m4Lmp3KLaNWTlBR+C
         rpa43xZzNXZDJlOemU/ArGstRFAjDIsTe5rTVW10FOfCXffVyRNLcJiSWpbN2KyN4tc/
         aT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EeY3mydnmkjq4oq4mpT6nBCvReQwvjW/TRWTsrG5dww=;
        b=BwcMqPunl+DmZyeJX6tTBdEyhFvHoiw5HAHmEI+GR3VPy/meSr8BG+yu4Wqe80FUWF
         e0BnhqGhXAybP/Wyah9/JAA8CZpEMJluKa8gaBylAVigR8JUCYwYdlBwaTpKXbWQKjGZ
         26RVkFoFzhVWhggUAtqd6xWH9100XCM+EHEj4fMPqUyCr4L4E1G9tsOErpSf3QgZoHDB
         Is4h99BRrkxuXwjBSQN3AhjKel7+Gh1wqBvW4mo0xSp3+UZl7iCGLT1Aj4mBtHe2D6Ru
         OZSb04cwHbFPjfQaYDN3ViJhFFX4DUirm3qxXeWuzaWCu2leU6wckPOjz+VYMR3I4mG3
         J9qg==
X-Gm-Message-State: AFqh2kqIz/QBtha35BKJWQyoWY8Q3p+pJxKPTebq6T2cCo5zldKkV+Wx
        dvxJuODKwaZY8sY+eMcZzUo=
X-Google-Smtp-Source: AMrXdXs/Y+wF+PZi2fvuaDGs1pENA54miR0u8XAmepmBDASjm/po6H3gd1fntTxSFbrPU4qVorSFlA==
X-Received: by 2002:a05:600c:1609:b0:3db:12a:5e65 with SMTP id m9-20020a05600c160900b003db012a5e65mr27772128wmn.4.1674573653065;
        Tue, 24 Jan 2023 07:20:53 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z4-20020a05600c0a0400b003db01178b62sm15608983wmp.40.2023.01.24.07.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 07:20:52 -0800 (PST)
Date:   Tue, 24 Jan 2023 18:20:46 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Bin Liu <b-liu@ti.com>, Min Guo <min.guo@mediatek.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Yonglong Wu <yonglong.wu@mediatek.com>,
        linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: musb: mediatek: don't unregister something that wasn't
 registered
Message-ID: <Y8/3TqpqiSr0RxFH@kili>
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

This function only calls mtk_otg_switch_init() when the ->port_mode
is MUSB_OTG so the clean up code should only call mtk_otg_switch_exit()
for that mode.

Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
From static analysis.  Please review carefully.

 drivers/usb/musb/mediatek.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index cad991380b0c..27b9bd258340 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -294,7 +294,8 @@ static int mtk_musb_init(struct musb *musb)
 err_phy_power_on:
 	phy_exit(glue->phy);
 err_phy_init:
-	mtk_otg_switch_exit(glue);
+	if (musb->port_mode == MUSB_OTG)
+		mtk_otg_switch_exit(glue);
 	return ret;
 }
 
-- 
2.35.1

