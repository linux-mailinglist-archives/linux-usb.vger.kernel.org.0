Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0162FB847
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 15:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392169AbhASMQb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 07:16:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732015AbhASKMM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 05:12:12 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E72CC061573
        for <linux-usb@vger.kernel.org>; Tue, 19 Jan 2021 02:11:25 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id i20so19223886qvk.18
        for <linux-usb@vger.kernel.org>; Tue, 19 Jan 2021 02:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=YXlxgq14VnReTcxjg/LBvkVDEl6P7FQiD3lR26uEf+M=;
        b=n9ztNgQi+mAAwySt5egAqA2o/ifrV1Ii75qwTpMnEdAI6pDb2Y00BJnlNj/sjetxXx
         Ll7e97CHvHAtxUJw/J/WqINf2uhNbd2yuV7DrZ0msvCCEISoJYa4JNByBhQOCR/PDxN3
         Lst0+9QZSaZGGyUDraseAAUs9OoZJ9HAuTdC6/e2Z+MFxIpR0KRxafFvZj0WO5t/U3ft
         3Y7+xONXH2uMoxUps/1p0cQpo710Hl1JbvfVH7KVX/z+2Uq0u44xjbqBrpMEJmyMAYgF
         oCKD/THQVrS7SRC2po374lxrQvASw/JvNyV+3TTqfcN+SlYk4BfHPg3sub+39nME48Ma
         xwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=YXlxgq14VnReTcxjg/LBvkVDEl6P7FQiD3lR26uEf+M=;
        b=MRbSciesrY7qYA29DqgL6MPkLuSPcj1V61p3mZICJSPKZmWNFbsuOfw1mc3CHwdqA9
         RNy8Gq3HoX5KxnW6bw/ewP9zoWQjInc+2bQ1FdbBCtXBg+FJOApWr1cMO2sRP9DIsA6e
         Qj9p30lOeGYYTb84oYG5zp+UGs9n8JwNqA73WoGnJXpGIWtbiHPbNRQua0Sf+7sI9su1
         HV0oFtJ8KzgIbB6bxsfNt9xVUG7lpOW1QTYCdnTTosBgc3h8MGtPpu0HDBGOoQw8Jd2X
         gWmYsHFMoSzeLZD9RI9b6zbdpIQAaYtfFEDl0AAnYSjuwxuiVAfyPHJBSwBXmhAv0zVU
         JVXQ==
X-Gm-Message-State: AOAM533rAKXGkaVCco7qSj1VxVd2NfDXRXFgjJJYVibDiBtfp7HUFfpF
        RKqDBXZWo2fF9rE5yrIJ+fVDVZpIEzS+y04=
X-Google-Smtp-Source: ABdhPJy/H8P5Ssvj6Q6sdyThV3lNfl0AFUG9nrdcbvbYDh85EnMukbtmyHIen93Tj7+5uHOXvtlWg3vvMuY3SRE=
Sender: "howardyen via sendgmr" <howardyen@howardyen.ntc.corp.google.com>
X-Received: from howardyen.ntc.corp.google.com ([2401:fa00:fc:202:5d06:ba6f:6a89:a201])
 (user=howardyen job=sendgmr) by 2002:ad4:476c:: with SMTP id
 d12mr3421233qvx.20.1611051084664; Tue, 19 Jan 2021 02:11:24 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:10:40 +0800
Message-Id: <20210119101044.1637023-1-howardyen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH 0/4] add xhci hooks for USB offload
From:   Howard Yen <howardyen@google.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Howard Yen <howardyen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To let the xhci driver support USB offload, add hooks for vendor to have
customized behavior for the initialization, memory allocation, irq work, and 
device context synchronization. Detail is in each patch commit message.

Howard Yen (4):
  usb: host: add xhci hooks for USB offload
  usb: host: export symbols for xhci hooks usage
  usb: xhci-plat: add xhci_plat_priv_overwrite
  dt-bindings: usb: usb-xhci: add USB offload support

 .../devicetree/bindings/usb/usb-xhci.txt      |  1 +
 drivers/usb/host/xhci-hub.c                   |  5 +
 drivers/usb/host/xhci-mem.c                   | 99 ++++++++++++++++---
 drivers/usb/host/xhci-plat.c                  | 45 ++++++++-
 drivers/usb/host/xhci-plat.h                  |  9 ++
 drivers/usb/host/xhci-ring.c                  | 19 +++-
 drivers/usb/host/xhci.c                       | 89 +++++++++++++++++
 drivers/usb/host/xhci.h                       | 38 +++++++
 8 files changed, 289 insertions(+), 16 deletions(-)

-- 
2.30.0.284.gd98b1dd5eaa7-goog

