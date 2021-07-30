Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F6B3DB368
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jul 2021 08:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237327AbhG3GSm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jul 2021 02:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhG3GSm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jul 2021 02:18:42 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B25C0613C1
        for <linux-usb@vger.kernel.org>; Thu, 29 Jul 2021 23:18:38 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id f3-20020a25cf030000b029055a2303fc2dso9277106ybg.11
        for <linux-usb@vger.kernel.org>; Thu, 29 Jul 2021 23:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=vthqjBQ/Q4udWXq8hxDLv4OMPT7q1106HFB0bgOZZVg=;
        b=hfCLLYg9u/HJ0MTxdrOhdfbc67sC4AG4T9SVaLsYna6Zon0m/LOAbckakXn6IYtYZS
         rPBFPG0Wc9XdhjWOun0Ga5Em2tuPzWT9lumyBIFLk7iCmThv/wdBF9HOlkRnToNiSHsn
         NQg1gLOqzn4x+mMiOr0UC5f0lxnd9guWLR4RJ8VaLm0y1GeV801sr2Vxp2QJAYelEkDF
         IYxOiwpsjrypgfXOf5+fGNsNXGxBwk7wZEiMJhah2bug+xrMXKH2AaaC5rfto9Qv7uPo
         N7EDaerkIZPS1HiROxcnSHJkyHJSIwwI8VbNvN1c2vyuQfYcJwLCcJiNiG8DDdRhydVW
         4HKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=vthqjBQ/Q4udWXq8hxDLv4OMPT7q1106HFB0bgOZZVg=;
        b=o58BXTwa7rHfuesxtrL9JJ664EeQtLTnBoP35GwAzuh0Un9GHMSZAo8Rfyp9z1BmFf
         G5jDJID9JkaRzKgoL5JzKoHf70RxB2MM0Nd6hTDJQmq/HjFD3zvheNhKZyhUXsYmu+kX
         hjc0oeLMoAJ5UpwKkpENgmut7oa9ZpjIg9zD6oT/OcQqO/UNhVbrtgFL6HRKZtmHN86a
         mbXkmdAZuP5SRd6Hr0+1wfd5v93N54gKtFOfVtacLGNcx52D6rug4fzfYGanI4PPQfv0
         As/I1H9vwBn8i8ssCusqLU9J1AlFrqa2yBVg99pfEDL2poshGk7RqEqcqQ8F8IGrW5Wk
         bJMQ==
X-Gm-Message-State: AOAM53157rWWY7QwiwkMgxrqMhTzXVjJoe/BOtHCH6lWJ7crwJUPbl/n
        QJay3sHQjw5jT4RZtgYJYv1b2DARU+wh
X-Google-Smtp-Source: ABdhPJwR59fBTTX9DCJKCQAWYXxa1dLyE5ol9vId57clmeAeKgqe/apxSgl2aaxNmbB2TsygddRPdY6DyOeJ
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:6892:a74:4970:a062])
 (user=kyletso job=sendgmr) by 2002:a25:54:: with SMTP id 81mr1165845yba.53.1627625917145;
 Thu, 29 Jul 2021 23:18:37 -0700 (PDT)
Date:   Fri, 30 Jul 2021 14:18:30 +0800
Message-Id: <20210730061832.1927936-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v4 0/2] TCPM non-PD mode
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

cover-letter is the same as that in v3

The reason for this patch is to let the device/system policy decide
whether PD is going to be supported using devicetree properties.

A new dt property "pd-unsupported" is introduced and TCPM uses this
property as a flag to decide whether PD is supported. If the flag is
false (the dt property is not present), the RX functionality of the
low-level driver will not be enabled. The power negotiation related
states will be skipped as well. If the flag is true, everything is a
what it was before.

If "pd-unsupported" is present, and the port is SRC or DRP, another
existing dt property "typec-power-opmode" needs to be specified to
indicate which Rp value should be used when the port is SRC.

changes since v3:

usb: typec: tcpm: Support non-PD mode
- commit msg updated
- removed unnecessary empty lines
- re-factored the code of reading device tree properties and the error
  handling
- removed unnecessay variable initialization
- modified the comments

Kyle Tso (2):
  dt-bindings: connector: Add pd-supported property
  usb: typec: tcpm: Support non-PD mode

 .../bindings/connector/usb-connector.yaml     |  4 +
 drivers/usb/typec/tcpm/tcpm.c                 | 87 +++++++++++++++----
 2 files changed, 72 insertions(+), 19 deletions(-)

-- 
2.32.0.554.ge1b32706d8-goog

