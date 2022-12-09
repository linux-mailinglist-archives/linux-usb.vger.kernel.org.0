Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 162836487BD
	for <lists+linux-usb@lfdr.de>; Fri,  9 Dec 2022 18:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbiLIR3T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Dec 2022 12:29:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbiLIR3I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Dec 2022 12:29:08 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CD46BC92
        for <linux-usb@vger.kernel.org>; Fri,  9 Dec 2022 09:29:05 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id vv4so13126413ejc.2
        for <linux-usb@vger.kernel.org>; Fri, 09 Dec 2022 09:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gzI0mSSXDiULYDkFXYMyFYk7pUZpjZLakH92fcemRT0=;
        b=avPhojfyAtEzYWjUqmN97DwPnMdwkhaZuk94QT4MgXiwryXE8hb1g9miVLLHqUYFP1
         jth0Q+Hoocw8uH3k5/I8Qm3zQlIWrg5JXJH6jVmmUwTxILt7dWi80KIxBkf+mKpLr7hq
         1tgQNCwBcUP9LG7xucdpxUC6h6HLop9xqEvCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzI0mSSXDiULYDkFXYMyFYk7pUZpjZLakH92fcemRT0=;
        b=zyOy+UknQcrfW1OIdFlRmvI1yK/eukFsgBrSMI+VrI8GrGkDRiy/BFMqt+ZHwWkxaq
         5d84gkSVJtDbk2bRzfM4lzmomDealZVobJYFByXKSipzMIEQhIR041B2Pw67Ec2Iu4D8
         LWFHNsIinNrRA4wU9E3oBYd6nQ9zpl1OtLKyykDN2dBUNdPRVsERf+5o2IFpxiUzpWpN
         TtxQl/x0Xv45/v7GGPvaGdiQQu8awNi8Ynt1QTPIUq+nJiTXCtemngASayFsqze7L5bB
         DO2lKBtlHAmI6BHwxMtaQuBuLQ8E9/wxV3ARuyo61Z8lKelWhUxzQeii/Ukz2L+vfVcf
         cBmg==
X-Gm-Message-State: ANoB5pkQcn+LUXdY7e4ZaozzInQZxbAxmMLrSD1hzZLCSE2PKME8jWoy
        YMXzvXTbzNOPhU77iBZgbXqbiw==
X-Google-Smtp-Source: AA0mqf5z7MfBtkUdBD3PRrX7l81o13oYiH7M+1xcBgip7ajZdifaWsn2o7It0BqoH+YLqdJaLHTt4g==
X-Received: by 2002:a17:906:381:b0:78d:f455:c39b with SMTP id b1-20020a170906038100b0078df455c39bmr5747668eja.65.1670606944432;
        Fri, 09 Dec 2022 09:29:04 -0800 (PST)
Received: from localhost.localdomain (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id pk14-20020a170906d7ae00b0077016f4c6d4sm161154ejb.55.2022.12.09.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 09:29:04 -0800 (PST)
From:   =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: u_ether: remove obnoxious warning messages
Date:   Fri,  9 Dec 2022 18:28:53 +0100
Message-Id: <20221209172853.2138941-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alvin Šipraga <alsi@bang-olufsen.dk>

There is really no need for the driver to unconditionally emit warnings
like this on every usage:

[    6.967283] using random self ethernet address
[    6.967294] using random host ethernet address

Since this is normal behaviour, just remove the messages altogether.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/usb/gadget/function/u_ether.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 8f12f3f8f6ee..3fdc913ef262 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -845,13 +845,11 @@ struct net_device *gether_setup_name_default(const char *netname)
 	snprintf(net->name, sizeof(net->name), "%s%%d", netname);
 
 	eth_random_addr(dev->dev_mac);
-	pr_warn("using random %s ethernet address\n", "self");
 
 	/* by default we always have a random MAC address */
 	net->addr_assign_type = NET_ADDR_RANDOM;
 
 	eth_random_addr(dev->host_mac);
-	pr_warn("using random %s ethernet address\n", "host");
 
 	net->netdev_ops = &eth_netdev_ops;
 
-- 
2.37.3

