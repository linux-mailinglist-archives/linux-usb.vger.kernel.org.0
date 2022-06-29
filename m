Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCAA560D87
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 01:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbiF2XeD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 19:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbiF2Xdi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 19:33:38 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2159726540
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 16:33:25 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 145so2668204pga.12
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 16:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NsipExiNrrBArXSMUQqN1JMJ/FxaIb/dWMMG0KzbrOs=;
        b=SKirdDWUbEM76rroMI+QFGcjo0pejKbbRpxDG17OH945v0BbXptuePFWmUkJdnAjDC
         S2EtS1whCoRGxKcli1T6cnbE4abqW5bDlGUTDrhNt8ay53FxRSaV/ejtnhfaORpv9NCG
         reeo1rMi9rtgrltdEO9o+VyWwTH8lMHh0bRjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NsipExiNrrBArXSMUQqN1JMJ/FxaIb/dWMMG0KzbrOs=;
        b=iKzHknJoRMwxGQSkvdpfzwp+bwLtVLXj/Xb1mHl5GrdTR97ZK+TX8+KgAVnFx9suJE
         8Ku6HBghQa7YPSY6VwB1U6SadCRUNbEn52UHsbLmj6aIQpi9raQfV+Nfeg+ytc5/9aHx
         FTwxisH0gkSaae3pQCazyH2cGuvD5toh1wbPj1ZogzIT7ttbEnnloqjVSZ8Rhcgouusw
         24V7tB0wjHg3lVi9bLLG0EkhI6GChkuteCPrvFkPL62TUA91iDEeXVllqaNcT+8n2uab
         ZXNhBsCRrto5ck6A+zEdAXqUfkh8bzvefrQMCkAhGNxu6uqcR9eQl6F0IbrphGtgsKgc
         UZOA==
X-Gm-Message-State: AJIora9gmnaRDUubj9+JowXm2Bo4Jj+334zIBE4SKE/VorVCk9Zq6AKA
        keoslmwMphiN6TJBogay5B6RVw==
X-Google-Smtp-Source: AGRyM1uT9ojCPeeZmZxFDwuVbWK511n55nDUuKeiOFARtW8UIDcnyVk/Bdy/frMbZN1So/MlNR5MRg==
X-Received: by 2002:a05:6a00:10c3:b0:525:40fe:6e8d with SMTP id d3-20020a056a0010c300b0052540fe6e8dmr12497366pfu.38.1656545604547;
        Wed, 29 Jun 2022 16:33:24 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id rm1-20020a17090b3ec100b001ed27d132c1sm127305pjb.2.2022.06.29.16.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 16:33:23 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        chrome-platform@lists.linux.dev
Cc:     bleung@chromium.org, heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        "Dustin L. Howett" <dustin@howett.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH 0/9] platform/chrome: Type-C switch driver and Type-C framework updates
Date:   Wed, 29 Jun 2022 23:32:18 +0000
Message-Id: <20220629233314.3540377-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series introduces a retimer class to the USB Type-C framework,
It also introduces a Chrome EC (Embedded Controller) switch driver which
registers the aforementioned retimer switches as well as mode-switches.

Patch 1 and 2 introduce the retimer class and associated functions to
the Type-C common code.

Patches 3-7 add the cros-typec-switch driver

Patches 8-9 update cros-ec-typec to get and use retimer switch handles

Submission suggestion (as always, open to better suggestions):
- Patch 1 and 2 can go through the USB repo.
- Patch 3-9 can go through the chrome-platform repo. Since they depend
  on patches 1 and 2, we can create an "topic branch" off of
  usb-next once Patch 1 and 2 are submitted, and then apply Patches 3-9
  on top of that "topic branch" before merging it back into
  chrome-platform's for-next branch

Prashant Malani (9):
  usb: typec: Add support for retimers
  usb: typec: Add retimer handle to port
  platform/chrome: Add Type-C mux set command definitions
  platform/chrome: cros_typec_switch: Add switch driver
  platform/chrome: cros_typec_switch: Set EC retimer
  platform/chrome: cros_typec_switch: Add event check
  platform/chrome: cros_typec_switch: Register mode switches
  platform/chrome: cros_ec_typec: Cleanup switch handle return paths
  platform/chrome: cros_ec_typec: Get retimer handle

 MAINTAINERS                                   |   1 +
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 drivers/platform/chrome/cros_ec_typec.c       |  50 ++-
 drivers/platform/chrome/cros_typec_switch.c   | 332 ++++++++++++++++++
 drivers/usb/typec/Makefile                    |   2 +-
 drivers/usb/typec/class.c                     |  17 +-
 drivers/usb/typec/class.h                     |   2 +
 drivers/usb/typec/retimer.c                   | 168 +++++++++
 drivers/usb/typec/retimer.h                   |  15 +
 .../linux/platform_data/cros_ec_commands.h    |  18 +
 include/linux/usb/typec_retimer.h             |  45 +++
 12 files changed, 653 insertions(+), 9 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_typec_switch.c
 create mode 100644 drivers/usb/typec/retimer.c
 create mode 100644 drivers/usb/typec/retimer.h
 create mode 100644 include/linux/usb/typec_retimer.h

-- 
2.37.0.rc0.161.g10f37bed90-goog

