Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B76F6D2E7E
	for <lists+linux-usb@lfdr.de>; Sat,  1 Apr 2023 08:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbjDAGFl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Apr 2023 02:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbjDAGFk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Apr 2023 02:05:40 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76BA1E721
        for <linux-usb@vger.kernel.org>; Fri, 31 Mar 2023 23:05:37 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id e5-20020a17090301c500b001a1aa687e4bso14143992plh.17
        for <linux-usb@vger.kernel.org>; Fri, 31 Mar 2023 23:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680329137;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nzj9Fg3GaIV9NE2Q/zhkZ2tE1+n4uT9HgOjZrVlSexY=;
        b=a+B/eYfLO/QRcC2R3kk9NVzQz2ZbJaoghwKedq2mxrvnt1fQ7X76yzOyktp3FTrfZJ
         lXOAhtIJgjpaznN4gd0nxR7Def4aezPHYphl+ftF1NWyx0e/fN7tNE68F7eCkX9UEhWL
         umWGKN4TuxXJtCbZzrK0hb2vPU+lG49Rz9r6W0Zb5xAcOuMHAIDd8AdKCDzjBhtR5tY7
         74PoftD/PfUW/5VHfWz06fpLSMMH5j2dggJEUDKepMqqBWXRsLI0rcrGYn91dOWD1f7P
         yPLdRKBLjnB2IChd8iaZ+LHB7yNrPqLFuHdZ6N6ByM/khZ03IAGUzzC3dOGq7E4CjMdK
         UttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680329137;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nzj9Fg3GaIV9NE2Q/zhkZ2tE1+n4uT9HgOjZrVlSexY=;
        b=Trj3pUN5ow5JW3rjzRj8JtRKqtXtd1XBAjj9boT8e/2o1W5FSZrki5Bd0LDVt3ROI0
         M46xLBRLkCrIZyd5ISfi/eKLhg+GqpfqHsZB5oHV7EjUCW+z1ajX5BeXN4OuHfutQ81i
         3VDtLRc4WDhqOMQLmcUgcvNVE6fvpP09UAaZWBBq6i8cZViVsGF7UlbKJ6kpFicKvh+2
         g66SRSvmtBVSsjVOiRp8E9b05TuNWG3S5MlQWuCxFVxOhSPNKlC8lezinNX5NN1Jm24Z
         1zqomFyaMDfOpQh0G8FaovL9qacrn8VqWVQlcuQvEAtqKJLPwKCXMAYhAU8u4aDCe/bl
         s40Q==
X-Gm-Message-State: AAQBX9eIr1KKNYEp72dHCu9XI/8BOwjzC4HqPUI3N4gPITmljji5gZ1W
        FA3hWtjvICcDV4ro9QPH6oMKG3CIVYsJ
X-Google-Smtp-Source: AKy350ZHfWs0860/xrymzSKCPQKop/B7XtT0OncKiX+Pf72FRIpkclD9sEc9SXlIlKdxX1csdPDiXRq/uB17
X-Received: from dhavale-ctop.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:5e39])
 (user=dhavale job=sendgmr) by 2002:a17:902:7c81:b0:1a1:f44c:8b98 with SMTP id
 y1-20020a1709027c8100b001a1f44c8b98mr9863957pll.12.1680329137028; Fri, 31 Mar
 2023 23:05:37 -0700 (PDT)
Date:   Sat,  1 Apr 2023 06:05:08 +0000
In-Reply-To: <20230401060509.3608259-1-dhavale@google.com>
Mime-Version: 1.0
References: <20230401060509.3608259-1-dhavale@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401060509.3608259-2-dhavale@google.com>
Subject: [PATCH v1 1/2] usb: gadget: f_fs: Fix ffs_epfile_read_iter to handle ITER_UBUF
From:   Sandeep Dhavale <dhavale@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>
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

iov_iter for ffs_epfile_read_iter can be ITER_UBUF with io_uring.
In that case dup_iter() does not have to allocate anything and it
can return NULL. ffs_epfile_read_iter treats this as a failure and
returns -ENOMEM. Fix it by checking if iter_is_ubuf().

Fixes: 1e23db450cff ("io_uring: use iter_ubuf for single range imports")
Signed-off-by: Sandeep Dhavale <dhavale@google.com>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 8830847fbf97..a13c946e0663 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1230,7 +1230,7 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 	p->kiocb = kiocb;
 	if (p->aio) {
 		p->to_free = dup_iter(&p->data, to, GFP_KERNEL);
-		if (!p->to_free) {
+		if (!iter_is_ubuf(&p->data) && !p->to_free) {
 			kfree(p);
 			return -ENOMEM;
 		}
-- 
2.40.0.348.gf938b09366-goog

