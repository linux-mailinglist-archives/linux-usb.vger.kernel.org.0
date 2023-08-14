Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD6CC77BD2B
	for <lists+linux-usb@lfdr.de>; Mon, 14 Aug 2023 17:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjHNPf7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Aug 2023 11:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbjHNPfb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Aug 2023 11:35:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82148C5
        for <linux-usb@vger.kernel.org>; Mon, 14 Aug 2023 08:35:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5F2F0615C4
        for <linux-usb@vger.kernel.org>; Mon, 14 Aug 2023 15:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558D8C433C9;
        Mon, 14 Aug 2023 15:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692027329;
        bh=sH4rINd0cTqIAhn3TtM/4TmeL4tguqZHMlefGVik+tE=;
        h=From:To:Cc:Subject:Date:From;
        b=ZbsCsY4kKkchgSWzIl9OgiHJvOwAFiVPYVr6EhBPCnguzUElLWHJ5bgwx+WGtQyHt
         sqrWktWqXNIVwPgOviLRZ8Z/UwkTs3rzK/8ckhIkQ6NbUCFVPxrozy+OApJMPdo2W4
         SNIPf0PoIr4t0LZI+YFFcAG83yJ8Yg9yXI1B8HnYb3mJM5eoBbVTkfzKBXonsHduKo
         0iKMvFpt70H3s+N0PVffefq1lsuTQ6tj8F2li+YALXrvCh5/MZHPzeXus1TqttKJqc
         DM2aJcNVVVF1YkHRRtvGS9ae5lb94OwSyUTulwiKHRQ3t5KO0w1+jxN5COLxmHQo+x
         lMmzGAvD1M26g==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        Jakub Kicinski <kuba@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        hayeswang@realtek.com, bjorn@mork.no, linux-usb@vger.kernel.org
Subject: [PATCH net-next] eth: r8152: try to use a normal budget
Date:   Mon, 14 Aug 2023 08:35:21 -0700
Message-ID: <20230814153521.2697982-1-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mario reports that loading r8152 on his system leads to a:

  netif_napi_add_weight() called with weight 256

warning getting printed. We don't have any solid data
on why such high budget was chosen, and it may cause
stalls in processing other softirqs and rt threads.
So try to switch back to the default (64) weight.

If this slows down someone's system we should investigate
which part of stopping starting the NAPI poll in this
driver are expensive.

Reported-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://lore.kernel.org/all/0bfd445a-81f7-f702-08b0-bd5a72095e49@amd.com/
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: hayeswang@realtek.com
CC: bjorn@mork.no
CC: linux-usb@vger.kernel.org
---
 drivers/net/usb/r8152.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index db9897e825b4..bb234cf0cea0 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -9760,8 +9760,7 @@ static int rtl8152_probe(struct usb_interface *intf,
 
 	usb_set_intfdata(intf, tp);
 
-	netif_napi_add_weight(netdev, &tp->napi, r8152_poll,
-			      tp->support_2500full ? 256 : 64);
+	netif_napi_add(netdev, &tp->napi, r8152_poll);
 
 	ret = register_netdev(netdev);
 	if (ret != 0) {
-- 
2.41.0

