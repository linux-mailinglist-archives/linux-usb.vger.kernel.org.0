Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49CDF251067
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 06:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgHYEWV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 00:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725263AbgHYEWU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 00:22:20 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53836C061574
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:20 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id o8so13322232ybg.16
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=/c51TfJaBziI1eN9wq01jeVj56xrIHjm/tLvMe9Q3YY=;
        b=iGXM5QycrbOT8ijGc0fdMOrgKahpDZiqXkaucZYHEAWp7oMPCLFltMCwtqKHsxS7cV
         02F3xQzc9dH5ovr6zzE9SNBwGQEFUE7GteWjLY3yGHPGtIbPZM8vZfkQKRB2MtWPi84N
         hZg9BC5Q8Yt+xUsw341pCG9qDC/sJWv0yWQTMq0BfyRPUYeOGeU4NMn1STFVxirwhXfV
         aJogMc/vJ2lHjkHL3csyJuuWPc+6SZgoJ9Y22t9YTAIxUgm9uf1zpvw2g/GWcH6PNggk
         i2g0zJY3RaiEFvH2IDRHNIKdkrz/OzWaecHGtXKFQ9xnWskSIDEdKQ405i6R+Jwpnbqj
         bGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=/c51TfJaBziI1eN9wq01jeVj56xrIHjm/tLvMe9Q3YY=;
        b=GWYn+WyTazskkQNhX1fKqmYxTcZjj1QDLM6VvexzqcVHnerwPCsT73VH8Uz48R5zW4
         fcqYVjqCNar6vQxShXA8wA4xV2uCPSYl4qwPqqGeE82yJ9Jh7PrXXvYA+4IQSjVWSrPr
         dWu2O01BeV+E9knExegp/CTVvRqEsmyBOKD3T04XZVKCbhNXCthZD2ZyyVVz0w6esFCY
         fjxN0uDWy367fFT4+vdMr8nO5/KR1V/Hn4SaX25z8PUlQrpZ1hrQMcfPKoMtkeeP3mt0
         FJRdSRDu5zZJeKQlmhr8DMUK/1ofhsxG3nd+cbOyfMkv9x57WX0HBUxjXekzThh551pi
         umdg==
X-Gm-Message-State: AOAM531kjaX9Tq8qSzlHajxwyAMvaJ5zs32eu5nFJFXi+au4Rgo48AYU
        Y7ICTRMCFl2wpo7mpwJt+RrlMTXwu9o=
X-Google-Smtp-Source: ABdhPJyYhvZ0I7GKmQxC+8W9XVFnCFFUYlSNbsEep8zhRBabM7qpmnZtotDNd8ZuMfLd2HKdgRu5gaDK8mk=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a25:3c47:: with SMTP id j68mr12180701yba.59.1598329339498;
 Mon, 24 Aug 2020 21:22:19 -0700 (PDT)
Date:   Mon, 24 Aug 2020 21:21:56 -0700
Message-Id: <20200825042210.300632-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH 00/14] TCPM support for FRS and AutoDischarge Disconnect
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

Hi all,

With this patchset, I am hoping to add Sink Fast Role swap support to TCPM.
Sink Fast Role swap is described by the USB Power Delivery Specification
Revision 3.0. The patchset also adds support to Auto Discharge Disconnect
described in the USB Type-C Port Controller Interface Specification.
I am also sending the chip level driver for the TCPCI based type-c controller
that supports Fast role swap.

I tested the fast role swap implementation with the following
accessories:
1. https://ezq.com/usb-c-multimedia-hub-adapter-8-ports.html
2. https://www.iogear.com/product/GUH3C22P/

Note: I will rebase the patchset on top of https://lkml.org/lkml/2020/8/19/52
once it's picked up in usb-next.

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
 drivers/usb/typec/tcpm/Kconfig                |   6 +
 drivers/usb/typec/tcpm/Makefile               |  13 +-
 drivers/usb/typec/tcpm/tcpci.c                | 149 ++++-
 drivers/usb/typec/tcpm/tcpci.h                |  43 ++
 drivers/usb/typec/tcpm/tcpci_maxim.c          | 564 ++++++++++++++++++
 drivers/usb/typec/tcpm/tcpm.c                 | 271 ++++++++-
 include/dt-bindings/usb/pd.h                  |  10 +
 include/linux/usb/pd.h                        |  20 +-
 include/linux/usb/tcpm.h                      |  24 +-
 include/linux/usb/typec.h                     |  13 +
 12 files changed, 1249 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/connector/usb-connector.txt
 create mode 100644 Documentation/devicetree/bindings/usb/maxim,tcpci.txt
 create mode 100644 drivers/usb/typec/tcpm/tcpci_maxim.c

-- 
2.28.0.297.g1956fa8f8d-goog

