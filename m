Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A61B64F3E1
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 23:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiLPWRp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 17:17:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiLPWRd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 17:17:33 -0500
Received: from mail-oo1-xc49.google.com (mail-oo1-xc49.google.com [IPv6:2607:f8b0:4864:20::c49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748012A252
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 14:17:26 -0800 (PST)
Received: by mail-oo1-xc49.google.com with SMTP id b6-20020a4a3406000000b004a5ffc77240so1727882ooa.17
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 14:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIc91OoDv/mBPCGHIucL2csPnIlsRLcBZ/NTNtcT38Q=;
        b=hAoT5MIAnuQSmqmxxyxbUJFAq8kFycgaIH3Rd2PXnLLgq4zV8nNoyOLPpXnYFa90MJ
         S/Y97RfYpDzWFWmFoI7ftgkP5qIXUmtQycstRGSutXYJQNRXpI+/tA5cXZ4MkpqC8m9h
         cdSrO4eoWj8H2mN8FnnHxk2Rf2m10M6jdxzt54kh/QZlJFj+8othZIIk4iBw9mv518Wa
         1nQCSs5NUtfc0KkQN4P1EoPdmiYOe5KUsMZcNEYfChG0LL7SEfTDyV6SdUUiun7x6Vqh
         z6UcYgV6HizryvFbeMJ1FomnoFuWgB4DkUC10Huv6lBsxzb6LQvZYjqwm7y4dJedWs6M
         eNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIc91OoDv/mBPCGHIucL2csPnIlsRLcBZ/NTNtcT38Q=;
        b=7zAgPbM8WzZyLmArsXv+DLNXzC0/reZfR6ly5Ay/VqG5gefRNLZSIWTKYn8ecYiVBz
         oUNgjEdepwaWbmXJ78WCYjcs1zRo3ryBNtYE44/H2eAZDWWwUSNzpjvw2ZyMIf4eq0Xc
         kgYabViXRUBdCzX3ZYAEJE65Yru8z8j8RC7rIlF13Jw48UwxuGMlXnTHQ8r2UwDqP7rM
         wNNZ3lzAbHek7RlU9jowoGnEOwPl9neKzm0Y6EW/b0EfP7d106KyLaILGfyjBqbQktpy
         CmYxJNteZT3qBBxv2PnZ2NndqzdBHLlCpbUUX8lT2E9fi3eGfGVfAL+oOTEOu+E8p/o5
         gaPQ==
X-Gm-Message-State: AFqh2kqdxgUmbWFY+IBc87VH7xMNX/AnqD/ZPoTMRvukoi+6VRT/lxVh
        zv96pAuWz91O05FGQribnJJEzNtPxV+mJec=
X-Google-Smtp-Source: AA0mqf71zNbvpxkSmqWDhizcNttRiDlQ6M7Uz0HofAn4JFHR2CcqiiSdNsVRzV138EW1X7bnH1CHA4hsEUcea+s=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a05:6870:6b8d:b0:143:53aa:5813 with SMTP
 id ms13-20020a0568706b8d00b0014353aa5813mr717884oab.161.1671229045721; Fri,
 16 Dec 2022 14:17:25 -0800 (PST)
Date:   Fri, 16 Dec 2022 16:17:03 -0600
In-Reply-To: <20221216221703.294683-1-allenwebb@google.com>
Mime-Version: 1.0
References: <Y5IA2NYE5IaAzNby@kroah.com> <20221216221703.294683-1-allenwebb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221216221703.294683-6-allenwebb@google.com>
Subject: [PATCH v7 5/5] build: Add modules.builtin.alias
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

Generate modules.builtin.alias using modpost and install it with the
modules.

Signed-off-by: Allen Webb <allenwebb@google.com>
---
 .gitignore               |  1 +
 Makefile                 |  1 +
 scripts/Makefile.modpost | 17 ++++++++++++++++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 47229f98b327b..40a90bca89641 100644
--- a/.gitignore
+++ b/.gitignore
@@ -67,6 +67,7 @@ modules.order
 /System.map
 /Module.markers
 /modules.builtin
+/modules.builtin.alias
 /modules.builtin.modinfo
 /modules.nsdeps
 
diff --git a/Makefile b/Makefile
index 78525ebea8762..572f364f40538 100644
--- a/Makefile
+++ b/Makefile
@@ -1558,6 +1558,7 @@ __modinst_pre:
 	fi
 	@sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
 	@cp -f modules.builtin $(MODLIB)/
+	@cp -f modules.builtin.alias $(MODLIB)/
 	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
 
 endif # CONFIG_MODULES
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index e41dee64d429c..94c1d66c7769a 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -15,6 +15,7 @@
 # 2) modpost is then used to
 # 3)  create one <module>.mod.c file per module
 # 4)  create one Module.symvers file with CRC for all exported symbols
+# 5)  create modules.builtin.alias the aliases for built-in modules
 
 # Step 3 is used to place certain information in the module's ELF
 # section, including information such as:
@@ -51,6 +52,21 @@ ifneq ($(findstring i,$(filter-out --%,$(MAKEFLAGS))),)
 modpost-args += -n
 endif
 
+vmlinux.o-if-present := $(wildcard vmlinux.o)
+ifneq ($(vmlinux.o-if-present),)
+output-builtin.alias := modules.builtin.alias
+modpost-args += -b .modules.builtin.alias.in
+.modules.builtin.alias.in: $(output-symdump)
+	@# Building $(output-symdump) generates .modules.builtin.alias.in as a
+	@# side effect.
+	@[ -e $@ ] || $(MODPOST) -b .modules.builtin.alias.in $(vmlinux.o-if-present)
+
+$(output-builtin.alias): .modules.builtin.alias.in
+	sort -o $@ $^
+
+__modpost: $(output-builtin.alias)
+endif
+
 ifeq ($(KBUILD_EXTMOD),)
 
 # Generate the list of in-tree objects in vmlinux
@@ -78,7 +94,6 @@ targets += .vmlinux.objs
 .vmlinux.objs: vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
 	$(call if_changed,vmlinux_objs)
 
-vmlinux.o-if-present := $(wildcard vmlinux.o)
 output-symdump := vmlinux.symvers
 
 ifdef KBUILD_MODULES
-- 
2.37.3

