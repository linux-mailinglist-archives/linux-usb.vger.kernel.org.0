Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D88F828B373
	for <lists+linux-usb@lfdr.de>; Mon, 12 Oct 2020 13:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387859AbgJLLKi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Oct 2020 07:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387594AbgJLLKg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Oct 2020 07:10:36 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81639C0613D0
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 04:10:34 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id h31so12434258qtd.14
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 04:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=3D+iUgAkOur1ln/tSlUdFsYgd3nRWfygTBeUj381R+w=;
        b=FjitLsxSV7fDLJTjWgRHfAL3AURwjaurcsA00gTdYrDDgOr0hV5d3MVOPPFWyx/M0O
         HA4I99D0mK8zF8ahT8Hpug4PzH/XxzB19ZajFEO/99oy7YYP1rGPp2x2oUXcEz5fGUuA
         AepIqPhQCSXL9Bg3VS/SVGQ7jlq9QCdu2zijrcgrDX056DtxuHbC8kOKtaHYDIVYdSAP
         dBkSyrSVZ1v8Tav26HsBaSkA2d3wtd+BSVOS5vdPLIR8SQpFHCvnXtzepsDzXJw/rf7E
         LrnCb4Ku/J6wWdb0f0nAEOZ5r3dSyV7LSysHaUSDW71aMt6sLuWeD6KWi02ZRwu+xOCW
         jFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=3D+iUgAkOur1ln/tSlUdFsYgd3nRWfygTBeUj381R+w=;
        b=fP6VXJT48IJ886bX92m4GSjzf7z9WWyQhCFOw4LeeSd7oSdRk8PYX8HTtcMmF6eC25
         Ggzvdw13gnmrffWS+C+72LBRu26blhPKPyoIcQUhDLqExhcvy8HPEPbQqtyKK5cZrBiL
         BqVL6jfZ3OQt7LtE2Wi22LiPuEH2cJ8Fal3kTvApZQ7SlbIOnqLNj7QUlpQgbOTDSKwS
         VDF274UuqY5QgpV7O/u7+7JQ50TMAZpDXUKHHbUvkFFD13X/ltdPgzouQe7Htr2lFZaT
         P36NEiQPTm0omJdxVwEN08Jy3O29gBRAxG2IUFVXUAm6sB55BQv28bpEqly0vV1FWH19
         8ZrQ==
X-Gm-Message-State: AOAM532NeXyIHOQJwossqblaNTO94vO73LAL1zUDXaJOhiW7Dn0f8mAH
        +wz6lD50NAOhoSysfls4N7SolNYJvuxH3w==
X-Google-Smtp-Source: ABdhPJz1HT7abBlSkvktyDViakKC0srBmkvNzEXx+HMq87tD+lrEoCpAarPsJmJDo6FSB+jhvSYj4tXV5RoQlg==
Sender: "rickyniu via sendgmr" <rickyniu@rickyniu.ntc.corp.google.com>
X-Received: from rickyniu.ntc.corp.google.com ([2401:fa00:fc:1:3e52:82ff:fe5e:efef])
 (user=rickyniu job=sendgmr) by 2002:ad4:40c6:: with SMTP id
 x6mr24831989qvp.20.1602501033489; Mon, 12 Oct 2020 04:10:33 -0700 (PDT)
Date:   Mon, 12 Oct 2020 19:10:21 +0800
Message-Id: <20201012111024.2259162-1-rickyniu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH 0/3] f_accessory upstream
From:   rickyniu <rickyniu@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, astrachan@google.com,
        rickyniu@google.com, amit.pundir@linaro.org, lockwood@android.com,
        benoit@android.com, jackp@codeaurora.org, vvreddy@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        kyletso@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Below commit is to add log and send uevent:
0003-ANDROID-usb-f_accessory-send-uevent-for-51-52-reques.patch

Benoit Goby (1):
  ANDROID: usb: gadget: f_accessory: Add Android Accessory function

Vijayavardhan Vennapusa (1):
  ANDROID: USB: f_accessory: Check dev pointer before decoding ctrl
    request

rickyniu (1):
  ANDROID: usb: f_accessory: send uevent for 51,52 requests

 drivers/usb/gadget/Kconfig                |   10 +
 drivers/usb/gadget/function/Makefile      |    2 +
 drivers/usb/gadget/function/f_accessory.c | 1388 +++++++++++++++++++++
 include/linux/usb/f_accessory.h           |   23 +
 include/uapi/linux/usb/f_accessory.h      |  146 +++
 5 files changed, 1569 insertions(+)
 create mode 100644 drivers/usb/gadget/function/f_accessory.c
 create mode 100644 include/linux/usb/f_accessory.h
 create mode 100644 include/uapi/linux/usb/f_accessory.h

-- 
2.28.0.1011.ga647a8990f-goog

