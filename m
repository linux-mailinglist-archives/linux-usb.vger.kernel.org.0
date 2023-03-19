Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADAE6C0243
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 15:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjCSOLm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 10:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjCSOLk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 10:11:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB251E29E
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 07:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679235063;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Mxfg9kgQ8xTY4kfBNMCHJxuv4+U4pmpKqJi9ZEPAVGs=;
        b=Lz5mLWhoz928qp8uYpU5v90EwhGNtTsS1iQeOjBBgALg1davIc7ugJBzqLqAXPluC7+PIn
        nrdh08U9wVwKgW+4OX9g4Zc+0/ueIgkkBZYPHGhOozvGAcRUToaOY5Hqt1OMEdt8ZXa7XW
        chM32oqWVg6zmXCw1a6K2R/FK0s95bI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-Jhe4oU0HNtKbL5MKPNjdAQ-1; Sun, 19 Mar 2023 10:11:02 -0400
X-MC-Unique: Jhe4oU0HNtKbL5MKPNjdAQ-1
Received: by mail-qv1-f71.google.com with SMTP id h10-20020a0cd80a000000b005cc75c78efcso103524qvj.21
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 07:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679235061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mxfg9kgQ8xTY4kfBNMCHJxuv4+U4pmpKqJi9ZEPAVGs=;
        b=OqAUfDVwZt5tmOp3QkXQbLvH9xY1er6KM1HSWRsYJPmjfo0Uc+RS3/z9BOidkrjXAX
         QqJzC8Nw3xo1YRu0uNGrR+NtLlMot2qYWMJOQ6Cb9W7wovMiL1s5cYrNO/Zdqh7DmQQh
         pc1uC1bkvif/Oi80Ceo0LtJYwUajmhBYpvWjEhzhhZLIkm2h+HoYe6Dov+CwZKporfTS
         TYkIQ3dDhXMCve0Lra2JyaFU2+XIX5OgTLLe/N+n3nuht5eINXAnv72B7yehHQ1y4VkU
         ZxIZCchx+zDHdr0wmilQw3zZpog55sw2qh1ezHrf3asksFpg/Lk+L0YgrAMOcdHxpGCw
         /xuA==
X-Gm-Message-State: AO0yUKXNWb54X8JWS8LvhffJ7zOddKwqIIvphM//7j3pdAqR3QLDMplB
        +fl6jx2Lltqi5kCEEypuC2k/aT1jynVx0TEdTqXKo2SlPG1bsyHgC0dfFmMMZ/SypM3XJ/9G1YP
        /12j4mFZcaRCxQQv1VM0d
X-Received: by 2002:a05:622a:1356:b0:3db:6f27:60b9 with SMTP id w22-20020a05622a135600b003db6f2760b9mr11743868qtk.15.1679235061580;
        Sun, 19 Mar 2023 07:11:01 -0700 (PDT)
X-Google-Smtp-Source: AK7set82QnetAWI+F3gcmRcjmUamYUEWEUr1FY8V21h15oRUvVodbHhYtRBiyrHKXmDFomTxkbB5rQ==
X-Received: by 2002:a05:622a:1356:b0:3db:6f27:60b9 with SMTP id w22-20020a05622a135600b003db6f2760b9mr11743843qtk.15.1679235061327;
        Sun, 19 Mar 2023 07:11:01 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id p11-20020a05620a22ab00b0074583bda590sm5492950qkh.10.2023.03.19.07.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 07:11:01 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, nathan@kernel.org,
        ndesaulniers@google.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, llvm@lists.linux.dev,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: typec: tcpci_mt6360: remove unused mt6360_tcpc_read16 function
Date:   Sun, 19 Mar 2023 10:10:53 -0400
Message-Id: <20230319141053.1703937-1-trix@redhat.com>
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
drivers/usb/typec/tcpm/tcpci_mt6360.c:46:19: error: unused function
  'mt6360_tcpc_read16' [-Werror,-Wunused-function]
static inline int mt6360_tcpc_read16(struct regmap *regmap,
                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/typec/tcpm/tcpci_mt6360.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
index 1b7c31278ebb..6fa8fd5c8041 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
@@ -43,12 +43,6 @@ struct mt6360_tcpc_info {
 	int irq;
 };
 
-static inline int mt6360_tcpc_read16(struct regmap *regmap,
-				     unsigned int reg, u16 *val)
-{
-	return regmap_raw_read(regmap, reg, val, sizeof(u16));
-}
-
 static inline int mt6360_tcpc_write16(struct regmap *regmap,
 				      unsigned int reg, u16 val)
 {
-- 
2.27.0

