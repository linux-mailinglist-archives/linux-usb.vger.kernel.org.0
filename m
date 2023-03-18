Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D682E6BFA2B
	for <lists+linux-usb@lfdr.de>; Sat, 18 Mar 2023 14:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjCRNO2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Mar 2023 09:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjCRNO1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Mar 2023 09:14:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28B761206A
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679145229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=jgoarmppOveCAhzhSS+yukRVNHlYy4ELLTt4seUigM0=;
        b=LC4DzcQzVQgYtw/VGoaGoMDiwspvJ8I/lK2djyBTwlEMUuw5lK8Rj9Q7KLQv2SGgIhajbv
        2Xta6AMta4eYWf3MSR6RMYswh1Y8xDxbWjZn5qQSZbIXZ1qdqgb3QcVEcClEgr+Vq54qvd
        YVoqQtRIi0k8rKJY55w0PscwtpPvGvY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-qCNQO9AsPUafeYaTTgycew-1; Sat, 18 Mar 2023 09:13:48 -0400
X-MC-Unique: qCNQO9AsPUafeYaTTgycew-1
Received: by mail-qv1-f72.google.com with SMTP id g14-20020ad457ae000000b005aab630eb8eso4198933qvx.13
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 06:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679145227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgoarmppOveCAhzhSS+yukRVNHlYy4ELLTt4seUigM0=;
        b=ZIWK015c1Qh65dYt9qwG49cApahDtHBFhGWCg7vQp/pYYxXeJuQ10fK3Wj2u5vuzd2
         FJornsWrcWTj1iZsqBb7OggCpOuoaerAqr7USUU75siOvo4gph06aqwiJlW5VpuJxFfq
         /fhoYka96C/xZ/S6fYOM6lknCrQOmCdLWCx9L/HIjmWBtXsHAqoaQDHF23k6RSsV6Ps4
         tRZfbtOB+ufT4FlZgwPNotwku+LvxEP8D/M59ksHTxDSaV4scm2E+Ijg6JK0NJfOV/Zl
         kdazbbYAi/G72rvXWt9Lbjas4FN20bBFFps9wl9NNut9OS1scsR39qKmOsqfAQdIuCZi
         +1NQ==
X-Gm-Message-State: AO0yUKVkrAofoTLRPZO/Rg7ZS7NoYXlBWgihVmbtG57z9eRBHuXjLKRr
        vO0tYldJxBHUmTevSYFDpFD6sou5MgyBgdX9QoE0I0eVWtus4lpKDJLgjMEs1vC2HBRDnJa8EAV
        2vzCOxpZXjbWTyJYAZoCq
X-Received: by 2002:a05:622a:1116:b0:3d3:6285:a63 with SMTP id e22-20020a05622a111600b003d362850a63mr10899543qty.10.1679145227301;
        Sat, 18 Mar 2023 06:13:47 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Sm2ecyLp2qn8isjtzfX8KwHzTIP8qxzV+utPo3ZIhQHxrfPrkzvAXLPrT24ch0L/LOoDWJQ==
X-Received: by 2002:a05:622a:1116:b0:3d3:6285:a63 with SMTP id e22-20020a05622a111600b003d362850a63mr10899504qty.10.1679145226993;
        Sat, 18 Mar 2023 06:13:46 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id bl28-20020a05620a1a9c00b007339c5114a9sm3575523qkb.103.2023.03.18.06.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 06:13:46 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
        stern@rowland.harvard.edu, studentxswpy@163.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: plusb: remove unused pl_clear_QuickLink_features function
Date:   Sat, 18 Mar 2023 09:13:42 -0400
Message-Id: <20230318131342.1684103-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

clang with W=1 reports
drivers/net/usb/plusb.c:65:1: error:
  unused function 'pl_clear_QuickLink_features' [-Werror,-Wunused-function]
pl_clear_QuickLink_features(struct usbnet *dev, int val)
^
This static function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/usb/plusb.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/usb/plusb.c b/drivers/net/usb/plusb.c
index 7a2b0094de51..2894114858a2 100644
--- a/drivers/net/usb/plusb.c
+++ b/drivers/net/usb/plusb.c
@@ -61,12 +61,6 @@ pl_vendor_req(struct usbnet *dev, u8 req, u8 val, u8 index)
 				val, index, NULL, 0);
 }
 
-static inline int
-pl_clear_QuickLink_features(struct usbnet *dev, int val)
-{
-	return pl_vendor_req(dev, 1, (u8) val, 0);
-}
-
 static inline int
 pl_set_QuickLink_features(struct usbnet *dev, int val)
 {
-- 
2.27.0

