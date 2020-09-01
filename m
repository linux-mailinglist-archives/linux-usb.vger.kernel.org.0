Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4792585D3
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 04:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgIAC7c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 22:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgIAC7b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 22:59:31 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA75C061366
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:31 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id q131so4875310qke.22
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=aqbI5Ia32TqOrslGEIErfhCZqRPbdylIvc6i8h2yZKw=;
        b=Saty0hS8ZkPaeozqCVkqP9Q7DGds6LC26Gc8QFvaGAlYQ16EcEAJMCNGsiC8NNVyUV
         rEzqmwSlyUCyMRR5RZ+yeI0D2OegIiIlPpWJ20k/Vc+O9HbZoBNrJKTdvXO4KA02rn2u
         CRuTCqopFDz1+l0Z2gudUoOZSj+Xe9rmUqdJAiygfXXYJ59Z9XPjGy1FOL5n16UfJGpq
         2e/irZ2KcO6rAy20guLmZuZW3Sti8PURgRX41WembXA58Pwp3jo1TXhDIiXThGGhOwIu
         L0Yf1Rb+imEPCoUhHlQ5Zs73MtzRwLQmTRzbIG65os/+tRibT9V9J7s4RgS9ruBorBbI
         b9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=aqbI5Ia32TqOrslGEIErfhCZqRPbdylIvc6i8h2yZKw=;
        b=OoyTXm4a0f+aJi2oB3CJNMCugJk8eMPWoyyVUVcocGq1xL2A0aiGxcuLNwS6q5nEQB
         bUa2DwCbFSuJV71XIMp2baRc9N0FgaIL48JLH0Nv/tLtaDTSc4ke7CSG3+n9Y86NSTcQ
         0zf9IA81ly3/5N8oPTn9JXxCBtOvWKLUyJtbNVOufa+sDKEGMc7WbmHJ/kJOzC9Vf6+T
         NDHrDaF5OJ+fHvNIMJ9wJijOU9Vh5zjr47BKL7me+GzF6Cu8MhOsXZ2evVHNW2RY8eGZ
         CjNVB12D9P6HEPfr5VrFKzLCAZ94rfjFVFaDRoxSC6ln1+rViwYHyq58PH9v4IN6s2yZ
         pAAw==
X-Gm-Message-State: AOAM531KKxtXfp0T9d3CCMkEIvNtkwPev7vp+KrNF+V0Jpne+SUt0cVQ
        iVEJaV09d7NFdzXrYa3qtEULYS7NVUQ=
X-Google-Smtp-Source: ABdhPJyAHfuQ9RaLLZ3z5nf1R7jFGuXpDSlM91oLR8qmMk3SusVTCBPIFpgE1gbGnSuRrwM6Pa7whya7RMI=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a0c:a789:: with SMTP id v9mr1397448qva.2.1598929170526;
 Mon, 31 Aug 2020 19:59:30 -0700 (PDT)
Date:   Mon, 31 Aug 2020 19:59:13 -0700
Message-Id: <20200901025927.3596190-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH v6 00/14] TCPM support for FRS and AutoDischarge Disconnect
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

First of all apologies for mixing up the patch version as noted by
Heikki and Greg. All of them were v1's but since I was manually adding
the version numbers I mixed them up. Using the --reroll-count option
now. Updating the patch version to v6 (highest version number in the
previous patchset + 1) to avoid confusion.

I also rebased on to off of the recent usb-next tip:
5fedf0d295d3 (origin/usb-testing, origin/usb-next) Merge 5.9-rc3 into usb-next
Which had the following changes causing merge conflict:
3ed8e1c2ac99 usb: typec: tcpm: Migrate workqueue to RT priority for processing events
6bbe2a90a0bb usb: typec: tcpm: During PR_SWAP, source caps should be sent only after tSwapSourceStart

Addressed comments from Heikki and Randy which have described in the
individual commit's change history as well.

Badhri Jagan Sridharan (14):
  usb: typec: tcpci: Add register definitions to tcpci
  usb: typec: tcpci: Add support when hidden tx registers are
    inaccessible
  usb: typec: tcpci: update ROLE_CONTROL for DRP
  usb: typec: tcpci: Add a getter method to retrieve tcpm_port reference
  usb: typec: tcpci: Add set_vbus tcpci callback
  dt-bindings: usb: Maxim type-c controller device tree binding document
  usb: typec: tcpci_maxim: Chip level TCPC driver
  dt-bindings: connector: Add property to set initial current cap for
    FRS
  usb: typec: tcpm: Add support for Sink Fast Role SWAP(FRS)
  usb: typec: tcpci: Implement callbacks for FRS
  usb: typec: tcpci_maxim: Add support for Sink FRS
  usb: typec: tcpm: Implement enabling Auto Discharge disconnect support
  usb: typec: tcpci: Implement Auto discharge disconnect callbacks
  usb: typec: tcpci_maxim: Implemnent set_auto_vbus_discharge_threshold

 .../bindings/connector/usb-connector.txt      | 128 ++++
 .../devicetree/bindings/usb/maxim,tcpci.txt   |  44 ++
 drivers/usb/typec/tcpm/Kconfig                |   5 +
 drivers/usb/typec/tcpm/Makefile               |  13 +-
 drivers/usb/typec/tcpm/tcpci.c                | 146 ++++-
 drivers/usb/typec/tcpm/tcpci.h                |  43 ++
 drivers/usb/typec/tcpm/tcpci_maxim.c          | 564 ++++++++++++++++++
 drivers/usb/typec/tcpm/tcpm.c                 | 291 ++++++++-
 include/dt-bindings/usb/pd.h                  |  10 +
 include/linux/usb/pd.h                        |  19 +-
 include/linux/usb/tcpm.h                      |  24 +-
 include/linux/usb/typec.h                     |  13 +
 12 files changed, 1266 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/connector/usb-connector.txt
 create mode 100644 Documentation/devicetree/bindings/usb/maxim,tcpci.txt
 create mode 100644 drivers/usb/typec/tcpm/tcpci_maxim.c


base-commit: 5fedf0d295d3ef69fd85fdee4cb68fd3756b54c2
-- 
2.28.0.402.g5ffc5be6b7-goog

