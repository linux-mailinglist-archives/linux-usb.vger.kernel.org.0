Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8CE127BAE2
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgI2CkL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgI2CkL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:40:11 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D18BC0613CF
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:11 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id n13so3239774ybk.9
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=fUNDNepzGaiGXAFhfkvJ0RSbCFD3wqyJd1yrtWxeUj8=;
        b=IoHqVaUbKcxLhyR1E/x98m/4a3etB97/ByKN3fmpKhAU/yIpgGoXK83g3Qd1IX2UDU
         1ZUtrDoMfdBcWpDZ2LyKNvlLnBDixrKvVU6MfpADkYztdZeN6XYU3cejo9FI6Xa1AqaH
         FdOtaRUlNJdLNfwrKRD3ftlZ3bmhNcZzD5VnV29ORmm/jIFxzYnr9FJ2bIgaXnoHvSH0
         YvQ+VRzkzdoq1TfIh47EIBPxCoebhMwcNSWL2q75Z9qFPiNOXVBTXGTIixJyjKuP4E2p
         FG0rOfhrWCtgmdYvYqz7V4XX6oIiqDzBU8FN5bYWIKYJZfWK8P9735CRrjXQeMfdtQAM
         h75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=fUNDNepzGaiGXAFhfkvJ0RSbCFD3wqyJd1yrtWxeUj8=;
        b=HEM8xbBwo9zQHBKh3XgpCC8KWc7Ij8mIeNSOhZ+CpLpmFgLpXkmVPrEBAbke6ySBkG
         wnxwKHrs3VeHd9u4a39XLh+zLL2iqOfvEhKPDDONJRzbiFHFNSDVcfD1L3WWfbXvO3E0
         KktAx58JkGKOx3hM+pv/N1vsytI6Hc6Yx+b80WsvkkNIAJ9nAmt89Mw1i5COAilzFJte
         U0x+Xj1c1kZf5w7tARRMni0zX0C4GA068n/+iKcci7dsiUKdaWdr9tJvqDt1O1kIOwiZ
         x/fhMpKr5a+e7ATrTmfabodDZvBf1G/MNr/LiADo8v2C6XeJv2slbaEwV3yaV+TyA8Ta
         t2gg==
X-Gm-Message-State: AOAM532x0z4b9v2LIHgTXp2bqb5MnuvIaTTcNqu+rg+ty3D26tICqF2J
        3UtsiJTFuXvvzAk9nuwEyeNmcI79a64=
X-Google-Smtp-Source: ABdhPJwWXU59duMCBuhqcj11SshhXEPhlM0S15Xa3yI/4xvIvgERj3QGHigEMR+6CTNyprPNRCKAT6YejKk=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a25:1381:: with SMTP id 123mr3584065ybt.406.1601347209808;
 Mon, 28 Sep 2020 19:40:09 -0700 (PDT)
Date:   Mon, 28 Sep 2020 19:39:49 -0700
Message-Id: <20200929024004.244992-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v9 00/15] TCPM support for FRS and AutoDischarge Disconnect
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
        Badhri Jagan Sridharan <badhri@google.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Addressed three comments from v8:
1. Fixed the make dt_binding_check that Rob Herring pointed out in
   "dt-bindings: usb: Maxim type-c controller device tree binding
   document"
   https://lkml.org/lkml/2020/9/22/720

2. Moved to string based enums for new-source-frs-typec-current to
   address comments from Rob herring for:
   "dt-bindings: connector: Add property to set initial current cap
   for FRS". As a result, introduced another patch:
   "usb: typec: tcpm: Parse frs type-c current from device tree"
   to refactor tcpm code to read new-source-frs-typec-current from
   device tree. Previously this is was a uint32.
   https://lkml.org/lkml/2020/9/22/729

3. To address Heikki's comment on Auto discharge disconnect threshold
   https://lkml.org/lkml/2020/9/21/1857
   a. Removed the call to tcpm_set_auto_vbus_discharge_threshold
      from source attach path.
   b. Moved logic of setting TCPC_VBUS_SINK_DISCONNECT_THRESH_MAX to
      tcpci.c as the tcpci_maxim was actually setting the default
      values. Removed the get_auto_vbus_discharge_threshold callback
      from tcpci_data for now. Can be added later if needed.

4. Added additional patches to address an isssue where vbus was being
   left post disconnect after Fast Role Swap operation is executed.
   a. usb: typec: tcpm: frs sourcing vbus callback
   b. usb: typec: tcpci: frs sourcing vbus callback
   c. usb: typec: tcpci_max77759: Fix vbus stuck on upon diconnecting sink

Thanks,
Badhri.

Badhri Jagan Sridharan (15):
  usb: typec: tcpci: Add a getter method to retrieve tcpm_port reference
  usb: typec: tcpci: Add set_vbus tcpci callback
  dt-bindings: usb: Maxim type-c controller device tree binding document
  usb: typec: tcpci_maxim: Chip level TCPC driver
  dt-bindings: connector: Add property to set initial current cap for
    FRS
  usb: typec: tcpm: Add support for Sink Fast Role SWAP(FRS)
  usb: typec: tcpci: Implement callbacks for FRS
  usb: typec: tcpci_maxim: Add support for Sink FRS
  usb: typec: tcpm: frs sourcing vbus callback
  usb: typec: tcpci: frs sourcing vbus callback
  usb: typec: tcpci_max77759: Fix vbus stuck on upon diconnecting sink
  usb: typec: tcpm: Parse frs type-c current from device tree
  usb: typec: tcpm: Implement enabling Auto Discharge disconnect support
  usb: typec: tcpci: Implement Auto discharge disconnect callbacks
  usb: typec: tcpci_maxim: Enable auto discharge disconnect

 .../bindings/connector/usb-connector.yaml     |  26 +
 .../devicetree/bindings/usb/maxim,tcpci.yaml  |  68 +++
 drivers/usb/typec/tcpm/Kconfig                |   6 +
 drivers/usb/typec/tcpm/Makefile               |  15 +-
 drivers/usb/typec/tcpm/tcpci.c                | 102 +++-
 drivers/usb/typec/tcpm/tcpci.h                |  30 +-
 drivers/usb/typec/tcpm/tcpci_maxim.c          | 504 ++++++++++++++++++
 drivers/usb/typec/tcpm/tcpm.c                 | 299 ++++++++++-
 include/dt-bindings/usb/pd.h                  |  10 +
 include/linux/usb/pd.h                        |  19 +-
 include/linux/usb/tcpm.h                      |  27 +-
 include/linux/usb/typec.h                     |  12 +
 12 files changed, 1093 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/maxim,tcpci.yaml
 create mode 100644 drivers/usb/typec/tcpm/tcpci_maxim.c

-- 
2.28.0.709.gb0816b6eb0-goog

