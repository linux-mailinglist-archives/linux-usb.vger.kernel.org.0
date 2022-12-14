Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D10264C4CE
	for <lists+linux-usb@lfdr.de>; Wed, 14 Dec 2022 09:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237224AbiLNIPb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Dec 2022 03:15:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237523AbiLNIPL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Dec 2022 03:15:11 -0500
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848B9E00
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 00:15:10 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id cp23-20020a056a00349700b005775c52dbceso3711907pfb.21
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 00:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZlQfCsrJq4nqGiGSGJoqdYiGzQG1JqFCkFWZgjViQrU=;
        b=Eb2gingklSMl9cha53wgAH0IBEyXBUinCjy4bH0XwYS066GkCfGG4lKjHYkRDEVxgG
         otK7YVOfig0248wrC/C+nDjvzfrUmK93mXrmV+fmvFaroL0YakK6RRLkrDqRJsq91zNp
         6+yjdPqikrw9AROQwNWnxq6HDdzE3BRNhezCVqDaTsVn6LX99Ys+UdNtT/Wxnfl7D8al
         wv5/nASL4w8NX6r5ocvmt+CNqV3zGK3sskAToMPvI7Xnj52rQayO2Y/27A83V+SSPZoN
         h49USi8WYVWojrlD4hJHoPcdbgSpP3nbipnL2QHeIlQkJ9B+CMzhxKFNeSCR4cT/yhk3
         433g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZlQfCsrJq4nqGiGSGJoqdYiGzQG1JqFCkFWZgjViQrU=;
        b=PJW1jHr3lt1sHA3cqir0TGN6HFkRRki7v45EudioH1duYhaaSOSwLse6dzxHp9QhSZ
         uqnPfOAZQOn8+EpxOykI4CrBEI26SW4gOXO1HHNRphPSyBANbjW/UT7t8lAQ3c/LFbba
         D/f8jraIEhokpx5y0v0wvJj2hFF5rFzZNRHNgoj3znMuDrE6pNT07KofJct+aLPdjGIO
         BLv7dTCboipP9zCpU/YPjcijU53e3k2d3utOJIxODn+QipreuzJFoY7/Rdf7lJb0MPhC
         MT7fNv77xNG1RnrUckNHMstXw1qAK2w1sKRmeY2JNwLoEB8+U+xWIESjQD63d3inFusU
         w0rw==
X-Gm-Message-State: ANoB5plO5Cmx2HACS+Vsqd+HJeojyR8E6lDRxiikugfc/innr2rSuc+Q
        ZXtarKYGCD5YjWM0ZvcJpIxLNbLLvz/J
X-Google-Smtp-Source: AA0mqf436BRHiFtx2EhinRKwvE/0cKEMDHFzkVG+T8QjqxOq8AgDKBl7X6OMbCXBnWQNg1DZOzrfvxPKdAm4
X-Received: from pumahsu.ntc.corp.google.com ([2401:fa00:fc:202:cb1:cbe3:3a49:1751])
 (user=pumahsu job=sendgmr) by 2002:a17:903:3314:b0:189:a208:d13d with SMTP id
 jk20-20020a170903331400b00189a208d13dmr44522733plb.144.1671005710041; Wed, 14
 Dec 2022 00:15:10 -0800 (PST)
Date:   Wed, 14 Dec 2022 16:14:54 +0800
Message-Id: <20221214081456.714859-1-pumahsu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Subject: [PATCH v2 0/2] add hooks for usb suspend and resume
From:   Puma Hsu <pumahsu@google.com>
To:     gregkh@linuxfoundation.org, mka@chromium.org, dianders@chromium.org
Cc:     albertccwang@google.com, raychi@google.com, howardyen@google.com,
        leejj@google.com, hch@infradead.org, linux-usb@vger.kernel.org,
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
consumption. In order to support this, we need to create hooks in suspend
and resume functions. We also upload our implementations for reviewing.

Puma Hsu (2):
  usb: core: add hooks for usb suspend and resume
  usb: core: add implementations for usb suspend/resume hooks

 drivers/usb/core/driver.c              | 36 +++++++++++++
 drivers/usb/core/usb-hooks-impl-goog.c | 72 ++++++++++++++++++++++++++
 drivers/usb/core/usb.h                 |  5 ++
 3 files changed, 113 insertions(+)
 create mode 100644 drivers/usb/core/usb-hooks-impl-goog.c

---
Changes in v2:
- Remove the wrong input in the Makefile
- Change description in commit message

-- 
2.39.0.rc1.256.g54fd8350bd-goog

