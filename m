Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0693764C433
	for <lists+linux-usb@lfdr.de>; Wed, 14 Dec 2022 08:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiLNHHP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Dec 2022 02:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiLNHHO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Dec 2022 02:07:14 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6739ABE3
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 23:07:13 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 195-20020a2505cc000000b0071163981d18so19677541ybf.13
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 23:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Brq+pkw1WCdoMG70dyu0o8ZTMZUjnHOojvZRFTnWmIM=;
        b=EvCYt1E2kGZ+/WPojuGuR8+58u+0ST/k5gsET2f/r0yzFGmkhR0A/I6m+5MJoWfwly
         twaLAwoyoq0gBtOJMIy5k4BSKOom+V9m8fDsun1/4nFvVBN4xbrpkMdXqDJh3rMsi2zB
         677P1fI0lo28wYEetApNJlxEbWYgICILTnaNJe/QpG1/PKI3uWnxJKmVXMDpBJiB+b9F
         zh/xQHdwb5jxa5+EA03OgvQZmtAZPbW4LmbsuYvooyVwc3SvJhbg5xqY/xbWRN/Yc6rI
         49ZMe4ix9QCISPYg8n9j5OB8dqLrL6/ig4qdurufSn39X24LjS0sUZlnsSaucGbedUVb
         09pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Brq+pkw1WCdoMG70dyu0o8ZTMZUjnHOojvZRFTnWmIM=;
        b=rkcK56gxQLAlbnwkezfPizJzQkz9l07NWFKMjD3UBN146esO02fwFWZBzJO92STMHc
         EwzG9vH6dqNowx2LMrylzVqLNVyvkv8aW/Qr1z17owCMgFur2UBOl8Fzz736enskC77Z
         736lFHHZP/Wxp9AZA3ho+NE5jHpQ+PQvkxCEQ1wXIrfcIX+xrI2vtmPXzQaYW7Cw42RO
         XTEtH2vzefVjSiYUf+sexxye7Q/lzxhxKs/+BAKM+Wbp/HTWjBk7Di4WTHrGJgbwBpGJ
         M9m9FP6m4eZp8nTD2qWpHowrwWUDuecE1w9uzrmbtTORdBqbNBOOsz3PmbPQ1QrF4msk
         yrdg==
X-Gm-Message-State: ANoB5ply8D/MoDu7m14MiIfOrr8iz2epCVh+l6gaw9dmrp2Lip/ztA9X
        dKzjMTOjoeU9nL7vAsOJd/xM0sr5p562
X-Google-Smtp-Source: AA0mqf5cRZIr9FbFwyWPrhxUwM2adn+MmJxlnfOZFmRKBRvX0hxeoSS9q9O2XRp3l1P3/mVkTluwKain0Wo4
X-Received: from pumahsu.ntc.corp.google.com ([2401:fa00:fc:202:cb1:cbe3:3a49:1751])
 (user=pumahsu job=sendgmr) by 2002:a81:7b08:0:b0:3ca:81e2:cf21 with SMTP id
 w8-20020a817b08000000b003ca81e2cf21mr613930ywc.13.1671001632666; Tue, 13 Dec
 2022 23:07:12 -0800 (PST)
Date:   Wed, 14 Dec 2022 15:06:48 +0800
Message-Id: <20221214070650.703793-1-pumahsu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Subject: [PATCH 0/2] add vendor hooks for usb suspend and resume
From:   Puma Hsu <pumahsu@google.com>
To:     gregkh@linuxfoundation.org, mka@chromium.org, dianders@chromium.org
Cc:     albertccwang@google.com, raychi@google.com, howardyen@google.com,
        leejj@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Puma Hsu <pumahsu@google.com>
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

In mobile, a co-processor can be used for USB audio. When the co-processor
is working for USB audio, the co-processor is the user/owner of the USB
driver, and the ACPU is able to sleep in such condition to improve power
consumption. In order to support this, we need to create vendor hooks in
suspend and resume functions, and also upload our implementations for
reference.

Puma Hsu (2):
  usb: core: add vendor hook for usb suspend and resume
  usb: core: add implementations for usb suspend/resume hooks

 drivers/usb/core/Makefile              |  2 +-
 drivers/usb/core/driver.c              | 36 +++++++++++++
 drivers/usb/core/usb-hooks-impl-goog.c | 72 ++++++++++++++++++++++++++
 drivers/usb/core/usb.h                 |  5 ++
 4 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/core/usb-hooks-impl-goog.c

-- 
2.39.0.rc1.256.g54fd8350bd-goog

