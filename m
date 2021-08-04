Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731D73DFCA5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Aug 2021 10:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236213AbhHDITi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Aug 2021 04:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbhHDITh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Aug 2021 04:19:37 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF301C0613D5
        for <linux-usb@vger.kernel.org>; Wed,  4 Aug 2021 01:19:23 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id 18-20020a05620a0792b02903b8e915ccceso1608373qka.18
        for <linux-usb@vger.kernel.org>; Wed, 04 Aug 2021 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=JaeVOCD1xjiNZOo9WK4DguArWkRWfpfwXcJD2bxAZ2E=;
        b=RUoMD6rTY3IJ5/5+6xzAN02NV3WPmsnxPG+M6fxPeTNjvM/X4YQhwIGP2Rup96mqcI
         BhViJzXZSQHeOTbN/UGP3oFMatd7QM8PuTjGcMQb6P+BUarMrSAj517wqzBc6UXudTGK
         k3bubRgnXNyS+LnPV+vAuaWqRXr4bELD8I4x98i4v27VZYNpbblHw6B61CBOQnVXwQ10
         CDP/9NmBDASfZkv6UeCrimgSd1Zoji+aEytv2Cu6cxJf1s4k/kG/r/5p0vPrCqPP/BG8
         iWS0q32Muevk+q1Z2hFn+AfPpvNH/D/XyaN/8Hh6JMPPkwdclpQaDQRl2Zg6SNW+dFwG
         CouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=JaeVOCD1xjiNZOo9WK4DguArWkRWfpfwXcJD2bxAZ2E=;
        b=PBL/vvkPKdRLwE0BYwE37Px1qzH1mShLNxjWSa1Mmpq9bgddsGY0lmyRm1e6AMXksw
         xq7VNrFHG2RHlcZxEWwRgujD7CAk1orsTALx/aJhsqQD2qevDHCT+9oIDd1z1+cVt16X
         flels0BK5crHgjZAcAnM+Fh5WTIAJAQU4f0gYnbSUR1W85MnZ+vx2Sw7toMgRlNKsASs
         uZEaWW75HNjQG8HP95Mq2/diAEuRCZsn1xdmXQGsQSAh1Jhwex4R6N5QysK+oKt2/czJ
         Ipr4KlPctwJKLIlDOH+dE4zrPD9UgfFuBJ/hVCiE9kLLN4dtKU4a3+enBxPkyauFAiGA
         5bIA==
X-Gm-Message-State: AOAM533fqU2pGtZ1sM4P5gAp8HdOy2IfSdRRiTakLocTsLA+txxc5ndn
        fFwdCMPNiTc3lVwsSty4nkKyIkZXyJ/w
X-Google-Smtp-Source: ABdhPJz/Ubuo6nOoq/2uOV+UPUW4YrwJ1FpKt6WTzRBYNSlxeSoAHZr/LPGvs7Jk8Fk/VC6Wf5zixktUKiHw
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:7eb8:c2f5:2e08:d4bc])
 (user=kyletso job=sendgmr) by 2002:a05:6214:1021:: with SMTP id
 k1mr25874996qvr.4.1628065162885; Wed, 04 Aug 2021 01:19:22 -0700 (PDT)
Date:   Wed,  4 Aug 2021 16:19:15 +0800
Message-Id: <20210804081917.3390341-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v6 0/2] TCPM non-PD mode
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

(changed the property name only)

The reason for this patch is to let the device/system policy decide
whether PD is going to be supported using devicetree properties.

A new dt property "pd-disable" is introduced and TCPM uses this
property as a flag to decide whether PD is supported. If the flag is
false (the dt property is not present), the RX functionality of the
low-level driver will not be enabled. The power negotiation related
states will be skipped as well. If the flag is true, everything is a
what it was before.

If "pd-disable" is present, and the port is SRC or DRP, another
existing dt property "typec-power-opmode" needs to be specified to
indicate which Rp value should be used when the port is SRC.

changes since v5:
dt-bindings: connector: Add pd-disable property
- Changed the property name to "pd-disable"

usb: typec: tcpm: Support non-PD mode
- Changed the property name to "pd-disable"
- Added Acked-by tag

Kyle Tso (2):
  dt-bindings: connector: Add pd-disable property
  usb: typec: tcpm: Support non-PD mode

 .../bindings/connector/usb-connector.yaml     |  4 +
 drivers/usb/typec/tcpm/tcpm.c                 | 87 +++++++++++++++----
 2 files changed, 72 insertions(+), 19 deletions(-)

-- 
2.32.0.554.ge1b32706d8-goog

