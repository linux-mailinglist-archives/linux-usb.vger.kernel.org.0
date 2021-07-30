Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513D83DB8D0
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jul 2021 14:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238880AbhG3MpO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jul 2021 08:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238877AbhG3Moq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jul 2021 08:44:46 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA89C061796
        for <linux-usb@vger.kernel.org>; Fri, 30 Jul 2021 05:43:53 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id m15-20020a0cbf0f0000b02902e60d75210eso5804210qvi.19
        for <linux-usb@vger.kernel.org>; Fri, 30 Jul 2021 05:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=BUiqVnmCC5LvHUiB8iYWIOWbO4jO0OfShvOq4rUC/U0=;
        b=uot/DzFgmwjObSu3zktrMgJ2umnJ8lum8uAOrI27vCbViA92GIbqlHdxxDRPAtckTu
         pERv9asVh4OIsUjb+BUVGdepbl1ymy3BdWTldI52oht4Djvx8c1uLSPY415R6wMYVqfP
         gh2tWn1w+GJx/x5pJ64MIl5CVdTQ5d4MVpxZcq/C15WiF5kTACB9QcDW/Ru8dv3bKYO7
         1XCRNDQ1GfUcykDekKhqhlqii7cp89YBceib99SKdTvjEb4dOjmjNd2B7LZRDb5dXKUx
         a5PQTb0tC4XQwd4a3cymf2cMRcb8AR13tAzMA+varqD7Skn/iPnkXY10kLohLcJB0CWT
         oSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=BUiqVnmCC5LvHUiB8iYWIOWbO4jO0OfShvOq4rUC/U0=;
        b=RLKA02ityjf8j8efBMl5Uzgkmc9l9Pv0tF+dNAcs1v8/pIDlS8w2UOJ0xErrQVsBbY
         jt3mNypqYNoPiI3r6z3/Ig+vIwqzyyeX81eELOx4SlQAEVgWfBzXW3++xiyhqEIW62tP
         Rj+YX2b5YGbFDGn0YJb97HXSTutbJrCrovXEfvb3qi7s5KPt2uNMU0tVZD0/780/hYBO
         zixG7tSva6bKUh5buXJOB43LfBT1GPBUlA+VgZo/XXP5b75eAbwGGJdmvvOTHqDxtBxO
         8bWE7B8BTV3d/6OCwN+7xUJ0++xi0erj26jZM+JLfht0Ow1Vys5zIXYBKK9Tpx7Sh5Qv
         gYDg==
X-Gm-Message-State: AOAM531pq8Qan+nT3/jGTrBwMT3S41DZfNSMMkyLnslWmupJ8KS4kyfi
        X3VLILLsmIeDRp5P7VYgWts7p3mh+est
X-Google-Smtp-Source: ABdhPJxzxMzASRvkFgqW+ytumwovki124B/n372u7N1TvgSmlRct/5OVggH9RDgimalWc+KEFLXb7Jn2Ascy
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:6892:a74:4970:a062])
 (user=kyletso job=sendgmr) by 2002:ad4:522c:: with SMTP id
 r12mr2460956qvq.17.1627649032859; Fri, 30 Jul 2021 05:43:52 -0700 (PDT)
Date:   Fri, 30 Jul 2021 20:43:46 +0800
Message-Id: <20210730124348.1986638-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v5 0/2] TCPM non-PD mode
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

cover-letter is the same as that in v4

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

changes since v4:
dt-bindings: connector: Add pd-unsupported property
- Corrected the subject

usb: typec: tcpm: Support non-PD mode
- Added Reviewed-by

Kyle Tso (2):
  dt-bindings: connector: Add pd-unsupported property
  usb: typec: tcpm: Support non-PD mode

 .../bindings/connector/usb-connector.yaml     |  4 +
 drivers/usb/typec/tcpm/tcpm.c                 | 87 +++++++++++++++----
 2 files changed, 72 insertions(+), 19 deletions(-)

-- 
2.32.0.554.ge1b32706d8-goog

