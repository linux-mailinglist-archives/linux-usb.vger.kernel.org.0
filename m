Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF8C5B9755
	for <lists+linux-usb@lfdr.de>; Thu, 15 Sep 2022 11:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiIOJXo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Sep 2022 05:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiIOJXn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Sep 2022 05:23:43 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DD09489CD3
        for <linux-usb@vger.kernel.org>; Thu, 15 Sep 2022 02:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=2tD4L
        rBGoU+6S1Rru1r84b9A7V5UbhshNzLBx12hF7Q=; b=MbSGNatmMq2jQ2622XSkX
        dGMNWEv3X/H51g3QQ/OvYjebpcFGmpPc/14w2D4tgS4pGj+Iye5d2upI/z0EEJ4J
        XXrqv2NPruyWthZMuo5FIMxTGmGYZC48SvfmLp+1PAIbrsH7O834kkGCTFnEod4h
        hltsa//7d9J/KXls2xhZao=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowACn9pLL7iJj_xJMBg--.43577S2;
        Thu, 15 Sep 2022 17:22:20 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     windhl@126.com
Subject: [PATCH v2] usb: typec: anx7411: Use of_get_child_by_name() instead of of_find_node_by_name()
Date:   Thu, 15 Sep 2022 17:22:09 +0800
Message-Id: <20220915092209.4009273-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowACn9pLL7iJj_xJMBg--.43577S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1kurW3AF1DGw1rXrykAFb_yoW8JFyrpF
        W5CrW5Z34xXFyaga40kwn8Aay3KaykG347JayxWas5Kr9xXF45Jr15ta45Grn5KFWIyw1F
        qay7AFy3AayDJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRoSotUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3A19F1pEEQpcdwAAsV
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In anx7411_typec_switch_probe(), we should call of_get_child_by_name()
instead of of_find_node_by_name() as of_find_xxx API will decrease the
refcount of the 'from' argument.

Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
Signed-off-by: Liang He <windhl@126.com>
---
 
 v2: use of_get_child_by_name() advised by Heikki Krogerus.

 drivers/usb/typec/anx7411.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index c0f0842d443c..f178d0eb47b1 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1105,7 +1105,7 @@ static int anx7411_typec_switch_probe(struct anx7411_data *ctx,
 	int ret;
 	struct device_node *node;
 
-	node = of_find_node_by_name(dev->of_node, "orientation_switch");
+	node = of_get_child_by_name(dev->of_node, "orientation_switch");
 	if (!node)
 		return 0;
 
@@ -1115,7 +1115,7 @@ static int anx7411_typec_switch_probe(struct anx7411_data *ctx,
 		return ret;
 	}
 
-	node = of_find_node_by_name(dev->of_node, "mode_switch");
+	node = of_get_child_by_name(dev->of_node, "mode_switch");
 	if (!node) {
 		dev_err(dev, "no typec mux exist");
 		ret = -ENODEV;
-- 
2.25.1

