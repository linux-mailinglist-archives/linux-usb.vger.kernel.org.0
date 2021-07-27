Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40CC3D7973
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 17:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbhG0PNN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 11:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232477AbhG0PNN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 11:13:13 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD11C061757
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 08:13:13 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id 15-20020a0562140dcfb02902e558bb7a04so313994qvt.10
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 08:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=MoBbmwwVoAs+ak0szW1VsZv7qNLKHbGSV3nOAEkfkt8=;
        b=XfJgoOdYamR7F+9PsH6kTPjt3ckIavxZN69iGZvVvSPiedLbxaZ3IxwI/k4Mz2h2vX
         wLLg0vcAcTc9TzTAgLMaBEnBf9L3j6lkndR6b7/aRUnEfdgSGxBCVAtaxpNEiHU2i1tZ
         2DFzPMu5MjNpINrDOZSV3cMlRsQx7bDr6dtwkhZApvo6YZ8/ZSUeOe5abI++8Snumh5A
         lTHEwmu9IsRjywgjrjVlkCzsXQGOfpB8Ctt9wzvdr3o22OxpdDOkhjyHwhLjNGgfXSW4
         +pkV2kJHTCGoMIcVOE/0OcnEv/pFpd6KVkBtEJ2M5RlZsMXJ7FKgoL0UZLxFMkloYMKL
         uiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=MoBbmwwVoAs+ak0szW1VsZv7qNLKHbGSV3nOAEkfkt8=;
        b=iyyQZT9zzjsj3Fi5Q/icp94t6qOpUq0+i4cB9jPvFKPL3JFrkJa+8f7+ijjL86Hi6r
         0rLzqDjapxYaDgALl1WCF+x6N62aYz83rxi2L82AR9EpVr7aDQ/FYCRWACYu0RntUuQg
         mh9SQB46fKYoaukeELVbM9fAeXnoovP3WwPDnuPUg+VZfoUyphOHchUEg2wXyXy1MJ/K
         SGB+ZcQzJmCO03NWkqGBTeoeFrJQQZrvBwVVhdx/O2zS+2N7xLS3edOhGCa7fl+buYQI
         D98K0eKBdPA3i8hAQnsi5wLQc0nF6Ik7UdBMOGh/QRViB4MTsufCQxku1MZE84mZ3Qlr
         lU4g==
X-Gm-Message-State: AOAM533yy6UXODFhgoKUNvL9Nz7pC3ppWrMMqPzlFIpeH3Ecikpyv9fS
        nRBAV6VOyUwInSSIfGsbpDpOu110yjBV
X-Google-Smtp-Source: ABdhPJwzEJKzuBqbCiUxaeAJy4u4O4sXmy2+Tf+qyNw6Ed7YgZiW68Kv/OHapgqflQytAbnlCQY9OybreoVH
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:da7f:a21b:ee74:66a2])
 (user=kyletso job=sendgmr) by 2002:a05:6214:2482:: with SMTP id
 gi2mr20396807qvb.51.1627398792472; Tue, 27 Jul 2021 08:13:12 -0700 (PDT)
Date:   Tue, 27 Jul 2021 23:13:05 +0800
Message-Id: <20210727151307.2178352-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
Subject: [PATCH v2 0/2] TCPM non-pd mode
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The reason for this patch is to let the device/system policy decide
whether PD is going to be supported using devicetree properties.

A new dt property "pd-supported" is introduced and TCPM uses this
property as a flag to decide whether PD is supported. If the flag is
false, the RX functionality of the low-level driver will not be enabled.
The power negotiation related states will be skipped as well. If the
flag is true, everything is as what it was before.

If "pd-supported" is not present, and the port is SRC or DRP, another
existing dt property "typec-power-opmode" needs to be specified to
indicate which Rp value should be used when the port is SRC.

changes since v1:
- revise the patch to use dt properties

Kyle Tso (2):
  dt-bindings: connector: Add pd-supported property
  usb: typec: tcpm: Support non-PD mode

 .../bindings/connector/usb-connector.yaml     |   5 +
 drivers/usb/typec/tcpm/tcpm.c                 | 108 +++++++++++++-----
 2 files changed, 84 insertions(+), 29 deletions(-)

-- 
2.32.0.432.gabb21c7263-goog

