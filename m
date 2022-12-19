Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061F4651449
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 21:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbiLSUqn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 15:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbiLSUq2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 15:46:28 -0500
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B2B12A8D
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:46:27 -0800 (PST)
Received: by mail-io1-xd49.google.com with SMTP id e15-20020a056602158f00b006e01d8fa493so4614295iow.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8H+688P7vbFiGJ1BQ5c1Gn7u2rmje2kOlAqfxbXizp0=;
        b=hlLpYyCAQfl+MIvWNIXiPjtfE2Ac9W/jMEeedSCc9xOWKwW8B4pnGdF4IrFSo4ZBbv
         E0gMdAmwR7I2MkjyCMWTmbVPWclTfr6tnZ8k8i2JtR5E6sFpnzv4ALxFqm/Yg//ALMBj
         VA2NhNpbG+MNilIgP8azk/Y+U+Eg39zrLR35qwyKASquB12Lzlmt1kYibif8x3X8XD09
         Cx0sWfwFTnuv15KXRd6ZlkspXo67DUuXIIrosUuK6Qq0MvNccg12PFiaAQ8yk7eYipN3
         NHcCXdo5BCJM7j/CPt0n37dnA8/jrNrV+D0ULQjUKpNQGwqpb+kmo0RyJWJvqhA3Qrmb
         v8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8H+688P7vbFiGJ1BQ5c1Gn7u2rmje2kOlAqfxbXizp0=;
        b=EWd8HJbwruGqYEMIcjJ73cuY29cukgrgY5xgA/LLBxyHXRgcNAyXJ+359PdwcjRP2G
         nW8wDpIj0nWgNqVNm0ro102Lw3osoOCYAU50SB9TIJDXfY3tFM2eqkJ24xT6pj/2FKU4
         2K5T9lpkKah7/sUzO/3HPiF0/4p5KuB92Z+TFDzeC7OndyLWrKBUWegXvz8DQFFZrGu7
         ANelib8LlkMBLazM+JCLaOUny3/ELqt3ZlpFT3gvHJCrONEz9LpHJR44vAyutXhAlmFR
         5C0u0lvQYIyDnAz7w/DOn5OuMXVryxldoX2a/7pKlyg0iHaURyAD6oq2coADm1w4Ieu1
         bbsA==
X-Gm-Message-State: ANoB5pk6VSdC00LdjQgw3sJsp4VpQEcXtKb8cHPbjb1Pf9bjcmYkiKDL
        oJAaJ0CVTwAFzPO+wA8Wqkkr5+HwVnHu25A=
X-Google-Smtp-Source: AA0mqf6T5dV8Yz0FXxbcdkxhpq283/ELJ0rlIwQCuUAeNfuNYlBGlC1OqEC85ctKhtBm+Yx8EW1rs5EKhZc0my8=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a6b:db1a:0:b0:6e2:f383:f68d with SMTP id
 t26-20020a6bdb1a000000b006e2f383f68dmr2494390ioc.75.1671482787431; Mon, 19
 Dec 2022 12:46:27 -0800 (PST)
Date:   Mon, 19 Dec 2022 14:46:13 -0600
In-Reply-To: <20221219204619.2205248-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221219191855.2010466-1-allenwebb@google.com> <20221219204619.2205248-1-allenwebb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221219204619.2205248-6-allenwebb@google.com>
Subject: [PATCH v9 05/10] module.h: MODULE_DEVICE_TABLE for built-in modules
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
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
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
 include/linux/module.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index ec61fb53979a..3d1b04ca6350 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -243,7 +243,20 @@ extern void cleanup_module(void);
 extern typeof(name) __mod_##type##__##name##_device_table		\
   __attribute__ ((unused, alias(__stringify(name))))
 #else  /* !MODULE */
-#define MODULE_DEVICE_TABLE(type, name)
+/*
+ * The names may not be unique for built-in modules, so include the module name
+ * to guarantee uniqueness.
+ *
+ * Note that extern is needed because modpost reads these symbols to generate
+ * modalias entries for each match id in each device table. They are not used
+ * at runtime.
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

