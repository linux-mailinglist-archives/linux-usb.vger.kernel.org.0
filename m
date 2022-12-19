Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B145A65144E
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 21:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbiLSUrQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 15:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbiLSUqp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 15:46:45 -0500
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A9313D08
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:46:33 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-434eb7c6fa5so121260387b3.14
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffbS/pv8mbkzwi7BuDuXxKBVWgm3Q+ZGzVMRzNeN5+Y=;
        b=P+tl9R92zOQTC3t4VBw6Y+REEQFR+YIPONKj6GW/JEp8bc5No52C7OOCdrsY39r2pk
         ySPHB3qcvlRU5J3a0c1HKvTnRbrxxdIckGKtiUEsyPUN5l0UfD7v1cnFyxsrMHjSeg9k
         ntwmZ6EMaNMngUAGGGjhgxLGtrqzmZppNYMUFeLMBFNfhfJNRapWUo64IFmy95TDVTW6
         eYrn2ifH7UePSbFRu2IUDUsVJRJvY1OfevX06T1K98mae5bCESQfnTcEHkMzZpKmcw2g
         1P8ECfIrvtAqhfF2Tnx6DZS+hcBtScf5fdyw1R4krdijYiv/Vn51BrnMfhW4zs8gKpg2
         1oQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffbS/pv8mbkzwi7BuDuXxKBVWgm3Q+ZGzVMRzNeN5+Y=;
        b=M13JBde/ZKRwknPUWIxIyXPb/8RL657R2710TPlHrlNzSdGTo1JqtlVO4fwr13Zdka
         m+RUPWOh8B0s7toPUA7JPt0iJwwU+0610VdDokp6m33Fv9gyEsdvqUyW62joJeWcs22K
         j1IN9etVQq2tnXLjaw+QQtTL8PzFHPmoP4MUWLMzWWaTN9AU5JH4Nz02ZExTK4vcZEQO
         AVH7oJsgCGVLr8eA4UVyGRngIkcBtzFUBjFSLwMYUVwA8M3vy/LYY++yS5FMyRECXMOj
         AZEkf03Sk0RVG7oe6+zwgx556oTlL/QPYupXe60FpJJ1FRf5TiTNuKbK3zIDVg3DV0+O
         EC8g==
X-Gm-Message-State: ANoB5pmPp2YHxHqp74XzqZP7Nn/x7NYnStEYB4hL/g0wWUCnU2aH0sdF
        oegG6lYjxvW/ItPQG0lbvk6naugPc6Qffbw=
X-Google-Smtp-Source: AA0mqf6w0d+8XmJPolVDX0bIGkOzyjIsL/6QyfMCMFcnlg7Ya0kUphOTNwSV8DaOZXqoHbReS+J1QcL40M1hjW8=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a05:690c:ec2:b0:3bd:7135:c319 with SMTP
 id cs2-20020a05690c0ec200b003bd7135c319mr4467546ywb.89.1671482792621; Mon, 19
 Dec 2022 12:46:32 -0800 (PST)
Date:   Mon, 19 Dec 2022 14:46:18 -0600
In-Reply-To: <20221219204619.2205248-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221219191855.2010466-1-allenwebb@google.com> <20221219204619.2205248-1-allenwebb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221219204619.2205248-11-allenwebb@google.com>
Subject: [PATCH v9 10/10] docs: Include modules.builtin.alias
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

