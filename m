Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1F464B6FA
	for <lists+linux-usb@lfdr.de>; Tue, 13 Dec 2022 15:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235928AbiLMOL2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Dec 2022 09:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235038AbiLMOKy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Dec 2022 09:10:54 -0500
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177C320BF1
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 06:10:11 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id n16-20020a056a000d5000b005764608bb24so2122879pfv.12
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 06:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rri1C/o36RGpuqsNznRHQOSMU8c1Xc1sU+YfPaf6jlU=;
        b=qOMVn54CBQX+zS3dkqSqXuujsqCKjQbxFTj8NLINxd0QSFY7ao73U2rwISYqxHmGRn
         UfL1oqA6G7cWIT6jkcl8TTmPApDK3w53hI+Hg1T63gTUIL3PUP3vBUW1LX6d2n/ez6zi
         27eMAeSmZqFSFoB1FP7B9cqhvtp/0emHq/QwkRP4bUNX6/NVV+MYnJR4U0kss5xmoPQH
         qQJ08rqwXR5mpGR+gC2w2/C+oC9VFNkvsRVq6JftPGyxBYsK8jpz5WWY5Y8F2Kqdm61T
         +t2qTj8nlP0hdzLrVMfJGTKqp0bV/8wAQ2u6aeiJpCJF2WyFdKJ8psxekovsKXjQeeSb
         zZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rri1C/o36RGpuqsNznRHQOSMU8c1Xc1sU+YfPaf6jlU=;
        b=Zclazi57DudcS287K6qp8cn1sqZEeDjLMm3GjrYgAOe9lhTYeKQz9uHPLaP2mE0NMi
         4TgqMU+EidDlPvwb4l4m7iNgkAXQ0vXntnpIdA0oNtaY2/BN4wC/xy3uU2bB/M/gBIZZ
         gunqffVIb5i8CleB9w5BYB204t8PrEba7W3KrOv9WMycyaEd2kuHCj4867lXxePYZBtn
         7YrEMK+o1WVBm32j5TSsA+nDV2q2XFTIPfc8XYsRcAkIojXBa9Fl6flmA2k+pBhWFDY6
         Cne2TOV1RKzjDdeJfAgmsc6WYJTsPLaMDGVw7pM8QonAXeBkHMNEuV5jke8T5tZGdgw/
         UG/A==
X-Gm-Message-State: ANoB5pl9mC5OZWqHysSE7ulChJfwJD6pCjFxYPDjZJ/uA8jbrQ0LFxuU
        cMRU1R9l9eX8irMxGoIYdjnBem97uErAtnSU7b0=
X-Google-Smtp-Source: AA0mqf6ExuCX22MtPnxCObSDjOf4ji5iOalM+KjgGr+L98Qfs6x72V7xo+8y0XK99Lin59OhmWdUIGKNcHymnNn+vQs=
X-Received: from albertccwang.c.googlers.com ([fda3:e722:ac3:cc00:3:22c1:c0a8:83d])
 (user=albertccwang job=sendgmr) by 2002:a17:902:6804:b0:189:907c:8380 with
 SMTP id h4-20020a170902680400b00189907c8380mr49845920plk.104.1670940610549;
 Tue, 13 Dec 2022 06:10:10 -0800 (PST)
Date:   Tue, 13 Dec 2022 14:10:02 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213141005.3068792-1-albertccwang@google.com>
Subject: [PATCH v3 0/3] add xhci hooks for USB offload
From:   Albert Wang <albertccwang@google.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     badhri@google.com, howardyen@google.com, pumahsu@google.com,
        raychi@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Albert Wang <albertccwang@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This serial patches enable the xhci driver to support USB offload, add
hooks for vendor to have customized behavior for the initialization,
memory allocation. Details are in each patch commit message. Meanwhile,
the offload function implementations is uploaded as well.

Albert Wang (1):
  usb: host: add the xhci offload hooks implementations

Howard Yen (2):
  usb: host: add xhci hooks for USB offload
  usb: xhci-plat: add xhci_plat_priv_overwrite

 drivers/usb/host/aoc-usb.c           | 198 ++++++++++++++
 drivers/usb/host/aoc-usb.h           | 108 ++++++++
 drivers/usb/host/xhci-mem.c          |  97 ++++++-
 drivers/usb/host/xhci-offload-impl.c | 396 +++++++++++++++++++++++++++
 drivers/usb/host/xhci-plat.c         |  43 +++
 drivers/usb/host/xhci-plat.h         |   8 +
 drivers/usb/host/xhci.c              |  21 ++
 drivers/usb/host/xhci.h              |  31 +++
 8 files changed, 889 insertions(+), 13 deletions(-)
 create mode 100644 drivers/usb/host/aoc-usb.c
 create mode 100644 drivers/usb/host/aoc-usb.h
 create mode 100644 drivers/usb/host/xhci-offload-impl.c

---
Changes in v3:
- Add the offload implementation files

-- 
2.39.0.rc1.256.g54fd8350bd-goog

