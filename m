Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDC315735FC
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 14:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236265AbiGMMHm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 08:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbiGMMHm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 08:07:42 -0400
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3D015104037
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=TVp3F
        AC4zLQTXrT2vQdzGriRuCr3pjOw+cscr3/4O2w=; b=JtxDwWzg2dPrsfmfU2g5E
        49TADlK5ut7nKxkLo8bl4jm/8M4gi4e//J6uKXsriOgUFnKBWEuBlIX67qUgfIur
        YrwQ1Ip4IoNTLThLiOIrqBa0Lh9unmsMJPwsDhOUA+dUidH0axZzlfeW2uwgxIA6
        WQnK5HERJi83ozbeUNON9A=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp8 (Coremail) with SMTP id NORpCgDnipcJtc5i80FIHw--.47583S2;
        Wed, 13 Jul 2022 20:05:30 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, joel@jms.id.au,
        andrew@aj.id.au, linux-usb@vger.kernel.org, windhl@126.com
Subject: [PATCH] usb: aspeed-vhub: Fix refcount leak bug in ast_vhub_init_desc()
Date:   Wed, 13 Jul 2022 20:05:28 +0800
Message-Id: <20220713120528.368168-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgDnipcJtc5i80FIHw--.47583S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFy8tw4DJFWfuFW7Ar4xWFg_yoWDZwcE9F
        4jg3W3Wr1Uta95Xr4DJ345Zry09a4kWryUu3Wrtr93WFWjvwnrXF1UWrZ5Ar9rZF42va4k
        Cw1qgFyjkw4FqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUyrW3UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuB89F2JVkVslCwACsc
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We should call of_node_put() for the reference returned by
of_get_child_by_name() which has increased the refcount.

Fixes: 30d2617fd7ed ("usb: gadget: aspeed: allow to set usb strings in device tree")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/hub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index 65cd4e46f031..e2207d014620 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -1059,8 +1059,10 @@ static int ast_vhub_init_desc(struct ast_vhub *vhub)
 	/* Initialize vhub String Descriptors. */
 	INIT_LIST_HEAD(&vhub->vhub_str_desc);
 	desc_np = of_get_child_by_name(vhub_np, "vhub-strings");
-	if (desc_np)
+	if (desc_np) {
 		ret = ast_vhub_of_parse_str_desc(vhub, desc_np);
+		of_node_put(desc_np);
+	}
 	else
 		ret = ast_vhub_str_alloc_add(vhub, &ast_vhub_strings);
 
-- 
2.25.1

