Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4569C6EE19E
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 14:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbjDYMIc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 08:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232881AbjDYMIb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 08:08:31 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 006E849CB
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 05:08:29 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4edcc885d8fso6264550e87.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 05:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682424508; x=1685016508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t0zGAyfvuBOl901b9x32jl8b0vHTFEeezVTSqmkq6+Q=;
        b=B9Glg16/Dtt+Um5cxZmlJGJ2b8nebW1rjbrMOb/OaudIdlz9cajOE22YheRps4ws+/
         8pOV8hKsbb9Bzo0dBEPPV9HpxsiW4Gwbr6JGlia+SVm2pgDJaJ0ebaW28YM0UGSgdOfk
         cs6+bnJUINrrOCu+f/FqYOYA9A0jRELiPMpj6EL/Bm0omSBKpYpRm8ziHfUh7JcqjIKk
         sFK4643LmoddvAyZu1JTtltp55O/XE3SGprZ/9g5hswbNt+bPfqUTq1eSym0MtYUKxS5
         z6KMb7YgMmFQnPh/iCaL+mjcmGEv49FehDgCQgGBORNqnF58dG/55NZ5FR7MNjVH1mS2
         30sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682424508; x=1685016508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0zGAyfvuBOl901b9x32jl8b0vHTFEeezVTSqmkq6+Q=;
        b=P+/QvJOM/g2UC0+iO1L5ewzcEzCdtl5I5MsY5LK30pW5xu5Klo7kF58kEn4wseMbvI
         F0557TohP6y37qaq151p7I92Zzc5PHn+kMsSeg9zKJhw12aYyQrdXg3i4q5JjNVtuAjF
         Cb9ziLj0UeYIxT+NLPjhufENMZjmwUbESAjMwxMN+Lk6v3bndBL+u7kw+ZMtDTVUzqJo
         wmQkvPlPUrqWnEk0+VAb1kEBiSg4/0clz1wIcIsQxepFdyJe5Ih+fJHLwdDJ1p78dJkM
         pTk0oCMYjNVqDMnxLZYypOV0WRkOVVJfnn3jPIPS4IcpOvcfFGiZrhl9xG+EpIRtnSug
         7gbA==
X-Gm-Message-State: AAQBX9dZPDOv4lHiYaEAEEWEULgc9HlNzwAmOVHE8o5kc6ZfWMYDOxzr
        LkQYX1TbsTpcI/CnH5IkH4Q=
X-Google-Smtp-Source: AKy350ZXfRW5tXr0wZu5jxSQwTulBpo0J4GzoZVFj5NAXeqhnP96GqOMkXvPZ36zd2cvwlaraV1X+A==
X-Received: by 2002:a2e:9556:0:b0:2a8:c4d0:b135 with SMTP id t22-20020a2e9556000000b002a8c4d0b135mr3321976ljh.49.1682424508014;
        Tue, 25 Apr 2023 05:08:28 -0700 (PDT)
Received: from t630.example.org (45-11-61-13.ip4.greenlan.pl. [45.11.61.13])
        by smtp.googlemail.com with ESMTPSA id f22-20020a2e9196000000b002a483f01d9csm2093548ljg.85.2023.04.25.05.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 05:08:27 -0700 (PDT)
From:   Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
To:     gregkh@linuxfoundation.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org,
        Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Subject: [PATCH] usb: libcomposite: prevent duplicate bEndpointAddress by usb_ep_autoconfig_ss.
Date:   Tue, 25 Apr 2023 14:08:10 +0200
Message-Id: <20230425120810.5365-1-wlodzimierz.lipert@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_ep_autoconfig_ss tries to use endpoint name or internal counters to generate
bEndpointAddress - this leads to duplicate addresses. Fix is simple -
use only internal counter and dont rely on ep naming scheme.

Signed-off-by: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
---
 drivers/usb/gadget/epautoconf.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epautoconf.c
index 1eb4fa2e623f..40adf09079ed 100644
--- a/drivers/usb/gadget/epautoconf.c
+++ b/drivers/usb/gadget/epautoconf.c
@@ -93,10 +93,7 @@ struct usb_ep *usb_ep_autoconfig_ss(
 
 	/* report address */
 	desc->bEndpointAddress &= USB_DIR_IN;
-	if (isdigit(ep->name[2])) {
-		u8 num = simple_strtoul(&ep->name[2], NULL, 10);
-		desc->bEndpointAddress |= num;
-	} else if (desc->bEndpointAddress & USB_DIR_IN) {
+	if (desc->bEndpointAddress & USB_DIR_IN) {
 		if (++gadget->in_epnum > 15)
 			return NULL;
 		desc->bEndpointAddress = USB_DIR_IN | gadget->in_epnum;
-- 
2.39.2

