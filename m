Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02DB29E443
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 08:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbgJ2HfW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 03:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbgJ2HY5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Oct 2020 03:24:57 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2797C05BD18
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2020 23:31:44 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id a27so1396328pfl.17
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2020 23:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=4aAjapW2g4WVwvkzNIoEg1ilkTogTj9VaUOLswnANNk=;
        b=JJ6GlOAjBHTLhA8EVphhV5Znn5NxVNjWlRv6InenqyI0qLaS8YC9SToQ87d3rcDQpM
         oyMEZZZJu/14exMxQa5m/Jg8qDk/qr0Ce9sw9jpm1eZl2QtNOA043FU24U0ACA+SqllG
         dZE46eOiqf3a50VroFY+mOAs6MNvkX7PtKdcKiNQZdaXnSBOP+WsnS9r7d+ZiIIgWYbZ
         Q082GGUCyaHEcJIJXKM2qw5A4R9w74j/P2bC5onv+mc+Y5clwr/p4+qwuGeHv316LN5P
         l6OCAUh6Gb0LyS03a6U3QvQ11sLSDULSmjD8pegWyfJxkkvqiI4WLOIV8hFbW1io1it2
         H6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=4aAjapW2g4WVwvkzNIoEg1ilkTogTj9VaUOLswnANNk=;
        b=uBzUd91XaOVJOP4ypJmxsqEgOcS/Po2OXG/v+MqHECluaMKp7K7yXv/UOnDL1u+4Wx
         Y+VG2krBDG/hdJb7kL6RkzUzrDdQG46lFrgGjSR2Yn0Sh6gT0DBTAY8CuKB37aPDVvZl
         0aWRGlwIUulyiKmBcrD50Muo39flfKZfAgdmdtHTng91qvtCgLhVF5rbRHWDthjEoCum
         IfPDZ3OZr+u2u1SuulckwyKM2mnK4yU3aUehiZJFFV1NzGJH6eZ3bCNnmyWK1ZiOepUe
         2/FugpkoKKkl6KVPgZEQ79qTwBumn+ej6gG5UtKkSTlSFgjSHKIdQERRIdVU+PIiboF+
         ttgw==
X-Gm-Message-State: AOAM532ZtLRa+Md7bDpmRT4e/j++2LV0rOYJxJBmvCnw/VsIDXORYRti
        KSZM0v9c50RtsDzhXp0pgO0pFXpATJE=
X-Google-Smtp-Source: ABdhPJwAa9PsaSb4fEU1nFvZeQwjIQfojniqqNUhMXA1K4oeSuR/CvJXHGufeGaCt/bg9RQFEa/eV9po/UE=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:aa7:8bcd:0:b029:160:cb7:b639 with SMTP id
 s13-20020aa78bcd0000b02901600cb7b639mr2761561pfd.78.1603953103909; Wed, 28
 Oct 2020 23:31:43 -0700 (PDT)
Date:   Wed, 28 Oct 2020 23:31:28 -0700
Message-Id: <20201029063138.1429760-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v12 00/10] TCPM support for FRS and AutoDischarge Disconnect
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

Addressed two comments in the series
1. From Rob Herring: Maxim parts are generally named 'maxim,max[0-9]+'
   https://lkml.org/lkml/2020/10/26/503
   Changed all occurences of maxim,33359 to maxim,max33359.

2. Added a new patch to address warnings reported by Kernel test robot.
   https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2354139.html
   usb: typec: tcpci_maxim: Fix smatch warnings

Heikki, now that Rob has reviewed the dts patches, the following patches
are ready to be reviewed as well:
usb: typec: tcpci_maxim: Fix the compatible string
usb: typec: tcpm: Refactor logic for new-source-frs-typec-current

Greatly appreciate all of your support reviewing the code.

Thanks,
Badhri.

Badhri Jagan Sridharan (10):
  dt-bindings: usb: Maxim type-c controller device tree binding document
  usb: typec: tcpci_maxim: Fix the compatible string
  usb: typec: tcpm: Refactor logic for new-source-frs-typec-current
  usb: typec: tcpm: frs sourcing vbus callback
  usb: typec: tcpci: frs sourcing vbus callback
  usb: typec: tcpci_maxim: Fix vbus stuck on upon diconnecting sink
  usb: typec: tcpm: Implement enabling Auto Discharge disconnect support
  usb: typec: tcpci: Implement Auto discharge disconnect callbacks
  usb: typec: tcpci_maxim: Enable auto discharge disconnect
  usb: typec: tcpci_maxim: Fix smatch warnings

 .../bindings/usb/maxim,max33359.yaml          | 75 ++++++++++++++++
 drivers/usb/typec/tcpm/tcpci.c                | 72 ++++++++++++++-
 drivers/usb/typec/tcpm/tcpci.h                | 18 +++-
 drivers/usb/typec/tcpm/tcpci_maxim.c          | 35 ++++----
 drivers/usb/typec/tcpm/tcpm.c                 | 87 ++++++++++++++++---
 include/linux/usb/tcpm.h                      | 19 ++++
 6 files changed, 274 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/maxim,max33359.yaml


base-commit: aee9ddb1d3718d3ba05b50c51622d7792ae749c9
-- 
2.29.1.341.ge80a0c044ae-goog

