Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93E1250C469
	for <lists+linux-usb@lfdr.de>; Sat, 23 Apr 2022 01:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233733AbiDVW5y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 18:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbiDVW5l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 18:57:41 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96809342C41
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 15:21:51 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 12so10542111oix.12
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 15:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zshTmKTlwWpNs+bPCyPg2G4xzDcF+pfyEHctS9lyUmM=;
        b=p18Ea3C4s1iYRhpjXGv+Q/z6sLN27GiKyszpjW0gjWX20QRsSCMVqd4yA/Lh7GOi9g
         /NZuoRazntRsAsm7WAgnDef7b9pUyzSbPBgJLpfKe4YaPvU0WJ0QR75I/vUhDq4iF6RT
         QUQKylKyqoeB5ZCAIKx5U/i6opxvjNvTD9dkTdx4Ut2k/jC9uC6xqzQstUbv9ArUTpU5
         eylxKDHkC64LZd0jHtQ00UXgy1/AShQ8KDXPe60eVxQwS3eWzG5ASX7cvsgM48zY4w1Q
         +k+q0r3URNAs8mcCu2n5GkmNiYnEkray5b5LPhbWNoTNHhoOnpg7Ib3g+qRBL5oC5/Xx
         q97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zshTmKTlwWpNs+bPCyPg2G4xzDcF+pfyEHctS9lyUmM=;
        b=HxiSsuwdnVT0NFoPXZXmVe8HeCpeBRzXYhtbh4lwmYZszsEoTQRrGt4on6YMTkpcdO
         YEod7ffmKY3jTJIlB+/DfZ6IrnjekeDRYbZ6iIf0H81gAZmD6xd1ZGgyVXFHtb/iE0jx
         4+9XEdRj+RdHSzUHfnP5DzWNHlvDba6kakfXqkHngZOs9AH+aX1/rNuJD5X+3oNWX60E
         I26Jv87Ph2o7hUOrlTvFYhjPCzpfPAhBsRr1ULsgZwl+Zk2GQO9JhybB6A7WtfzNj2Xl
         Ktjzs/WlIEhtPw1TX97xEh7UVNHV0d0WiG0qcrr2C0TO4tU/xPlDe0czhA90NWBQ3G4e
         sxXg==
X-Gm-Message-State: AOAM530R8u+ZsZpGYHV1kfzUxUYKoY4t90iLsYtXKnPrCrOX7mE8KYN+
        Ru82mZGRwfUCbC9fK6DwaVQJsrZimDWAXH2k
X-Google-Smtp-Source: ABdhPJy2wkzUusvXDfhRYywzAm+d4ZCyFMdNt0N57JRQDI6OHyUJyvx5APLKi6X+9Gnrlb3M4ed0/A==
X-Received: by 2002:a05:6808:1828:b0:322:4891:8832 with SMTP id bh40-20020a056808182800b0032248918832mr7699862oib.172.1650666110356;
        Fri, 22 Apr 2022 15:21:50 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id js4-20020a056870bac400b000e687cdf5adsm1049224oab.55.2022.04.22.15.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 15:21:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [PATCH v5 0/7] typec: mux: Introduce support for multiple USB TypeC muxes
Date:   Fri, 22 Apr 2022 15:23:44 -0700
Message-Id: <20220422222351.1297276-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series introduces a level of indirection between the controller's view of
a typec_mux/switch and the implementation and then expands that to support
multiple drivers.

This is needed in order to support devices such as the Qualcomm Snapdragon 888
HDK, which does muxing and orientation handling in the QMP (USB+DP) PHY and SBU
muxing in the external FSA4480 chip.

Bjorn Andersson (7):
  device property: Add helper to match multiple connections
  device property: Use multi-connection matchers for single case
  usb: typec: mux: Check dev_set_name() return value
  usb: typec: mux: Introduce indirection
  usb: typec: mux: Allow multiple mux_devs per mux
  dt-bindings: usb: Add binding for fcs,fsa4480
  usb: typec: mux: Add On Semi fsa4480 driver

 .../devicetree/bindings/usb/fcs,fsa4480.yaml  |  72 +++++
 drivers/base/property.c                       |  96 +++++--
 drivers/usb/typec/bus.c                       |   2 +-
 drivers/usb/typec/mux.c                       | 271 +++++++++++++-----
 drivers/usb/typec/mux.h                       |  12 +-
 drivers/usb/typec/mux/Kconfig                 |  10 +
 drivers/usb/typec/mux/Makefile                |   1 +
 drivers/usb/typec/mux/fsa4480.c               | 218 ++++++++++++++
 drivers/usb/typec/mux/intel_pmc_mux.c         |   8 +-
 drivers/usb/typec/mux/pi3usb30532.c           |   8 +-
 include/linux/property.h                      |   5 +
 include/linux/usb/typec_mux.h                 |  22 +-
 12 files changed, 614 insertions(+), 111 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
 create mode 100644 drivers/usb/typec/mux/fsa4480.c

-- 
2.35.1

