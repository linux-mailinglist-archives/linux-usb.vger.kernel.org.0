Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AB42511C9
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 07:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgHYFzZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 01:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHYFzZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 01:55:25 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC78C061574
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 22:55:24 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id v11so13587815ybm.22
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 22:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=jNR22cUCkRamdFBrm/Cw6uj0oXmQtMCRztRwTa314ZY=;
        b=KuTLHp/2ENAeXrHwE3XBwPFMFmJzwUsIczE+L1+wc9O3Kh74V6O8MPUswfP4ZjL1yt
         aC4Fepw+RCr1Dwt0SOMwxzOOuKB4zQKpsYM6JobiljCREnri3CNQcYCJhGMd6EDmm7ck
         0Og9DDM8yPl5e/L/JLjw8zg8mhHEK1zfpPSSWiN+JE32ampWRKAXd5hTZM3ANjGQDwlD
         mAeQbYRFWnzZJC3eHT2LsHeQ9EusjO32IR7PU21IQp1udzYyYIgcPiwVPfiGP91iG1VK
         00PGVuFZ+wZ68k8qh4OQlhqy8hSmFjTEXc1Lya2+KcxzFjWpiSZ4RdvnMvkeOOGkLrL3
         DZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=jNR22cUCkRamdFBrm/Cw6uj0oXmQtMCRztRwTa314ZY=;
        b=gY7FnAzbkW3xkPQxxlcTC023V/kPnY3CN33H2ae9kXc/6PyzbfuacCHfD5MkJoQT7/
         Hjn38JUT9+mjjpxaXaWRlQgrr7oG1lq2Sr/+kHsVUHRSYpsB38pE9Dtw5qQOxk4zkMf4
         +b0LNj3kNsSDs9FLBc8V+kf+XxKlDDusY1obMIpDJqWr7iMqvUvIbGQdaxL8jIdTMXcG
         VZ9kHt6TrelwkF8E5Fsagf0TSrWAsqawc6bXOXgx3l5ZvhkmQZm4kfJQtfA5NK8n31At
         dp9f3zCLlYDFoGuIw1+F3iuGh/+/Ld0j8VGNDdSAsCBBf4KjVCd6rm1d0ai4o8srmdiK
         NX6A==
X-Gm-Message-State: AOAM531WitLRNb/mea/P8lNP1XzUI8dUp4k3H/w6Sw0T39iAWgPJrivx
        V8uDifhbvt2FOqAyJXVDVZCS/sENcJV9uKtmHCbHuuTI8r/SMc9mEmg4/wALLKFgifuHXGN1MLh
        ouEayKNhbojXvGjF2UjsO9NNu1DAu9Ws/hBZFYKekozg5ZPBY3dYp7vXSc9cim3/QPMUD
X-Google-Smtp-Source: ABdhPJytsSDkSKyn/tLvBSeokGFUrq2wkd1J/jWG8BtgCunlcQeWGYQRmS3YPzoDmi0pgHTkPaoVvPTrplib
X-Received: from lorenzo.tok.corp.google.com ([2401:fa00:8f:2:eeb1:d7ff:fe57:b7d5])
 (user=lorenzo job=sendgmr) by 2002:a25:ab34:: with SMTP id
 u49mr11822809ybi.516.1598334923387; Mon, 24 Aug 2020 22:55:23 -0700 (PDT)
Date:   Tue, 25 Aug 2020 14:55:02 +0900
Message-Id: <20200825055505.765782-1-lorenzo@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v3 0/3] usb: gadget: f_ncm: support SuperSpeed Plus, improve
 on SuperSpeed
From:   Lorenzo Colitti <lorenzo@google.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        zenczykowski@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series makes the NCM gadget usable at SuperSpeed Plus
speeds (currently, it crashes with an oops). It also improves the
behaviour on SuperSpeed and above by making simple performance
improvements and by fixing the speeds that are reported to the
host (currently 851 Mbps, which is much below actual throughput).

Tested on a gadget directly connected to a Linux laptop running
5.6.14 and cdc_ncm, using both 5 Gbps and 10 Gbps cables. iperf3
single TCP connection throughput (gadget to host) is > 2 Gbps on
SuperSpeed and > 4 Gbps on SuperSpeed Plus.

Changes since v1:
- Set bMaxBurst to 15 on endpoints.
- Report more realistic speeds than 851 Mbps.

Changes since v2:
- Remove the separate SuperSpeed Plus descriptors and function
  which were just a copy of the SuperSpeed descriptors and
  function. Instead, just pass the SuperSpeed function to
  usb_assign_descriptors for both SuperSpeed and SuperSpeed
  Plus.
- Don't set bMaxBurst on the interrupt endpoint. This is
  incorrect/useless and forbidden by the spec.
- Make the speed constants unsigned literals.


