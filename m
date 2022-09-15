Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4BD05B92CB
	for <lists+linux-usb@lfdr.de>; Thu, 15 Sep 2022 04:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiIOCy4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Sep 2022 22:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbiIOCyn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Sep 2022 22:54:43 -0400
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1B6022AF3
        for <linux-usb@vger.kernel.org>; Wed, 14 Sep 2022 19:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CQyeJ
        oU8WEe+B+D2938yNIOHiISM9LiPoPC+hFcnG6Q=; b=ARynQGubWXiOCy99HIx0u
        hAMYKBEg76e7UOg3XkMPQm2CcmpIte52E/y3kCCkTdw3xYSvM1jylveLjjrO96lf
        /gV6crCo5bUMvzQzOwTBfuTDY5KkE75WkxmAbLu4nE0qnQ46TI1dGSMvZWzFA6iW
        gO9YtDRhwBvGDwsugYHEJI=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp2 (Coremail) with SMTP id DMmowABn7GDIkyJj81o9Bg--.37585S2;
        Thu, 15 Sep 2022 10:54:02 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     windhl@126.com
Subject: [PATCH] usb: typec: anx7411: Call of_node_get() before of_find_xxx API
Date:   Thu, 15 Sep 2022 10:54:00 +0800
Message-Id: <20220915025400.4003321-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowABn7GDIkyJj81o9Bg--.37585S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr1DXw1DCF45JFWktrWrZrb_yoWDKFc_ur
        yxury2qr45uFZ5tr4vq342ga4q9w48XF1j9FnY9393Ja45uF1UWr1DZrWvqrZ7uFsrtFZ0
        gF12gFyj9r48WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuHq73UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuAt9F2JVlYuc8wAAsf
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In anx7411_typec_switch_probe(), we should call of_node_get() before
of_find_node_by_name() which will automatically decrease the 'from'
argument.

Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/usb/typec/anx7411.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index c0f0842d443c..fe000bbf7183 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1105,6 +1105,7 @@ static int anx7411_typec_switch_probe(struct anx7411_data *ctx,
 	int ret;
 	struct device_node *node;
 
+	of_node_get(dev->of_node);
 	node = of_find_node_by_name(dev->of_node, "orientation_switch");
 	if (!node)
 		return 0;
@@ -1115,6 +1116,7 @@ static int anx7411_typec_switch_probe(struct anx7411_data *ctx,
 		return ret;
 	}
 
+	of_node_get(dev->of_node);
 	node = of_find_node_by_name(dev->of_node, "mode_switch");
 	if (!node) {
 		dev_err(dev, "no typec mux exist");
-- 
2.25.1

