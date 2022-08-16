Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBF059588D
	for <lists+linux-usb@lfdr.de>; Tue, 16 Aug 2022 12:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234914AbiHPKh5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Aug 2022 06:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234832AbiHPKhF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Aug 2022 06:37:05 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0288FF47
        for <linux-usb@vger.kernel.org>; Tue, 16 Aug 2022 01:39:01 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-3238ce833beso97038657b3.11
        for <linux-usb@vger.kernel.org>; Tue, 16 Aug 2022 01:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=EOnmlL6LsfTodQR77oJXoAN0zndUFH29ZZQq5z6fShA=;
        b=ksnZOtVsQpnTNhmqOOPXxrs5IqXuxFIcTmOFlk76hKpPDUtlleKXGAwWUDkdGaCN9e
         4cwxOGqLMomyIFchTf6OCwasMmAYp7f+rYosLs3c8G68lm1jauSK9+6mk0jyBSq7LtRt
         MkCqC2uIgKfaj9345ubs0HF72kvhC9yf4ee9prhuWM/J9ydPqweIchGBL7z6CWavmDRg
         WZTUFEmHFFL/MudmIYZ2YD8LOPSN04hvOCwAPrfLNcCep7Z+BVZ6mcrg6zdgJL/hS+Zl
         LNaobAblgKvpd01LAhNJRnRpbfxpSfI59fdkEFpWCYJE/+jbDmN5uzgBowPXQMTVLKQd
         qsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=EOnmlL6LsfTodQR77oJXoAN0zndUFH29ZZQq5z6fShA=;
        b=EUmngXHZqwXPz4BQsWxuMpTSILCE4SHFcTVyljJqvQhKu1c8fjQqP4e/iZDlX+NExK
         XoAgWH5+k63C8BHfi5POX5L36GeYXC7T9VVCtqzLPfXnKnGdzse3GckTTot5BYW9f1OX
         QTGgrihTRMhrGmQe3hnu2edNWECiTX+KRo1Cf3tRXaoLCCs2SeEAEljcpMCo5trBGwTv
         FwsXbclyOCo70XUOD4TKCfC/QCHxHh39R/7UUw0daNYL0LXKhbk5U3LZLb0zLUxjpTPN
         MsOsSpEs9tuZ6PzI35NOyH5N8IQ5cnxqJirAT0ZydUXADdcZCCFcyQcVStl3/32ckWmJ
         oYqg==
X-Gm-Message-State: ACgBeo2t2uSn+W+ADhiwiXV7uGJ8ktMpcLZSaQuLPwo+4hAmEfbIcEEG
        Bd0JPgplDNJ7WHi9vUebmz/6c6aAgvA=
X-Google-Smtp-Source: AA6agR66iqEt6akaam8vWCgoFbvY0jmRCa/rYuE7K5o6nnTQZ9Aic9AaluOidN0pnHQF8W3edRxwLGTTlNo=
X-Received: from raychi.tao.corp.google.com ([2401:fa00:fc:202:5bfb:2ce6:1e1b:f496])
 (user=raychi job=sendgmr) by 2002:a81:ae55:0:b0:31f:6630:9736 with SMTP id
 g21-20020a81ae55000000b0031f66309736mr16694413ywk.346.1660639140284; Tue, 16
 Aug 2022 01:39:00 -0700 (PDT)
Date:   Tue, 16 Aug 2022 16:38:52 +0800
Message-Id: <20220816083854.1491886-1-raychi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH 0/2] Provide a hook to check port init status
From:   Ray Chi <raychi@google.com>
To:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        stern@rowland.harvard.edu
Cc:     badhri@google.com, albertccwang@google.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Chi <raychi@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, only usbcore knows port init status even if the result
is bad, so it will keep doing USB enumeration and other drivers can't
do anything. Add the hook to let other drivers know the status and do
error handling.

Ray Chi (2):
  usb: core: add a hook to check port init status
  usb: xhci: add check_init_status hook support

 drivers/usb/core/hub.c  | 14 ++++++++++++++
 drivers/usb/host/xhci.c | 17 +++++++++++++++++
 drivers/usb/host/xhci.h |  1 +
 include/linux/usb/hcd.h |  8 ++++++++
 4 files changed, 40 insertions(+)

-- 
2.37.1.595.g718a3a8f04-goog

