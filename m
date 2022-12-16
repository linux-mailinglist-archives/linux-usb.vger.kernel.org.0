Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E08B064F3E8
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 23:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiLPWRY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 17:17:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbiLPWRV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 17:17:21 -0500
Received: from mail-il1-x14a.google.com (mail-il1-x14a.google.com [IPv6:2607:f8b0:4864:20::14a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C779029369
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 14:17:20 -0800 (PST)
Received: by mail-il1-x14a.google.com with SMTP id 7-20020a056e0220c700b0030386f0d0e6so2484185ilq.3
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 14:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QIkoHfPVoGJGQCXWyZmF+mudK9y7JC4uGfB+VF9vmAA=;
        b=DPM862br1ksx4WgfZPPdueiIQnI6WvqPmGTG1MgLblwtuOlS7D2+IHQhAHJWXU9iNG
         j4RxkkFEM0HoFL3kqNsdC+IJMWBTwI8W6+Ta5PvZplSXceS8nTDmbx2x+33J5oD92OFT
         g77b5zdEyCeTgxNQQFcZA/XalLB+/1uF5YTqvBjiIxsFzKG/Km8FlFj84+FnuoT0LMow
         HT2aw6HDm83sOt0XTM+xnEBPzPFUkRx+tiHqOWVrRF/4zSEfTDSIW0wZe/YA3+3tJQA8
         F7V6Z8l7ZANhHSadRJglbkKVcT0i88Xi5gRe00KnPx6R6+C1xOoBUsZ+idFieWINkCzf
         aXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QIkoHfPVoGJGQCXWyZmF+mudK9y7JC4uGfB+VF9vmAA=;
        b=EdRo9IP7zjzizqVIUKWD4A62Nu1pnUeyNH3SxyoHqmvbrXZsfGTrr5enP3BIEM/nxi
         ZJSTAW84Tgc4Q2knDQmBnAoFJLJWS9tWxT/lzmvRGH11o2w7W/qJUmk7Cbmwlayae98c
         ulODcKOQ6jzitcTxR3Ar6y0A2W0p7neKjYmmiVeKZ9gJSDkv+ky8Sg87E4qRBlNvf6Lb
         a7EwlnwKaTojN2BbBncTGcFj3FTQnJ8oK6zi8ndvGwO3sgVjZUtzOon1L7T2ElU1euAS
         R69ex4mVngOdRBgY7RbJcqCAo6Cm1Bfmm2zhcEdBgt+B357GxIultmDydZSfTuJomhfT
         RMQg==
X-Gm-Message-State: ANoB5pn+cEjYRArbLPBIKXn57M47sj8pTorLbirQ5S8LEb7zMBj7CieO
        MnR/kiE/jkSczm55gvkPnVxdVRjlYfZZk7o=
X-Google-Smtp-Source: AA0mqf6TfmBK0Mx/g4QE2FH2JCuQ34V+4c+rpIqMat7imN4HKSMjxbOfVMuq9+IWftjxtKMRD5QngzlpEPjmoOk=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a5d:9e4a:0:b0:6de:42ff:d96b with SMTP id
 i10-20020a5d9e4a000000b006de42ffd96bmr34882896ioi.58.1671229040270; Fri, 16
 Dec 2022 14:17:20 -0800 (PST)
Date:   Fri, 16 Dec 2022 16:16:59 -0600
In-Reply-To: <20221216221703.294683-1-allenwebb@google.com>
Mime-Version: 1.0
References: <Y5IA2NYE5IaAzNby@kroah.com> <20221216221703.294683-1-allenwebb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221216221703.294683-2-allenwebb@google.com>
Subject: [PATCH v7 1/5] module.h: MODULE_DEVICE_TABLE for built-in modules
From:   Allen Webb <allenwebb@google.com>
To:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Allen Webb <allenwebb@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Implement MODULE_DEVICE_TABLE for build-in modules to make it possible
to generate a builtin.alias file to complement modules.alias.

Signed-off-by: Allen Webb <allenwebb@google.com>
---
 include/linux/module.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index ec61fb53979a9..49e4019393127 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -243,7 +243,15 @@ extern void cleanup_module(void);
 extern typeof(name) __mod_##type##__##name##_device_table		\
   __attribute__ ((unused, alias(__stringify(name))))
 #else  /* !MODULE */
-#define MODULE_DEVICE_TABLE(type, name)
+/* The names may not be unique for built-in modules, so include the module name
+ * to guarantee uniqueness.
+ */
+#define MODULE_DEVICE_TABLE(type, name)					\
+extern void *CONCATENATE(						\
+	CONCATENATE(__mod_##type##__##name##__,				\
+		__KBUILD_MODNAME),					\
+	_device_table)							\
+	__attribute__ ((unused, alias(__stringify(name))))
 #endif
 
 /* Version of form [<epoch>:]<version>[-<extra-version>].
-- 
2.37.3

