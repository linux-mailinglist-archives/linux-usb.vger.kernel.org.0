Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05276651452
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 21:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232852AbiLSUrT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 15:47:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232743AbiLSUqx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 15:46:53 -0500
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C00F13D4A
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:46:33 -0800 (PST)
Received: by mail-io1-xd49.google.com with SMTP id o16-20020a056602225000b006e032e361ccso4622680ioo.13
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffbS/pv8mbkzwi7BuDuXxKBVWgm3Q+ZGzVMRzNeN5+Y=;
        b=nqnUkMASlYpMM28opAhWoAU1NBwY2jEzGkvUjYSnlp7J3g7LFTrfsGOZtIYLEdhmdi
         Nj0kimdtanY+nZdYkSCLG8zQFU5mpiAGqiQ4/RBijOk2L3W2nziZqNXJ7WrHg4TDWzPF
         Y0zsYFU7krvm141/cij+TsvNPr2hxM4hsLciLy3/m5euyiexb3HtGhjQNqBmCnmJGwXf
         MUTgJu5AHfzQ8ShP60lUShV3R5HQAHQcXeXnv2LFkXe7fsBt5cb+gev18+KhxKGr+5kI
         0qXU+ShjEnxk5+V2OJLaQRiEdaCMpClzWMTB2XVgCtuA+SnMmfOOqMTcMe80vuJOW7MK
         SLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffbS/pv8mbkzwi7BuDuXxKBVWgm3Q+ZGzVMRzNeN5+Y=;
        b=Gif7ORx/6YL/PA8Q9rwe4+raSVKWS3MNItPUVz4oeKzSAQxAD15bdcwU7Gu6va4DEX
         x/rYCiih0cOT0PKFJM6R5gmMYEdjNqovM8XBrYx6VZKhVxafb6bewfOUXOJHz+q0YbEj
         iL0dqcqZMSnREuK1vZy2AWTyCfS0bFUXlpsY61zrYXBICQEewdDS1ak/FVZgng1epuZ5
         IIScJekeHA3i3CBpbjz/rjMF0yKbMhud6JM4JpQK8Ij5fJcyKEa9aR4tD4a9tBR3fp7A
         /YudXDgdll3YgoEOmuM1fXpqYoPAdCMN0+TZfH3geATlA9HmYd5ZRYhTX6tGC5rnBMix
         86/Q==
X-Gm-Message-State: ANoB5pmqPQFoT25FP5ROTJyrhvApd43zS4X3mayWmaz6XV77Famxjus+
        3IQLiv4Tj/pYx70R39rgsCsmPctdgXE3Su4=
X-Google-Smtp-Source: AA0mqf6QFQzi7P5j2zCWig0dCG28/HaaTm4atHzN0jrf21gACRfqp7XweVAXGEEiRc1oG+wRFR/a6fqA6RDLewo=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a02:2a4c:0:b0:374:3cc9:2b37 with SMTP id
 w73-20020a022a4c000000b003743cc92b37mr44057930jaw.294.1671482793424; Mon, 19
 Dec 2022 12:46:33 -0800 (PST)
Date:   Mon, 19 Dec 2022 14:46:19 -0600
In-Reply-To: <20221219204619.2205248-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221219191855.2010466-1-allenwebb@google.com> <20221219204619.2205248-1-allenwebb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221219204619.2205248-12-allenwebb@google.com>
Subject: [PATCH v9 10/10] Documentation: Include modules.builtin.alias
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

Update the documentation to include the presense and use case of
modules.builtin.alias.

Signed-off-by: Allen Webb <allenwebb@google.com>
---
 Documentation/kbuild/kbuild.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 08f575e6236c..1c7c02040a54 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -17,6 +17,12 @@ modules.builtin
 This file lists all modules that are built into the kernel. This is used
 by modprobe to not fail when trying to load something builtin.
 
+modules.builtin.alias
+---------------------
+This file lists all match-id based aliases for modules built into the kernel.
+These are intended to enable userspace to make authorization decisions based
+on which modules are likely to be bound to a device after it is authorized.
+
 modules.builtin.modinfo
 -----------------------
 This file contains modinfo from all modules that are built into the kernel.
-- 
2.37.3

