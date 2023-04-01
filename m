Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 697686D2E7C
	for <lists+linux-usb@lfdr.de>; Sat,  1 Apr 2023 08:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232682AbjDAGFo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Apr 2023 02:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbjDAGFn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Apr 2023 02:05:43 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167AC1DF8A
        for <linux-usb@vger.kernel.org>; Fri, 31 Mar 2023 23:05:43 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-545e529206eso180549677b3.9
        for <linux-usb@vger.kernel.org>; Fri, 31 Mar 2023 23:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680329142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YJIKAiLrcYph4SDFvXf83ay8bL8jHgmMLaG1jX6sOx0=;
        b=frACg17a8pI0bbcxxKJzpQQeLf47wzT6rc2ZVp3Aaq8MfX03AmW3eP1GF68xZeBM6N
         n9ewuLIh9l54jBHPvslv9mMx1A/Ej8zTYEh/t6IAGO6qfydAw0wPzS48ERRVRQJSE00C
         YesQl6RTmnVvR4uE70swykMBPexUt58a13kSleN4aYjOgzJg9bAqlXStAUP/pLTTlLY6
         4vLvdo1IxAU5ZmTqbKWUp98FeELLIX1M1z8fnAJiv83m/uqcpVvtuN77UEo/zE7k5X2M
         tFprKTQztNiF5Ws5gTFoju5yCH1bR1XRzna97+ZwHgJPldsiyWqYzQ9pKkKhKZ3GZ9nd
         30Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680329142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJIKAiLrcYph4SDFvXf83ay8bL8jHgmMLaG1jX6sOx0=;
        b=A506VrWyajczh1DEspt3a/0QFvcWeMMSjhNEBsuUjWWjpHp9xP5UgLZQFD3SUboD1M
         Mjea8gw0FZgsV5YSmQMII+YYh+Iw71JOfsHXHavETd0E0EtyZCjUt7/JgrSCoBrjCsRG
         MkeMwsIHkI0LhS65fs4QQcC5AROmQpe3kxRVtefEUSAv3P1rSxbKxIWJULkxQvaW98ps
         LDDAmLkVpGzwhEFFn/EIPTI2PXCVi6c9mE0IINKMoJ0/GWYkDuSQskxVQysR+KOuyMJt
         K+k2mKlBl66h8zgPBDMSSM36K9xt9wcou+bicjFkegrxb1OIlo4VA5XoMdW0HW/3/pII
         UksQ==
X-Gm-Message-State: AAQBX9fgbja4wslqSbhrGmjxUIjo6fdSjZFFuFpsp4wIewJ4iZHael0Y
        PCTPjB2atD4PcXqJ5sZnAipCcnuA/eAl
X-Google-Smtp-Source: AKy350ZEkYkx/cnN4LKrWExUKxfzEZ+Fbw1UrV+ww+lENePsSHSFei3i2z2m6GsTrCtyz5NuzrjcBN12YoyN
X-Received: from dhavale-ctop.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:5e39])
 (user=dhavale job=sendgmr) by 2002:a81:ae60:0:b0:546:5f4d:c002 with SMTP id
 g32-20020a81ae60000000b005465f4dc002mr1322669ywk.10.1680329142383; Fri, 31
 Mar 2023 23:05:42 -0700 (PDT)
Date:   Sat,  1 Apr 2023 06:05:09 +0000
In-Reply-To: <20230401060509.3608259-1-dhavale@google.com>
Mime-Version: 1.0
References: <20230401060509.3608259-1-dhavale@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401060509.3608259-3-dhavale@google.com>
Subject: [PATCH v1 2/2] usb: gadgetfs: Fix ep_read_iter to handle ITER_UBUF
From:   Sandeep Dhavale <dhavale@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc:     Sandeep Dhavale <dhavale@google.com>, kernel-team@android.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

iov_iter for ep_read_iter can be ITER_UBUF with io_uring.
In that case dup_iter() does not have to allocate iov and it can
return NULL. Fix the assumption by checking for iter_is_ubuf()
other wise ep_read_iter can treat this as failure and return -ENOMEM.

Fixes: 1e23db450cff ("io_uring: use iter_ubuf for single range imports")
Signed-off-by: Sandeep Dhavale <dhavale@google.com>
---
 drivers/usb/gadget/legacy/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d605bc2e7e8f..28249d0bf062 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -614,7 +614,7 @@ ep_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		if (!priv)
 			goto fail;
 		priv->to_free = dup_iter(&priv->to, to, GFP_KERNEL);
-		if (!priv->to_free) {
+		if (!iter_is_ubuf(&priv->to) && !priv->to_free) {
 			kfree(priv);
 			goto fail;
 		}
-- 
2.40.0.348.gf938b09366-goog

